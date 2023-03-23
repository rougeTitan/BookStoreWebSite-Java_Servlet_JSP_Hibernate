<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register customer</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center">
    <h2 class='pageHeading'>
        Register as a customer
    </h2>
</div>

<div align="center">
    <form action="register_customer" method="post" id="customerForm">
        <jsp:include page="../common/customer_form.jsp"/>
    </form>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript" src="../js/customer-form.js"></script>
</html>

