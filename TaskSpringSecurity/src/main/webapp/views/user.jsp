<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Spring&Bootstrap</title>
    <link rel="stylesheet" href="/static/styles.css">
    <link rel="stylesheet" href="/static/bootstrap.css">
    <script src="/static/jquery-3.2.0.min.js"></script>
    <script src="/static/bootstrap.min.js"></script>
</head>
<body>
    <c:set var="Admin" value="${adminRole}"/>
    <c:set var="User" value="${userRole}"/>

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
        <div class="row">
            <div class="col-lg-2 col-md-3" id="side-menu">
                <ul class="nav nav-stacked nav-pills">
                    <c:set var="roles" value="${roles}"/>
                    <c:choose>
                        <c:when test="${roles.contains(Admin)}">
                            <li><a href="/admin">Admin</a></li>
                        </c:when>

                        <c:when test="${roles.contains(User)}">
                            <li class="disabled"><a>Admin</a></li>
                        </c:when>
                    </c:choose>

                    <li class="active"><a href="/user">User</a></li>
                </ul>
            </div>
            <div class="col-lg-10 col-md-9 main-menu">
                <div class="page-header">
                    <h3>Home page</h3>
                </div>
                <h4>Hello ${role}, ${name}!</h4>
            </div>
        </div>
    </div>
</body>
</html>
