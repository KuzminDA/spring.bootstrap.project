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
                    <li class="active"><a href="/admin">Admin</a></li>
                    <li><a href="/user">User</a></li>
                </ul>
            </div>
            <div class="col-lg-10 col-md-9 main-menu">
                <div class="page-header">
                    <h3>Admin panel</h3>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="/admin">User table</a></li>
                    <li><a href="/admin/add">New user</a></li>
                </ul>
                <div class="panel panel-default">
                    <div class="panel-heading"><label>All users</label></div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <td align="center"><label>ID</label></td>
                                <td align="center"><label>Name</label></td>
                                <td align="center"><label>Login</label></td>
                                <td align="center"><label>Password</label></td>
                                <td align="center"><label>Role</label></td>
                                <td align="center"><label>Actions</label></td>
                            </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td align="center">${user.id}</td>
                                        <td align="center">${user.name}</td>
                                        <td align="center">${user.login}</td>
                                        <td align="center">${user.password}</td>

                                        <c:set var="roles" value="${user.roles}"/>
                                        <c:choose>
                                            <c:when test="${roles.contains(Admin)}">
                                                <td align="center">Admin</td>
                                            </c:when>

                                            <c:when test="${roles.contains(User)}">
                                                <td align="center">User</td>
                                            </c:when>
                                        </c:choose>

                                        <td align="center">
                                            <button class="btn btn-primary btn-xs" type="button" data-toggle="modal" data-target="#${user.id}">Edit</button>
                                            <a class="btn btn-danger btn-xs" href="<c:url value="/delete/${user.id}"/>">Delete</a>
                                        </td>

                                        <div class="container">
                                            <div class="modal fade" id="${user.id}">
                                                <div class="modal-dialog modal-sm">
                                                    <div class="modal-content">
                                                        <form role="form" action="/admin/edit" method="post">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Editing of user</h4>
                                                            </div>

                                                            <div class="modal-body">
                                                                <div class="form-edit">

                                                                    <label>ID</label>
                                                                    <input type="text" class="form-control" name="id" value="${user.id}" readonly="readonly">

                                                                    <label>Name</label>
                                                                    <input type="text" class="form-control" name="name" value="${user.name}">

                                                                    <label>Login</label>
                                                                    <input type="text" class="form-control" name="login" value="${user.login}">

                                                                    <label>Password</label>
                                                                    <input type="text" class="form-control" name="password" value="${user.password}">

                                                                    <label>Role</label>
                                                                    <select class="form-control" name="role">
                                                                        <c:set var="roles" value="${user.roles}"/>
                                                                        <c:choose>
                                                                            <c:when test="${roles.contains(Admin)}">
                                                                                <option>Admin</option>
                                                                                <option>User</option>
                                                                            </c:when>

                                                                            <c:when test="${roles.contains(User)}">
                                                                                <option>User</option>
                                                                                <option>Admin</option>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <input type="submit" class="btn btn-success" value="Edit"/>
                                                                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



</body>
</html>
