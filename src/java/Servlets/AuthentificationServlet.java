/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Database.SQLConnection;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/** 
 *
 * @author Zakaria Nabil
 */
@WebServlet(name = "AuthentificationServlet", urlPatterns = {"/AuthentificationServlet"})
public class AuthentificationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
            Connection con=SQLConnection.getConnection();
            HttpSession session=request.getSession();

         if(con!=null){
                 PreparedStatement pstmtUser = con.prepareStatement("select nom,prenom,ville from utilisateur where Nom=? and Password=?");
                 PreparedStatement pstmtFournisseur = con.prepareStatement("select NomFournisseur,Adresse,Ville,NumeroTelephone from Fournisseur where NomFournisseur=? and PasswordFour=?");

                 pstmtUser.setString(1, request.getParameter("nom"));
                 pstmtUser.setString(2, request.getParameter("motdepasse"));
                 pstmtFournisseur.setString(1, request.getParameter("nom"));
                 pstmtFournisseur.setString(2, request.getParameter("motdepasse"));

                 ResultSet rs = pstmtUser.executeQuery();
                 ResultSet rsFourn = pstmtFournisseur.executeQuery();
                 
                 if (rs.next()) {
                     response.sendRedirect("HomeUser.jsp");
                     session.setAttribute("PrenomClient", rs.getString(2));
                     session.setAttribute("VilleClient", rs.getString(3));
                     session.setAttribute("nomClient", rs.getString(1));

                 }
                 
                 if (rsFourn.next()) {

                     response.sendRedirect("HomeFournisseur.jsp");
                     session.setAttribute("NomFournisseur", rsFourn.getString(1));
                     session.setAttribute("AdresseFournisseur", rsFourn.getString(2));
                     session.setAttribute("VilleFournisseur", rsFourn.getString(3));    
                     session.setAttribute("NumeroTelephoneFournisseur", rsFourn.getString(4));    
                   
                 }
//                    Erreur D'identifiants
//                 else{
//                     
//                        response.sendRedirect("index.jsp");
//                        session.setAttribute("Status", "Verifiez Vos Identifiants !");
//
//
//                 }
                 
                }
//                     Erreur De Connection avec la DB 
                else{
                     response.sendRedirect("index.jsp");
                     session.setAttribute("Status", "Verifiez Votre Connexion Internet !");

                       
                    }
                
                


            } catch (SQLException ex) {
            Logger.getLogger(AuthentificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}