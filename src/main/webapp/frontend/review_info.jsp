<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>write review - online book Store</title>
    <link rel="stylesheet" href="../css/style.css" >
    <script src="../js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
</head>
<body style="padding-top: 100px;">
<div>
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>
<div align="center" style="text-align: center;">
    <form id="reviewForm">
        <table class="normal" style="display: inline">
            <tr>
                <td>
                    <h3>Your already wrote a review for this book</h3>
                </td>
				<td>&nbsp;</td>
                <td>
                    <h2>Review By: ${loggedCustomer.fullname}</h2>
                </td>
            </tr>
            <tr>
                <td colspan="3"><hr/>
                </td>
            </tr>
            <tr>
                <td id ="book-title" >${book.title }<br/>
                    <img class="book_large" style="width:240px;height:300px;" src="data:image/jpg;base64,${book.base64Image}"/>
                <td>
                    <div id="rateYo"></div>
					<br/>
                    <input type="text" name="headline" size="63" placeholder="readonly" value="${review.headline}"/>
                    <br/>
					<br/>
                    <textarea name="comment" rows="20" cols="60" placeholder="readonly">${review.comment}</textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<footer style="position: fixed;bottom: 0;left: 36%;">
    <jsp:directive.include file="footer.jsp"/>
</footer>
<script type="text/javascript">
    $(document).ready(function () {
        $("#rateYo").rateYo({
            starWidth: "40px",
            fullStar: true,
            rating: ${review.rating},
            readonly: true,
        });
    });
</script>
</body>
</html>
