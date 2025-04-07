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

<!--Mon Css Pour Order Table-->
<style>
    .orber {
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        overflow: hidden;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }

    .orber:hover {
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    }

    .orber .head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 1.5rem;
        background: #f9f9f9;
        border-bottom: 1px solid var(--border-color);
    }

    .orber .head h3 {
        margin: 0;
        font-size: 1.25rem;
        font-weight: 600;
        color: #342e37;
    }

    .orber .head .icon-tbl {
        font-size: 1.2rem;
        color: #342e37;
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        padding: 0.5rem;
        border-radius: 50%;
    }

    .orber .head .icon-tbl:hover {
        background: rgba(0, 0, 0, 0.05);
        transform: scale(1.1);
    }

    .orber table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
    }

    .orber thead {
        position: sticky;
        top: 0;
        background: white;
        z-index: 10;
    }
    
    .orber thead tr th{
        padding-left: 0;        
    }

    .orber th {
        padding: 1rem 1.5rem;
        text-align: left;
        font-weight: 600;
        color: #342e37;
        border-bottom: 2px solid var(--border-color);
        background: #f9f9f9;
        position: relative;
    }

    .orber th:after {
        content: "";
        position: absolute;
        bottom: -2px;
        left: 0;
        width: 0;
        height: 2px;
        background: #3c91e6;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }

    .orber th:hover:after {
        width: 100%;
    }

    .orber td {
        padding: 1.25rem 1.5rem;
        border-bottom: 1px solid var(--border-color);
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }

    .orber tr:last-child td {
        border-bottom: none;
    }

    .orber tr:hover td {
        background: #f5f5f5;
    }

    .orber td:first-child {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .orber td img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .orber td p {
        margin: 0;
        font-weight: 500;
    }

    /* Status badges */
    .status {
        display: inline-block;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }

    .status.completed {
        background: #3c91e6;
        color: white;
    }

    .status.process {
        background: #ffc107;
        color: #333;
    }

    .status.pending {
        background: #ff6b6b;
        color: white;
    }

    /* Animation for table rows */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .orber tbody tr {
        animation: fadeIn 0.4s ease-out forwards;
        opacity: 0;
    }

    .orber tbody tr:nth-child(1) { animation-delay: 0.1s; }
    .orber tbody tr:nth-child(2) { animation-delay: 0.2s; }
    .orber tbody tr:nth-child(3) { animation-delay: 0.3s; }
    .orber tbody tr:nth-child(4) { animation-delay: 0.4s; }
    .orber tbody tr:nth-child(5) { animation-delay: 0.5s; }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .orber .head {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
        }

        .orber .head .icon-tbl {
            align-self: flex-end;
        }

        .orber td {
            padding: 1rem;
        }

        .orber td:first-child {
            flex-direction: column;
            align-items: flex-start;
            gap: 0.5rem;
        }
    }
    
    
    
    /*Search*/
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
    
    
    
    /*Btn Actions*/
    /* Style pour le conteneur des actions */
    td.action-icons {
        display: flex;
        gap: 1rem;
        padding: 0.75rem 1.5rem;
    }

    /* Style de base pour les liens des icônes */
    td.action-icons a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        color: #5f6368;
        background-color: transparent;
    }

    /* Style pour les icônes */
    td.action-icons a i {
        font-size: 1.25rem;
        transition: transform 0.2s ease;
    }

    /* Style au survol */
    td.action-icons a:hover {
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    /* Style spécifique pour l'icône d'édition */
    td.action-icons a:first-child:hover {
        color: #3c91e6;
        background-color: rgba(60, 145, 230, 0.1);
    }

    /* Style spécifique pour l'icône de suppression */
    td.action-icons a:last-child:hover {
        color: #ff6b6b;
        background-color: rgba(255, 107, 107, 0.1);
    }

    /* Animation au clic */
    td.action-icons a:active {
        transform: scale(0.95);
    }

    /* Effet de vague au clic (effet matériel) */
    td.action-icons a {
        position: relative;
        overflow: hidden;
    }

    td.action-icons a::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        width: 5px;
        height: 5px;
        background: rgba(0, 0, 0, 0.1);
        opacity: 0;
        border-radius: 100%;
        transform: scale(1, 1) translate(-50%, -50%);
        transform-origin: 50% 50%;
    }

    td.action-icons a:active::after {
        animation: ripple 0.6s ease-out;
    }

    @keyframes ripple {
        0% {
            transform: scale(0, 0);
            opacity: 0.5;
        }
        100% {
            transform: scale(20, 20);
            opacity: 0;
        }
    }

    /* Version responsive */
    @media (max-width: 768px) {
        td.action-icons {
            gap: 0.75rem;
            padding: 0.5rem;
        }

        td.action-icons a {
            width: 32px;
            height: 32px;
        }

        td.action-icons a i {
            font-size: 1.1rem;
        }
    }
    
    /* Style spécifique pour le bouton de suppression invisible */
    .btn-invisble {
        border: none;
        outline: none;
        background: transparent;
        padding: 0;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        width: 36px;
        height: 36px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        color: #5f6368;
    }

    /* Style de l'icône à l'intérieur du bouton */
    .btn-invisble i {
        font-size: 1.25rem;
        transition: all 0.2s ease;
    }

    /* Effet au survol */
    .btn-invisble:hover {
        transform: translateY(-2px);
        color: #ff6b6b;
        background-color: rgba(255, 107, 107, 0.1);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    /* Effet au clic */
    .btn-invisble:active {
        transform: scale(0.95);
    }

    /* Animation de ripple (onde) au clic */
    .btn-invisble::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        width: 5px;
        height: 5px;
        background: rgba(255, 107, 107, 0.3);
        opacity: 0;
        border-radius: 100%;
        transform: scale(1, 1) translate(-50%, -50%);
        transform-origin: 50% 50%;
    }

    .btn-invisble:active::after {
        animation: ripple 0.6s ease-out;
    }

    @keyframes ripple {
        0% {
            transform: scale(0, 0);
            opacity: 0.5;
        }
        100% {
            transform: scale(20, 20);
            opacity: 0;
        }
    }

    /* Version responsive */
    @media (max-width: 768px) {
        .btn-invisble {
            width: 32px;
            height: 32px;
        }

        .btn-invisble i {
            font-size: 1.1rem;
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

<!--Juste Stle Pour Que Ce : place-recherche-entre-deux-date Est visible et invisible Apres click Btn-->
<style>
    /* Ajoutez ceci dans votre section <style> */
    .place-recherche-entre-deux-date {
        display: none;
        transition: all 0.3s ease;
    }
    
    .place-recherche-entre-deux-date.show {
        display: block;
        animation: fadeIn 0.5s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>


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
                        <h1>LISTE DES PERSONNES PRÊTANT</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Bibliothèque</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="/GestionBibliotheque/Components/Preters/indexPreters.jsp">Liste des personnes prêtant</a>
                            </li>
                        </ul>
                    </div>
                    <a href="/GestionBibliotheque/Components/Preters/FrmPreters.jsp" class="btn-download">
                        <i class='bx bx-plus' ></i>
                        <span class="text">AJOUT DE PRÊTS</span>
                    </a>
                </div>

                <!-- ********************** Prêts ************************ -->
                
                <!--Order : Liste des prêts effectuées entre deux dates-->
                <div class="table-date">
                    <div class="orber place-recherche-entre-deux-date">
                        <div class="">
                            <div class="head">
                                <h3>Recherche de prêts entre deux dates</h3>
                            </div>

                            <!-- Formulaire de recherche par dates -->
                            <div class="date-filter-container">
                                <form method="get" action="indexPreters.jsp" class="date-filter-form">
                                    <div class="date-input-group">
                                        <label for="date-debut">Date de début</label>
                                        <input type="date" id="date-debut" name="dateDebut" class="date-input" required>
                                    </div>

                                    <div class="date-input-group">
                                        <label for="date-fin">Date de fin</label>
                                        <input type="date" id="date-fin" name="dateFin" class="date-input" required>
                                    </div>

                                    <button type="submit" class="search-btn" name="action" value="searchByDate">
                                        <i class='bx bx-search'></i> Rechercher
                                    </button>

                                    <button type="reset" class="reset-btn">
                                        <i class='bx bx-reset'></i> Réinitialiser
                                    </button>
                                </form>
                            </div>

                            <!-- Résultats de la recherche -->
                            <div class="search-results">
                                <table>
                                    <thead class="thead">
                                        <tr>
                                            <th>ID PRETERS</th>
                                            <th>ID PERSONNELS</th>
                                            <th>ID LIVRE</th>
                                            <th>DATE PRETER</th>
                                            <th>DATE RETOUR</th>
                                            <th>ACTIONS</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbody">
                                        <%
                                            String dateDebutParam = request.getParameter("dateDebut");
                                            String dateFinParam = request.getParameter("dateFin");
                                            String actionParam = request.getParameter("action");

                                            if ("searchByDate".equals(actionParam) && dateDebutParam != null && dateFinParam != null 
                                                    && !dateDebutParam.isEmpty() && !dateFinParam.isEmpty()) {

                                                Connection conn = null;
                                                PreparedStatement stmt = null;
                                                ResultSet rs = null;

                                                try {
                                                    conn = DB_Connexion.getConnection();

                                                    // Convertir les dates en format SQL
                                                    java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutParam);

                                                    // Ajouter un jour à la date de fin pour inclure toute la journée
                                                    java.sql.Date dateFin = java.sql.Date.valueOf(dateFinParam);
                                                    Calendar cal = Calendar.getInstance();
                                                    cal.setTime(dateFin);
                                                    cal.add(Calendar.DAY_OF_MONTH, 1);
                                                    dateFin = new java.sql.Date(cal.getTimeInMillis());

                                                    String sql = "SELECT * FROM preter WHERE datepret BETWEEN ? AND ? ORDER BY datepret DESC";
                                                    stmt = conn.prepareStatement(sql);
                                                    stmt.setDate(1, dateDebut);
                                                    stmt.setDate(2, dateFin);

                                                    rs = stmt.executeQuery();

                                                    if (!rs.isBeforeFirst()) {
                                        %>
                                        <tr>
                                            <td colspan="6" class="no-results">Aucun prêt trouvé pour la période sélectionnée</td>
                                        </tr>
                                        <%
                                                    } else {
                                                        while (rs.next()) {
                                                            String idpret = rs.getString("idpret");
                                                            String idpers = rs.getString("idpers");
                                                            String idlivre = rs.getString("idlivre");
                                                            java.sql.Timestamp datepretTimestamp = rs.getTimestamp("datepret");
                                                            java.sql.Date dateretourSqlDate = rs.getDate("dateretour");

                                                            // Formatage des dates
                                                            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

                                                            String datepretFormatted = datepretTimestamp != null ? dateTimeFormat.format(datepretTimestamp) : "N/A";
                                                            String dateretourFormatted = dateretourSqlDate != null ? dateFormat.format(dateretourSqlDate) : "N/A";
                                        %>
                                        <tr>
                                            <td>
                                                <img src="/GestionBibliotheque/images/P.png" alt="Avatar">
                                                <p><%= idpret %></p>
                                            </td>
                                            <td>
                                                <p><%= idpers %></p>
                                            </td>
                                            <td><%= idlivre %></td>
                                            <td><span class="status process"><%= datepretFormatted %></span></td>
                                            <td><span class="status pending"><%= dateretourFormatted %></span></td>
                                            <td class="action-icons">
                                                <a href="/GestionBibliotheque/Components/Preters/FrmPreters.jsp?edit=true&idpret=<%= idpret %>&idpers=<%= idpers %>&idlivre=<%= idlivre %>&datepret=<%= datepretFormatted %>&dateretour=<%= dateretourFormatted %>" 
                                                   aria-label="Edit" title="Edit">
                                                    <i class='bx bx-edit'></i>
                                                </a>
                                                <form method="get" action="<%= request.getContextPath() %>/ServletPreters" style="display:inline;">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="idpret" value="<%= idpret %>">
                                                    <!-- Ajoutez ces champs cachés pour conserver les dates de recherche -->
                                                    <input type="hidden" name="dateDebut" value="<%= request.getParameter("dateDebut") %>">
                                                    <input type="hidden" name="dateFin" value="<%= request.getParameter("dateFin") %>">
                                                    <button type="submit" class="btn-invisble" 
                                                            onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet emprunt ?')">
                                                        <i class='bx bx-trash'></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                                        }
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                        %>
                                        <tr>
                                            <td colspan="6" class="no-results">Erreur lors de la recherche: <%= e.getMessage() %></td>
                                        </tr>
                                        <%
                                                } finally {
                                                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>                     
                    </div>
                </div>

                
                <!--Order : Tout Liste des prêts-->
                <div class="table-date">
                    <div class="orber">
                        <div class="head">
                            <h3>Derniers Prêteurs</h3>
                            <div class="div-btn-recherche">
                                <button class="btn-modern" onclick="toggleDateSearch()">
                                    <i class='bx bx-calendar'></i> 
                                    <span class="search-text">Rechercher entre deux dates</span>
                                </button>
                            </div>
                            <div class="search-container">
                                <input type="search" placeholder="Rechercher..." class="search-input" style="display: none;">
                                <i class='bx bx-search icon-tbl search-icon'></i>
                            </div>
                            <a href="/GestionBibliotheque/Components/Preters/indexPreters.jsp">
                                <i class='bx bx-filter icon-tbl'></i>                                
                            </a>
                        </div>
                        <table>
                            <thead class="thead">
                                <tr>
                                    <th>ID PRETERS</th>
                                    <th>ID PERSONNELS</th>
                                    <th>ID LIVRE</th>
                                    <th>DATE PRETER</th>
                                    <th>DATE RETOUR</th>
                                    <th>ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody class="tbody">
                                
                                <%
                                    Connection conn = null;
                                    PreparedStatement stmt = null;
                                    ResultSet rs = null;
                                    try {
                                        conn = DB_Connexion.getConnection();
                                        String sql = "SELECT * FROM preter";
                                        stmt = conn.prepareStatement(sql);
                                        rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String idpret = rs.getString("idpret");
                                            String idpers = rs.getString("idpers");
                                            String idlivre = rs.getString("idlivre");

                                            // Correction pour les dates
                                            java.sql.Timestamp datepretTimestamp = rs.getTimestamp("datepret");
                                            java.sql.Date dateretourSqlDate = rs.getDate("dateretour");

                                            // Conversion en java.util.Date
                                            java.util.Date datepret = null;
                                            java.util.Date dateretour = null;

                                            if (datepretTimestamp != null) {
                                                datepret = new java.util.Date(datepretTimestamp.getTime());
                                            }
                                            if (dateretourSqlDate != null) {
                                                dateretour = new java.util.Date(dateretourSqlDate.getTime());
                                            }

                                            // Formatage des dates pour l'affichage
                                            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

                                            String datepretFormatted = datepret != null ? dateTimeFormat.format(datepret) : "N/A";
                                            String dateretourFormatted = dateretour != null ? dateFormat.format(dateretour) : "N/A";
                                %>
                                
                                <tr>
                                    <td>
                                        <img src="/GestionBibliotheque/images/P.png" alt="Avatar">
                                        <p><%= idpret %></p>
                                    </td>
                                    <td>
                                        <p><%= idpers %></p>
                                    </td>
                                    <td><%= idlivre %></td>
                                    <td><span class="status process"><%= datepretFormatted %></span></td>
                                    <td><span class="status pending"><%= dateretourFormatted %></span></td>
                                    <td class="action-icons">
                                        <a href="/GestionBibliotheque/Components/Preters/FrmPreters.jsp?edit=true&idpret=<%= idpret %>&idpers=<%= idpers %>&idlivre=<%= idlivre %>&datepret=<%= datepretFormatted %>&dateretour=<%= dateretourFormatted %>" 
                                           aria-label="Edit" title="Edit">
                                            <i class='bx bx-edit'></i>
                                        </a>
                                        <form method="get" action="<%= request.getContextPath() %>/ServletPreters" style="display:inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="idpret" value="<%= idpret %>">
                                            <button type="submit" class="btn-invisble" 
                                                    onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet emprunt ?')">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                
                                <%
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) rs.close();
                                        if (stmt != null) stmt.close();
                                        if (conn != null) conn.close();
                                    }
                                %>
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
                        <a href="/GestionBibliotheque/Components/Preters/indexPreters.jsp"><i class='bx bx-up-arrow-alt'></i></a>
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
