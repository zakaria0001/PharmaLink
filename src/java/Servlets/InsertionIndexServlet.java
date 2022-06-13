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
@WebServlet(name = "InsertionIndexServlet", urlPatterns = {"/InsertionIndexServlet"})
public class InsertionIndexServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("StringEquality")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
            Connection con=SQLConnection.getConnection();
            HttpSession session=request.getSession();

         if(con!=null){
                String typeInscription=request.getParameter("Inscription");
                
               if (typeInscription.equals("S'inscrire")){
                PreparedStatement psinsert = con.prepareStatement("INSERT INTO Utilisateur (Nom, Prenom, Ville, NuméroTelephone, Email, Password) VALUES (?,?,?,?,?,?)");

                 
                 
                psinsert.setString(1,request.getParameter("NomClient"));
                psinsert.setString(2,request.getParameter("PrenomClient"));
                psinsert.setString(3,request.getParameter("VilleClient"));
                psinsert.setString(4,request.getParameter("numtel"));
                psinsert.setString(5,request.getParameter("AdrMail"));
                psinsert.setString(6,request.getParameter("password"));
                
                psinsert.executeUpdate();
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                request.setAttribute("message", "Utilisateur Ajouté , Connectez Vous");
                dispatcher.forward(request, response);
                
                
                }
                if (typeInscription.equals("Collaborer")){
                PreparedStatement psinsertFour = con.prepareStatement("INSERT INTO fournisseur(NomFournisseur, AdresseMail, NumeroTelephone, Adresse, Ville, PasswordFour) VALUES (?,?,?,?,?,?)");

                 
                 
                psinsertFour.setString(1,request.getParameter("NomFournisseur"));
                psinsertFour.setString(2,request.getParameter("AdressMailFour"));
                psinsertFour.setString(3,request.getParameter("numtel"));
                psinsertFour.setString(4,request.getParameter("AdresseFour"));
                psinsertFour.setString(5,request.getParameter("VilleFournisseur"));
                psinsertFour.setString(6,request.getParameter("passwordFour"));
                
                psinsertFour.executeUpdate();
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                request.setAttribute("messagef", "Fournisseur Ajouté , Connectez Vous ");
                dispatcher.forward(request, response);
                }
               
                else{
                    out.print(con);
                    out.print("Error");

                }

             
                
                }

                else{
                       out.println(con);

                       out.println("Erreur De Connexion");
                       
                    }
                


            } catch (SQLException ex) {
            Logger.getLogger(InsertionIndexServlet.class.getName()).log(Level.SEVERE, null, ex);
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