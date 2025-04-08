package Bibliotheque;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletPDF extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            processRequest(request, response);
            return;
        }

        switch (action) {
            case "searchByIdAndDate":
                searchByIdPersAndDate(request, response);
                break;
            default:
                redirectWithError(request, response, "/Components/GenererPDF/indexPDF.jsp", "action_invalide");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void searchByIdPersAndDate(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String idpers = getTrimmedParameter(request, "idpers");
        String datepretStr = getTrimmedParameter(request, "datepret");

        if (idpers.isEmpty() || datepretStr.isEmpty()) {
            redirectWithError(request, response, "/Components/GenererPDF/indexPDF.jsp", "champs_recherche_vides");
            return;
        }

        try {
            // Convertir la date en objet Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date datepret = dateFormat.parse(datepretStr);

            try (Connection conn = DB_Connexion.getConnection()) {
                // Requête optimisée pour éviter les doublons
                String sql = "SELECT m.nom, m.age, m.sexe, m.contact, " +
                             "l.idlivre, l.designation as titre_livre, " +
                             "MIN(p.dateretour) as dateretour, " +
                             "COUNT(*) as total " +
                             "FROM preter p " +
                             "JOIN membre m ON p.idpers = m.idpers " +
                             "JOIN livre l ON p.idlivre = l.idlivre " +
                             "WHERE p.idpers = ? AND DATE(p.datepret) = ? " +
                             "GROUP BY m.nom, m.age, m.sexe, m.contact, l.idlivre, l.designation " +
                             "ORDER BY l.designation";

                List<Map<String, Object>> prets = new ArrayList<>();
                Map<String, String> membre = null;
                Date dateRetour = null;

                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, idpers);
                    stmt.setDate(2, new java.sql.Date(datepret.getTime()));

                    try (ResultSet rs = stmt.executeQuery()) {
                        boolean firstRow = true;
                        while (rs.next()) {
                            if (firstRow) {
                                membre = new HashMap<>();
                                membre.put("nom", rs.getString("nom"));
                                membre.put("age", String.valueOf(rs.getInt("age")));
                                membre.put("sexe", rs.getString("sexe"));
                                membre.put("contact", rs.getString("contact"));
                                firstRow = false;
                            }

                            Map<String, Object> pret = new HashMap<>();
                            pret.put("idlivre", rs.getString("idlivre"));
                            pret.put("titre_livre", rs.getString("titre_livre"));
                            pret.put("total", rs.getInt("total")); // Nombre total de prêts pour ce livre

                            // Stocker la date de retour la plus proche
                            if (dateRetour == null) {
                                dateRetour = rs.getDate("dateretour");
                            }

                            prets.add(pret);
                        }
                    }
                }

                if (membre == null) {
                    redirectWithError(request, response, "/Components/GenererPDF/indexPDF.jsp", "membre_non_trouve");
                    return;
                }

                if (prets.isEmpty()) {
                    redirectWithError(request, response, "/Components/GenererPDF/indexPDF.jsp", "aucun_pret_trouve");
                    return;
                }

                // Calcul de la date de retour si non trouvée
                if (dateRetour == null) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(datepret);
                    cal.add(Calendar.DAY_OF_MONTH, 14);
                    dateRetour = new java.util.Date(cal.getTimeInMillis());
                } else {
                    dateRetour = new java.util.Date(dateRetour.getTime());
                }

                // Passer les données à la JSP
                request.setAttribute("membre", membre);
                request.setAttribute("prets", prets);
                request.setAttribute("datePret", new java.util.Date(datepret.getTime()));
                request.setAttribute("dateRetour", dateRetour);

                request.getRequestDispatcher("/Components/GenererPDF/indexPDF.jsp").forward(request, response);

            } catch (SQLException e) {
                handleSQLException(e, request, response, "/Components/GenererPDF/indexPDF.jsp", null);
            }
        } catch (ParseException e) {
            redirectWithError(request, response, "/Components/GenererPDF/indexPDF.jsp", "format_date_invalide");
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPDF</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPDF at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet pour la génération de PDF";
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

    private String getTrimmedParameter(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return value != null ? value.trim() : "";
    }
}