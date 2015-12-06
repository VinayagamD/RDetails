<%@ page import="com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants" %>
<%@ page import="static com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants.ERROR" %>
<%@ page import="static com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants.LOGIN_OBJECT" %>
<%@ page import="com.vinay.rdetails.utils.dto.LoginBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Vinayagam
  Date: 10/11/15
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>RDetails</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="webjars/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/demo.css">
    <link rel="stylesheet" href="css/footer-basic-centered.css">
    <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
    <link rel="stylesheet" href="css/footer-distributed.css">
    <link rel="stylesheet" href="css/footer-distributed-with-contact-form.css">
    <link rel="stylesheet" href="css/footer-distributed-with-search.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="shortcut icon" type="image/x-icon" href="images/rdetails.png">
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src=" https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
</head>

<body>


        <c:catch var="error">
            <div class="container">
                <div class="row">

                <% Object object =  request.getAttribute(LOGIN_OBJECT);

               if(object == null) {%>

            <div class="col-lg-10 col-md-10">
                <h1><img src="images/rdetails.png" alt="details">RDetails</h1>

            </div>
            <div class="col-lg-2 col-md-2">
                <div class="row" style="margin-top: 20px">
                    <div class="col-lg-6 col-md-6" style="padding: 20px"><a href="<c:url value="login.jsp"/>"
                                                                            style="text-decoration: none;margin: 20px;"><i
                            class="fa fa-user fa-lg">Login</i></a></div>
                    <div class="col-lg-6 col-md-6" style="padding: 20px"><a href="<c:url value="signup.jsp"/>"
                                                                            style="text-decoration: none;margin: 20px;">
                        <i class="fa fa-user-plus fa-lg">Register</i></a></div>
                </div>
            </div>

            <%}else {%>
            <%
                String userName = ((LoginBean)object).getUserName();
                if(userName==null||userName.isEmpty()){%>

                    <div class="col-lg-10 col-md-10">
                        <h1><img src="images/rdetails.png" alt="details">RDetails</h1>

                    </div>
                    <div class="col-lg-2 col-md-2">
                        <div class="row" style="margin-top: 20px">
                            <div class="col-lg-6 col-md-6" style="padding: 20px"><a href="<c:url value="login.jsp"/>"
                                                                                    style="text-decoration: none;margin: 20px;"><i
                                    class="fa fa-user fa-lg">Login</i></a></div>
                            <div class="col-lg-6 col-md-6" style="padding: 20px"><a href="<c:url value="signup.jsp"/>"
                                                                                    style="text-decoration: none;margin: 20px;">
                                <i class="fa fa-user-plus fa-lg">Register</i></a></div>
                        </div>
                    </div>

            <%} else {%>

            <div class="col-lg-12 col-md-12">
                <h1><img src="images/rdetails.png" alt="details">RDetails</h1>

                <h2 class="h2"></h2>
            </div>

            <%}%>
            <%}%>
            </div>
        </div>
        </c:catch>
        <c:if test="${error != null}">
            <p>${error}</p>
        </c:if>



<nav class="navbar navbar-inverse">
    <div class="container-fluid">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarmain"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right" id="navbarmain">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<c:url value="index.jsp"/>"><i class="fa fa-home ">&nbsp;Home</i></a></li>
                <li><a href="#"><i class="fa fa fa-exclamation-circle ">&nbsp;About Us</i></a></li>
                <li><a href="#"><i class="fa fa-briefcase">&nbsp;Products</i></a></li>
                <li><a href="#"><i class="fa fa-paper-plane ">&nbsp;Contact Us</i></a></li>
                <li><a href="#"><i class="fa fa-pencil-square">&nbsp;Feedback</i></a></li>
                <c:catch var="error">
                    <% LoginBean loginBean = (LoginBean) request.getAttribute(LOGIN_OBJECT);
                        String userName = loginBean.getUserName();
                        if (!userName.isEmpty() || userName != null) {%>

                    <li><a href="<c:url value="profileDetails.jsp"/>"><i class="fa fa-user">&nbsp;ProfileDetails</i></a>
                    </li>
                    <li><a href="<c:url value="logout"/>"><i class="fa fa-sign-out">&nbsp;Logout</i></a></li>
                    <%}%>
                </c:catch>
                <c:if test="${error != null}">
                    <p>${error}</p>
                </c:if>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
</nav>


<div class="container">
    <div class="row">

        <c:catch var="error">
            <% LoginBean loginBean = (LoginBean) request.getAttribute(LOGIN_OBJECT);
                String userName = loginBean.getUserName();
                if (!userName.isEmpty() || userName != null) {%>
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2">
                <div class="panel panel-success">
                    <div class="panel-heading text-center">Success</div>
                    <div class="panel-body text-center">
                        <p> Welcome!<%=userName%>
                        </p>
                    </div>
                </div>
            </div>


            <%}%>
        </c:catch>
        <c:if test="${error != null}">
            <p>${error}</p>
        </c:if>
        <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading text-center">About US</div>
                <div class="panel-body">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                    Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                    a galley of type and scrambled it to make a type specimen book. It has survived not only five
                    centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was
                    popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and
                    more recently with desktop publishing software like Aldus PageMaker including versions of Lorem
                    Ipsum.
                </div>
                <div class="panel-body">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                    Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                    a galley of type and scrambled it to make a type specimen book. It has survived not only five
                    centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was
                    popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and
                    more recently with desktop publishing software like Aldus PageMaker including versions of Lorem
                    Ipsum.
                </div>
            </div>
        </div>
    </div>

</div>


<!-- The content of your page would go here. -->

<footer class="footer-distributed">

    <div class="footer-left">

        <h3><img src="images/rdetails.png" alt="logo"></h3>

        <p class="footer-links">
            <a href="#">Home</a>
            ·
            <a href="#">Blog</a>
            ·
            <a href="#">Pricing</a>
            ·
            <a href="#">About</a>
            ·
            <a href="#">Faq</a>
            ·
            <a href="#">Contact</a>
        </p>

        <p class="footer-company-name">RDetails &copy; 2015</p>
    </div>

    <div class="footer-center">

        <div>
            <i class="fa fa-map-marker"></i>

            <p><span>#888,5<sup>Th</sup> Cross</span> Bangalore, India</p>
        </div>

        <div>
            <i class="fa fa-phone"></i>

            <p>+91 8553364798</p>
        </div>

        <div>
            <i class="fa fa-envelope"></i>

            <p><a href="mailto:support@company.com">vinay@rdetails.com</a></p>
        </div>

    </div>

    <div class="footer-right">

        <p class="footer-company-about">
            <span>About the company</span>
            Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu
            auctor lacus vehicula sit amet.
        </p>

        <div class="footer-icons">

            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>

        </div>

    </div>

</footer>

</body>
</html>
