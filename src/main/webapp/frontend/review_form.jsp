<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Write a Review - online book Store</title>
	<link rel="stylesheet" href ="../css/style.css">
<%--	<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>--%>
	<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

</head>
<body style="padding-top: 100px;">
<div>
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>
<div align="center">
    <form id="reviewForm" action="submit_review" method="post">
        <table class = "normal" style="width:60%; border: 0;">
            <tr>
                <td>
                    <h2>Your reviews</h2>
                </td>
				<td>&nbsp;</td>
                <td>
                    <h2>${loggedCustomer.fullname}</h2>
                </td>
            </tr>
            <tr>
                <td colspan="3"><hr/>
                </td>
            </tr>
            <tr>
                <td>
					<span id="book-title">${book.title}</span><br/>
                    <img class ="book_large" style="width:240px;height:300px;" src="data:image/jpg;base64,${book.base64Image}"/>
				</td>
                <td>
                    <div id="rateYo"></div>
                    <input type="hidden" id="rating" name="rating"/><br/>
                    <input type="hidden" name="bookId" value="${book.bookId}"/>
                    <input type="text" name="headline" size="60"
                           placeholder="headline or summary for your review (required)"/>
					<br/>
					<br/>
                    <textarea name="comment" rows="20" cols="60" placeholder="write the review details..."></textarea>
                    <br>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button type="submit">submit</button>
                    &nbsp;&nbsp;
                    <button id="buttonCancel">cancel</button>
                </td>
            </tr>
        </table>

    </form>

</div>
<footer style="bottom: 0;left: 36%;">
    <jsp:directive.include file="footer.jsp"/>
</footer>
<script type="text/javascript">
	$(document).ready(function () {
		// $("#reviewForm").validate({
		// 	rules: {
		// 		headline: "required",
		// 		comment: "required"
		// 	},
		// 	messages: {
		// 		headline: "please enter headline",
		// 		comment: "please enter review details"
		// 	}
		// });

		$("#buttonCancel").click(function () {
			history.go(-1);
		});

		$("#rateYo").rateYo({
			starWidth: "40px",
			fullStar: true,
			onSet: function (rating, rateYoInstance) {
				$('#rating').val(rating);
			}
		});
	});
</script>
</body>
</html>
