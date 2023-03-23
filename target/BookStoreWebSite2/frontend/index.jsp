<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/style.css">
    <meta charset="ISO-8859-1">
    <title>Evergreen Books - Online Bookstore</title>
</head>
<body style="text-align: center; padding-top: 30px;">
    <h1 style="display: inline-block;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
<div class="center">
    <div style="padding-bottom: 25px;">
        <h2>New Books</h2>
        <c:forEach items="${listNewBooks}" var="book">
            <jsp:directive.include file="book_group.jsp"/>
        </c:forEach>
    </div>
    <div class="next_row">
        <h2>Best Selling Books:</h2>
        <c:forEach items="${listBestSellingBooks}" var="book">
            <jsp:directive.include file="book_group.jsp"/>
        </c:forEach>
    </div>
    <div class="next_row">
        <h2>Most Favoured Books:</h2>
        <c:forEach items="${listMostFavouredBooks}" var="book">
            <jsp:directive.include file="book_group.jsp"/>
        </c:forEach>
    </div>
</div>
    <footer style=" bottom: 0;left: 36%;">
        <jsp:include page="footer.jsp"/>
    </footer>
</body>
</html>
