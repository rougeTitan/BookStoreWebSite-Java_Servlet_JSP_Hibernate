package com.bookstore.service;


import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BookServices {
    private final BookDAO bookDAO;
    private final CategoryDAO categoryDAO;
    private final HttpServletRequest request;
    private final HttpServletResponse response;


    public BookServices(HttpServletRequest request,
                        HttpServletResponse response) {
        super();
        this.request = request;
        this.response = response;
        bookDAO = new BookDAO();
        categoryDAO = new CategoryDAO();
    }

	public void listBooks(String Message) throws ServletException, IOException {

		List<Book> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);
		if (Message != null) {
			request.setAttribute("message", listBooks);
		}
		String listPage = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

    public void listBooks() throws ServletException, IOException {
        listBooks(null);
    }


    public void createBook() throws ServletException, IOException {
        Integer categoryId = Integer.parseInt(request.getParameter("category"));
        String title = request.getParameter("title");
        Book existBook = bookDAO.findByTitle(title);
        if (existBook != null) {
            String message = "could not create a new book because the title" + title + "is already exist";
            listBooks(message);
            return;
        }
        Book newBook = new Book();
        readBookFields(newBook);

        Book createdBook = bookDAO.create(newBook);
        if (createdBook.getBookId() > 0) {
            String message = "A new book has bee created successfully";
            listBooks(message);
        }
    }

    public void editBook() throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.get(bookId);
        request.setAttribute("book", book);
        List<Category> listCategory = categoryDAO.listAll();
        request.setAttribute("listCategory", listCategory);

        String editPage = "book_form.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
        requestDispatcher.forward(request, response);
    }

    public void updateBook() throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        Book existBook = bookDAO.get(bookId);
        Book bookByTitle = bookDAO.findByTitle(title);

        if (bookByTitle != null && !existBook.equals(bookByTitle)) {
            String message = "could not update book because the title" + title + "is already exist";
            listBooks(message);
            return;
        }
        readBookFields(existBook);
        bookDAO.update(existBook);

        String message = "The book has been updated successfully";
        listBooks(message);
    }

    public void deleteBook() throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("id"));
        bookDAO.delete(bookId);
        String message = "the book" + bookId + " has been deleted successfully";
        listBooks(message);
    }

    public void showBookNewForm() throws ServletException, IOException {
        List<Category> listCategory = categoryDAO.listAll();
        request.setAttribute("listCategory", listCategory);
        String newPage = "book_form.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
        requestDispatcher.forward(request, response);
    }

    public void readBookFields(Book book) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        String isbn = request.getParameter("isbn");
        float price = Float.parseFloat(request.getParameter("price"));
        DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD");
        Date publishDate = null;

        try {
            publishDate = dateFormat.parse(request.getParameter("publishDate"));
        } catch (ParseException ex) {
            throw new ServletException("Error parsing publish date(format is YYYY-MM-DD)");
        }

        book.setTitle(title);
        book.setAuthor(author);
        book.setDescription(description);
        book.setIsbn(isbn);
        book.setPublishDate(publishDate);
        Integer CategoryId = Integer.parseInt(request.getParameter("category"));
        Category category = categoryDAO.get(CategoryId);
        book.setCategory(category);
        book.setPrice(price);

        Part part = request.getPart("bookImage");

        if (part != null && part.getSize() > 0) {
            long size = part.getSize();
            byte[] imageBytes = new byte[(int) size];

            //reading the image data through an array
            InputStream inputStream = part.getInputStream();
            inputStream.read(imageBytes);
            inputStream.close();
            book.setImage(imageBytes);
        }

    }

    public void listBooksByCategory() throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        List<Book> listBooks = bookDAO.listByCategory(categoryId);
        Category category = categoryDAO.get(categoryId);

        request.setAttribute("listBooks", listBooks);
        request.setAttribute("category", category);

        String listPage = "frontend/books_list_by_category.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public void viewBookDetails() throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.get(bookId);

        request.setAttribute("book", book);

        String listPage = "frontend/book_detail.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public void search() throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Book> result = null;
        if (keyword.equals("")) {
            result = bookDAO.listAll();
        } else {
            result = bookDAO.search(keyword);
        }
        request.setAttribute("keyword", keyword);
        request.setAttribute("result", result);
        String resultPage = "frontend/search_result.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
        requestDispatcher.forward(request, response);
    }

}
