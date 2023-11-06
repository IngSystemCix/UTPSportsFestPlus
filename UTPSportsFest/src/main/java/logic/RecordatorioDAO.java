package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecordatorioDAO {
    public List<Recordatorio> obtenerRecordatoriosPorUsuario(String codigoUsuario) {
        List<Recordatorio> recordatorios = new ArrayList<>();
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();

        String query = "SELECT r.titulo, r.fecha_hora, " +
                "CASE " +
                "    WHEN r.estado = 0 THEN 'No-completado' " +
                "    WHEN r.estado = 1 THEN 'Completado' " +
                "END AS [estado] " +
                "FROM usuario AS u " +
                "INNER JOIN recordatorio AS r ON u.id = r.usuario_id " +
                "WHERE u.codigo = ?";


        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setString(1, codigoUsuario);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String titulo = resultSet.getString("titulo");
                String fechaHora = resultSet.getString("fecha_hora");
                String estado = resultSet.getString("estado");

                Recordatorio recordatorio = new Recordatorio(titulo, fechaHora, estado);
                recordatorios.add(recordatorio);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return recordatorios;
    }
}
