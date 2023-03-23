<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Profile - Online BookStore </title>
</head>
<body style="padding-top: 100px;">
<div>
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>

    <div align="center">
        <h2>Welcome,${loggedCustomer.fullname}</h2>
    </div>
    <table class="normal" style="display: inline-block;position: relative; left: 645px;">
        <tr>
            <td><b>E-mail Address :</b></td>
            <td>${loggedCustomer.email}</td>
        </tr>

        <tr>
            <td><b>First Name: </b></td>
            <td>${loggedCustomer.firstname}</td>
        </tr>

        <tr>
            <td><b>Last Name: </b></td>
            <td>${loggedCustomer.lastname}</td>
        </tr>

        <tr>
            <td><b>Phone Number: </b></td>
            <td>${loggedCustomer.phone}</td>
        </tr>

        <tr>
            <td><b>Address Line1: </b></td>
            <td>${loggedCustomer.addressLine1}</td>
        </tr>

        <tr>
            <td><b>Address Line2: </b></td>
            <td>${loggedCustomer.addressLine2}</td>
        </tr>

        <tr>
            <td><b>city: </b></td>
            <td>${loggedCustomer.city}</td>
        </tr>

        <tr>
            <td><b>state: </b></td>
            <td>${loggedCustomer.state}</td>
        </tr>

        <tr>
            <td><b>Zip Code: </b></td>
            <td>${loggedCustomer.zipcode}</td>
        </tr>

        <tr>
            <td><b>country: </b></td>
            <td>${loggedCustomer.country}</td>
        </tr>

        <tr>
            <tr><td>&nbsp;</td></tr>
        </tr>

        <tr>
            <td colspan="2" align="center"><a href="edit_profile">Edit my profile</a></td>
        </tr>

    </table>
    <footer style="position: fixed; bottom: 0;left: 36%;">
        <jsp:include page="footer.jsp"/>
    </footer>
</body>
</html>
