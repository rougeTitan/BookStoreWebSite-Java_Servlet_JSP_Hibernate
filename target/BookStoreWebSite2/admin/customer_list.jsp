<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
    <title>Manage Customer - Evergreen Bookstore Administration</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center" style="padding-top: 20px;padding-bottom: 20px;">
    <h2 class="pageHeading">Customer Management</h2>
    <a href="new_customer">Create New Customer</a>
</div>

<c:if test="${message != null}">
    <div align="center">
        <h4 class="message">${message}</h4>
    </div>
</c:if>

<div align="center">
    <table border="1" cellpadding="5" style="border: solid black 1px;">
        <tr style="background-color: cornflowerblue;">
            <th>Index</th>
            <th>ID</th>
            <th>E-Mail</th>
            <th>First Name</th>
            <th>last Name</th>
            <th>City</th>
            <th>Country</th>
            <th>Registered Date</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="customer" items="${listCustomer}" varStatus="status">
            <tr>
                <td>${status.index +1}</td>
                <td>${customer.customerId}</td>
                <td>${customer.email}</td>
                <td>${customer.firstname}</td>
                <td>${customer.lastname}</td>
                <td>${customer.city}</td>
                <td>${customer.countryName}</td>
                <td>${customer.registerDate}</td>

                <td>
                    <a href="edit_customer?id=${customer.customerId}">Edit Customer</a>&nbsp;
                    <a href="javascript:void(0);" class="deleteLink" id="${customer.customerId}">Delete</a>
                    &nbsp;
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
                customerId = $(this).attr("id");
                if (confirm("Are you sure you want to delete the customer with id " + customerId + "?")) {
                    window.location = "delete_customer?id=" + customerId;
                }
            });
        });
    });
</script>

</body>

</html>
