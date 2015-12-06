package com.vinay.rdetails;

import com.vinay.rdetails.utils.dao.ProfileUploadDao;
import com.vinay.rdetails.utils.dto.LoginBean;
import com.vinay.rdetails.utils.dto.ProfileUploadBean;
import com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

/**
 * Created by Vinayagam on 12/6/15.
 */
@WebServlet(name = "ProfileUploadServlet", urlPatterns = "/profileupload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class ProfileUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Part profileImage = request.getPart(RDetailsConstants.PROFILE_IMAGE);
            LoginBean loginBean = (LoginBean) request.getSession().getAttribute(RDetailsConstants.LOGIN_OBJECT);
            ProfileUploadBean profileUploadBean = new ProfileUploadBean();
            profileUploadBean.setInputStream(profileImage.getInputStream());
            profileUploadBean.setLoginBean(loginBean);
            int result = ProfileUploadDao.uploadProfileImage(profileUploadBean);
            if (result > 0) {
                System.out.println("Success Upload");
            } else {
                System.out.println("Failed");
            }

        } catch (Throwable t) {
            t.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
