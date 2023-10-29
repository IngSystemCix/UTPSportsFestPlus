/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Juan Romero
 */
public class Settings {
    public boolean autentificacion (String codigo, String contrasena) {
        ConnectionMySQL connectionMySQL = new ConnectionMySQL();
        boolean rpta = false;
        String query = "SELECT * FROM Deportista WHERE Codigo = ? AND contraseñaHash = UNHEX(SHA2(?, 256))";
        try (PreparedStatement preparedStatement = connectionMySQL.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigo);
            preparedStatement.setString(2, contrasena);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    rpta = true;
                    return rpta;
                }else {
                    rpta = false;
                    return rpta;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionMySQL.closeConnection();
        }
        return rpta;
    }
}
