package main.com.vinay.rdetails.utils.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Vinayagam on 10/16/15.
 */
public class DBConnection {

    private interface DBConnectionConstants{
        String DB_URL ="jdbc:mysql://localhost:3306/RDetailDb";
        String DB_USER= "vinay";
        String DB_PASSWORD = "drago";
    }

    public static Connection createConnection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        Connection connection = DriverManager.getConnection(DBConnectionConstants.DB_URL, DBConnectionConstants.DB_USER, DBConnectionConstants.DB_PASSWORD);
        return connection;
    }
}
