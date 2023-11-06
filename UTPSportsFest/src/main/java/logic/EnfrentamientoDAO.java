package logic;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class EnfrentamientoDAO {
    public List<Enfrentamiento> obtenerEnfrentamientos() {
        List<Enfrentamiento> enfrentamientos = new ArrayList<>();

        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();

        String query = "SELECT E.id, EQLocal.NombreEquipo AS EquipoLocal, " +
                "EQVisitante.NombreEquipo AS EquipoVisitante, " +
                "E.FechaHora, " +
                "D.NombreDeporte AS Deporte, " +
                "CASE " +
                "    WHEN E.Estado = 'C' THEN 'Completo' " +
                "    WHEN E.Estado = 'E' THEN 'Proceso' " +
                "    WHEN E.Estado = 'P' THEN 'Pendiente' " +
                "END AS [Estado] " +
                "FROM Enfrentamientos E " +
                "INNER JOIN Equipo EQLocal ON E.EquipoLocalID = EQLocal.ID " +
                "INNER JOIN Equipo EQVisitante ON E.EquipoVisitanteID = EQVisitante.ID " +
                "INNER JOIN Deporte D ON E.DeporteID = D.ID";

        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String equipoLocal = resultSet.getString("EquipoLocal");
                String equipoVisitante = resultSet.getString("EquipoVisitante");
                String fechaHora = resultSet.getString("FechaHora");
                String deporte = resultSet.getString("Deporte");
                String estado = resultSet.getString("Estado");

                Enfrentamiento enfrentamiento = new Enfrentamiento(id, equipoLocal, equipoVisitante, fechaHora, deporte, estado);
                enfrentamientos.add(enfrentamiento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return enfrentamientos;
    }

    public boolean eliminarEnfrentamiento(int id) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        String query = "DELETE FROM Enfrentamientos WHERE ID = ?";

        try (PreparedStatement preparedStatement = connectionSQLServer.connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionSQLServer.closeConnection();
        }

        return false; // Error en la eliminación
    }

    public void insertarEnfrentamiento(String fechaHora, int equipoLocalID, int equipoVisitanteID, int deporteID, String estado) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        Connection connection = connectionSQLServer.getConnection();

        String query = "INSERT INTO Enfrentamientos (FechaHora, EquipoLocalID, EquipoVisitanteID, DeporteID, Estado) " + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Establecer los valores de los parámetros en la consulta
            preparedStatement.setString(1, fechaHora.replace("T", " ").concat(":00"));
            preparedStatement.setInt(2, equipoLocalID);
            preparedStatement.setInt(3, equipoVisitanteID);
            preparedStatement.setInt(4, deporteID);
            preparedStatement.setString(5, estado);

            // Ejecutar la inserción
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar cualquier excepción de SQL aquí
        } finally {
            connectionSQLServer.closeConnection();
        }
    }

    public void actualizarEnfrentamiento(int enfrentamientoID, String fechaHora, int equipoLocalID, int equipoVisitanteID, int deporteID, String estado) {
        ConnectionSQLServer connectionSQLServer = new ConnectionSQLServer();
        Connection connection = connectionSQLServer.getConnection();

        String query = "UPDATE Enfrentamientos " +
                "SET FechaHora = ?, EquipoLocalID = ?, EquipoVisitanteID = ?, DeporteID = ?, Estado = ? " +
                "WHERE ID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            // Establecer los valores de los parámetros en la consulta
            preparedStatement.setString(1, fechaHora.replace("T", " ").concat(":00"));
            preparedStatement.setInt(2, equipoLocalID);
            preparedStatement.setInt(3, equipoVisitanteID);
            preparedStatement.setInt(4, deporteID);
            preparedStatement.setString(5, estado);
            preparedStatement.setInt(6, enfrentamientoID); // ID del enfrentamiento que deseas actualizar

            // Ejecutar la actualización
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar cualquier excepción de SQL aquí
        } finally {
            connectionSQLServer.closeConnection();
        }
    }

}
