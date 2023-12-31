<%--
  Created by IntelliJ IDEA.
  User: mariusz
  Date: 10.11.2023
  Time: 08:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
        <a href="<c:url value="/user/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-plus fa-sm text-white-50"></i> Dodaj użytkownika</a>
    </div>

    <c:if test="${not empty message}">
        <div class="card mb-4 py-3 border-left-warning">
            <div class="card-body">
                    ${not empty message ? message : "" }
            </div>
        </div>
    </c:if>


    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Lista użytkowników</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nazwa</th>
                        <th>E-mail</th>
                        <th>Akcja</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Nazwa</th>
                        <th>E-mail</th>
                        <th>Akcja</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.getId()}</td>
                            <td>${user.getUserName()}</td>
                            <td>${user.getEmail()}</td>
                            <td>

                                <a href="<c:url value="/user/show?id=${user.getId()}"/>"
                                   class="btn btn-info btn-icon-split btn-sm">
                                    <span class="icon text-white-50">
                                    <i class="fas fa-user fa-sm text-white-50"></i></span>
                                    <span class="text">Pokaż </span></a>

                                <a href="<c:url value="/user/edit?id=${user.getId()}"/>"
                                   class="btn btn-primary btn-icon-split btn-sm">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-edit fa-sm text-white-50"></i></span>
                                    <span class="text">Edytuj</span></a>

                                <a href="<c:url value="/user/remove?id=${user.getId()}"/>"
                                   class="btn btn-danger btn-icon-split btn-sm">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-minus fa-sm text-white-50"></i></span>
                                    <span class="text">Usuń</span></a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

<%@ include file="/includes/footer.jsp" %>