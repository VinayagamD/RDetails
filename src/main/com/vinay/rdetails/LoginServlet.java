package main.com.vinay.rdetails;

import main.com.vinay.rdetails.utils.dao.LoginDao;
import main.com.vinay.rdetails.utils.dto.LoginBean;
import main.com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants;
import main.com.vinay.rdetails.utils.rdetailsutils.RDetailsUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Vinayagam on 10/16/15.
 */
@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginBean loginBean = new LoginBean();
        String userName = request.getParameter(RDetailsConstants.USER_NAME);
        String password = request.getParameter(RDetailsConstants.PASSWORD);
        if (RDetailsUtils.checkEmptyString(userName) || RDetailsUtils.checkEmptyString(password)) {
            transferErrorMessage(request, response, RDetailsConstants.FILL_EMPTY_FIELDS);
        } else {
            loginBean.setUserName(userName);
            loginBean.setPassword(password);
            loginBean = LoginDao.authenticate(loginBean);
            if (loginBean.isValidUser()) {
                request.getSession().setAttribute(RDetailsConstants.LOGIN_OBJECT, loginBean);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                transferErrorMessage(request, response, RDetailsConstants.INVALID_USER_CREDENTIALS);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void transferErrorMessage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.getSession().setAttribute(RDetailsConstants.ERROR, message);
        request.getRequestDispatcher("/login.jsp").forward(request, response);

    }
}
