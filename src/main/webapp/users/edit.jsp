<%--
  Created by IntelliJ IDEA.
  User: mariusz
  Date: 10.11.2023
  Time: 12:38
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
        <a href="<c:url value="/user/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-list-ul fa-sm text-white-50"></i> Lista użytkowników</a>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Szczegóły użytkownika</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form method="post" name="editUser" action="<c:url value="/user/edit"/>">
                    <input name="id" value="${id}" type="hidden">
                    <div>
                        <label>Nazwa<br>
                        <input type="text" name="userName" value="${name}" required>
                        </label>
                    </div>
                    <br>
                    <div>
                        <label for="email">Email<br>
                        <input id="email" type="email" name="email" value="${email}" required>
                        </label>
                    </div>
                    <br>
                    <div>
                        <label for="password">Hasło<br>
                        <input id="password" type="password" name="password">
                        </label>
                    </div>
                    <br>
                    <br>
                    <input type="submit" name="save" value="Zapisz" class="btn btn-primary">
                </form>

            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<%@ include file="/includes/footer.jsp" %>