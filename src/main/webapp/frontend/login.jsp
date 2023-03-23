<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
        crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>
    <title>Customer Login</title>
</head>
<body style="padding-top: 100px;">
<div >
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>

<div align="center">
    <h1>Customer Login</h1>

    <c:if test="${message != null}">
        <div align="center">
            <h4 class="message">${message}</h4>
        </div>
    </c:if>
    <form id="formLogin" action="login" method="post">
        <table>
            <tr>
                <td align="center">Email:</td>
                <td align="left"><input type="text" id="email" name="email"
                                        size="20" value="${user.email}"/></td>
            </tr>
            <tr>
                <td align="center">password:</td>
                <td align="left"><input type="password" id="password"
                                        name="password" size="20" value="${user.password}"/></td>
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
<footer style="position: fixed;bottom: 0;left: 36%;">
    <jsp:include page="footer.jsp"/>
</footer>
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
