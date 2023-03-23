<div align="center">
    <h2>Order Overview:</h2>
    <table>
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
            <td>${order.State}</td>
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
    <table border="1">
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
                <td><img src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64">${orderDetail.book.title}</td>
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
                <p>Shipping Fee: <fmt:formatNumber value=" ${order.shippingfee}" type="currency"/></p>
                <p>Total: <fmt:formatNumber value=" ${order.total}" type="currency"/></p>
            </td>
        </tr>
    </table>
</div>
