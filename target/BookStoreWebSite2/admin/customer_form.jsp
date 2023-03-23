<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Create New customer</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center">
	<h2 class="pageHeading">
		<c:if test="${customer != null}">Edit Customer</c:if>
		<c:if test="${customer == null}">Create New Customer</c:if>
	</h2>
</div>

<div align="center">

	<c:if test="${customer != null}">
	<form action="update_customer" method="post" id="customerForm">
		<input type="hidden" name="customerId" value="${customer.customerId}"/>
		</c:if>
		<c:if test="${customer == null}">
		<form action="create_customer" method="post" id="customerForm">
		</c:if>
		<jsp:include page="../common/customer_form.jsp"/>
		</form>
</div>
</body>

<footer style="position: fixed; bottom: 0;left: 36%;">
	<jsp:include page="footer.jsp"/>
</footer>

<script type="text/javascript" src="../js/customer-form.js"></script>
</html>
