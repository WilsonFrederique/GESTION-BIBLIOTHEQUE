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
import java.util.Date;

@WebServlet(name = "ServletRendres", urlPatterns = {"/ServletRendres"})
public class ServletRendres extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            redirectWithError(request, response, "/Components/Rendres/indexRendres.jsp", "action_non_specifiee");
            return;
        }
        
        switch (action) {
            case "update":
                updateRendu(request, response);
                break;
            case "insert":
                insertRendu(request, response);
                break;
            default:
                redirectWithError(request, response, "/Components/Rendres/indexRendres.jsp", "action_invalide");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/Components/Rendres/indexRendres.jsp");
            return;
        }
        
        if ("delete".equals(action)) {
            deleteRendu(request, response);
        } else {
            redirectWithError(request, response, "/Components/Rendres/indexRendres.jsp", "action_invalide");
        }
    }

    private void insertRendu(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idrendu = getTrimmedParameter(request, "idrendu");
        String idpers = getTrimmedParameter(request, "idpers");
        String idlivre = getTrimmedParameter(request, "idlivre");
        String daterenduStr = getTrimmedParameter(request, "daterendu");

        if (isAnyParameterEmpty(idrendu, idpers, idlivre, daterenduStr)) {
            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "champs_vides");
            return;
        }

        try {
            // Conversion de la date de rendu
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date daterendu = dateTimeFormat.parse(daterenduStr);
            Timestamp daterenduTimestamp = new Timestamp(daterendu.getTime());

            try (Connection conn = DB_Connexion.getConnection()) {
                if (conn == null) {
                    redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "connexion_bdd");
                    return;
                }

                if (isIdAlreadyExists(conn, idrendu)) {
                    redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "id_existe_deja");
                    return;
                }

                // Démarrer une transaction
                conn.setAutoCommit(false);

                try {
                    // 1. Insérer le rendu
                    String sql = "INSERT INTO rendre (idrendu, idpers, idlivre, daterendu) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, idrendu);
                        stmt.setString(2, idpers);
                        stmt.setString(3, idlivre);
                        stmt.setTimestamp(4, daterenduTimestamp);

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected <= 0) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "insertion_echouee");
                            return;
                        }
                    }

                    // 2. Incrémenter le nombre d'exemplaires du livre rendu
                    String updateSql = "UPDATE livre SET exemplaire = exemplaire + 1 WHERE idlivre = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setString(1, idlivre);
                        int updatedRows = updateStmt.executeUpdate();
                        
                        if (updatedRows <= 0) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "mise_a_jour_exemplaire_echouee");
                            return;
                        }
                    }

                    // Valider la transaction
                    conn.commit();
                    redirectWithSuccess(request, response, "/Components/Rendres/indexRendres.jsp", "insert");

                } catch (SQLException e) {
                    conn.rollback();
                    handleSQLException(e, request, response, "/Components/Rendres/FrmRendres.jsp", null);
                } finally {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Rendres/FrmRendres.jsp", null);
            }
        } catch (ParseException e) {
            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "date_invalide");
        }
    }

    private void updateRendu(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idrendu = getTrimmedParameter(request, "idrendu");
        String idpers = getTrimmedParameter(request, "idpers");
        String idlivre = getTrimmedParameter(request, "idlivre");
        String daterenduStr = getTrimmedParameter(request, "daterendu");

        if (isAnyParameterEmpty(idrendu, idpers, idlivre, daterenduStr)) {
            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "champs_vides", "edit=true&idrendu=" + idrendu);
            return;
        }

        try {
            // Conversion de la date de rendu
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date daterendu = dateTimeFormat.parse(daterenduStr);
            Timestamp daterenduTimestamp = new Timestamp(daterendu.getTime());

            try (Connection conn = DB_Connexion.getConnection()) {
                if (conn == null) {
                    redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "connexion_bdd", "edit=true&idrendu=" + idrendu);
                    return;
                }

                // Démarrer une transaction
                conn.setAutoCommit(false);

                try {
                    // 1. Récupérer l'ancien idlivre pour le comparer avec le nouveau
                    String oldIdlivre = null;
                    String selectSql = "SELECT idlivre FROM rendre WHERE idrendu = ?";
                    try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                        selectStmt.setString(1, idrendu);
                        try (ResultSet rs = selectStmt.executeQuery()) {
                            if (rs.next()) {
                                oldIdlivre = rs.getString("idlivre");
                            }
                        }
                    }

                    // 2. Mettre à jour le rendu
                    String updateSql = "UPDATE rendre SET idpers=?, idlivre=?, daterendu=? WHERE idrendu=?";
                    try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                        stmt.setString(1, idpers);
                        stmt.setString(2, idlivre);
                        stmt.setTimestamp(3, daterenduTimestamp);
                        stmt.setString(4, idrendu);

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected <= 0) {
                            conn.rollback();
                            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "rendu_non_trouve", "edit=true&idrendu=" + idrendu);
                            return;
                        }
                    }

                    // 3. Gérer les exemplaires seulement si le livre a changé
                    if (oldIdlivre != null && !oldIdlivre.equals(idlivre)) {
                        // Décrémenter les exemplaires du nouveau livre (car on rend l'ancien)
                        String decrementSql = "UPDATE livre SET exemplaire = exemplaire - 1 WHERE idlivre = ?";
                        try (PreparedStatement decrementStmt = conn.prepareStatement(decrementSql)) {
                            decrementStmt.setString(1, oldIdlivre);
                            decrementStmt.executeUpdate();
                        }

                        // Incrémenter les exemplaires de l'ancien livre (car on prend le nouveau)
                        String incrementSql = "UPDATE livre SET exemplaire = exemplaire + 1 WHERE idlivre = ?";
                        try (PreparedStatement incrementStmt = conn.prepareStatement(incrementSql)) {
                            incrementStmt.setString(1, idlivre);
                            incrementStmt.executeUpdate();
                        }
                    }

                    // Valider la transaction
                    conn.commit();
                    redirectWithSuccess(request, response, "/Components/Rendres/indexRendres.jsp", "update");

                } catch (SQLException e) {
                    conn.rollback();
                    handleSQLException(e, request, response, "/Components/Rendres/FrmRendres.jsp", "edit=true&idrendu=" + idrendu);
                } finally {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Rendres/FrmRendres.jsp", "edit=true&idrendu=" + idrendu);
            }
        } catch (ParseException e) {
            redirectWithError(request, response, "/Components/Rendres/FrmRendres.jsp", "date_invalide", "edit=true&idrendu=" + idrendu);
        }
    }

    private void deleteRendu(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idrendu = getTrimmedParameter(request, "idrendu");
        if (idrendu.isEmpty()) {
            redirectWithError(request, response, "/Components/Rendres/indexRendres.jsp", "id_rendu_manquant");
            return;
        }

        try (Connection conn = DB_Connexion.getConnection()) {
            if (conn == null) {
                redirectWithError(request, response, "/Components/Rendres/indexRendres.jsp", "connexion_bdd");
                return;
            }

            // Démarrer une transaction
            conn.setAutoCommit(false);

            try {
                // 1. Récupérer l'id du livre avant suppression
                String livreId = null;
                String selectSql = "SELECT idlivre FROM rendre WHERE idrendu = ?";
                try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                    selectStmt.setString(1, idrendu);
                    try (ResultSet rs = selectStmt.executeQuery()) {
                        if (rs.next()) {
                            livreId = rs.getString("idlivre");
                        }
                    }
                }

                // 2. Supprimer le rendu
                String deleteSql = "DELETE FROM rendre WHERE idrendu = ?";
                try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                    deleteStmt.setString(1, idrendu);
                    int rowsAffected = deleteStmt.executeUpdate();
                    
                    if (rowsAffected <= 0) {
                        conn.rollback();
                        redirectWithError(request, response, "/Components/Rendres/indexRendres.jsp", "rendu_non_trouve");
                        return;
                    }
                }

                // 3. Décrémenter le nombre d'exemplaires si le livre existe
                if (livreId != null) {
                    String updateSql = "UPDATE livre SET exemplaire = exemplaire - 1 WHERE idlivre = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setString(1, livreId);
                        updateStmt.executeUpdate();
                    }
                }

                // Valider la transaction
                conn.commit();
                redirectWithSuccess(request, response, "/Components/Rendres/indexRendres.jsp", "delete");

            } catch (SQLException e) {
                conn.rollback();
                handleSQLException(e, request, response, "/Components/Rendres/indexRendres.jsp", null);
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            handleSQLException(e, request, response, "/Components/Rendres/indexRendres.jsp", null);
        }
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

    private boolean isIdAlreadyExists(Connection conn, String idrendu) throws SQLException {
        String checkSql = "SELECT COUNT(*) FROM rendre WHERE idrendu = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setString(1, idrendu);
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
                errorMessage = "rendu_lie_a_autre_table";
            } else if (e.getMessage().contains("primary key") || e.getMessage().contains("duplicate")) {
                errorMessage = "id_existe_deja";
            }
        }
        redirectWithError(request, response, path, errorMessage, additionalParams);
    }
}