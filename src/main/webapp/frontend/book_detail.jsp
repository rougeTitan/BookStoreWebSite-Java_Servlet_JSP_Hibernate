<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content=text/html;charset="ISO-8859-1">
	<title>${book.title} - Online Book Store</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
			integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
			crossorigin="anonymous"></script>
</head>
<body style="padding-top: 100px;">
	<div>
		<h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
		<jsp:include page="header.jsp"/>
	</div>

	<div class="center" style="text-align: center;">
		<table class="book" style="display: inline-block; margin: 20px; text-align: center;">
			<tr>
				<td colspan="3" align="left">
					<p id="book-title">${book.title}</p>
					by <span id="author">${book.author}</span>
				</td>
			</tr>
			<tr>
				<td rowspan="2"><img
					src="data:image/jpg;base64,${book.base64Image}" class="book_large" style="width:240px; height:300px;"/>
				</td>
				<td valign="top" align="left">
					<jsp:directive.include file="book_rating.jsp"/>
						<a href="#reviews">${fn:length(book.reviews)}Reviews</a>
				</td>
				<td valign="top" rowspan="2" width="20%">
					<h2>$${book.price}</h2>
					<br />
					<br />
					<button id="buttonAddToCart">Add to Cart</button>
				</td>
			</tr>
			<tr>
				<td id="description">${book.description}
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><h2><a id="reviews">Customer.Reviews</a></h2></td>
				<td colspan="2" align="center">
					<button id ="buttonWriteReview">Write a customer review</button>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="left">
					<table class="normal" style="border: 0;">
						<c:forEach items="${book.reviews }" var="review">
							<tr>
								<td><c:forTokens items="${review.stars }" delims="," var="star">
									<c:if test="${star eq 'on'}">
										<img src="../images/rating-on.png"/>
									</c:if>
									<c:if test="${star eq 'off'}">
										<img src="../images/rating-off.png"/>
									</c:if>`
								</c:forTokens>-<b> ${review.headline}</b></td>
							</tr>
							<tr>
								<td>by ${review.customer.fullname} on ${review.reviewTime}</td>
							</tr>
							<tr>
								<td><i>by${review.comment}</i></td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<footer style="bottom: 0;left: 36%;">
		<jsp:directive.include file="footer.jsp"/>
	</footer>
	<script type="text/javascript">
		$(document).ready(function () {

			$("#buttonWriteReview").click(function () {
				window.location = "write_review?book_id=" +${book.bookId};
			});

			$("#buttonAddToCart").click(function () {
				window.location = "add_to_cart?book_id=" +${book.bookId};
				//history.go(-1);
			});
		});
	</script>
</body>
</html>
