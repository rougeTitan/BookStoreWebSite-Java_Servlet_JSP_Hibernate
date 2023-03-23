<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register as a customer</title>
    <link rel="stylesheet" href="../css/style.css" >
    <link rel="stylesheet" href="../css/jquery-ui.min.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>

</head>
<body style="padding-top: 100px;">
<div>
    <h1 style="position:absolute;left: 615px;top:40px;">Welcome to book store</h1>
    <jsp:include page="header.jsp"/>
</div>
    <div align="center">
        <h2 class='pageheading'>
            Edit my profile
        </h2>
    </div>

    <div align="center">

        <form action="update_profile" method="post" id="customerForm">
            <table class="form" style="display: block; left: 486px; position: absolute;">
                <tr>
                    <td align="right">E-mail:</td>
                    <td align="left"><b>${loggedCustomer.email}</b>(cannot be changed)</td>
                </tr>
                <tr>
                    <td align="right">First Name:</td>
                    <td align="left"><input type="text" id="firstname" name="firstname" size="45" value="${loggedCustomer.firstname}"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">Last Name:</td>
                    <td align="left"><input type="text" id="lastname" name="lastname" size="45" value="${loggedCustomer.lastname}"/></td>
                </tr>
                <tr>
                    <td align="right">Phone Number:</td>
                    <td align="left"><input type="text" id="phone" name="phone" size="45" value="${loggedCustomer.phone}"/></td>
                </tr>
                <tr>
                    <td align="right">Address Line1:</td>
                    <td align="left"><input type="text" id="addressLine1" name="addressLine1" size="45" value="${loggedCustomer.addressLine1}"/></td>
                </tr>
                <tr>
                    <td align="right">Address Line2:</td>
                    <td align="left"><input type="text" id="addressLine2" name="addressLine2" size="45" value="${loggedCustomer.addressLine2}"/></td>
                </tr>
                <tr>
                    <td align="right">City:</td>
                    <td align="left"><input type="text" id="city" name="city" size="45" value="${loggedCustomer.city}"/></td>
                </tr>
                <tr>
                    <td align="right">State:</td>
                    <td align="left"><input type="text" id="state" name="state" size="45" value="${loggedCustomer.state}"/></td>
                </tr>
                <tr>
                    <td align="right">Zip Code:</td>
                    <td align="left"><input type="text" id="zipCode" name="zipCode" size="45" value=${loggedCustomer.zipcode}/></td>
                </tr>
                <tr>
                    <td align="right">Country:</td>
                    <td align="left">
                        <select name="country" id="country">
                            <c:forEach items="${mapCountries}" var="country">
                                <option value="${country.value}" <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><i>(Leave password fields blank if you dont want to change it)</i></td>
                </tr>

                <tr>
                    <td align="right">Password:</td>
                    <td align="left"><input type="text" id="password"
                                            name="password" size="45"/></td>
                </tr>
                <tr>
                    <td align="right">Confirmed Password:</td>
                    <td align="left"><input type="text" id="confirmedpassword"
                                            name="confirmedpassword" size="45"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" value="Save">Save</button>
                        <button type="button" value="Cancel" onclick="history.go(-1)">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <footer style="position: fixed; bottom: 0;left: 36%;">
        <jsp:include page="footer.jsp"/>
    </footer>
</body>
<script type="text/javascript">
    $(document).ready(function () {

        $("#customerForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                fullName: "required",
                confirmPassword: {
                    equalTo: "#password",
                },
                Phone: "required",
                Address: "required",
                City: "required",
                ZipCode: "required",
                Country: "required",
            },
            messages: {
                email: {
                    required: " please enter valid email",
                    email: "please enter a valid email"
                },
                fullName: "please select a full name",
                confirmPassword: {
                    equalTo: "Confirm password doesnt match with password"
                },
                Phone: "please enter phone",
                Address: "please enter address",
                City: "please enter city",
                ZipCode: "please enter zipcode",
                Country: "please enter country",
            }
        });

        $("#buttonCancel").click(function () {
            history.go(-1);
        });

    })

</script>
</html>
