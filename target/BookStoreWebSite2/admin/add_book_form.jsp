<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Book to Order</title>
</head>
<body>
<div align="center">
    <h2>Add book to order ID:${order.orderId}</h2>
    <form action="add_book_to_order" method="post">
        <table style="border: solid black 1px;">
            <tr>
                <td>Select a book:</td>
                <td>
                    <select name="bookId">
                        <c:forEach var="book" items="${listBook}" varStatus="status">
                            <option value="${book.bookId}">${book.title} - ${book.author}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Number of copies</td>
                <td>
                    <select name="quantity">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <td colspan="2" align="center">
                <input type="submit" value="Add"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="cancel" onclick="self.close();"/>
            </td>
        </table>
    </form>
</div>

</body>
</html>
