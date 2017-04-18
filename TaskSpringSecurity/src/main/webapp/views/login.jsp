<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login page</title>
    <link rel="stylesheet" href="/static/styles.css">
    <link rel="stylesheet" href="/static/bootstrap.css">
    <script src="/static/jquery-3.2.0.min.js"></script>
    <script src="/static/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="navbar navbar-inverse">
                <div class="navbar-header"><a class="navbar-brand">Spring & Bootstrap</a></div>
                <div class="collapse navbar-collapse"></div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row" id="main-menu">
            <div class="panel panel-default center-block" id="login-panel">
                <div class="panel-heading"><label>Login</label></div>

                <div class="panel-body">
                    <div>
                        <form method="post" action="" name="loginForm">
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success">
                                    <p>Log out successfully.</p>
                                </div>
                            </c:if>
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <p>Invalid username and password.</p>
                                </div>
                            </c:if>

                            <div class="login-form-block">
                                <input class="form-control" type="text" name="username" placeholder="Login"/>
                            </div>
                            <div class="login-form-block">
                                <input class="form-control" type="password" name="password" placeholder="Password">
                            </div>
                            <div class="login-form-block">
                                <input class="btn btn-primary form-control" name="submit" type="submit" value="Login"/>
                            </div>
                            <div align="right" class="login-form-block">
                                <a href="/registration" style="color: black">Registry</a>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
