<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/754ec3e605.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/style.css">

<div align="center">
    <div style="right: 213px; position:relative;bottom: 85px;">
        <a href="${pageContext.request.contextPath}/">
            <i class="fa-5x fa-solid fa-book-open-reader"></i>
        </a>
    </div>
    <div>
        <form action="search" method="get">
            <input type="text" name="keyword" size="50"/>
            <input type="submit" value="search"/>
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <c:if test="${loggedCustomer==null}">
                <a href="login">Sign In</a>|
                <a href="register">Register</a>
            </c:if>

            <c:if test="${loggedCustomer != null}">
                <a href="view_profile">welcome, ${loggedCustomer.fullname}</a> |
                <a href="view_orders">My Orders</a> |
                <a href="logout">Logout</a> |
            </c:if>

            <a href="view_cart">Cart</a>
        </form>
    </div>
    <div style="padding-top: 25px;">
        <c:forEach var="category" items="${listCategory}" varStatus="status">
            <a href="view_category?id=${category.categoryId}">
                <font size="+1"><b><c:out value="${category.name}"/></b></font>
            </a>

            <c:if test="${not status.last}">
			&nbsp;|&nbsp;
            </c:if>
        </c:forEach>
    </div>
</div>
