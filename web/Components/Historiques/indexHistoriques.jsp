
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


<!--Css pour historique-->
<style>
    .historique {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 2rem;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
    }

    .search-box {
        display: flex;
        gap: 12px;
        margin-bottom: 2rem;
    }

    .search-box input {
        flex: 1;
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    .search-box input:focus {
        outline: none;
        border-color: #4a90e2;
        box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.2);
    }

    .search-box button {
        padding: 12px 24px;
        background-color: #4a90e2;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .search-box button:hover {
        background-color: #3a7bc8;
    }

    .membre-info {
        background-color: #f8f9fa;
        padding: 1.5rem;
        border-radius: 8px;
        margin-bottom: 2rem;
    }

    .membre-info h3 {
        margin-top: 0;
        color: #333;
        font-size: 1.25rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid #e0e0e0;
    }

    .membre-info p {
        margin: 0.75rem 0;
        color: #555;
    }

    .section-title {
        color: #333;
        font-size: 1.25rem;
        margin: 2rem 0 1rem 0;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid #e0e0e0;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 2rem;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    }

    thead {
        background-color: #f8f9fa;
    }

    th {
        padding: 12px 16px;
        text-align: left;
        font-weight: 500;
        color: #555;
        border-bottom: 2px solid #e0e0e0;
    }

    td {
        padding: 12px 16px;
        border-bottom: 1px solid #e0e0e0;
        color: #333;
    }

    tr:hover {
        background-color: #f5f7fa;
    }

    .no-data {
        text-align: center;
        color: #888;
        padding: 1.5rem;
        background-color: #f8f9fa;
        border-radius: 8px;
        margin: 1rem 0;
    }

    span[style*="color: green"] {
        font-weight: 500;
        background-color: rgba(46, 204, 113, 0.1);
        padding: 4px 8px;
        border-radius: 4px;
    }

    span[style*="color: orange"] {
        font-weight: 500;
        background-color: rgba(241, 196, 15, 0.1);
        padding: 4px 8px;
        border-radius: 4px;
    }
</style>

<!--Css error-message-->
<style>
    .error-message {
        color: red;
        padding: 10px;
        background-color: #ffeeee;
        border: 1px solid #ffcccc;
        border-radius: 4px;
        margin: 10px 0;
    }
</style>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WiFre - Historique</title>
    </head>
    <body>        
        <!--SidBar et NavBar-->
        <jsp:include page="../SidBar/NavSidBar.jsp" />
        
        <!--Container-->
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>HISTORIQUE DES PRÊTS</h1>
                        <ul class="breadcrumb">
                            <li><a href="#">Bibliothèque</a></li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li><a class="active" href="#">Historique</a></li>
                        </ul>
                    </div>
                </div>

                <div class="table-date">
                    <div class="orber">
                        <div class="historique">
                            <!-- Utilisation de pageContext.request.contextPath pour construire l'URL absolue -->
                            <form action="${pageContext.request.contextPath}/ServletHistoriques" method="GET">
                                <input type="hidden" name="action" value="search">
                                <div class="search-box">
                                    <input type="text" name="idpers" placeholder="ID Membre (ex: M001)" required 
                                           value="<%= request.getParameter("idpers") != null ? request.getParameter("idpers") : "" %>">
                                    <button type="submit">Rechercher</button>
                                </div>
                            </form>

                            <% if (request.getAttribute("error") != null) { %>
                                <div class="error-message">
                                    <%= request.getAttribute("error") %>
                                </div>
                            <% } %>

                            <% if (request.getAttribute("membreInfo") != null) { 
                                Map<String, String> membreInfo = (Map<String, String>) request.getAttribute("membreInfo");
                            %>
                                <div class="membre-info">
                                    <h3>Informations du membre</h3>
                                    <p><strong>ID:</strong> <%= membreInfo.get("idpers") %></p>
                                    <p><strong>Nom:</strong> <%= membreInfo.get("nom") %></p>
                                    <p><strong>Sexe:</strong> <%= membreInfo.get("sexe") %></p>
                                    <p><strong>Âge:</strong> <%= membreInfo.get("age") %> ans</p>
                                    <p><strong>Contact:</strong> <%= membreInfo.get("contact") %></p>
                                </div>

                                <h3 class="section-title">Livres empruntés</h3>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>ID Prêt</th>
                                            <th>Livre</th>
                                            <th>Date Prêt</th>
                                            <th>Date Retour prévue</th>
                                            <th>Statut</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                        List<Map<String, String>> prets = (List<Map<String, String>>) request.getAttribute("prets");
                                        if (prets != null && !prets.isEmpty()) {
                                            for (Map<String, String> pret : prets) { 
                                        %>
                                            <tr>
                                                <td><%= pret.get("idpret") %></td>
                                                <td><%= pret.get("designation") %></td>
                                                <td><%= pret.get("datepret") %></td>
                                                <td><%= pret.get("dateretour") %></td>
                                                <td>
                                                    <span style="color: <%= "Rendu".equalsIgnoreCase(pret.get("statut")) ? "green" : "orange" %>;">
                                                        <%= pret.get("statut") %>
                                                    </span>
                                                </td>
                                            </tr>
                                        <% 
                                            }
                                        } else { 
                                        %>
                                            <tr>
                                                <td colspan="5" style="text-align: center;">Aucun prêt en cours</td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>

                                <h3 class="section-title">Livres rendus</h3>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>ID Rendu</th>
                                            <th>Livre</th>
                                            <th>Date Rendu</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                        List<Map<String, String>> rendus = (List<Map<String, String>>) request.getAttribute("rendus");
                                        if (rendus != null && !rendus.isEmpty()) {
                                            for (Map<String, String> rendu : rendus) { 
                                        %>
                                            <tr>
                                                <td><%= rendu.get("idrendu") %></td>
                                                <td><%= rendu.get("designation") %></td>
                                                <td><%= rendu.get("daterendu") %></td>
                                            </tr>
                                        <% 
                                            }
                                        } else { 
                                        %>
                                            <tr>
                                                <td colspan="3" style="text-align: center;">Aucun livre rendu</td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            <% } %>
                        </div>
                    </div>
                </div>
                
                <footer class="footer">
                    <div class="footer-text">
                        <p>&copy; 2025 par Bibliothèque WiFre | Tous Droits Réservés.</p>
                    </div>
                    <div class="footer-iconTop">
                        <a href="#"><i class='bx bx-up-arrow-alt'></i></a>
                    </div>
                </footer>
            </main>
        </section>
    </body>
</html>

