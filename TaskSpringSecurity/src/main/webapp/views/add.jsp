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
                    <li class="active"><a href="/admin">Admin</a></li>
                    <li><a href="/user">User</a></li>
                </ul>
            </div>
            <div class="col-lg-10 col-md-9 main-menu">
                <div class="page-header">
                    <h3>Admin panel</h3>
                </div>
                <ul class="nav nav-tabs">
                    <li><a href="/admin">User table</a></li>
                    <li class="active"><a href="/admin/add">New user</a></li>
                </ul>
                <div class="panel panel-default">
                    <div class="panel-heading"><label>Add new user</label></div>
                    <div class="panel-body">
                        <div class="form-add">
                            <c:choose>
                                <c:when test="${param.duplicate != null}">
                                    <div class="alert alert-danger">
                                        <p>User with this login already exist.</p>
                                    </div>
                                </c:when>

                                <c:when test="${param.error != null}">
                                    <div class="alert alert-danger">
                                        <p>All fields must be filled.</p>
                                    </div>
                                </c:when>
                            </c:choose>

                            <form role="form" method="post" action="/admin/add">
                                <div class="form-group">
                                    <label>Name</label>
                                    <c:choose>
                                        <c:when test="${param.error != null}">
                                            <div class="has-error">
                                                <input class="form-control" type="text" name="name">
                                            </div>
                                        </c:when>

                                        <c:when test="${param.error == null}">
                                            <div>
                                                <input class="form-control" type="text" name="name">
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>

                                <div class="form-group">
                                    <label>Login</label>
                                    <c:choose>
                                        <c:when test="${param.duplicate != null}">
                                            <div class="has-error">
                                                <input class="form-control" type="text" name="login">
                                            </div>
                                        </c:when>

                                        <c:when test="${param.error != null}">
                                            <div class="has-error">
                                                <input class="form-control" type="text" name="login">
                                            </div>
                                        </c:when>

                                        <c:when test="${param.error == null}">
                                            <div>
                                                <input class="form-control" type="text" name="login">
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>

                                <div class="form-group">
                                    <label>Password</label>
                                    <c:choose>
                                        <c:when test="${param.error != null}">
                                            <div class="has-error">
                                                <input class="form-control" type="text" name="password">
                                            </div>
                                        </c:when>

                                        <c:when test="${param.error == null}">
                                            <div>
                                                <input class="form-control" type="text" name="password">
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>

                                <div class="form-group">
                                    <label>Role</label>
                                    <select class="form-control" name="role">
                                        <option>User</option>
                                        <option>Admin</option>
                                    </select>
                                </div>

                                <input type="submit" value="Add user" class="btn btn-success center-block">

                                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
