package main.com.vinay.rdetails.utils.dao;


import main.com.vinay.rdetails.utils.dbutils.DBConnection;
import main.com.vinay.rdetails.utils.dto.SignUpBean;
import main.com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants;

import java.sql.*;

/**
 * Created by Vinayagam on 10/16/15.
 */
public class SignUpDao {

    private interface SignUpDaoConstants{
        String SIGN_UP_QUERY = "INSERT INTO RDetailsUser ("+ RDetailsConstants.USER_NAME+","+RDetailsConstants.PASSWORD+","+RDetailsConstants.EMAIL+") VALUES (?,?,?) ;";



    }

    public static int addUser(SignUpBean signUpBean){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBConnection.createConnection();
            System.out.println(signUpBean.getUserName()+" "+signUpBean.getPassword()+" "+signUpBean.getEmail());
            preparedStatement = connection.prepareStatement(SignUpDaoConstants.SIGN_UP_QUERY );
            preparedStatement.setString(1,signUpBean.getUserName());
            preparedStatement.setString(2,signUpBean.getPassword());
            preparedStatement.setString(3,signUpBean.getEmail());

            return preparedStatement.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                closeConnection(connection,preparedStatement,null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;

    }

    public static void closeConnection(Connection connection,Statement statement,ResultSet resultSet)throws SQLException {
        if(resultSet != null){
            resultSet.close();
        }
        if (statement != null){
            statement.close();
        }
        if (connection != null){
            connection.close();
        }
    }
}
