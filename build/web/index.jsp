<%-- 
    Document   : index
    Created on : Jun 9, 2022, 10:19:19 AM
    Author     : mbp-de-zakaria
--%>

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
        <title>Login - PharmaLink</title>
    </head>
    <style>
        #status{
            color:red;
            display: none;
            }
    </style>
    <body>
        <h1 style="text-align: center">PharmaLink </h1>
        
       
            <fieldset>
                <legend>Connexion: </legend>
                <form method="POST" action="AuthentificationServlet">
                    <label>Nom :</label>
                    <input type="text" name="nom" placeholder="Nom ou Nom D'entreprise">
                    <label>Mot De Passe :</label>
                    <input type="password" name="motdepasse" placeholder="Saisissez Votre Mot De Passe">
                    
                    <input type="submit" value="Se Connecter">
                    
                </form>
               
                    <% String status=(String)session.getAttribute("Status");  if (status == null ) status =" "; %>
                    <h3 id="status"><%= status %></h3>
                    
                
                
                
                
                 </fieldset>
            <fieldset>
                <legend>Inscription </legend>
                
                <section style="width: 100%;display: inline-flex;">
                    <form  style="width: 50%;border-right: 2px solid black" method="POST" action="InsertionIndexServlet">
                    <h3  style="text-align: center" >Vous Etes Utilisateur ? </h3>
                    <% String message=(String)request.getAttribute("message");  if (message == null ) message =" "; %>
                    <% String messagef=(String)request.getAttribute("messagef");  if (messagef == null ) messagef =" "; %>
                    
                    <table  style="width: 100%">
                        <tr>
                            <td>
                                <label>Nom :</label>
                                <input type="text" name="NomClient" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <label>Prénom :</label>
                                <input type="text" name="PrenomClient" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Ville :</label>
                                <select name="VilleClient">
                                    <option value="Casablanca">Casablanca</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <label>Numéro Téléphone :</label>
                                 <input type="phone" name="numtel" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <label>Adresse Mail :</label>
                                <input type="email" name="AdrMail" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <label>Mot De passe</label>
                                <input type="password" name="password" >
                            </td>
                        </tr>    
                        <tr>
                                <td><input type="submit" name="Inscription" value="S'inscrire"></td>
                        </tr>
                        <tr><td><%= message %></td></tr>
                    </table> 
                </form>
                    
                <form style="width: 50%" method="POST" action="InsertionIndexServlet">
                    <h3 style="text-align: center"> Ou Fournisseur ? </h3>
                     <table  style="width: 100%">
                        <tr>
                            <td>
                                <label>Nom Fournisseur :</label>
                                <input type="text" name="NomFournisseur" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <label>Adresse Mail :</label>
                                <input type="email" name="AdressMailFour" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <label>Numéro Téléphone :</label>
                                 <input type="phone" name="numtel" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <label>Adresse :</label>
                                <input type="text" name="AdresseFour" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Ville :</label>
                                <select name="VilleFournisseur">
                                    <option value="Casablanca">Casablanca</option>
                                </select>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                               <label>Mot De Passe :</label>
                                <input type="password" name="passwordFour" >
                            </td>
                        </tr>    
                        <tr >
                            <td><input type="submit" name="Inscription" value="Collaborer"></td>
                        </tr>
                        <tr><td><%= messagef %></td></tr>
                    </table> 
                </form>
                </section>
            </fieldset>


    
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
    $('#status').delay(1500).hide(500);

    </script>
    
</html>
