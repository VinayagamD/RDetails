package com.vinay.rdetails.utils.dao;

import com.vinay.rdetails.utils.dbutils.DBConnection;
import com.vinay.rdetails.utils.dto.LoginBean;
import com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants;

import java.sql.*;

/**
 * Created by Vinayagam on 10/16/15.
 */
public class LoginDao {
    private interface LoginDaoConstant {
        String USER_QUERY = "SELECT UserName,Password,UserID FROM RDetailsUser WHERE UserName = ? AND Password = ?";

    }
    public static LoginBean authenticate(LoginBean loginBean){

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String userNameDB = "";
        String passwordDB = "";

        try {
            connection = DBConnection.createConnection();
            preparedStatement = connection.prepareStatement(LoginDaoConstant.USER_QUERY);
            preparedStatement.setString(1,loginBean.getUserName());
            preparedStatement.setString(2,loginBean.getPassword());
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                userNameDB = resultSet.getString(RDetailsConstants.USER_NAME);
                passwordDB = resultSet.getString(RDetailsConstants.PASSWORD);
                if (loginBean.getUserName().equalsIgnoreCase(userNameDB) && loginBean.getPassword().equals(passwordDB)) {
                    loginBean.setId(resultSet.getInt(RDetailsConstants.USER_ID));
                    loginBean.setUserName(userNameDB);
                    loginBean.setValidUser(true);
                    return  loginBean;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                closeConnection(connection,preparedStatement,resultSet);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        loginBean.setValidUser(false);
        return loginBean;
    }

    private static void closeConnection(Connection connection, Statement statement, ResultSet resultSet) throws SQLException {
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
