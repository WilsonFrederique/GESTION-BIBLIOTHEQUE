package Bibliotheque;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import Bibliotheque.DB_Connexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletPreters", urlPatterns = {"/ServletPreters"})
public class ServletPreters extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "action_non_specifiee");
            return;
        }
        
        switch (action) {
            case "update":
                updatePret(request, response);
                break;
            case "insert":
                insertPret(request, response);
                break;
            default:
                redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "action_invalide");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/Components/Preters/indexPreters.jsp");
            return;
        }

        switch (action) {
            case "delete":
                deletePret(request, response);
                break;
            case "searchByDate":
                searchByDateRange(request, response);
                break;
            default:
                redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "action_invalide");
        }
    }

    private void searchByDateRange(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");

        if (dateDebutStr == null || dateDebutStr.isEmpty() || 
            dateFinStr == null || dateFinStr.isEmpty()) {
            redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "dates_manquantes");
            return;
        }

        try {
            // Convertir les dates en objets Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dateDebut = dateFormat.parse(dateDebutStr);
            Date dateFin = dateFormat.parse(dateFinStr);

            // Ajouter un jour à la date de fin pour inclure toute la journée
            Calendar cal = Calendar.getInstance();
            cal.setTime(dateFin);
            cal.add(Calendar.DAY_OF_MONTH, 1);
            dateFin = cal.getTime();

            try (Connection conn = DB_Connexion.getConnection()) {
                String sql = "SELECT p.*, m.nom as nom_pers, l.designation as titre_livre " +
                             "FROM preter p " +
                             "JOIN membre m ON p.idpers = m.idpers " +
                             "JOIN livre l ON p.idlivre = l.idlivre " +
                             "WHERE p.datepret BETWEEN ? AND ? " +
                             "ORDER BY p.datepret DESC";

                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setTimestamp(1, new Timestamp(dateDebut.getTime()));
                    stmt.setTimestamp(2, new Timestamp(dateFin.getTime()));

                    ResultSet rs = stmt.executeQuery();
                    List<Map<String, String>> prets = new ArrayList<>();

                    while (rs.next()) {
                        Map<String, String> pret = new HashMap<>();
                        pret.put("idpret", rs.getString("idpret"));
                        pret.put("idpers", rs.getString("idpers"));
                        pret.put("nom_pers", rs.getString("nom_pers"));
                        pret.put("idlivre", rs.getString("idlivre"));
                        pret.put("titre_livre", rs.getString("titre_livre"));

                        // Formatage des dates
                        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                        SimpleDateFormat dateOnlyFormat = new SimpleDateFormat("dd/MM/yyyy");

                        Timestamp datepret = rs.getTimestamp("datepret");
                        Date dateretour = rs.getDate("dateretour");

                        pret.put("datepret", dateTimeFormat.format(datepret));
                        pret.put("dateretour", dateretour != null ? dateOnlyFormat.format(dateretour) : "N/A");

                        prets.add(pret);
                    }

                    request.setAttribute("pretsParDate", prets);
                    request.setAttribute("dateDebut", dateDebutStr);
                    request.setAttribute("dateFin", dateFinStr);
                    request.getRequestDispatcher("/Components/Preters/indexPreters.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Preters/indexPreters.jsp", null);
            }
        } catch (ParseException e) {
            redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "format_date_invalide");
        }
    }

    private void insertPret(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        String idpret = getTrimmedParameter(request, "idpret");
        String idpers = getTrimmedParameter(request, "idpers");
        String idlivre = getTrimmedParameter(request, "idlivre");
        String datepretStr = getTrimmedParameter(request, "datepret");
        String dateretourStr = getTrimmedParameter(request, "dateretour");

        if (isAnyParameterEmpty(idpret, idpers, idlivre, datepretStr)) {
            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "champs_vides");
            return;
        }

        try {
            // Conversion de la date de prêt
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date datepret = dateTimeFormat.parse(datepretStr);
            Timestamp datepretTimestamp = new Timestamp(datepret.getTime());

            // Calcul de la date de retour
            java.sql.Date dateretourSqlDate;
            if (dateretourStr != null && !dateretourStr.isEmpty()) {
                // Si date de retour fournie, l'utiliser
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date dateretour = dateFormat.parse(dateretourStr);

                // Validation: Vérifier que la date de retour ne dépasse pas 14 jours
                long diff = dateretour.getTime() - datepret.getTime();
                long diffDays = diff / (1000 * 60 * 60 * 24);

                if (diffDays > 13) {
                    redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "date_retour_trop_eloignee");
                    return;
                }

                dateretourSqlDate = new java.sql.Date(dateretour.getTime());
            } else {
                // Sinon, calculer 14 jours après la date de prêt
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(datepret);
                calendar.add(Calendar.DAY_OF_MONTH, 14);
                dateretourSqlDate = new java.sql.Date(calendar.getTimeInMillis());
            }

            try (Connection conn = DB_Connexion.getConnection()) {
                if (conn == null) {
                    redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "connexion_bdd");
                    return;
                }

                // Vérifier si le livre est disponible
                if (!isLivreDisponible(conn, idlivre)) {
                    redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "livre_indisponible");
                    return;
                }

                if (isIdAlreadyExists(conn, idpret)) {
                    redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "id_existe_deja");
                    return;
                }

                // Démarrer une transaction
                conn.setAutoCommit(false);

                try {
                    // 1. Insérer le prêt
                    String sql = "INSERT INTO preter (idpret, idpers, idlivre, datepret, dateretour) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, idpret);
                        stmt.setString(2, idpers);
                        stmt.setString(3, idlivre);
                        stmt.setTimestamp(4, datepretTimestamp);
                        stmt.setDate(5, dateretourSqlDate);

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected <= 0) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "insertion_echouee");
                            return;
                        }
                    }

                    // 2. Décrémenter le nombre d'exemplaires
                    String updateSql = "UPDATE livre SET exemplaire = exemplaire - 1 WHERE idlivre = ? AND exemplaire > 0";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setString(1, idlivre);
                        int updatedRows = updateStmt.executeUpdate();

                        if (updatedRows <= 0) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "mise_a_jour_exemplaire_echouee");
                            return;
                        }
                    }

                    // Valider la transaction
                    conn.commit();
                    redirectWithSuccess(request, response, "/Components/Preters/indexPreters.jsp", "insert");

                } catch (SQLException e) {
                    conn.rollback();
                    handleSQLException(e, request, response, "/Components/Preters/FrmPreters.jsp", null);
                } finally {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Preters/FrmPreters.jsp", null);
            }
        } catch (ParseException e) {
            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "date_invalide");
        }
    }

    private void updatePret(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        String idpret = getTrimmedParameter(request, "idpret");
        String idpers = getTrimmedParameter(request, "idpers");
        String idlivre = getTrimmedParameter(request, "idlivre");
        String datepretStr = getTrimmedParameter(request, "datepret");
        String dateretourStr = getTrimmedParameter(request, "dateretour");

        if (isAnyParameterEmpty(idpret, idpers, idlivre, datepretStr)) {
            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "champs_vides", "edit=true&idpret=" + idpret);
            return;
        }

        try {
            // Conversion de la date de prêt
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date datepret = dateTimeFormat.parse(datepretStr);
            Timestamp datepretTimestamp = new Timestamp(datepret.getTime());

            // Calcul de la date de retour
            java.sql.Date dateretourSqlDate;
            if (dateretourStr != null && !dateretourStr.isEmpty()) {
                // Si date de retour fournie, l'utiliser
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date dateretour = dateFormat.parse(dateretourStr);

                // Validation: Vérifier que la date de retour ne dépasse pas 14 jours
                long diff = dateretour.getTime() - datepret.getTime();
                long diffDays = diff / (1000 * 60 * 60 * 24);

                if (diffDays > 13) {
                    redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "date_retour_trop_eloignee", "edit=true&idpret=" + idpret);
                    return;
                }

                dateretourSqlDate = new java.sql.Date(dateretour.getTime());
            } else {
                // Sinon, calculer 14 jours après la date de prêt
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(datepret);
                calendar.add(Calendar.DAY_OF_MONTH, 14);
                dateretourSqlDate = new java.sql.Date(calendar.getTimeInMillis());
            }

            try (Connection conn = DB_Connexion.getConnection()) {
                if (conn == null) {
                    redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "connexion_bdd", "edit=true&idpret=" + idpret);
                    return;
                }

                // Démarrer une transaction pour gérer la cohérence des données
                conn.setAutoCommit(false);

                try {
                    // 1. Récupérer l'ancien idlivre pour le comparer avec le nouveau
                    String oldIdlivre = null;
                    String selectSql = "SELECT idlivre FROM preter WHERE idpret = ?";
                    try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                        selectStmt.setString(1, idpret);
                        try (ResultSet rs = selectStmt.executeQuery()) {
                            if (rs.next()) {
                                oldIdlivre = rs.getString("idlivre");
                            }
                        }
                    }

                    // 2. Mettre à jour le prêt
                    String updateSql = "UPDATE preter SET idpers=?, idlivre=?, datepret=?, dateretour=? WHERE idpret=?";
                    try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                        stmt.setString(1, idpers);
                        stmt.setString(2, idlivre);
                        stmt.setTimestamp(3, datepretTimestamp);
                        stmt.setDate(4, dateretourSqlDate);
                        stmt.setString(5, idpret);

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected <= 0) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "pret_non_trouve", "edit=true&idpret=" + idpret);
                            return;
                        }
                    }

                    // 3. Gérer les exemplaires seulement si le livre a changé
                    if (oldIdlivre != null && !oldIdlivre.equals(idlivre)) {
                        // Incrémenter les exemplaires de l'ancien livre
                        String incrementSql = "UPDATE livre SET exemplaire = exemplaire + 1 WHERE idlivre = ?";
                        try (PreparedStatement incrementStmt = conn.prepareStatement(incrementSql)) {
                            incrementStmt.setString(1, oldIdlivre);
                            incrementStmt.executeUpdate();
                        }

                        // Décrémenter les exemplaires du nouveau livre
                        if (!isLivreDisponible(conn, idlivre)) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "livre_indisponible", "edit=true&idpret=" + idpret);
                            return;
                        }

                        String decrementSql = "UPDATE livre SET exemplaire = exemplaire - 1 WHERE idlivre = ?";
                        try (PreparedStatement decrementStmt = conn.prepareStatement(decrementSql)) {
                            decrementStmt.setString(1, idlivre);
                            decrementStmt.executeUpdate();
                        }
                    }

                    // Valider la transaction
                    conn.commit();
                    redirectWithSuccess(request, response, "/Components/Preters/indexPreters.jsp", "update");

                } catch (SQLException e) {
                    conn.rollback();
                    handleSQLException(e, request, response, "/Components/Preters/FrmPreters.jsp", "edit=true&idpret=" + idpret);
                } finally {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Preters/FrmPreters.jsp", "edit=true&idpret=" + idpret);
            }
        } catch (ParseException e) {
            redirectWithError(request, response, "/Components/Preters/FrmPreters.jsp", "date_invalide", "edit=true&idpret=" + idpret);
        }
    }

    private void deletePret(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idpret = getTrimmedParameter(request, "idpret");
        if (idpret.isEmpty()) {
            redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "id_pret_manquant");
            return;
        }

        try (Connection conn = DB_Connexion.getConnection()) {
            if (conn == null) {
                redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "connexion_bdd");
                return;
            }

            // Démarrer une transaction
            conn.setAutoCommit(false);

            try {
                // 1. Récupérer l'id du livre avant suppression
                String livreId = null;
                String selectSql = "SELECT idlivre FROM preter WHERE idpret = ?";
                try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                    selectStmt.setString(1, idpret);
                    try (ResultSet rs = selectStmt.executeQuery()) {
                        if (rs.next()) {
                            livreId = rs.getString("idlivre");
                        }
                    }
                }

                // 2. Supprimer le prêt
                String deleteSql = "DELETE FROM preter WHERE idpret = ?";
                try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                    deleteStmt.setString(1, idpret);
                    int rowsAffected = deleteStmt.executeUpdate();
                    
                    if (rowsAffected <= 0) {
                        conn.rollback();
                        redirectWithError(request, response, "/Components/Preters/indexPreters.jsp", "pret_non_trouve");
                        return;
                    }
                }

                // 3. Incrémenter le nombre d'exemplaires si le livre existe
                if (livreId != null) {
                    String updateSql = "UPDATE livre SET exemplaire = exemplaire + 1 WHERE idlivre = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setString(1, livreId);
                        updateStmt.executeUpdate();
                    }
                }

                // Valider la transaction
                conn.commit();
                redirectWithSuccess(request, response, "/Components/Preters/indexPreters.jsp", "delete");

            } catch (SQLException e) {
                conn.rollback();
                handleSQLException(e, request, response, "/Components/Preters/indexPreters.jsp", null);
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            handleSQLException(e, request, response, "/Components/Preters/indexPreters.jsp", null);
        }
    }
    
    // Vérifie si un livre est disponible (au moins un exemplaire)
    private boolean isLivreDisponible(Connection conn, String idlivre) throws SQLException {
        String sql = "SELECT exemplaire FROM livre WHERE idlivre = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idlivre);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("exemplaire") > 0;
                }
            }
        }
        return false;
    }

    // Méthodes utilitaires
    private String getTrimmedParameter(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return value != null ? value.trim() : "";
    }

    private boolean isAnyParameterEmpty(String... params) {
        for (String param : params) {
            if (param.isEmpty()) {
                return true;
            }
        }
        return false;
    }

    private boolean isIdAlreadyExists(Connection conn, String idpret) throws SQLException {
        String checkSql = "SELECT COUNT(*) FROM preter WHERE idpret = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setString(1, idpret);
            try (ResultSet rs = checkStmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    private void redirectWithError(HttpServletRequest request, HttpServletResponse response, 
            String path, String error) throws IOException {
        redirectWithError(request, response, path, error, null);
    }

    private void redirectWithError(HttpServletRequest request, HttpServletResponse response, 
            String path, String error, String additionalParams) throws IOException {
        String params = "error=" + error;
        if (additionalParams != null && !additionalParams.isEmpty()) {
            params += "&" + additionalParams;
        }
        response.sendRedirect(request.getContextPath() + path + "?" + params);
    }

    private void redirectWithSuccess(HttpServletRequest request, HttpServletResponse response, 
            String path, String success) throws IOException {
        response.sendRedirect(request.getContextPath() + path + "?success=" + success);
    }

    private void handleSQLException(SQLException e, HttpServletRequest request, 
            HttpServletResponse response, String path, String additionalParams) throws IOException {
        e.printStackTrace();
        String errorMessage = "erreur_bdd";
        if (e.getMessage().contains("constraint")) {
            if (e.getMessage().contains("foreign key")) {
                errorMessage = "pret_lie_a_autre_table";
            } else if (e.getMessage().contains("primary key") || e.getMessage().contains("duplicate")) {
                errorMessage = "id_existe_deja";
            }
        }
        redirectWithError(request, response, path, errorMessage, additionalParams);
    }
}