<%--
  Created by IntelliJ IDEA.
  User: mariusz
  Date: 10.11.2023
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
        <a href="<c:url value="/user/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-plus fa-sm text-white-50"></i> Dodaj użytkownika</a>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Szczegóły użytkownika</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">

                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <tbody>
                        <tr>
                            <td>Id</td><td>${user.getId()}</td>
                            <td>Nazwa użytkownika</td><td>${user.getUserName()}</td>
                            <td>Email</td><td>${user.getEmail()}</td>
                        </tr>
                    </tbody>
                </table>


            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

<%@ include file="/includes/footer.jsp" %>