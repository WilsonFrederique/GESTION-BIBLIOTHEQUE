package Bibliotheque;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLivres extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Erreur</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Une erreur est survenue</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {
            deleteLivre(request, response);
        } else if ("search".equals(action)) {
            searchLivres(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("insert".equals(action)) {
            insertLivre(request, response);
        } else if ("update".equals(action)) {
            updateLivre(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
        }
    }

    private void searchLivres(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        
        if (searchTerm == null || searchTerm.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
            return;
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DB_Connexion.getConnection();
            String sql = "SELECT * FROM livre WHERE idlivre LIKE ? OR designation LIKE ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + searchTerm + "%");
            stmt.setString(2, "%" + searchTerm + "%");
            
            rs = stmt.executeQuery();
            
            List<Map<String, String>> resultatsRecherche = new ArrayList<>();
            
            while (rs.next()) {
                Map<String, String> livre = new HashMap<>();
                livre.put("idlivre", rs.getString("idlivre"));
                livre.put("designation", rs.getString("designation"));
                livre.put("exemplaire", String.valueOf(rs.getInt("exemplaire")));
                resultatsRecherche.add(livre);
            }
            
            request.setAttribute("resultatsRecherche", resultatsRecherche);
            request.getRequestDispatcher("/Components/Livres/indexLivres.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void insertLivre(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idlivre = request.getParameter("idlivre");
        String designation = request.getParameter("designation");
        String exemplaireStr = request.getParameter("exemplaire");
        
        // Validation des champs
        if (idlivre == null || idlivre.isEmpty() || 
            designation == null || designation.isEmpty() || 
            exemplaireStr == null || exemplaireStr.isEmpty()) {
            redirectWithError(response, "champs_vides");
            return;
        }
        
        try {
            int exemplaire = Integer.parseInt(exemplaireStr);
            if (exemplaire <= 0) {
                redirectWithError(response, "exemplaire_invalide");
                return;
            }
            
            // Vérifier si l'ID existe déjà
            if (livreExists(idlivre)) {
                redirectWithError(response, "id_existe_deja");
                return;
            }
            
            // Insertion du livre
            Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
                conn = DB_Connexion.getConnection();
                String sql = "INSERT INTO livre (idlivre, designation, exemplaire) VALUES (?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, idlivre);
                stmt.setString(2, designation);
                stmt.setInt(3, exemplaire);
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
                } else {
                    redirectWithError(response, "erreur_insertion");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                redirectWithError(response, "connexion_bdd");
            } finally {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        } catch (NumberFormatException e) {
            redirectWithError(response, "exemplaire_invalide");
        } catch (SQLException e) {
            redirectWithError(response, "connexion_bdd");
        }
    }

    private void updateLivre(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idlivre = request.getParameter("idlivre");
        String designation = request.getParameter("designation");
        String exemplaireStr = request.getParameter("exemplaire");
        
        // Validation des champs
        if (idlivre == null || idlivre.isEmpty() || 
            designation == null || designation.isEmpty() || 
            exemplaireStr == null || exemplaireStr.isEmpty()) {
            redirectWithError(response, "champs_vides");
            return;
        }
        
        try {
            int exemplaire = Integer.parseInt(exemplaireStr);
            if (exemplaire <= 0) {
                redirectWithError(response, "exemplaire_invalide");
                return;
            }
            
            // Mise à jour du livre
            Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
                conn = DB_Connexion.getConnection();
                String sql = "UPDATE livre SET designation = ?, exemplaire = ? WHERE idlivre = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, designation);
                stmt.setInt(2, exemplaire);
                stmt.setString(3, idlivre);
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
                } else {
                    redirectWithError(response, "livre_non_trouve");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                redirectWithError(response, "connexion_bdd");
            } finally {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        } catch (NumberFormatException e) {
            redirectWithError(response, "exemplaire_invalide");
        } catch (SQLException e) {
            redirectWithError(response, "connexion_bdd");
        }
    }

    private void deleteLivre(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idlivre = request.getParameter("idlivre");
        
        if (idlivre == null || idlivre.isEmpty()) {
            redirectWithError(response, "champs_vides");
            return;
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DB_Connexion.getConnection();
            String sql = "DELETE FROM livre WHERE idlivre = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, idlivre);
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect(request.getContextPath() + "/Components/Livres/indexLivres.jsp");
            } else {
                redirectWithError(response, "livre_non_trouve");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            redirectWithError(response, "connexion_bdd");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean livreExists(String idlivre) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DB_Connexion.getConnection();
            String sql = "SELECT idlivre FROM livre WHERE idlivre = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, idlivre);
            rs = stmt.executeQuery();
            
            return rs.next();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    private void redirectWithError(HttpServletResponse response, String error) throws IOException {
        response.sendRedirect(response.encodeRedirectURL(
            request.getContextPath() + "/Components/Livres/FrmLivre.jsp?error=" + error));
    }

    @Override
    public String getServletInfo() {
        return "Servlet pour la gestion des livres";
    }
}