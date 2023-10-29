/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Juan Romero
 */
public class ConnectionMySQL {
    Connection connection;

    public ConnectionMySQL() {
        // ruta
        String host = "localhost";
        String port = "3306";
        String nameDB = "utpsportsfest";
        // acceder
        String user = "root";
        String pass = "";
        // Driver
        String drive = "com.mysql.cj.jdbc.Driver";
        // construir URL
        String DBURL = "jdbc:mysql://" + host + ":" + port + "/" + nameDB + "?useSSL=false";
        
        try {
            Class.forName(drive);
            connection = DriverManager.getConnection(DBURL, user, pass);
        } catch (Exception e) {
            
        }
        
    }
    
    public Connection getConnection () {
        return connection;
    }
    
    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            // Manejo de excepciones en caso de error al cerrar la conexión
        }
    }

}
