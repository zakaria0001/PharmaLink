package Database;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection; 
import Database.SQLConnection;
/**
 *
 * @author Zakaria Nabil
 */
public class TestConnection {

    public static void main(String[] args) {
        Connection con = SQLConnection.getConnection();
        if(con==null){
            System.out.println("Erreur");
        }
        else{
            System.out.println("Kayna Connection");
        }
    }
}
