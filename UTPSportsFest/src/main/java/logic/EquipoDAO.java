package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EquipoDAO {
    public List<Equipo> obtenerEquipos() {
        List<Equipo> equipos = new ArrayList<>();
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();

        String query = "SELECT ID, logoEquipo, NombreEquipo, EntrenadorID, EventoID FROM equipo";

        try (Connection connection = connectionSQLServer.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("ID");
                String logoEquipo = resultSet.getString("logoEquipo");
                String nombreEquipo = resultSet.getString("NombreEquipo");
                int entrenadorId = resultSet.getInt("EntrenadorID");
                int eventoId = resultSet.getInt("EventoID");

                Equipo equipo = new Equipo(id, logoEquipo, nombreEquipo, entrenadorId, eventoId);
                equipos.add(equipo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return equipos;
    }
}
