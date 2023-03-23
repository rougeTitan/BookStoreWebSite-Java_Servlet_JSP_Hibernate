<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit review</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
            integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
            crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="header.jsp"/>

<div align="center">
    <h2 class="pageHeading">Edit Review</h2>
</div>

<div align="center">
    <form action="update_review" method="post" id="reviewForm">
        <input type="hidden" name="reviewId" value="${review.reviewId}"/>

        <table class="form" style="border: solid black 1px;">
            <tr>
                <td align="right">Book:</td>
                <td align="left"><b>${review.book.title}</b></td>
            </tr>
            <tr>
                <td align="right">Rating:</td>
                <td align="left"><b>${review.rating}</b></td>
            </tr>
            <tr>
                <td align="right">Customer:</td>
                <td align="left"><b>${review.customer.fullname}</b></td>
            </tr>
            <tr>
                <td align="right">Headline:</td>
                <td align="left">
                    <input type="text" size="52" name="headline" value="${review.headline}" />
                </td>
            </tr>
            <tr>
                <td align="right">Comment:</td>
                <td align="left"><textarea rows="10" cols="50" name="comment" value="${review.comment}"></textarea>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">Save</button>
                    <button id="buttonCancel">Cancel</button>
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
    $(document).ready(function () {

        $("#reviewForm").validate({
            rules: {
                headline: "required",
                comment: "required"
            },
            messages: {
                headline: "please select a headline",
                comment: "please enter comment"
            }
        });

        $("#buttonCancel").click(function () {
            history.go(-1);
        });
    });

</script>
</html>
