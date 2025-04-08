<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
    <!--Mon Css-->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            text-decoration: none;
        }

        li {
            list-style: none;
        }

        html {
            overflow-x: hidden;
        }

        #sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 280px;
            background: #dedee980;
            z-index: 2000;
            font-family: red;
            transition: .3s ease;
            overflow-x: hidden;
            scrollbar-width: none;
            display: flex;
            flex-direction: column;
        }

        #sidebar::-webkit-scrollbar {
            display: none;
        }

        #sidebar.hide {
            width: 54px;
        }

        #sidebar .brand {
            font-size: 24px;
            font-weight: 700;
            height: 56px;
            display: flex;
            align-items: center;
            color: highlighttext;
            position: sticky;
            top: 0;
            left: 0;
            z-index: 500;
            padding-bottom: 20px;
            box-sizing: content-box;
            color: rgba(0, 0, 0, 0.804);
        }

        #sidebar .brand .bx {
            min-width: 60px;
            display: flex;
            justify-content: center;
        }

        #sidebar .side-menu {
            width: 100%;
            margin-top: 48px;
        }

        #sidebar .side-menu li {
            height: 48px;
            background: transparent;
            margin-left: 6px;
            border-radius: 48px 0 0 48px;
            padding: 4px;
        }

        #sidebar .side-menu li.active {
            background: transparent;
            position: relative;
        }

        #sidebar .side-menu li.active::before {
            content: '';
            position: absolute;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            top: -40px;
            right: 0;
            box-shadow: 20px 20px 0 var(--grey);
            z-index: -1;
        }

        #sidebar .side-menu li.active::after {
            content: '';
            position: absolute;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            bottom: -40px;
            right: 0;
            box-shadow: 20px -20px 0 var(--grey);
            z-index: -1;
        }

        #sidebar .side-menu li a {
            width: 98%;
            height: 100%;
            background: #dedee992;
            display: flex;
            align-items: center;
            border-radius: 13px;
            font-size: 16px;
            color: black;
            white-space: nowrap;
            overflow-x: hidden;
        }

        #sidebar .side-menu.top li.active a {
            color: green;
        }

        #sidebar.hide .side-menu li a {
            width: calc(47px - (4px * 2));
            transition: width .3s ease;
        }

        #sidebar .side-menu li a.logout {
            color: black;
        }

        #sidebar .side-menu.top li a:hover {
            color: green;
        }

        #sidebar .side-menu li a .bx {
            min-width: calc(60px - ((4px + 6px) * 2));
            display: flex;
            justify-content: center;
        }
        
        
        
        
        #sidebar .side-menu.top {
            flex: 1;
            overflow-y: auto;
            margin-top: 48px;
        }

        #sidebar .side-menu.en-bas {
            margin-top: auto; /* Cela pousse le menu en bas */
            padding-bottom: 20px; /* Espace en bas */
            width: 100%;
        }
        
        
        
        
        #content nav {
            height: 56px;
            background: #dedee980;
            padding: 0 24px;
            display: flex
        ;
            align-items: center;
            grid-gap: 24px;
            padding-left: 0;
            position: sticky;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        
        
        
        /* =========== FIN CONTENT ========== */

        @media screen and (max-width: 768px) {
            #sidebar {
                width: 200px;
            }

            #content {
                width: calc(100% - 60px);
                left: 200px;
            }

            #content nav .nav-link {
                display: none;
            }
        }

        @media screen and (max-width: 576px) {
            #content nav form .form-input input {
                display: none;
            }

            #content nav form .form-input button {
                width: auto;
                height: auto;
                background: transparent;
                border-radius: none;
                color: #000;
            }

            #content nav form.show .form-input input {
                display: block;
                width: 100%;
            }

            #content nav form.show .form-input button {
                width: 36px;
                height: 100%;
                border-radius: 0 36px 36px 0;
                color: #fff;
                background: #342e37;
            }

            #content nav form.show ~ .notification,
            #content nav form.show ~ .profile {
                display: none;
            }

            #content main .box-info {
                grid-template-columns: 1fr;
            }

            #content main .table-date .head {
                min-width: 420px;
            }

            #content main .table-date .orber table {
                min-width: 420px;
            }

            #content main .table-date .todo .todo-list {
                min-height: 420px;
            }
        }
        
        
        .txtUppercase{
            text-transform: uppercase;
        }
        
    </style>
    
    <!--Mon Css Logo--> 
    <style>
        .Logo{
            margin-left: 1rem;
            width: 30px;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <!--SidBar-->
    <section id="sidebar">
        <a href="/GestionBibliotheque/index.jsp" class="brand">
            <img class="Logo" src="/GestionBibliotheque/images/Logo.png" alt="Avatar">
            <span class="text">BIBLIOTHEQUE</span>
        </a>
        <ul class="side-menu top">
            <li class="active">
                <a href="/GestionBibliotheque/index.jsp">
                    <i class='bx bxs-dashboard'></i>
                    <span class="text txtUppercase">Tableau de bord</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/Membres/indexMembre.jsp">
                    <i class='bx bxs-group'></i>
                    <span class="text">LISTE DES MEMBRES</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/Livres/indexLivres.jsp">
                    <i class='bx bxs-book' ></i>
                    <span class="text">LISTE DES LIVRES</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/Preters/indexPreters.jsp">
                    <i class='bx bxs-user' ></i>
                    <span class="text">PRETERS</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/Rendres/indexRendres.jsp">
                    <i class='bx bxs-calendar-event' ></i>
                    <span class="text">RENDRES</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/Historiques/indexHistoriques.jsp">
                    <i class='bx bx-history' ></i>
                    <span class="text">HISTORIQUE</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/GenererPDF/indexPDF.jsp">
                    <i class='bx bxs-file-pdf'></i>
                    <span class="text">GÉNÉRER LE PDF</span>
                </a>
            </li>
            <li>
                <a href="/GestionBibliotheque/Components/Messages/indexMessages.jsp">
                    <i class='bx bxs-message-dots'></i>
                    <span class="text">MESSAGES</span>
                </a>
            </li>
        </ul>
        <ul class="side-menu en-bas">
            <li>
                <a href="#">
                    <i class='bx bxs-cog'></i>
                    <span class="text txtUppercase">PARAMÈTRES</span>
                </a>
            </li>
            <li>
                <a href="#" class="logout">
                    <i class='bx bx-log-out' ></i>
                    <span class="text txtUppercase">DÉCONNEXION</span>
                </a>
            </li>
        </ul>
    </section>

    <!--Container-->
    <!-- ========================================= CONTENT ======================================== -->
    <section id="content">
        <!-- ----------------------  Navbar ------------------ -->
        <nav>
            <i class='bx bx-menu menu' ></i>
            <a href="#" class="nav-link">Catégories</a>
            <form id="searchForm" action="" method="get">
                <div class="form-input">
                    <input type="search" name="searchTerm" placeholder="Rechercher..." value="${param.searchTerm}">
                    <button type="submit" class="search-btn"><i class='bx bx-search'></i></button>
                </div>
            </form>

            <div class="theme-toggler">
                <a href="#">
                    <i class='bx bxs-brightness-half them' ></i>
                </a>
            </div>
            
            <a href="#" class="notification">
                <i class='bx bxs-bell' ></i>
                <span class="num">8</span>
            </a>

            <!-- /////////////////////// PROFILE ////////////////////////// -->
            <div class="right">
                <div class="top">
                    <div class="profile">
                        <div class="info">
                            <p class="admin-nom">Bonjour, <b>Fred</b></p>
                            <small class="text-muted admin-grad">Administrateur</small>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#" class="profile">
                <img src="/GestionBibliotheque/images/a1.png">
            </a>
            
        </nav>
        <!-- ---------------------- Fin Navbar -------------- -->

        <!-- --------------------- Main --------------------- -->
        
    </section>
    
    
    <!--Scrip-->
    <script>
        const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

        // Charger l'élément actif depuis le localStorage
        const activeItem = localStorage.getItem('activeMenuItem');
        if (activeItem) {
            document.querySelectorAll('#sidebar .side-menu.top li').forEach(item => {
                item.classList.remove('active');
                if (item.querySelector('a').getAttribute('href') === activeItem) {
                    item.classList.add('active');
                }
            });
        }

        allSideMenu.forEach(item => {
            const li = item.parentElement;

            item.addEventListener('click', function() {
                allSideMenu.forEach(i => {
                    i.parentElement.classList.remove('active');
                });
                li.classList.add('active');

                // Stocker l'élément actif dans le localStorage
                localStorage.setItem('activeMenuItem', item.getAttribute('href'));
            });
        });

        // ======= TOGGLE SIDE BAR =======
        const menuBar = document.querySelector('#content nav .bx.bx-menu');
        const sidebar = document.getElementById('sidebar');

        menuBar.addEventListener('click', function() {
            sidebar.classList.toggle('hide');
        });

        const searchButton = document.querySelector('#content nav form .form-input button');
        const searchButtonIcon = document.querySelector('#content nav form .form-input button .bx');
        const searchForm = document.querySelector('#content nav form');

        searchButton.addEventListener('click', function(e) {
            if(window.innerWidth < 576) {
                e.preventDefault();
                searchForm.classList.toggle('show');
                if(searchForm.classList.contains('show')){
                    searchButtonIcon.classList.replace('bx-search', 'bx-x');
                } else {
                    searchButtonIcon.classList.replace('bx-x', 'bx-search');
                }
            }
        });

        if(window.innerWidth < 768) {
            sidebar.classList.add('hide');
        } else if(window.innerWidth > 576) {
            searchButtonIcon.classList.replace('bx-x', 'bx-search');
            searchForm.classList.remove('show');
        }

        window.addEventListener('resize', function() {
            if(this.innerWidth > 576) {
                searchButtonIcon.classList.replace('bx-x', 'bx-search');
                searchForm.classList.remove('show');
            }
        });

        ////////////////////////// CHANGE THEME /////////////////////////////
        const themeToggler = document.querySelector(".theme-toggler");
        const body = document.body;

        // Load theme from localStorage
        if (localStorage.getItem('theme') === 'dark') {
            body.classList.add('dark-theme-variables');
            themeToggler.querySelector('i').classList.add('active');
        }

        // Change theme
        themeToggler.addEventListener('click', () => {
            document.body.classList.toggle('dark-theme-variables');
            themeToggler.querySelector('i').classList.toggle('active');

            // Save theme preference to localStorage
            if (body.classList.contains('dark-theme-variables')) {
                localStorage.setItem('theme', 'dark');
            } else {
                localStorage.removeItem('theme');
            }
        });
    </script>
    
    
    <!--Script Pour Recherche a chaque page-->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchForm = document.getElementById('searchForm');

            searchForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const searchTerm = this.searchTerm.value.trim();

                if (searchTerm === '') {
                    return; // Ne rien faire si le terme est vide
                }

                // Détermine la page actuelle et l'action correspondante
                const currentPage = window.location.pathname;
                let actionUrl = '';
                let actionParam = '';

                if (currentPage.includes('indexMembre')) {
                    actionUrl = '${pageContext.request.contextPath}/ServletMembres';
                    actionParam = 'action=search';
                } else if (currentPage.includes('indexLivres')) {
                    actionUrl = '${pageContext.request.contextPath}/ServletLivres';
                    actionParam = 'action=search';
                } else {
                    // Page non gérée, rediriger vers la page d'accueil
                    window.location.href = '${pageContext.request.contextPath}/index.jsp';
                    return;
                }

                // Soumettre la recherche
                const form = document.createElement('form');
                form.method = 'get';
                form.action = actionUrl;

                const inputAction = document.createElement('input');
                inputAction.type = 'hidden';
                inputAction.name = 'action';
                inputAction.value = 'search';
                form.appendChild(inputAction);

                const inputSearch = document.createElement('input');
                inputSearch.type = 'hidden';
                inputSearch.name = 'searchTerm';
                inputSearch.value = searchTerm;
                form.appendChild(inputSearch);

                document.body.appendChild(form);
                form.submit();
            });
        });
    </script>
</body>
</html>