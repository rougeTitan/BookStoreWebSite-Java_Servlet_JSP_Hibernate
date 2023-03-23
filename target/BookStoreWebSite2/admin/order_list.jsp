<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Orders - Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css" >
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center" style="padding-top: 20px;padding-bottom: 20px;">
    <h2 class="pageHeading">Book Orders Management</h2>
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
            <th>Order ID</th>
            <th>Order by</th>
            <th>Book Copies</th>
            <th>Total</th>
            <th>Payment Methods</th>
            <th>Status</th>
            <th>Order Date</th>
            <th>Actions</th>

        </tr>
        <c:forEach var="order" items="${listOrder}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${order.orderId}</td>
                <td>${order.customer.fullname}</td>
                <td>${order.bookCopies}</td>
                <td><fmt:formatNumber value=" ${order.total}"
                                      type="currency"/></td>
                <td>${order.paymentMethod}</td>
                <td>${order.status}</td>
                <td>${order.orderDate}</td>
                <td>
                    <a href="view_order?id=${order.orderId}">Details</a>&nbsp;
                    <a href="edit_order?id=${order.orderId}">Edit</a>&nbsp;
                    <a href="javascript:void(0);" class="deleteLink" id="${order.orderId}">Delete</a>
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
                orderId = $(this).attr("id");
                if (confirm("Are you sure you want to delete the order with id " + orderId + "?")) {
                    window.location = "delete_order?id=" + orderId;
                }
            })
        });
    });
</script>

</body>

</html>
