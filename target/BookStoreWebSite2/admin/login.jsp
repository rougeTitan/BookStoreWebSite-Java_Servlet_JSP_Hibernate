<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Login</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
    <h1>Books store Administration</h1>
    <h1>Admin Login</h1>

    <c:if test="${Message != null}">
        <div align="center">
            <h4 class="message">${message}</h4>
        </div>
    </c:if>
    <form id="formLogin" action="login" method="post">
    <table style="border: solid black 1px;">
        <tr>
            <td align="center">Email:</td>
            <td align="left"><input type="email" id="email" name="email"
                                    size="20" required minlength="5" maxlength="30"/></td>
        </tr>
        <tr>
            <td align="center">password:</td>
            <td align="left"><input type="password" id="password"
                                    name="password" size="20" required minlength="4" maxlength="32"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">Login</button>
            </td>
        </tr>

    </table>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: "password",
            },
            messages: {
                email: {
                    required: "please enter email",
                    email: "please enter an valid email address"
                },
                password: "please enter password"
            }
        });
    });
</script>

</body>
</html>
