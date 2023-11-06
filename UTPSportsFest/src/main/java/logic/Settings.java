package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Juan Romero
 */
public class Settings {
    /**
     * Método para poder autentificar.
     * @param codigo Código que empieza por U.
     * @param contrasena Contraseña del usuario.
     * @return retorna verdadero o falso dependiendo la condición.
     */
    public boolean autentificacion (String codigo, String contrasena) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        boolean rpta = false;
        String query = "SELECT * FROM usuario WHERE codigo = ? AND contraseña = HASHBYTES('SHA2_256','" + contrasena + "')";
        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigo);
            // preparedStatement.setString(2, contrasena);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    rpta = true;
                } else {
                    rpta = false;
                }
                return rpta;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }
        return rpta;
    }

    /**
     * Este método permite borrar registros de usuarios
     * @param codigo Código del estudiante o administrativo.
     * @return
     */
    public boolean deleteUser(String codigo) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        boolean eliminado = false;

        String query = "DELETE FROM usuario WHERE codigo = ?";

        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigo);

            int filasAfectadas = preparedStatement.executeUpdate();

            if (filasAfectadas > 0) {
                eliminado = true;
            } else {
                eliminado = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return eliminado;
    }

    public boolean insertUser(String codigo, String contrasena, String cargo) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        boolean insertado = false;

        String query = "INSERT INTO usuario (codigo, contrasena, cargo) VALUES (?, HASHBYTES('SHA2_256', '" + contrasena + "'), ?)";

        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigo);
            // preparedStatement.setString(2, contrasena);
            preparedStatement.setString(3, cargo);

            int filasAfectadas = preparedStatement.executeUpdate();

            if (filasAfectadas > 0) {
                insertado = true;
            } else {
                insertado = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return insertado;
    }

}
