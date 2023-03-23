<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title> Order details - Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center">
    <h2 class="pageHeading">Details of order ID:${order.orderId}</h2>
</div>

<c:if test="${message != null}">
    <div align="center">
        <h4 class="message">${message}</h4>
    </div>
</c:if>

<div align="center">
    <h2>Order Overview:</h2>
    <table style="border: solid black 1px;">
        <tr>
            <td>Ordered By:</td>
            <td>${order.customer.fullname}</td>
        </tr>
        <tr>
            <td>order Status:</td>
            <td>${order.status}</td>
        </tr>
        <tr>
            <td>order date:</td>
            <td>${order.orderDate}</td>
        </tr>
        <tr>
            <td>Payment method:</td>
            <td>${order.paymentMethod}</td>
        </tr>
        <tr>
            <td>Book copies:</td>
            <td>${order.bookCopies}</td>
        </tr>
        <tr>
            <td>Total Amount:</td>
            <td><fmt:formatNumber value=" ${order.total}"
                                  type="currency"/></td>
        </tr>
    </table>
    <table>
        <h2>Recipient Information</h2>
        <tr>
            <td>First Name:</td>
            <td>${order.firstname}</td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td>${order.lastname}</td>
        </tr>
        <tr>
            <td>phone:</td>
            <td>${order.phone}</td>
        </tr>
        <tr>
            <td>Address Line1:</td>
            <td>${order.addressLine1}</td>
        </tr>
        <tr>
            <td>Address Line2:</td>
            <td>${order.addressLine2}</td>
        </tr>
        <tr>
            <td>City:</td>
            <td>${order.city}</td>
        </tr>
        <tr>
            <td>State:</td>
            <td>${order.state}</td>
        </tr>
        <tr>
            <td>Country:</td>
            <td>${order.countryName}</td>
        </tr>
        <tr>
            <td>zip Code:</td>
            <td>${order.zipcode}</td>
        </tr>
    </table>
</div>
<div align="center">
    <h2>Ordered Books</h2>
    <table border="1" style="border: solid black 1px;">
        <tr>
            <th>Index</th>
            <th>Book Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
        <c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td><img src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48"
                         height="64">${orderDetail.book.title}</td>
                <td>${orderDetail.book.author}</td>
                <td><fmt:formatNumber value=" ${orderDetail.book.price}" type="currency"/></td>
                <td>${orderDetail.quantity}</td>
                <td><fmt:formatNumber value=" ${orderDetail.subtotal}" type="currency"/></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="6" align="right">
                <p>Subtotal: <fmt:formatNumber value=" ${order.subtotal}" type="currency"/></p>
                <p>Tax: <fmt:formatNumber value=" ${order.tax}" type="currency"/></p>
                <p>Shipping Fee: <fmt:formatNumber value=" ${order.shippingFee}" type="currency"/></p>
                <p>Total: <fmt:formatNumber value=" ${order.total}" type="currency"/></p>
            </td>
        </tr>
    </table>
</div>

<div align="center">
    <br/>
    <a href="edit_order?id=${order.orderId}">Edit this order</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:void(0);" class="deleteLink" id="${order.orderId}">Delete</a>
</div>

<jsp:include page="footer.jsp"/>

<script type="text/javascript">
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                deleteId = $(this).attr("id");
                if (confirm("Are you sure you want to delete the review with ID" + deleteId + "?")) {
                    window.location = "delete_order?id=" + deleteId;
                }
            });
        });
    });
</script>

</body>

</html>
