<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/754ec3e605.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/style.css">

<div align="center">
    <div>
        <a href="${pageContext.request.contextPath}/admin/" style="position: absolute;right: 916px;">
            <i class="fa-5x fa-solid fa-id-badge"></i>
        </a>
    </div>
    <div style="padding-top: 30px;"> Welcome, <b><c:out value="${sessionScope.useremail}"/></b> |<a href="logout">Logout</a>
        <br/>
        <br/>
    </div>
    <div id="headermenu" style="display: inline-flex; padding-top: 35px;">
        <div style="margin-right: 30px;">
            <a href="list_users"><i class="fa-3x fa-solid fa-user"></i></br> Users </a>
        </div>
        <div style="margin-right: 30px;">
            <a href="list_category"><i class=" fa-3x fa-solid fa-list"></i> </br> Categories </a>
        </div>
        <div style="margin-right: 30px;">
            <a href="list_books"><i class="fa-3x fa-solid fa-book"></i> </br> Books </a>
        </div>
        <div style="margin-right: 30px;">
            <a href="list_customer"><i class="fa-3x fa-solid fa-briefcase"></i> </br> Customers </a>
        </div>
        <div style="margin-right: 30px;">
            <a href="list_review"><i class="fa-3x fa-solid fa-magnifying-glass"></i> </br> Reviews </a>
        </div>
        <div >
            <a href="list_order"><i class="fa-3x fa-solid fa-store"></i></br> Orders </a>
        </div>
    </div>
</div>
