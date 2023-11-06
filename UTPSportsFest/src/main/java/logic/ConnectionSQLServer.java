package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionSQLServer {
    Connection connection;

    public ConnectionSQLServer() {
        // Datos de conexión a SQL Server
        String host = "localhost"; // Cambia esto al nombre o dirección IP de tu servidor SQL Server.
        String port = "1433"; // El puerto predeterminado de SQL Server es 1433.
        String nameDB = "UTPSportsFest"; // Reemplaza con el nombre de tu base de datos en SQL Server.
        String user = "TestUTPSportsFest"; // Reemplaza con el nombre de usuario de SQL Server.
        String pass = "Admin"; // Reemplaza con la contraseña de SQL Server.

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String DBURL = "jdbc:sqlserver://" + host + ":" + port + ";databaseName=" + nameDB + ";encrypt=false;trustServerCertificate=true";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(DBURL, user, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
