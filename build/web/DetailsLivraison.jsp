<%-- 
    Document   : DetailsLivraison
    Created on : Jun 11, 2022, 8:01:21 PM
    Author     : mbp-de-zakaria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tajawal&display=swap" rel="stylesheet">
    </head>
    <style>
        body{
                font-family: 'Tajawal', sans-serif;        
        }
        #DetailSec {
            background-color:#1363DF; ;
            width: 50%;
            border-top-right-radius:30px;
            border-bottom-left-radius:30px;
        }
        #DetailSec form{
            background-color:#1363DF; ;
            padding-left: 30%;
        }
        hr{
            color: black
        }
        label{
            font-weight: bold;

        }
        #ValiderLivr{
            width:60%;
            background-color: black;
            color:white;padding: 10px;
            margin-bottom: 3%;
        }
    </style>
    <body>
        <h1 style="text-align:center">PharmaLink</h1>
        <a href="HomeUser.jsp"> < Menu </a>

        <section id="DetailSec">
            <h2>Détails De Livraison : </h2>
            <hr>
                <img width="150px"src="data:image/jpeg;base64,<%= request.getParameter("imageMedic")%>"> 

            <form>
                <table>
                    <tr>
                        
                        <td><h4><%=request.getParameter("NomMedoc")%></h4></td>         
                    </tr>
                    <tr>
                        <td> </td>
                    </tr>
                    <tr>
                        <td><label> Nom  : </label>
                        <td><%=request.getParameter("nomClient")%></td> 
                    </tr>
                    <tr>
                        <td><label> Adresse : </label>
                        <td><%=request.getParameter("")%></td> 
                    </tr>
                    <tr>
                        <td><label>Fournisseur :</label></td>
                        <td><%=request.getParameter("NomFournisseur")%></td> 
                    </tr>
                    <tr> 
                        <td><label>Quantité :</label></td>
                        <td><input type="number" placeholder="1"min="1" max="<%=request.getParameter("stockDispo")%>"></td>

                    </tr>
                    <tr>
                        <td><label>Délai Livraison : </label></td>
                        <td><select name="Delai">
                                <option value="24H">24H</option>
                                <option value="48H">48H</option>
                                <option value="72H">72H</option>
                            </select> </td>
                    </tr>
                    <tr>
                        <td><label>Tarif Livraison : </label></td>
                        <td><input type="text" value="10 Dhs" readonly></td>
                    </tr>

                    <tr>
                        <td><label>Prix TTC :</label></td>
                        <td><%=request.getParameter("prixMedoc")%> DHS</td> 
                    </tr>
                    <tr>
                        
                    </tr>
                </table>
                     <input type="submit" id="ValiderLivr" value="Valider">

            </form>
        </section>
    </body>
</html>
