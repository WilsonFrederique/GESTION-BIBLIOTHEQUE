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
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletHistoriques", urlPatterns = {"/ServletHistoriques"})
public class ServletHistoriques extends HttpServlet {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final SimpleDateFormat dateOnlyFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);
            return;
        }

        switch (action) {
            case "search":
                searchHistorique(request, response);
                break;
            default:
                request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);
        }
    }

    private void searchHistorique(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idpers = request.getParameter("idpers");

        if (idpers == null || idpers.trim().isEmpty()) {
            request.setAttribute("error", "Veuillez entrer un ID membre");
            request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DB_Connexion.getConnection()) {
            if (conn == null) {
                request.setAttribute("error", "Erreur de connexion à la base de données");
                request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);
                return;
            }

            // Vérifier si le membre existe
            if (!membreExists(conn, idpers)) {
                request.setAttribute("error", "Membre non trouvé");
                request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);
                return;
            }

            // Récupérer les informations du membre
            Map<String, String> membreInfo = getMembreInfo(conn, idpers);
            
            // Récupérer tous les prêts du membre
            List<Map<String, String>> allPrets = getAllPretsMembre(conn, idpers);
            
            // Séparer les prêts en cours et les rendus
            List<Map<String, String>> pretsEnCours = new ArrayList<>();
            for (Map<String, String> pret : allPrets) {
                // Vérifier si un retour existe pour ce membre et ce livre
                if (isPretRendu(conn, idpers, pret.get("idlivre"))) {
                    pret.put("statut", "Rendu");
                } else {
                    pret.put("statut", "En cours");
                }
                pretsEnCours.add(pret);
            }

            // Stocker les données dans la requête
            request.setAttribute("membreInfo", membreInfo);
            request.setAttribute("prets", pretsEnCours);
            request.setAttribute("rendus", getRendusMembre(conn, idpers));
            request.setAttribute("idpers", idpers);

            // Transférer à la JSP
            request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la recherche: " + e.getMessage());
            request.getRequestDispatcher("/Components/Historiques/indexHistoriques.jsp").forward(request, response);
        }
    }

    private boolean membreExists(Connection conn, String idpers) throws SQLException {
        String sql = "SELECT 1 FROM membre WHERE idpers = ? LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idpers);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    private Map<String, String> getMembreInfo(Connection conn, String idpers) throws SQLException {
        String sql = "SELECT * FROM membre WHERE idpers = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idpers);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Map<String, String> membre = new HashMap<>();
                    membre.put("idpers", rs.getString("idpers"));
                    membre.put("nom", rs.getString("nom"));
                    membre.put("sexe", rs.getString("sexe"));
                    membre.put("age", String.valueOf(rs.getInt("age")));
                    membre.put("contact", rs.getString("contact"));
                    return membre;
                }
            }
        }
        return null;
    }

    private List<Map<String, String>> getAllPretsMembre(Connection conn, String idpers) throws SQLException {
        List<Map<String, String>> prets = new ArrayList<>();
        String sql = "SELECT p.*, l.designation FROM preter p " +
                     "JOIN livre l ON p.idlivre = l.idlivre " +
                     "WHERE p.idpers = ? ORDER BY p.datepret DESC";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idpers);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> pret = new HashMap<>();
                    pret.put("idpret", rs.getString("idpret"));
                    pret.put("idlivre", rs.getString("idlivre"));
                    pret.put("designation", rs.getString("designation"));
                    pret.put("datepret", dateFormat.format(rs.getTimestamp("datepret")));
                    pret.put("dateretour", dateOnlyFormat.format(rs.getDate("dateretour")));
                    prets.add(pret);
                }
            }
        }
        return prets;
    }

    // Vérifier s'il existe une entrée dans rendre pour ce membre et ce livre
    private boolean isPretRendu(Connection conn, String idpers, String idlivre) throws SQLException {
        String sql = "SELECT 1 FROM rendre WHERE idpers = ? AND idlivre = ? LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idpers);
            stmt.setString(2, idlivre);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    // Récupérer les rendus du membre (sans joindre la table preter car idpret n'existe pas dans rendre)
    private List<Map<String, String>> getRendusMembre(Connection conn, String idpers) throws SQLException {
        List<Map<String, String>> rendus = new ArrayList<>();
        String sql = "SELECT r.*, l.designation FROM rendre r " +
                     "JOIN livre l ON r.idlivre = l.idlivre " +
                     "WHERE r.idpers = ? ORDER BY r.daterendu DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idpers);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> rendu = new HashMap<>();
                    rendu.put("idrendu", rs.getString("idrendu"));
                    rendu.put("idlivre", rs.getString("idlivre"));
                    rendu.put("designation", rs.getString("designation"));
                    rendu.put("daterendu", dateFormat.format(rs.getTimestamp("daterendu")));
                    rendus.add(rendu);
                }
            }
        }
        return rendus;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
