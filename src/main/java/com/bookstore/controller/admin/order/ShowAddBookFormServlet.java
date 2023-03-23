package com.bookstore.controller.admin.order;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/admin/add_book_form")
public class ShowAddBookFormServlet extends HttpServlet {

    public ShowAddBookFormServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        List<Book> listBook = bookDAO.listAll();
        request.setAttribute("listBook", listBook);
        String addFormPage = "add_book_form.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(addFormPage);
        dispatcher.forward(request, response);
    }

}
