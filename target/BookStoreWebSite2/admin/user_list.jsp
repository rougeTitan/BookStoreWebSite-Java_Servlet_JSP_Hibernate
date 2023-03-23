<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Users - Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center" style="padding-top: 20px;padding-bottom: 20px;">
    <h2 class="pageHeading">Users Management</h2>
    <a href="user_form.jsp">Create New User</a>
</div>

<c:if test="${message != null}">
    <div align="center">
        <h4 class="message"><i>${message}</i></h4>
    </div>
</c:if>

<div align="center">
    <table border="1" cellpadding="5" style="border: solid black 1px;">
        <tr style="background-color: cornflowerblue;">
            <th>Index</th>
            <th>ID</th>
            <th>Email</th>
            <th>Full Name</th>
            <th>Actions</th>
        </tr>

        <c:forEach items="${listUsers}" var="user" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${user.userId}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td><a href="edit_user?id=${user.userId}">Edit</a> &nbsp;
                    <a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>

</div>

<footer style="bottom: 0;left: 36%;">
    <jsp:include page="footer.jsp"/>
</footer>

<script>
    $(document).ready(function(){
        $(".deleteLink").each(function(){
            $(this).on("click", function(){
                userId = $(this).attr("id");
                if ( confirm("Are you sure you want to delete the user with ID" + userId + "?")){
                    window.location = "delete_user?id=" + userId;
                }
            });
        });
    });
</script>

</body>

</html>
