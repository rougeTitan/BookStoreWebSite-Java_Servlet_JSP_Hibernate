<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Categories - Evergreen Bookstore Administration</title>
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
    <h2 class="pageHeading">Category Management</h2>
    <a href="category_form.jsp">Create New Category</a>
</div>

<c:if test="${Message != null}">
    <div align="center">
        <h4 class="message">${Message}</h4>
    </div>
</c:if>

<div align="center">
    <table border="1" cellpadding="5" style="border: solid 1px black;">
        <tr style="background-color: cornflowerblue;">
            <th>Index</th>
            <th>ID</th>
            <th>Full Name</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="cat" items="${listCategory}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${cat.categoryId}</td>
                <td>${cat.name}</td>
                <td><a href="edit_category?id=${cat.categoryId}">Edit</a>&nbsp;
                    <a href="javascript:void(0);" class="deleteLink" id="${cat.categoryId}">Delete</a>&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

<footer style="position: fixed; bottom: 0;left: 36%;">
    <jsp:include page="footer.jsp"/>
</footer>

<script type="text/javascript">
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                categoryId = $(this).attr("id");
                if (confirm("Are you sure you want to delete the category with id " + categoryId + "?")) {
                    window.location = "delete_category?id=" + categoryId;
                }
            });
        });
    });

</script>

</body>

</html>
