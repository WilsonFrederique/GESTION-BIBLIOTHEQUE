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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletMembres", urlPatterns = {"/ServletMembres"})
public class ServletMembres extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "action_non_specifiee");
            return;
        }
        
        switch (action) {
            case "update":
                updateMembre(request, response);
                break;
            case "insert":
                insertMembre(request, response);
                break;
            default:
                redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "action_invalide");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/Components/Membres/indexMembre.jsp");
            return;
        }

        switch (action) {
            case "delete":
                deleteMembre(request, response);
                break;
            case "search":
                searchMembres(request, response);
                break;
            default:
                redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "action_invalide");
        }
    }
    
    
    private void searchMembres(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");

        // Vérifie si le terme de recherche est vide
        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "term_recherche_vide");
            return;
        }

        try (Connection conn = DB_Connexion.getConnection()) {
            // Requête SQL améliorée pour rechercher dans tous les champs pertinents
            String sql = "SELECT * FROM membre WHERE "
                       + "idpers LIKE ? OR "
                       + "nom LIKE ? OR "
                       + "sexe LIKE ? OR "
                       + "contact LIKE ? "
                       + "ORDER BY nom ASC"; // Tri par nom par défaut

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                String likeTerm = "%" + searchTerm + "%";
                stmt.setString(1, likeTerm);
                stmt.setString(2, likeTerm);
                stmt.setString(3, likeTerm);
                stmt.setString(4, likeTerm);

                ResultSet rs = stmt.executeQuery();
                List<Map<String, String>> resultats = new ArrayList<>();

                while (rs.next()) {
                    Map<String, String> membre = new HashMap<>();
                    membre.put("idpers", rs.getString("idpers"));
                    membre.put("nom", rs.getString("nom"));
                    membre.put("sexe", rs.getString("sexe"));
                    membre.put("age", rs.getString("age"));
                    membre.put("contact", rs.getString("contact"));
                    resultats.add(membre);
                }

                // Stocke les résultats dans la requête
                request.setAttribute("resultatsRecherche", resultats);
                request.setAttribute("searchTerm", searchTerm); // Conserve le terme de recherche

                // Transfère à la JSP
                request.getRequestDispatcher("/Components/Membres/indexMembre.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "erreur_recherche");
        }
    }
    

    private void insertMembre(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idpers = getTrimmedParameter(request, "idpers");
        String nom = getTrimmedParameter(request, "nom");
        String sexe = getTrimmedParameter(request, "sexe");
        String ageStr = getTrimmedParameter(request, "age");
        String contact = getTrimmedParameter(request, "contact");

        if (isAnyParameterEmpty(idpers, nom, sexe, ageStr, contact)) {
            redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "champs_vides");
            return;
        }

        try {
            int age = Integer.parseInt(ageStr);
            if (age <= 0) {
                redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "age_invalide");
                return;
            }

            try (Connection conn = DB_Connexion.getConnection()) {
                if (conn == null) {
                    redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "connexion_bdd");
                    return;
                }

                // Vérification si l'ID existe déjà (uniquement pour l'insertion)
                if (isIdAlreadyExists(conn, idpers)) {
                    redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "id_existe_deja");
                    return;
                }

                String sql = "INSERT INTO membre (idpers, nom, sexe, age, contact) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, idpers);
                    stmt.setString(2, nom);
                    stmt.setString(3, sexe);
                    stmt.setInt(4, age);
                    stmt.setString(5, contact);

                    int rowsAffected = stmt.executeUpdate();
                    if (rowsAffected > 0) {
                        redirectWithSuccess(request, response, "/Components/Membres/indexMembre.jsp", "insert");
                    } else {
                        redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "insertion_echouee");
                    }
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Membres/FrmMembre.jsp", null);
            }
        } catch (NumberFormatException e) {
            redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "age_invalide");
        }
    }

    private void updateMembre(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idpers = getTrimmedParameter(request, "idpers");
        String nom = getTrimmedParameter(request, "nom");
        String sexe = getTrimmedParameter(request, "sexe");
        String ageStr = getTrimmedParameter(request, "age");
        String contact = getTrimmedParameter(request, "contact");

        if (isAnyParameterEmpty(idpers, nom, sexe, ageStr, contact)) {
            redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "champs_vides", "edit=true&idpers=" + idpers);
            return;
        }

        try {
            int age = Integer.parseInt(ageStr);
            if (age <= 0) {
                redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "age_invalide", "edit=true&idpers=" + idpers);
                return;
            }

            try (Connection conn = DB_Connexion.getConnection()) {
                if (conn == null) {
                    redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "connexion_bdd", "edit=true&idpers=" + idpers);
                    return;
                }

                // On ne vérifie pas si l'ID existe pour une mise à jour
                String sql = "UPDATE membre SET nom=?, sexe=?, age=?, contact=? WHERE idpers=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nom);
                    stmt.setString(2, sexe);
                    stmt.setInt(3, age);
                    stmt.setString(4, contact);
                    stmt.setString(5, idpers);

                    int rowsAffected = stmt.executeUpdate();
                    if (rowsAffected > 0) {
                        redirectWithSuccess(request, response, "/Components/Membres/indexMembre.jsp", "update");
                    } else {
                        redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "membre_non_trouve", "edit=true&idpers=" + idpers);
                    }
                }
            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/Membres/FrmMembre.jsp", "edit=true&idpers=" + idpers);
            }
        } catch (NumberFormatException e) {
            redirectWithError(request, response, "/Components/Membres/FrmMembre.jsp", "age_invalide", "edit=true&idpers=" + idpers);
        }
    }

    private void deleteMembre(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String idpers = getTrimmedParameter(request, "idpers");
        if (idpers.isEmpty()) {
            redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "id_membre_manquant");
            return;
        }

        try (Connection conn = DB_Connexion.getConnection()) {
            if (conn == null) {
                redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "connexion_bdd");
                return;
            }

            String deleteSql = "DELETE FROM membre WHERE idpers = ?";
            try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                deleteStmt.setString(1, idpers);
                int rowsAffected = deleteStmt.executeUpdate();
                if (rowsAffected > 0) {
                    redirectWithSuccess(request, response, "/Components/Membres/indexMembre.jsp", "delete");
                } else {
                    redirectWithError(request, response, "/Components/Membres/indexMembre.jsp", "membre_non_trouve");
                }
            }
        } catch (SQLException e) {
            handleSQLException(e, request, response, "/Components/Membres/indexMembre.jsp", null);
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

    private boolean isIdAlreadyExists(Connection conn, String idpers) throws SQLException {
        String checkSql = "SELECT COUNT(*) FROM membre WHERE idpers = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setString(1, idpers);
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
                errorMessage = "membre_lie_a_emprunt";
            } else if (e.getMessage().contains("primary key") || e.getMessage().contains("duplicate")) {
                errorMessage = "id_existe_deja";
            }
        }
        redirectWithError(request, response, path, errorMessage, additionalParams);
    }
}