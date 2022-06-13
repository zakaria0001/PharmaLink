<%-- 
    Document   : HomeUser
    Created on : Jun 9, 2022, 10:59:00 PM
    Author     : mbp-de-zakaria
--%>

<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - PharmaLink</title>
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tajawal&display=swap" rel="stylesheet">
    </head>
    <style>
        body{
             font-family: 'Tajawal', sans-serif;        

        }
        .MedocCard{
            border:2px solid black;
            width:fit-content;
            padding-left: 2%;
            padding-right: 2%;
            padding-top:1%;
            border-radius:20px;
            margin-top:5%;
            margin-right:2%;
            position: relative;

        }
        .MedocCard button{
            background-color: #1363DF;
            width: 100% ;
            border: none;
            border-radius:30px;
            text-decoration: none;
            margin: 5px;
            text-transform: uppercase;
            padding:2%;


        }
        .MedocCard button a{
            text-decoration: none;
            
            font-size: 18px;
            color:white;
            font-family: 'Tajawal', sans-serif; 



        }
        #AllMedocCards{
            display: flex;
            flex-direction: row;
            justify-content: center; 
            flex-wrap: wrap;
            position: relative;
        }
        #FourButton{
            background-color:#1363DF;
            border: none;
            border-radius:30px;
            padding:1%;
            width: 10%;

        }
        #FourButton a{
            text-decoration: none;
            color:white;
            font-family: 'Tajawal', sans-serif; 
            text-transform: uppercase;
            font-size: 15px;
            
        }
        #searchMedoc{
            border-top:none;
            border-left:none;
            border-right:none;
            font-size: 30px;
                outline:none;
                color:#1363DF;
               
        }
    </style>
    <body>
        <h1 style="text-align:end">Bonjour <%=session.getAttribute("nomClient")%>  <%=session.getAttribute("PrenomClient")%></h1>
        <a style="float:right" href="index.jsp">Se Déconnecter</a>
        <h1>Catalogue De Médicaments Disponibles : </h1>
        <section style="text-align:center" id="SearchSection">
            <input type="text" id="searchMedoc" placeholder="Chercher Medicament " name="searchmdc" >
            <br>
         
        </section>
             <%
               Connection con = SQLConnection.getConnection();
                Statement stFour = con.createStatement();
                ResultSet rsFournisseur = stFour.executeQuery("select distinct NomFournisseur,IDFournisseur from Fournisseur ");
                while (rsFournisseur.next()) {
           
        %>
        <button id="FourButton"> <a href="ProfileFournisseur.jsp?idFournisseur=<%=rsFournisseur.getInt(2)%>"> <%=rsFournisseur.getString(1)%></a></button>
        <%}%>
                

        <section id="AllMedocCards">
        <%
            Statement stmt2 = con.createStatement();
            ResultSet rsMedoc = stmt2.executeQuery("select m.Designation,m.PhotoMedoc,m.DatePeremption,m.DateReception,m.StockActuel,m.StockMin,f.NomFournisseur,m.IDMedicament,m.fournisseurID,m.prix from Medicament m join fournisseur f on m.fournisseurID=f.IDFournisseur ");
            while (rsMedoc.next()) {
            byte[] imgData =rsMedoc.getBytes(2);
            String encode = Base64.getEncoder().encodeToString(imgData);
        %>
        
            <div class="MedocCard" style="text-align: center">
                
                <img width="150px"height="130px"src="data:image/jpeg;base64,<%= encode %>"> 
                <h3><%=rsMedoc.getString(1)%></h3>
                <h4>Stock Restant : <%=rsMedoc.getInt(5)%></h4>
                <h4>Fournisseur : <%=rsMedoc.getString(7)%></h4>
              
                <button>  <a href="DetailsLivraison.jsp?idMedoc=<%=rsMedoc.getInt(8)%>&imageMedic=<%=encode%>&NomMedoc=<%=rsMedoc.getString(1)%>&prixMedoc=<%=rsMedoc.getInt(10)%>&stockDispo=<%=rsMedoc.getInt(5)%>&idFournisseur=<%=rsMedoc.getInt(9)%>&NomFournisseur=<%=rsMedoc.getString(7)%>&nomClient=<%=session.getAttribute("nomClient")%>"> Commander</a></button>
            
            </div>
            <% } %>
        </section>
       
    </body>
</html>
