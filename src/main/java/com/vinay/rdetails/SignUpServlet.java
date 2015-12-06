package com.vinay.rdetails;

import com.vinay.rdetails.utils.dao.SignUpDao;
import com.vinay.rdetails.utils.dto.RDetailsMessage;
import com.vinay.rdetails.utils.dto.SignUpBean;
import com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants;
import com.vinay.rdetails.utils.rdetailsutils.RDetailsUtils;
import com.vinay.rdetails.utils.rdetailsutils.UserDataLength;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Vinayagam on 10/17/15.
 */
@WebServlet(name = "SignUpServlet", urlPatterns = "/signup")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SignUpBean signUpBean = new SignUpBean();
        String userName = request.getParameter(RDetailsConstants.USER_NAME);
        String password = request.getParameter(RDetailsConstants.PASSWORD);
        String email = request.getParameter(RDetailsConstants.EMAIL);
        System.out.println(userName+" "+password+" "+email);

        if (RDetailsUtils.checkEmptyString(userName) || RDetailsUtils.checkEmptyString(password) || RDetailsUtils.checkEmptyString(email)) {
            transferErrorMessage(request, response, RDetailsConstants.FILL_EMPTY_FIELDS);
        } else if (RDetailsUtils.dataLength(userName, UserDataLength.USER_NAME)) {
            transferErrorMessage(request, response, RDetailsConstants.USER_NAME + " " + RDetailsConstants.REQUIRES_MINIMUM_4_CHARACTERS);
        } else if (!RDetailsUtils.isValidateEmail(email)) {
            transferErrorMessage(request, response, RDetailsConstants.ENTER_VALID_EMAIL);
        } else if (RDetailsUtils.dataLength(password, UserDataLength.PASSWORD)) {
            transferErrorMessage(request, response, RDetailsConstants.PASSWORD + " " + RDetailsConstants.REQUIRES_MINIMUM_6_CHARACTERS);
        } else {

            signUpBean.setUserName(RDetailsUtils.firstStringToUpper(userName));
            signUpBean.setEmail(RDetailsUtils.stringToLower(email));
            signUpBean.setPassword(password);
            int rows = SignUpDao.addUser(signUpBean);

            System.out.println(rows);
            if (rows > 0) {
                request.setAttribute(RDetailsConstants.USER_NAME, signUpBean.getUserName());
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                transferErrorMessage(request, response, RDetailsConstants.USER_NAME_OR_EMAIL_ALREADY_EXISTS);
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void transferErrorMessage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        RDetailsMessage rDetailsMessage = new RDetailsMessage();
        rDetailsMessage.setErrorMessage(message);
        request.setAttribute(RDetailsConstants.ERROR, rDetailsMessage);
        request.getRequestDispatcher("/signup.jsp").forward(request, response);

    }
}
