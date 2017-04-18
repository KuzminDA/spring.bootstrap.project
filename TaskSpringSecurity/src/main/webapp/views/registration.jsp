<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Registration</title>
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
                <div class="panel-heading"><label>Registration</label></div>

                <div class="panel-body">
                    <div>
                        <form method="post" action="/registration">
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


                            <div>
                                <label>Name</label>
                            </div>
                            <div>
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

                            <div>
                                <label>Login</label>
                            </div>
                            <div>
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

                            <div>
                                <label>Password</label>
                            </div>
                            <div>
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

                            <div>
                                <label>Role</label>
                            </div>
                            <div>
                                <select class="form-control" name="role">
                                    <option>User</option>
                                    <option>Admin</option>
                                </select>
                            </div>

                            <div align="right">
                                <input class="btn btn-success btn-margin-top" type="submit" value="Registry"/>
                                <a class="btn btn-danger btn-margin-top" href="/login">Back</a>
                                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
