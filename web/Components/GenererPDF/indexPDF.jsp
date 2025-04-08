<!--Mon Css-->
<style>
    /*Container*/
    /* =========== CONTENT ========== */
        #content{
            position: relative;
            width: calc(100% - 280px);
            left: 280px;
            transition: .3s ease;
        }

        #sidebar.hide ~ #content{
            width: calc(100% - 54px);
            left: 54px;
        }

        /* ----- NAVBAR ----- */
        #content nav{
            height: 56px;
            background: #dedee980;
            padding: 0 24px;
            display: flex;
            align-items: center;
            grid-gap: 24px;
            font-family: 'Lato', sans-serif;
            position: sticky;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .admin-nom{
            color: #181718;
        }
        .admin-grad{
            color: #2d2e30;
        }

        #content nav::before{
            content: '';
            position: absolute;
            width: 40px;
            height: 40px;
            /* background: var(--blue); */
            bottom: -40px;
            left: 0;
            border-radius: 50%;
            box-shadow: -20px -20px 0 var(--light);
        }

        #content nav a{
            /* color: var(--dark); */
            color: #181718;
        }

        #content nav .bx.bx-menu{
            cursor: pointer;
        }

        #content nav .nav-link{
            font-size: 16px;
            transition: .3s ease;
        }

        #content nav .nav-link:hover{
            color: #3c91e6;
        }

        #content nav form{
            max-width: 400px;
            width: 100%;
            margin-right: auto;
        }

        #content nav form .form-input{
            display: flex;
            align-items: center;
            height: 36px;
        }

        #content nav form .form-input input{
            flex-grow: 1;
            padding: 0 16px;
            height: 100%;
            border: none;
            background: #fff;
            color: #181718;
            border-radius: 36px 0 0 36px;
            outline: none;
            width: 100%;
        }

        #content nav form .form-input button{
            width: 36px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #fff;
            color: black;
            font-size: 18px;
            border: none;
            outline: none;
            border-radius: 0 36px 36px 0;
            cursor: pointer;
        }

        #content nav .notification{
            font-size: 20px;
            position: relative;
        }

        #content nav .notification .num{
            position: absolute;
            top: -6px;
            right: -6px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 2px solid var(--light);
            background: #db504a;
            color: #f9f9f9;
            font-weight: 700;
            font-size: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #content nav .profile img{
            width: 36px;
            height: 36px;
            object-fit: cover;
            border-radius: 50%;
        }
        /* ----- FIN NAVBAR ----- */

        .right .top {
            display: flex;
            justify-content: end;
            gap: 2rem;
        }

        .them, .menu{
            font-size: 23px;
            color: #181718
        }
        
        
        
        /* --------- Main ---------- */
        #content main{
            width: 100%;
            padding: 36px 24px;
            font-family: 'Poppins', sans-serif;
            max-height: calc(100vh - 56px);
            overflow-y: auto;
        }
        #content main .head-title{
            display: flex;
            align-items: center;
            justify-content: space-between;
            grid-gap: 16px;
            flex-wrap: wrap;
        }

        #content main .head-title .left h1{
            font-size: 36px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #342e37;
        }

        #content main .head-title .left .breadcrumb{
            display: flex;
            align-items: center;
            grid-gap: 16px;
        }

        #content main .head-title .left .breadcrumb li{
            color: #342e37;
        }

        #content main .head-title .left .breadcrumb li a{
            color: #3f3e3e;
            pointer-events: none;
        }

        #content main .head-title .left .breadcrumb li a.active{
            color: #8fafcf;
            pointer-events: unset;
        }

        #content main .head-title .btn-download{
            height: 36px;
            padding: 0 16px;
            border-radius: 36px;
            background: #3c91e6;
            color: #f9f9f9;
            display: flex;
            align-items: center;
            justify-content: center;
            grid-gap: 10px;
            font-weight: 500;
        }



        #content main .box-info{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            grid-gap: 24px;
            margin-top: 36px;
        }

        #content main .box-info li{
            padding: 24px;
            background: #f9f9f9;
            border-radius: 20px;
            display: flex;
            align-items: center;
            grid-gap: 24px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.170);
        }

        #content main .box-info li .bx{
            width: 80px;
            height: 80px;
            border-radius: 10px;
            /* background: var(--grey); */
            font-size: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .txt-box-top{
            color: black;
        }

        .txt-box-bottom{
            color: rgb(30, 30, 30);
        }

        #content main .box-info li:nth-child(1) .bx{
            background: #cfe8ff;
            color: #3c91e6;
        }

        #content main .box-info li:nth-child(2) .bx{
            background: rgb(189, 173, 108);
            color: rgb(68, 67, 46);
        }

        #content main .box-info li:nth-child(3) .bx{
            background: rgb(230, 175, 112);
            color: rgb(190, 120, 39);
        }

        #content main .box-info li .text h3{
            font-size: 24px;
            font-weight: 600;
        }



        #content main .table-date{
            display: flex;
            flex-wrap: wrap;
            grid-gap: 24px;
            margin-top: 24px;
            width: 100%;
            color: #342e37;
        }

        #content main .table-date > div {
            border-radius: 20px;
            background: #f9f9f9;
            padding: 24px;
            overflow: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.170);
        }

        #content main .table-date .orber{
            flex-grow: 1;
            flex-basis: 500px;
        }

        #content main .table-date .head{
            display: flex;
            align-items: center;
            grid-gap: 16px;
            margin-bottom: 24px;
        }

        .thead{
            color: #1d1e1f;
            letter-spacing: 1px;
        }

        .tbody{
            color: rgba(0, 0, 0, 0.908);
        }

        .todo-color{
            color: rgba(0, 0, 0, 0.908);
        }

        #content main .table-date .head h3{
            margin-right: auto;
            font-size: 24px;
            font-weight: 600;
            color: #342e37;
        }

        .icon-tbl{
            color: #1b1b1d;
        }

        #content main .table-date .head .bx{
            cursor: pointer;
        }

        #content main .table-date .orber table{
            width: 100%;
            border-collapse: collapse;
        }

        #content main .table-date .orber table th{
            padding-bottom: 12px;
            font-size: 13px;
            text-align: left;
            border-bottom: 1px solid var(--grey);
        }

        #content main .table-date .orber table td{
            padding: 16px 0;
        }

        #content main .table-date .orber table tr td:first-child{
            display: flex;
            align-items: center;
            grid-gap: 12px;
            padding-left: 6px;
        }

        #content main .table-date .orber table td img{
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
        }

        #content main .table-date .orber table tbody tr:hover{
            background: #EEE;
        }

        #content main .table-date .orber table tr td .status{
            font-size: 10px;
            padding: 6px 16px;
            color: #f9f9f9;
            border-radius: 20px;
            font-weight: 700;
        }

        #content main .table-date .orber table tr td .status.completed{
            background: #3c91e6;
        }

        #content main .table-date .orber table tr td .status.process{
            background: rgb(204, 201, 38);
        }

        #content main .table-date .orber table tr td .status.pending{
            background: rgb(190, 120, 39);
        }

        #content main .table-date .todo{
            flex-grow: 1;
            flex-basis: 300px;
        }

        #content main .table-date .todo .todo-list{
            width: 100%;
        }

        #content main .table-date .todo .todo-list li{
            width: 100%;
            margin-bottom: 16px;
            background: #EEE;
            border-radius: 10px;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        #content main .table-date .todo .todo-list li .bx{
            cursor: pointer;
        }

        #content main .table-date .todo .todo-list li.completed{
            border-left: 10px solid var(--blue);
        }

        #content main .table-date .todo .todo-list li.not-completed{
            border-left: 10px solid var(--orange);
        }

        #content main .table-date .todo .todo-list li:last-child{
            margin-bottom: 0;
        }
        @media (max-width: 768px) {
            .search-text{
                display: none;
            }
        }
</style>

<!--Mon Css Footer-->
<style>
    /*Fotter*/
    .footer{
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-items: center;
        padding: 1.5rem 3%;
        margin-bottom: 0;
        margin-top: 2rem;
        background: #dedee980;
        color: #000;
    }

    .footer-text p{
        font-size: 1.3rem;
    }

    .footer-iconTop a{
        display: inline-block;
        justify-content: center;
        align-items: center;
        padding: 0.8rem;
        background: #3c91e6;
        border-radius: .8rem;
        transition: .5s ease;
    }

    .footer-iconTop a:hover{
        box-shadow: 0 0 1rem #3c91e6;
    }

    .footer-iconTop a i{
        font-size: 1.7rem;
        color: #323946;
    }
    
    @media (max-width: 365px){
        .footer{
            flex-direction: column-reverse;
        }

        .footer p{
            text-align: center;
            margin-top: 2rem;
        }
    }
</style>

<!--Mon Css pour Recherche Prets entre deux dates-->
<style>
    /* Style pour le filtre de dates */
    .date-filter-container {
        padding: 1.5rem;
        background: #f9f9f9;
        border-radius: 12px;
        margin-bottom: 1.5rem;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .date-filter-form {
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
        align-items: flex-end;
    }

    .date-input-group {
        flex: 1;
        min-width: 200px;
    }

    .date-input-group label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 500;
        color: #342e37;
    }

    .date-input {
        width: 100%;
        padding: 0.75rem 1rem;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-family: 'Poppins', sans-serif;
        transition: all 0.3s ease;
        background: white;
    }

    .date-input:focus {
        outline: none;
        border-color: #3c91e6;
        box-shadow: 0 0 0 3px rgba(60, 145, 230, 0.2);
    }

    .search-btn, .reset-btn {
        padding: 0.75rem 1.5rem;
        border-radius: 8px;
        font-family: 'Poppins', sans-serif;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        cursor: pointer;
        transition: all 0.3s ease;
        border: none;
    }

    .search-btn {
        background: #3c91e6;
        color: white;
    }

    .search-btn:hover {
        background: #2b7dcc;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(60, 145, 230, 0.3);
    }

    .reset-btn {
        background: #f1f1f1;
        color: #342e37;
    }

    .reset-btn:hover {
        background: #e1e1e1;
        transform: translateY(-2px);
    }

    /* Style pour les résultats de recherche */
    .search-results {
        margin-top: 1.5rem;
    }

    .no-results {
        text-align: center;
        padding: 2rem;
        color: #666;
        font-style: italic;
    }

    /* Animation pour les résultats */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .search-results table tbody tr {
        animation: fadeInUp 0.5s ease-out forwards;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .date-filter-form {
            flex-direction: column;
            gap: 1rem;
        }

        .date-input-group {
            width: 100%;
        }

        .search-btn, .reset-btn {
            width: 100%;
            justify-content: center;
        }
    }
</style>

<!--Stle Btn Recherche entre Deux dates-->
<style>
    .btn-modern {
        padding: 12px 20px;
        background: #2b7dcc;
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        box-shadow: 0 4px 14px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
      }

      .btn-modern:hover {
        background: #2b7dcc;
        transform: translateY(-2px);
      }
</style>

<!--Css Pour Format PDF Prêts-->
<style>
    .format-pdf {
            max-width: 100%;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .format-pdf h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
            color: #333;
        }

        .member-info p {
            margin: 4px 0;
            font-size: 15px;
        }

        .table {
            width: 100% !important;
            border-collapse: collapse !important;
            margin-top: 20px !important;
            margin-bottom: 20px !important;
        }
        
        .table thead tr .th, .table tbody tr .td{
            padding-left: 2rem !important;
        }
        
        .table .thead .tr .th, .table .tbody .tr .td{
            border: 1px solid #ccc !important;
            padding: 10px !important;
            font-size: 14px !important;
            text-align: left !important;            
        }

        .table .thead .tr .th {
            background-color: #f0f0f0 !important;
            font-weight: bold !important;
        }

        .footer-dates p {
            margin: 6px 0 !important;
        }        
        
</style>

<!--Css Btn Telechager PDF et Annuler PDF-->
<style>
    .group-btns-telecharge-annuler {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 30px;
    }

    .group-btns-telecharge-annuler button {
        width: 100%;
        padding: 12px 24px;
        font-size: 16px;
        font-weight: 600;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .telecharge {
        background-color: #4CAF50;
        color: white;
    }

    .telecharge:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }

    .annuler {
        background-color: #f44336;
        color: white;
    }

    .annuler:hover {
        background-color: #e53935;
        transform: scale(1.05);
    }
</style>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>

<%@page import="Bibliotheque.DB_Connexion"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WiFre</title>
    </head>
    <body>        
        <!--SidBar et NavBar-->
        <jsp:include page="/Components/SidBar/NavSidBar.jsp" />
        
        <!--Container-->
        <!-- ========================================= CONTENT ======================================== -->
        <section id="content">
            <!-- --------------------- Main --------------------- -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>GÉNÉRER LE PDF DU PRÊT</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Bibliothèque</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="/GestionBibliotheque/Components/GenererPDF/indexPDF.jsp">Générer le pdf</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- ********************** Prêts ************************ -->
                
                <!--Order : Format PDF Prêts -->
                <div class="table-date">
                    <!--Order-->
                    <div class="orber">
                        <div class="head">
                            <h3>Générer en PDF</h3>
                            <a href="#">
                                <i class='bx bx-filter icon-tbl'></i>                                
                            </a>
                        </div>
                        
                        <!--Place Input Avec Btn De Générer-->
                        <div class="frm-avec-btn-generer">
                            <!-- Formulaire de recherche par idpers et datepret -->
                            <div class="date-filter-container">
                                <form method="get" action="${pageContext.request.contextPath}/ServletPDF" class="date-filter-form">
                                    <input type="hidden" name="action" value="searchByIdAndDate">

                                    <div class="date-input-group">
                                        <label for="idpers">ID PERSONNE</label>
                                        <input type="text" name="idpers" placeholder="ID PERSONNE" class="date-input" required>
                                    </div>

                                    <div class="date-input-group">
                                        <label for="datepret">DATE PRÊT</label>
                                        <input type="date" name="datepret" class="date-input" required>
                                    </div>

                                    <button type="submit" class="search-btn">
                                        <i class='bx bxs-file-pdf'></i> Générer
                                    </button>
                                </form>
                            </div>
                        </div>

                        <!--Place PDF Avec Des Btn Telecharger et Annuler-->
                        <div class="format-pdf-avec-btn-telecherger-annuler">
                            <div class="format-pdf">
                                <h2>BIBLIOTHÈQUE FIWRE</h2>

                                <div class="member-info">
                                    <p><strong>Info Membre :</strong></p>
                                    <%
                                        Map<String, String> membre = (Map<String, String>) request.getAttribute("membre");
                                        if (membre != null) {
                                    %>
                                        <p><%= membre.get("nom") %></p>
                                        <p><%= membre.get("age") %> ans</p>
                                        <p><%= membre.get("sexe") %></p>
                                        <p><strong>Contact :</strong> <%= membre.get("contact") %></p>
                                    <%
                                        }
                                    %>
                                </div>

                                <table class="table">
                                    <thead class="thead">
                                        <tr class="tr">
                                            <th class="th">Code livre</th>
                                            <th class="th">Intitulé</th>
                                            <th class="th">Nombre prêté</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbody">
                                        <%
                                            List<Map<String, Object>> prets = (List<Map<String, Object>>) request.getAttribute("prets");
                                            if (prets != null) {
                                                for (Map<String, Object> pret : prets) {
                                        %>
                                                    <tr class="tr">
                                                        <td class="td"><%= pret.get("idlivre") %></td>
                                                        <td class="td"><%= pret.get("titre_livre") %></td>
                                                        <td class="td"><%= pret.get("total") %></td>
                                                    </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <div class="footer-dates">
                                    <%
                                        // Récupération des dates avec gestion des types différents
                                        Object datePretObj = request.getAttribute("datePret");
                                        Object dateRetourObj = request.getAttribute("dateRetour");
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");

                                        // Conversion de datePret
                                        String datePretFormatted = "";
                                        if (datePretObj != null) {
                                            if (datePretObj instanceof java.sql.Date) {
                                                datePretFormatted = dateFormat.format(new java.util.Date(((java.sql.Date) datePretObj).getTime()));
                                            } else if (datePretObj instanceof java.util.Date) {
                                                datePretFormatted = dateFormat.format((java.util.Date) datePretObj);
                                            } else if (datePretObj instanceof java.sql.Timestamp) {
                                                datePretFormatted = dateFormat.format(new java.util.Date(((java.sql.Timestamp) datePretObj).getTime()));
                                            }
                                        }

                                        // Conversion de dateRetour
                                        String dateRetourFormatted = "";
                                        if (dateRetourObj != null) {
                                            if (dateRetourObj instanceof java.sql.Date) {
                                                dateRetourFormatted = dateFormat.format(new java.util.Date(((java.sql.Date) dateRetourObj).getTime()));
                                            } else if (dateRetourObj instanceof java.util.Date) {
                                                dateRetourFormatted = dateFormat.format((java.util.Date) dateRetourObj);
                                            } else if (dateRetourObj instanceof java.sql.Timestamp) {
                                                dateRetourFormatted = dateFormat.format(new java.util.Date(((java.sql.Timestamp) dateRetourObj).getTime()));
                                            }
                                        }
                                    %>
                                    <p>Prêté le : <%= datePretFormatted %></p>
                                    <p>Doit être rendu le : <%= dateRetourFormatted %></p>
                                </div>
                            </div>
                            <div class="group-btns-telecharge-annuler format-btns">
                                <button class="telecharge">Télécharger le PDF</button>
                                <button class="annuler">Annuler</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Footer -->
                <footer class="footer">
                    <div class="footer-text">
                        <p>&copy; 2025 par Bibliothèque WiFre | Tous Droits Réservés.</p>
                    </div>

                    <div class="footer-iconTop">
                        <a href="/GestionBibliotheque/Components/GenererPDF/indexPDF.jsp"><i class='bx bx-up-arrow-alt'></i></a>
                    </div>
                </footer>
            </main>
            <!-- --------------------- Fin Main ----------------- -->
        </section>
        
        
        <!--Script Pour Ce input Search dans Order-->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const searchIcon = document.querySelector('.search-icon');
                const searchInput = document.querySelector('.search-input');

                searchIcon.addEventListener('click', function() {
                    searchInput.classList.toggle('active');

                    // Focus sur l'input quand il apparaît
                    if (searchInput.classList.contains('active')) {
                        searchInput.focus();
                    }
                });

                // Optionnel: Fermer la recherche si on clique en dehors
                document.addEventListener('click', function(e) {
                    if (!e.target.closest('.search-container')) {
                        searchInput.classList.remove('active');
                    }
                });
            });
        </script>
        
        
        <!-- Script pour Recherche Prets entre deux dates-->
        <script>
            // Validation des dates et initialisation des valeurs par défaut
            document.addEventListener('DOMContentLoaded', function() {
                // Récupérer les paramètres d'URL
                const urlParams = new URLSearchParams(window.location.search);
                const dateDebutParam = urlParams.get('dateDebut');
                const dateFinParam = urlParams.get('dateFin');

                // Définir les valeurs des champs
                const dateDebutInput = document.getElementById('date-debut');
                const dateFinInput = document.getElementById('date-fin');

                // Si des paramètres existent, les utiliser, sinon définir les valeurs par défaut
                if (dateDebutParam) {
                    dateDebutInput.value = dateDebutParam;
                } else {
                    // Définir la date de début par défaut à il y a 1 mois
                    const oneMonthAgo = new Date();
                    oneMonthAgo.setMonth(oneMonthAgo.getMonth() - 1);
                    dateDebutInput.value = oneMonthAgo.toISOString().split('T')[0];
                }

                if (dateFinParam) {
                    dateFinInput.value = dateFinParam;
                } else {
                    // Définir la date de fin par défaut à aujourd'hui
                    dateFinInput.value = new Date().toISOString().split('T')[0];
                }

                // Validation du formulaire
                const dateForm = document.querySelector('.date-filter-form');
                if (dateForm) {
                    dateForm.addEventListener('submit', function(e) {
                        const dateDebut = dateDebutInput.value;
                        const dateFin = dateFinInput.value;

                        if (dateDebut && dateFin) {
                            const debut = new Date(dateDebut);
                            const fin = new Date(dateFin);

                            if (debut > fin) {
                                e.preventDefault();
                                alert('La date de début doit être antérieure à la date de fin');
                                return false;
                            }
                        }
                        return true;
                    });
                }
            });
        </script>
        
        
        <!--Script pour ce : place-recherche-entre-deux-date est gérer l'affichage/masquage-->
        <script>
            // Au chargement de la page
            document.addEventListener('DOMContentLoaded', function() {
                const searchSection = document.querySelector('.place-recherche-entre-deux-date');
                const searchText = document.querySelector('.search-text');

                // Vérifier l'état dans le localStorage
                const isSearchVisible = localStorage.getItem('dateSearchVisible') === 'true';

                // Appliquer l'état initial
                if (isSearchVisible) {
                    searchSection.classList.add('show');
                    searchText.textContent = 'Fermer la recherche entre deux dates';
                }
            });

            function toggleDateSearch() {
                const searchSection = document.querySelector('.place-recherche-entre-deux-date');
                const searchText = document.querySelector('.search-text');
                const isNowVisible = !searchSection.classList.contains('show');

                // Basculer l'affichage
                searchSection.classList.toggle('show');

                // Mettre à jour le texte du bouton
                if (isNowVisible) {
                    searchText.textContent = 'Fermer la recherche entre deux dates';
                } else {
                    searchText.textContent = 'Rechercher entre deux dates';
                }

                // Sauvegarder l'état dans le localStorage
                localStorage.setItem('dateSearchVisible', isNowVisible.toString());

                // Optionnel: Faire défiler jusqu'à la section si elle est affichée
                if (isNowVisible) {
                    searchSection.scrollIntoView({ behavior: 'smooth' });
                }
            }

            // Optionnel: Cacher la section si on clique en dehors
            document.addEventListener('click', function(e) {
                const searchSection = document.querySelector('.place-recherche-entre-deux-date');
                const btnModern = document.querySelector('.btn-modern');
                const searchText = document.querySelector('.search-text');

                if (searchSection && !searchSection.contains(e.target)) {
                    if (e.target !== btnModern && !btnModern.contains(e.target)) {
                        searchSection.classList.remove('show');
                        searchText.textContent = 'Rechercher entre deux dates';
                        localStorage.setItem('dateSearchVisible', 'false');
                    }
                }
            });
        </script>
    </body>
</html>
