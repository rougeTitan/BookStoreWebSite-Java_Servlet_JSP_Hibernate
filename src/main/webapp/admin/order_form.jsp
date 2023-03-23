<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Order - Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center">
    <h2 class="pageHeading">Edit order ID:${order.orderId}</h2>
</div>

<c:if test="${message != null}">
    <div align="center">
        <h4 class="message">${message}</h4>
    </div>
</c:if>
<form action="update_order" method="post" id="orderForm">
    <div align="center">

        <table style="border: solid black 1px;">
            <h2>Order Overview:</h2>
            <tr>
                <td><b>Ordered By:</b></td>
                <td>${order.customer.fullname}</td>
            </tr>
            <tr>
                <td><b>order date:</b></td>
                <td>${order.orderDate}</td>
            </tr>
            <tr>
                <td><b>Payment method:</b></td>
                <td>
                    <select name="paymentMethod">
                        <option value="Cash On Delivery" <c:if
                                test="${order.paymentMethod eq 'Cash On Delivery'}"> selected='selected' </c:if>>Cash On
                            Delivery
                        </option>
                        <option value="paypal" <c:if
                                test="${order.paymentMethod eq 'paypal'}"> selected='selected' </c:if>>Paypal or Credit
                            card
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><b>Order Status:</b></td>
                <td>
                    <select name="orderStatus">
                        <option value="Processing" <c:if test="${order.status eq 'Processing'}">selected='selected'</c:if>>Processing</option>
                        <option value="Shipping" <c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if>>Shipping</option>
                        <option value="Delivered" <c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>>Delivered</option>
                        <option value="Completed" <c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>>Completed</option>
                        <option value="Cancelled" <c:if test="${order.status eq 'Cancelled'}">selected='selected'</c:if>>Cancelled</option>
                    </select>
                </td>
            </tr>
        </table>
        <h2>Recipient Information</h2>
        <table>
            <tr>
                <td><b>First Name:</b></td>
                <td><input type="text" name="firstname" id="firstname" value="${order.firstname}" size="45" required
                           minlength="3" maxlength="30"/></td>
            </tr>
            <tr>
                <td><b>last Name:</b></td>
                <td><input type="text" name="lastname" id="lastname" value="${order.lastname}" size="45" required
                           minlength="3" maxlength="30"/></td>
            </tr>
            <tr>
                <td><b>phone:</b></td>
                <td><input type="text" name="phone" id="phone" value="${order.phone}" size="45" required minlength="9"
                           maxlength="15"/></td>
            </tr>
            <tr>
                <td><b>Address Line 1:</b></td>
                <td><input type="text" name="address1" id="address1" value="${order.addressLine1}" size="45" required
                           minlength="10" maxlength="256"/></td>
            </tr>
            <tr>
                <td><b>Address Line 2:</b></td>
                <td><input type="text" name="address2" name="address2" value="${order.addressLine2}" size="45" required
                           minlength="30" maxlength="256"/></td>
            </tr>
            <tr>
                <td><b>City:</b></td>
                <td><input type="text" name="city" id="city" value="${order.city}" size="45" required minlength="3"
                           maxlength="32"/></td>
            </tr>
            <tr>
                <td><b>State:</b></td>
                <td><input type="text" name="state" id="state" value="${order.state}" size="45" required minlength="3"
                           maxlength="45"/></td>
            </tr>

            <tr>
                <td><b>Zipcode:</b></td>
                <td><input type="text" name="zipcode" id="zipcode" value="${order.zipcode}" size="45" required
                           minlength="3" maxlength="24"/></td>
            </tr>
            <tr>
                <td><b>Country:</b></td>
                <td align="left">
                    <select name="country" id="country" required>
                        <c:forEach items="${mapCountries}" var="country">
                            <option value="${country.value}"
                                    <c:if test="${order.country eq country.value}">selected="selected"</c:if>>${country.key}
                            </option>
                        </c:forEach>
                    </select>
                </td>
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
                <th></th>
            </tr>
            <c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${orderDetail.book.title}</td>
                    <td>${orderDetail.book.author}</td>
                    <td>
                        <input type="hidden" name="price" value="${orderDetail.book.price}"/>
                        <fmt:formatNumber value=" ${orderDetail.book.price}" type="currency"/>
                    </td>
                    <td>
                        <input type="hidden" name="bookId" value="${orderDetail.book.bookId}" size="5"/>
                        <input type="number" name="quantity ${status.index+1}" value="${orderDetail.quantity}" size="5"
                               step="1" min="1" required/>
                    </td>
                    <td><fmt:formatNumber value=" ${orderDetail.subtotal}" type="currency"/></td>
                    <td><a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7" align="right">
                    <p>Subtotal: <fmt:formatNumber value=" ${order.subtotal}" type="currency"/></p>
                    <p>Tax: <input type="number" size="5" name="tax" value="${order.tax}" step="0.1" min="0.0"/></p>
                    <p>Shipping Fee: <input type="number" size="5" name="shippingFee" value="${order.shippingFee}"
                                            step="0.1" min="0.0" required/></p>
                    <p>Total: <fmt:formatNumber value=" ${order.total}" type="currency"/></p>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="padding-top: 30px;">
        <a href="javascript:showAddBookPopup()"><b>Add Books</b></a>
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        <input type="submit" value="save"/>
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        <input type="button" value="cancel" onclick="window.location.href='list_order';"/>

    </div>

    </div>
</form>

<script type="text/javascript">
    function showAddBookPopup() {
        let width = 600;
        let height = 240;
        let left = (screen.width - width) / 2;
        let top = (screen.height - height) / 2;
        window.open('add_book_form', '_blank', 'width=' + width + ', height=' + height + ', top=' + top + ',left=' + left);
    }

    <%--$(document).ready(function () {--%>

    <%--	$("#orderForm").validate({--%>
    <%--		rules: {--%>
    <%--			firstname: "required",--%>
    <%--			lastname: "required",--%>
    <%--			phone: "required",--%>
    <%--			address1: "required",--%>
    <%--			address2: "required",--%>
    <%--			city: "required",--%>
    <%--			state: "required",--%>
    <%--			zipCode: "required",--%>
    <%--			country: "required",--%>

    <%--			<c:forEach items="${order.orderDetails}" var="book" varStatus="status">--%>
    <%--				quantity ${status.index+1}: {required: true, number: true, min: 1}--%>
    <%--			</c:forEach>--%>
    <%--		},--%>
    <%--		messages: {--%>
    <%--			firstname: "please enter first name",--%>
    <%--			lastname: "please enter last name",--%>
    <%--			phone: "please enter phone",--%>
    <%--			address1: "please enter addressline1",--%>
    <%--			address2: "please enter addressline3",--%>
    <%--			city: "please enter city",--%>
    <%--			state: "please enter state",--%>
    <%--			zipCode: "please enter zipcode",--%>
    <%--			country: "please enter country",--%>
    <%--			<c:forEach items="${order.orderDetails}" var="book" varStatus="status">--%>
    <%--			quantity${status.index+1}: {--%>
    <%--				required: "Please enter quantity",--%>
    <%--				number: "Quantity must be a number",--%>
    <%--				min: "Quantity must be grater than 0",--%>
    <%--			},--%>
    <%--			</c:forEach>--%>

    <%--			shippingFee:{--%>
    <%--				required:"please enter shipping fee",--%>
    <%--				number:" shipping fee must be a number",--%>
    <%--				min:"shipping fee must be greater than 0"--%>
    <%--			},--%>

    <%--			tax:{--%>
    <%--				required:"please enter tax",--%>
    <%--				number:"tax must be a number",--%>
    <%--				min:"tax must be greater than 0"--%>
    <%--			},--%>
    <%--		},--%>
    <%--	});--%>
    <%--});--%>

</script>

</body>

<footer style="bottom: 0;left: 36%;">
    <jsp:include page="footer.jsp"/>
</footer>

</html>
