<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
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
    <title>
        <c:if test="${category != null}"> Edit Category</c:if>
        <c:if test="${category == null}"> Create New Category</c:if>
    </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="center">
    <h2 class="pageheading">
        <c:if test="${category != null}">Edit category</c:if>
        <c:if test="${category == null}">Create New category</c:if>
    </h2>
</div>

<div align="center">

    <c:if test="${category != null}">
    <form action="update_category" method="post" style="max-width: 400px; margin: 0 auto;" id="categoryForm">
        <input type="hidden" name="categoryId" value="${category.categoryId}">
        </c:if>
        <c:if test="${category == null}">
            <form action="create_category" method="post" style="max-width: 400px; margin: 0 auto;">
        </c:if>
            <table class="form" style="border: solid black 1px;">
                <tr>
                    <td align="right">Name:</td>
                    <td align="left"><input type="text" id="name"
                                            name="name" size="20" value="${category.name}"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
                        <button id="buttonCancel" type="button" onclick="history.go(-1);">Cancel</button>
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
        $("#categoryForm").validate({
            rules: {
                name: "required",
            },
            message: {
                name: "please enter category name",
            },
        });

        $("#buttonCancel").click(function(){
            history.go(-1);
        });
    });
</script>
</html>
