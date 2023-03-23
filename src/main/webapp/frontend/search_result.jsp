<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Results for ${keyword} - Online Bookstore</title>
    <link rel="stylesheet" href="../css/style.css" >
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="center">
    <c:if test="${fn:length(result)== 0}">
        <h2>No results for "${keyword}"</h2>
    </c:if>
    <c:if test="${fn:length(result)> 0}">
    <div class="book_group">
        <h2>Results for "${keyword}"</h2>
        <c:forEach items="${result}" var="book">
            <div>
                <div id="search_image">
                    <div align="left">
                        <a href="view_book?id=${book.bookId}"> <img src="data:image/jpg;base64,${book.base64Image}"
                                                                    class="book_small"/>
                        </a>
                    </div>
                </div>
                <div id="search_description">
                    <div>
                        <h2><a href="view_book?id=${book.bookId}"> <b>${book.title}</b> </a></h2>
                        </a>
                    </div>
                    <div>Rating *****</div>
                    <div>
                        <i>by ${book.author}</i>
                    </div>
                    <div>
                        <p>${fn:substring(book.discription,0,100)}....</p>
                    </div>
                </div>
                <div id="search_price">
                    <h3>$ ${book.price}</h3>
                    <h3><a href="">Add to cart</a></h3>
                </div>
            </div>
        </c:forEach>
</div>
</c:if>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
