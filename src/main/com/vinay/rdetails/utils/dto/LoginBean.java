package main.com.vinay.rdetails.utils.dto;

/**
 * Created by Vinayagam on 10/16/15.
 */
public class LoginBean {

    private String userName;
    private String password;
    private int id;
    private boolean validUser;

    public boolean isValidUser() {
        return validUser;
    }

    public void setValidUser(boolean validUser) {
        this.validUser = validUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}


