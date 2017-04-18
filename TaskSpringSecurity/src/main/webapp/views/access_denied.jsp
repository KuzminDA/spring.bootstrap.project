<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Access denied</title>
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
                <div class="collapse navbar-collapse">
                    <div class="nav navbar-nav pull-right">
                        <a class="navbar-brand" href="/logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row" id="main-menu">
            <div class="page-header">
                <h3>ERROR:</h3>
            </div>
            <h4>Access denied for this account.</h4>
        </div>
    </div>
</body>
</html>
