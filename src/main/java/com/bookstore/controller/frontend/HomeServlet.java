package com.bookstore.controller.frontend;



import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("")
public class HomeServlet extends HttpServlet {

	public HomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CategoryDAO categoryDAO = new CategoryDAO();
		BookDAO bookDAO = new BookDAO();

		List<Category> listCategory = categoryDAO.listAll();
		List<Book> listNewBooks = bookDAO.listNewBooks();
		List<Book> listBestSellingBooks = bookDAO.listBestSellingBooks();
		List<Book> listMostFavouredBooks = bookDAO.listMostFavouredBooks();


		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listNewBooks", listNewBooks);
		request.setAttribute("listBestSellingBooks", listBestSellingBooks);
		request.setAttribute("listMostFavouredBooks", listMostFavouredBooks);
		String homePage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
	}

}
