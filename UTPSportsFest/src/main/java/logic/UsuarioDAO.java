package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    public Usuario obtenerUsuarioPorCodigo(String codigo) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        Usuario usuario = null;

        String query = "SELECT codigo FROM usuario WHERE codigo = ?";

        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigo);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    usuario = new Usuario();
                    usuario.setCodigo(resultSet.getString("codigo"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return usuario;
    }

    public String obtenerConfiguracionUsuario (String codigoUsuario) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        String modo = null;

        String query = "SELECT CASE " +
                "WHEN c.modo_oscuro_claro = 0 THEN '' " +
                "WHEN c.modo_oscuro_claro = 1 THEN 'dark' " +
                "END AS modo " +
                "FROM Configuracion AS c " +
                "INNER JOIN usuario AS u " +
                "ON c.id_usuario = u.id " +
                "WHERE u.codigo = ?";

        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigoUsuario);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    modo = resultSet.getString("modo");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return modo;
    }
}
