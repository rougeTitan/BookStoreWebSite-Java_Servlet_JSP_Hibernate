<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/jquery-ui.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <meta charset="ISO-8859-1">
    <title> Books in ${category.name} - Online Books Store</title>
</head>
<body style="padding-top: 100px;">
<div>
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>

<div class="center" style="text-align: center;">
    <h2>Category: ${category.name}</h2>
</div>
<div class="book_group" style="display: flex; width: 80%; margin: 0 auto;">
    <c:forEach items="${listBooks}" var="book">
        <div class="book" style=" display: inline-block; margin: 20px; text-align: center;">
            <div>
                <a href="view_book?id=${book.bookId}">
                    <img src="data:image/jpg;base64,${book.base64Image}" class="book_small" style="width: 128px;height: 164px;"/>
                </a>
            </div>
            <div>
                <a href="view_book?id=${book.bookId}">
                    <b>${book.title}</b>
                </a>
            </div>
            <div>
                <jsp:directive.include file="book_rating.jsp"/>
            </div>
            <div><i>by ${book.author}</i></div>
            <div><b>$ ${book.price}</b></div>
        </div>
    </c:forEach>
</div>
<footer style="position: fixed; bottom: 0;left: 36%;">
    <jsp:directive.include file="footer.jsp"/>
</footer>
</body>
</html>
