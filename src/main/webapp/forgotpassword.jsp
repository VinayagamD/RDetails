<%@ page import="main.com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants" %>
<%@ page import="static main.com.vinay.rdetails.utils.rdetailsutils.RDetailsConstants.ERROR" %>
<%@ page import="main.com.vinay.rdetails.utils.dto.RDetailsMessage" %>
<%--
  Created by IntelliJ IDEA.
  User: Vinayagam
  Date: 10/11/15
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SignUp</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="webjars/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="images/rdetails.png">
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/demo.css">
    <link rel="stylesheet" href="css/footer-basic-centered.css">
    <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
    <link rel="stylesheet" href="css/footer-distributed.css">
    <link rel="stylesheet" href="css/footer-distributed-with-contact-form.css">
    <link rel="stylesheet" href="css/footer-distributed-with-search.css">
    <link rel="stylesheet" href="css/main.css">
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
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <h1><img src="images/rdetails.png" alt="details">RDetails</h1>
        </div>

    </div>
</div>


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
                <li><a href="<c:url value="login.jsp"/>"><i class="fa fa-user">&nbsp;Login</i></a></li>
                <li class="active"><a href="<c:url value="signup.jsp"/>"><i class="fa fa-user-plus">
                    &nbsp;Register</i></a></li>
                <li><a href="#"><i class="fa fa-unlock-alt">&nbsp;Forgot Password</i></a></li>
                <li><a href="<c:url value="index.jsp"/>"><i class="fa fa-home">&nbsp; Home </i></a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 -align-center">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <form action="signup" method="post">
                        <div class="form-group">
                            <label for="username"><i class="fa fa-user">&nbsp;User Name</i></label>
                            <input type="text" class="form-control" id="username" placeholder="UserName"
                                   name="<%=RDetailsConstants.USER_NAME %>">
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="fa fa-envelope">&nbsp;Email Address</i></label>
                            <input type="text" class="form-control" id="email" placeholder="Email"
                                   name="<%=RDetailsConstants.EMAIL%>">
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-success"><strong><i class="fa fa-save">
                                &nbsp;Register</i></strong>
                            </button>
                        </div>
                        <div>
                            <c:catch var="error">
                                <% String errorMessage = ((RDetailsMessage) request.getAttribute(ERROR)).getErrorMessage();
                                    if (!errorMessage.isEmpty() || errorMessage != null) {%>

                                <div class="alert alert-danger alert-dismissable text-center">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <%=errorMessage%>
                                </div>

                                <%}%>
                            </c:catch>
                            <c:if test="${error != null}">
                                <p>${error}</p>
                            </c:if>
                        </div>


                    </form>


                </div>

            </div>

        </div>
    </div>
</div>

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