<%-- 
    Document   : ProfileFournisseur
    Created on : Jun 12, 2022, 6:48:37 PM
    Author     : mbp-de-zakaria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tajawal&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Profile</title>
    </head>
    <style>
        body{
            font-family: 'Tajawal', sans-serif;  
            margin:0px;
            overflow-x: hidden;

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
                #AllMedocCards{
            display: flex;
            flex-direction: row;
            justify-content: center; 
            flex-wrap: wrap;
            position: relative;
        }
        nav{
            display:inline-flex;
            background-color: #1363DF;
            padding: 1%;
            width:100%;
        }
        nav li{
                list-style-type: none; 
                margin-right: 5%
        }
    </style>
    <body>
         <%
               Connection con = SQLConnection.getConnection();
                
                PreparedStatement psFour=con.prepareStatement("select distinct f.* from Fournisseur f  where f.idFournisseur=?");
                String idF=request.getParameter("idFournisseur");
                psFour.setInt(1, Integer.parseInt(idF));
                ResultSet rsFournisseur=psFour.executeQuery();
                
                if (rsFournisseur.next()) {
                     PreparedStatement psMedoc=con.prepareStatement("select * from medicament where fournisseurID=?");
                     psMedoc.setInt(1, rsFournisseur.getInt(1));
                     ResultSet rsMedoc=psMedoc.executeQuery();
                     

        %>
        
        <h1 style="text-align:center">Store <%=rsFournisseur.getString(2)%></h1>
              <a href="HomeUser.jsp"> < Menu </a>
              <br>
              <nav>
                  <li><i class="fa fa-envelope" aria-hidden="true"></i> <%=rsFournisseur.getString(3)%></li>
                  <li><i class="fa fa-phone" aria-hidden="true"></i> <%=rsFournisseur.getString(4)%></li>
                  <li><i class="fa fa-map-marker" aria-hidden="true"></i> <%=rsFournisseur.getString(5)%>,<%=rsFournisseur.getString(6)%></li>

              </nav>
              <br>
             <section id="AllMedocCards">
              <h1>Produits : </h1>

                <% while(rsMedoc.next()){ 
                      byte[] imgData =rsMedoc.getBytes(3);
                      String imageMedoc = Base64.getEncoder().encodeToString(imgData);
                %>

                  <div class="MedocCard" style="text-align: center">
                      <img width="150px"height="130px"src="data:image/jpeg;base64,<%= imageMedoc %>"> 
                      <h3><%=rsMedoc.getString(2)%></h3>
                      <h4>Stock Restant : <%=rsMedoc.getInt(6)%></h4>
                  </div>
                <%}%>
        <%}else{%>
                <section id="noMedoc">
                    <h1>Aucun Produit</h1>
                </section>
        <%}%>
        </section>
    </body>
</html>
