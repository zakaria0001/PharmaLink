/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Zakaria Nabil
 */
public class SQLConnection {
static {
    try {
           Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException ex) {
            Logger.getLogger(SQLConnection.class.getName()).log(Level.SEVERE, null, ex);
    }
}
    public static Connection getConnection() {
        
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost:3300/PharmaLink","root"," ");

        } catch (SQLException ex) {
        Logger.getLogger(SQLConnection.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }
}
