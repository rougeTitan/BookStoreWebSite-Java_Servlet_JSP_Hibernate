<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Your Shopping Cart</title>
	<link rel="stylesheet" href ="../css/style.css">
	<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>

</head>
<body style="padding-top: 100px;">
<div>
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>
<div align="center">
    <h1>Shopping Cart</h1>

	<div align="center">
		<h2>Your Shopping Cart Details</h2>

		<c:if test="${message != null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>
	</div>

    <c:set var="cart" value="${sessionScope['cart']}"/>

    <c:if test="${cart.totalItems ==0}">
        <h2>There is no item in your car</h2>
    </c:if>

    <c:if test="${cart.totalItems > 0}">

        <form action="update_cart" method="post" id="cartForm">
            <div>
                <table border="1">
                    <tr style="background-color: cornflowerblue;">
                        <th>No</th>
                        <th colspan="2">Book</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                        <th></th>
					</tr>
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>
								<img class ="book-small" style="width:128px;height:164px;" src="data:image/jpg;base64,${item.key.base64Image}"/>
							</td>
							<td><span id="book-title">${item.key.title}</span>
							</td>
							<td>
								<input type="hidden" name="bookId" value="${item.key.bookId}"/>
								<input type="text" name="quantity${status.index + 1}" value="${item.value}" size="5"/>
							</td>
							<td><fmt:formatNumber value=" ${item.key.price}" type="currency"/></td>
							<td><fmt:formatNumber value=" ${item.value * item.key.price}" type="currency"/></td>
							<td><a href="remove_from_cart?book_id=${item.key.bookId}">Remove</a></td>
						</tr>

					</c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
						<td></td>
                        <td>${cart.totalQuantity} book(s)</td>
                        <td>Total:</td>
                        <td colspan="2"><fmt:formatNumber value=" ${cart.totalAmount}" type="currency"/></td>
                    </tr>
                </table>
            </div>
            <div>
                <table class="normal">
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td><button type="submit">Update</button></td>
                        <td><input type="button" id="clearCart" value="Clear Cart"/></td>
                        <td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
                        <td><a href="checkout">Checkout</a></td>
                    </tr>
                </table>
            </div>
        </form>
    </c:if>
</div>
<footer style="bottom: 0;left: 36%;">
    <jsp:directive.include file="footer.jsp"/>
</footer>
<script type="text/javascript">
	$(document).ready(function () {
		$("#clearCart").click(function () {
			window.location = 'clear_cart';
		});

		$("#cartForm").validate({
			rules: {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
				quantity${status.index+1}: {
				    required: true,
                    number: true,
                    min: 1},
				</c:forEach>
			},
			messages: {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
				quantity${status.index+1}: {
					required: "Please enter quantity", number: "Quantity must be a number",
					min: "Quantity must be grater than 0"
				},
				</c:forEach>
			}
		});
	});

</script>

</body>
</html>
