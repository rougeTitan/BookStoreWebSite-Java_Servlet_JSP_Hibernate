<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create New User</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center">
    <h2 class="pageHeading">
        <c:if test="${user != null}">Edit User</c:if>
        <c:if test="${user == null}">Create New User</c:if>
    </h2>
</div>

<div align="center">

    <c:if test="${user != null}">
    <form action="update_user" method="post" style="max-width: 400px; margin: 0 auto;" id="userForm">
        <input type="hidden" name="userId" value="${user.userId}">
    </c:if>
    <c:if test="${user == null}">
        <form action="create_user" method="post" style="max-width: 400px; margin: 0 auto;" id="userForm">
     </c:if>
            <table class="form" style="border: solid black 1px;">
                <tr>
                    <td align="right">Email:</td>
                    <td align="left"><input type="email" id="email" name="email"
                                            size="20" value="${user.email}" required/></td>
                </tr>
                <tr>
                    <td align="right">Full Name:</td>
                    <td align="left"><input type="text" id="fullName"
                                            name="fullname" size="20" value="${user.fullName}" required/></td>
                </tr>
                <tr>
                    <td align="right">password:</td>
                    <td align="left"><input type="password" id="password"
                                            name="password" size="20" value="${user.password}" required/></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" onclick="history.go(-1);"/>Cancel</button>
					</td>
                </tr>

            </table>
        </form>
</div>
</body>

<footer style="position: fixed; bottom: 0;left: 36%;">
    <jsp:include page="footer.jsp"/>
</footer>

<script type="text/javascript">
    //this function will get executed once page is loaded.
    $(document).ready(function () {
        $(id = "userForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                fullName: "required",
                password: "required",
            },
            message: {
                email: {
                    required: "please enter email",
                    email: "please enter an valid email address"
                },

                fullName: "pleas enter the full name",
                password: "please enter password"
            }

        });
        $("#cancelButton").click(function () {
            history.go(-1);

        });

    });

</script>
</html>
