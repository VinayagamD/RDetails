package com.vinay.rdetails.utils.dto;

import java.io.InputStream;

/**
 * Created by Vinayagam on 11/30/15.
 */
public class ProfileUploadBean {

    private LoginBean loginBean;
    private InputStream inputStream;

    public LoginBean getLoginBean() {
        return loginBean;
    }

    public void setLoginBean(LoginBean loginBean) {
        this.loginBean = loginBean;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
