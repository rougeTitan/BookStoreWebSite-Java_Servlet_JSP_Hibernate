<div class="book" style="padding-bottom: 25px;">
    <div>
        <a href="view_book?id=${book.bookId}"> <img src="data:image/jpg;base64,${book.base64Image}" class="book_small" /></a>
    </div>
    <div>
        <a href="view_book?id=${book.bookId}"> <b>${book.title}</b></a>
    </div>
    <div>
        <jsp:directive.include file="book_rating.jsp"/>
    </div>
    <div>
        <i>by ${book.author}</i>
    </div>
    <div>
        <b>$ ${book.price}</b>
    </div>
</div>
