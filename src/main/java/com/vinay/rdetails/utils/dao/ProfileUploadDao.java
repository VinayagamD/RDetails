package com.vinay.rdetails.utils.dao;

import com.vinay.rdetails.utils.dbutils.DBConnection;
import com.vinay.rdetails.utils.dto.ProfileUploadBean;
import com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants;

import java.io.IOException;
import java.sql.*;

/**
 * Created by Vinayagam on 11/30/15.
 */
public class ProfileUploadDao {

    private interface ProfileUploadDaoConstants {
        String PROFILE_UPLOAD_QUERY = String.format("INSERT INTO RDetailProfiles (%s,%s,%s) VALUES (?,?,?) ;", RDetailsConstants.PROFILE_PICTURES, RDetailsConstants.USER_ID, RDetailsConstants.PRIVATE);
    }

    public static int uploadProfileImage(ProfileUploadBean profileUploadBean) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBConnection.createConnection();
            System.out.println(String.format("UserId %s ", profileUploadBean.getLoginBean().getId()));
            preparedStatement = connection.prepareStatement(ProfileUploadDaoConstants.PROFILE_UPLOAD_QUERY);
            preparedStatement.setBlob(1, profileUploadBean.getInputStream());
            preparedStatement.setInt(2, profileUploadBean.getLoginBean().getId());
            preparedStatement.setShort(3, (short) 0);
            return preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (profileUploadBean.getInputStream() != null) {

                    profileUploadBean.getInputStream().close();
                    closeConnection(connection, preparedStatement, null);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return 0;

    }

    private static void closeConnection(Connection connection, Statement statement, ResultSet resultSet) throws SQLException {
        if (resultSet != null) {
            resultSet.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
}
