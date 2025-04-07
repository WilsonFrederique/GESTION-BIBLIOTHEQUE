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


<!-- Mon Css Pour Tables -->
<style>
    /* Style général du tableau */
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 1rem 0;
        background: #ffffff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    /* En-tête du tableau */
    .thead {
        background-color: #3c91e6;
        color: white;
    }

    .thead tr th {
        padding: 1rem 1.5rem;
        text-align: left;
        font-weight: 600;
        font-size: 0.85rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        position: relative;
    }

    .thead tr th:not(:last-child)::after {
        content: "";
        position: absolute;
        right: 0;
        top: 50%;
        transform: translateY(-50%);
        height: 60%;
        width: 1px;
        background-color: rgba(255, 255, 255, 0.2);
    }

    /* Corps du tableau */
    .tbody tr {
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }

    .tbody tr:not(:last-child) {
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }

    .tbody tr:hover {
        background-color: #f8fafc;
    }

    .tbody td {
        padding: 1.25rem 1.5rem;
        font-size: 0.95rem;
        color: #4a5568;
        vertical-align: middle;
    }

    /* Style des cellules */
    .tbody td p {
        margin: 0;
        font-weight: 500;
    }

    /* Badges de statut */
    .status {
        display: inline-block;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }

    .status.process {
        background-color: #ffc107;
        color: #1a202c;
    }

    /* Icônes d'action */
    .action-icons {
        display: flex;
        gap: 0.75rem;
        justify-content: flex-start;
    }

    .action-icons a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        color: #718096;
        background-color: transparent;
        transition: all 0.3s ease;
    }

    .action-icons a:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .action-icons a:first-child:hover {
        color: #3c91e6;
        background-color: rgba(60, 145, 230, 0.1);
    }

    .action-icons a:last-child:hover {
        color: #e53e3e;
        background-color: rgba(229, 62, 62, 0.1);
    }

    .action-icons i {
        font-size: 1.25rem;
    }

    /* Animation des lignes */
    @keyframes fadeInRow {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .tbody tr {
        animation: fadeInRow 0.4s ease-out forwards;
        opacity: 0;
    }

    .tbody tr:nth-child(1) { animation-delay: 0.1s; }
    .tbody tr:nth-child(2) { animation-delay: 0.2s; }
    .tbody tr:nth-child(3) { animation-delay: 0.3s; }
    .tbody tr:nth-child(4) { animation-delay: 0.4s; }

    /* Responsive */
    @media (max-width: 768px) {
        table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }

        .thead tr th,
        .tbody td {
            padding: 0.75rem 1rem;
        }

        .action-icons {
            gap: 0.5rem;
        }

        .action-icons a {
            width: 32px;
            height: 32px;
        }
    }
    
    
    
    
    
    /*Search Dans Table*/
    .search-container {
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
    }
    
    .search-input {
        border: 1px solid #ddd;
        border-radius: 20px;
        padding: 0.5rem 1rem;
        margin-right: 0.5rem;
        width: 0;
        opacity: 0;
        transition: all 0.3s ease;
    }
    
    .search-input.active {
        display: block !important;
        width: 200px;
        opacity: 1;
    }
    
    .search-icon {
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .search-icon:hover {
        color: #3c91e6;
        transform: scale(1.1);
    }
</style>


<!--Mon Css Pour Section Home-->
<style>
    .table-date .todo1{
        background-image: url("./images/b1.jpg")!important;
        background-size: cover !important;
        background-position: center !important;
        background-repeat: no-repeat !important;
        color: #fff !important;
    }
    .table-date .head .h3, .table-date .head .bxx{
        color: #fff !important;
    }
    .table-date .headHome{
        color: #000 !important;
    }
    .home{
        display: flex;
        align-items: center;
    }

    .home-img img{
        width: 200px;
        height: 200px;
        box-shadow: 0 0 7px #3c91e6;
        padding: .2rem;
        border-radius: 10px;
        animation: floatImage 4s ease-in-out infinite;
        
    }
    
    @keyframes floatImage {
        0%{
            transform: translateY(0);
        }
        50%{
            transform: translateY(-2.4rem);
        }
        100%{
            transform: translateY(0);
        }
    }
    
    .home-content h3{
        font-size: 1.5rem;
        font-weight: 550;
    }

    .home-content h3:nth-of-type(2){
        margin-bottom: 1.4rem;
    }
    
    .home-content h1{
        font-size: 2.5rem;
        font-weight: 700;
        line-height: 1.3;
    }

    .home-content p{
        font-size: 1rem;
    }
    
    @media (max-width: 991px){
        .home{
            padding-bottom: 4rem;
        }
    }
    
    @media (max-width: 768px){
        .home{
            flex-direction: column;
        }
        
        .home-content h3{
            font-size: 0.9rem;
            font-weight: 550;
        }

        .home-content h1{
            font-size: 1.5rem;
            font-weight: 600;
        }

        .home-content p{
            font-size: 0.6rem;
        }
        
        .home-img img{
            width: 90vw;
            margin-top: 6rem;
            margin-bottom: 2em;
        }

        .home-img .img-profil1{
            display: none;
        }

        .home-img .img-profil2{
            display: block;
        }

        .about{
            flex-direction: column-reverse;
        }

        .about-content h2{
            text-align: center;
            margin-top: 1em;
        }

        .about-img img{
            width: 90vw;
            margin-top: 0rem;
            margin-bottom: 2em;
        }

        .about-img .img-profil1{
            display: none;
        }

        .about-img .img-profil2{
            display: block;
        }

        .services h2{
            margin-bottom: 3rem;
        }

        .portfolio h2{
            margin-bottom: 3rem;
        }

        .portfolio-container{
            grid-template-columns: repeat(2, 1fr);
        }
    }
    
    
    .multiple-text{
        color: #3c91e6;
    }
    
    
    .social-media a{
        display: inline-flex;
        justify-content: center;
        align-items: center;
        width: 3rem;
        height: 3rem;
        background: transparent;
        border: .2rem solid #3c91e6;
        border-radius: 50%;
        font-size: 1.5rem;
        color: #fff;
        margin: 1rem 1.5rem 1rem 0;
        transition: .5s ease;
    }

    .social-media a:hover{
        background: #3c91e6;
        color: #323946;
        box-shadow: 0 0 1rem #3c91e6;
    }
    
    .btn{
        display: inline-block;
        padding: .8rem 2.1rem;
        background: #3c91e6;
        border-radius: 4rem;
        font-size: 1.1rem;
        color: #fff;
        letter-spacing: .1rem;
        font-weight: 600;
        transition: .5s ease;
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WiFre</title>
    </head>
    <body>
        <%--<jsp:include page="/Components/NavBar/index.jsp" />--%>
        
        <!--SidBar et NavBar-->
        <jsp:include page="/Components/SidBar/NavSidBar.jsp" />
        
        
        <!--Container-->
        <!-- ========================================= CONTENT ======================================== -->
        <section id="content">
            <!-- --------------------- Main --------------------- -->
            <main>
                <div class="head-title">
                    <!--Titre et file d'ariane -->
                    <div class="left">
                        <h1>TABLEAU DE BORD</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Bibliothèque</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Tableau de bord</a>
                            </li>
                        </ul>
                    </div>
                    <!--Ajout-->
                    <a href="/GestionBibliotheque/Components/Membres/FrmMembre.jsp" class="btn-download">
                        <i class='bx bx-plus' ></i>
                        <span class="text">AJOUT MEMBRE</span>
                    </a>
                </div>

                <!-- ************************ Box********************** -->
                <ul class="box-info">
                    <li>
                        <i class='bx bx-group' ></i>
                        <span class="text">
                            <h3 class="txt-box-top">1020</h3>
                            <p class="txt-box-bottom">Total des membres</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bx-book-alt' ></i>
                        <span class="text">
                            <h3 class="txt-box-top">2830</h3>
                            <p class="txt-box-bottom">Total des Livres</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bx-user' ></i>
                        <span class="text">
                            <h3 class="txt-box-top">543</h3>
                            <p class="txt-box-bottom">Total des Preters</p>
                        </span>
                    </li>
                </ul>

                <!-- ************************  HOME  *********************** -->
                <div class="table-date">
                    <!--Todo Home-->
                    <div class="todo1">
                        <div class="head headHome">
                            <h3 class="h3">Bibliothèque WiFre</h3>
                            <i class='bx bxx bx-plus icon-tbl' ></i>
                            <i class='bx bxx bx-filter icon-tbl'></i>
                        </div>
                        
                        <section class="home" id="home">
                            <div class="home-content">
                                <h3>Bonjour et bienvenue chez nous !</h3>
                                <h1>Bibliothèque WiFre</h1>
                                <h3>Nous sommes <span class="multiple-text"></span></h3>
                                <p>
                                    La bibliothèque WiFre est un espace dédié à la lecture, à l'apprentissage et à la découverte du savoir. 
                                    le met à disposition un large choix de livres, d'articles et de ressources numériques couvrant divers domaines tels que la littérature, 
                                    la science, l'histoire, la technologie et bien plus encore.
                                </p>
                                <div class="social-media">
                                    <a href="https://facebook.com/profile.php?id=100084737982019"><i class='bx bxl-facebook' ></i></a>
                                    <a href="#"><i class='bx bxl-twitter' ></i></a>
                                    <a href="#"><i class='bx bxl-instagram-alt' ></i></a>
                                    <a href="https://www.linkedin.com/in/wilson-frederique-500b82352"><i class='bx bxl-linkedin' ></i></a>
                                </div>
                                <a href="#" class="btn">Visitez les membres</a>
                            </div>

                            <div class="home-img">
                                <img class="img-profil1" src="./images/b2.jpg" alt="">
                            </div>
                        </section>
                        
                    </div>
                </div>
                
                
                <!--**************************** TABLES 1 ******************************-->
                
                <div class="table-date">
                    <!--Todo-->
                    <div class="todo">
                        <div class="head">
                            <h3>Todos</h3>
                            <i class='bx bx-plus icon-tbl' ></i>
                            <i class='bx bx-filter icon-tbl'></i>
                        </div>
                        <ul class="todo-list todo-color">
                            <li class="not-completed">
                                <p>Todo List</p>
                                <i class='bx bx-dots-vertical-rounded bg-hover-icon' ></i>
                            </li>
                            <li class="completed">
                                <p>Todo List</p>
                                <i class='bx bx-dots-vertical-rounded' ></i>
                            </li>
                            <li class="not-completed">
                                <p>Todo List</p>
                                <i class='bx bx-dots-vertical-rounded' ></i>
                            </li>
                            <li class="completed">
                                <p>Todo List</p>
                                <i class='bx bx-dots-vertical-rounded' ></i>
                            </li>
                            <li class="not-completed">
                                <p>Todo List</p>
                                <i class='bx bx-dots-vertical-rounded' ></i>
                            </li>
                            <li class="completed">
                                <p>Todo List</p>
                                <i class='bx bx-dots-vertical-rounded' ></i>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <!--**************************** TABLES 2 et 3******************************-->

                <div class="table-date">
                    <!--Order-->
                    <div class="orber">
                        <div class="head">
                            <h3 class="dernier1">Derniers Membres</h3>
                            <div class="search-container">
                                <input type="search" placeholder="Search..." class="search-input" style="display: none;">
                                <i class='bx bx-search icon-tbl search-icon'></i>
                            </div>
                            <i class='bx bx-filter icon-tbl'></i>
                        </div>
                        <table>
                            <thead class="thead">
                                <tr>
                                    <th>ID PERSONNELS</th>
                                    <th>NOM</th>
                                    <th>SEXE</th>
                                    <th>CONTACT</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody class="tbody">
                                <tr>
                                    <td>
                                        <img src="/GestionBibliotheque/images/a4.png" alt="Avatar">
                                        <p>M001</p>
                                    </td>
                                    <td>
                                        <p>Walle Fred</p>
                                    </td>
                                    <td>M</td>
                                    <td><span class="status process">0000000000</span></td>
                                    <td class="action-icons">
                                        <a href="#" aria-label="Edit" title="Edit">
                                            <i class='bx bx-edit'></i>
                                        </a>
                                        <a href="#" aria-label="Delete" title="Delete">
                                            <i class='bx bx-trash'></i>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="/GestionBibliotheque/images/a4.png" alt="Avatar">
                                        <p>M001</p>
                                    </td>
                                    <td>
                                        <p>Walle Fred</p>
                                    </td>
                                    <td>M</td>
                                    <td><span class="status process">0000000000</span></td>
                                    <td class="action-icons">
                                        <a href="#" aria-label="Edit" title="Edit">
                                            <i class='bx bx-edit'></i>
                                        </a>
                                        <a href="#" aria-label="Delete" title="Delete">
                                            <i class='bx bx-trash'></i>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="/GestionBibliotheque/images/a4.png" alt="Avatar">
                                        <p>M001</p>
                                    </td>
                                    <td>
                                        <p>Walle Fred</p>
                                    </td>
                                    <td>M</td>
                                    <td><span class="status process">0000000000</span></td>
                                    <td class="action-icons">
                                        <a href="#" aria-label="Edit" title="Edit">
                                            <i class='bx bx-edit'></i>
                                        </a>
                                        <a href="#" aria-label="Delete" title="Delete">
                                            <i class='bx bx-trash'></i>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="/GestionBibliotheque/images/a4.png" alt="Avatar">
                                        <p>M001</p>
                                    </td>
                                    <td>
                                        <p>Walle Fred</p>
                                    </td>
                                    <td>M</td>
                                    <td><span class="status process">0000000000</span></td>
                                    <td class="action-icons">
                                        <a href="#" aria-label="Edit" title="Edit">
                                            <i class='bx bx-edit'></i>
                                        </a>
                                        <a href="#" aria-label="Delete" title="Delete">
                                            <i class='bx bx-trash'></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <!-- Footer -->
                <footer class="footer">
                    <div class="footer-text">
                        <p>&copy; 2025 par Bibliothèque WiFre | Tous Droits Réservés.</p>
                    </div>

                    <div class="footer-iconTop">
                        <a href="/GestionBibliotheque/index.jsp"><i class='bx bx-up-arrow-alt'></i></a>
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
        
        <!--Script Pour Nous somnes-->
        <!-- Chargement de Typed.js depuis CDN -->
        <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                // Vérification que l'élément existe et que Typed est bien chargé
                if(document.querySelector('.multiple-text') && typeof Typed !== 'undefined') {
                    try {
                        var typed = new Typed('.multiple-text', {
                            strings: ['une bibliothèque moderne', 'accessible à tous', 'amoureux du savoir', 'explorateurs de connaissances', 'guides vers la sagesse', 'curieux et inspirés', 'architectes de l’imaginaire et aussi', 'chercheurs de vérité'],
                            typeSpeed: 50,
                            backSpeed: 30,
                            startDelay: 500,
                            backDelay: 1500,
                            loop: true,
                            showCursor: true,
                            cursorChar: '|',
                            contentType: 'html'
                        });
                    } catch(e) {
                        console.error("Erreur d'initialisation de Typed:", e);
                        // Solution de repli si Typed échoue
                        document.querySelector('.multiple-text').textContent = 'une bibliothèque moderne et accessible à tous';
                    }
                } else {
                    console.log("Typed.js non chargé ou élément .multiple-text introuvable");
                    // Solution de repli
                    var element = document.querySelector('.multiple-text');
                    if(element) {
                        element.textContent = 'une bibliothèque moderne et accessible à tous';
                    }
                }
            });
        </script>
    </body>
</html>
