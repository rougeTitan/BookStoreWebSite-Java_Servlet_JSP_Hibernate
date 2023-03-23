package com.bookstore.service;


import com.bookstore.dao.BookDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public class ReviewServices {

	private ReviewDAO reviewDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	
	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.reviewDAO = new ReviewDAO();
		this.request = request;
		this.response = response;
	}

	public void listAllReview(String message) throws ServletException, IOException {
		List<Review> listReviews = reviewDAO.listAll();
		request.setAttribute("listReviews", listReviews);
		if (message != null) {
			request.setAttribute("message", message);
		}
		String listPage = "review_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}
	
	public void listAllReview() throws ServletException, IOException {
		listAllReview(null);
	}

//
//	public void createUser() throws ServletException, IOException {
//		String email = request.getParameter("email");
//		String fullName = request.getParameter("fullname");
//		String password = request.getParameter("password");
//		Users existUser = userDAO.findByEmail(email);
//		if (existUser !=null) {
//			String message = "couldnt create user. A user with email " +email+ " already exists";
//			request.setAttribute("message", message);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("Message.jsp");
//			dispatcher.forward(request, response);
//		}
//		else
//		{
//			Users newUser = new Users(email, fullName, password);
//			userDAO.create(newUser);
//			listUser("New User Created Successfully");
//		}
//	}

	public void editReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDAO.get(reviewId);
		request.setAttribute("review", review);
		String editPage = "review_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateReview() throws ServletException, IOException {

		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");

		Review review = reviewDAO.get(reviewId);
		review.setHeadline(headline);
		review.setComment(comment);
		
		reviewDAO.update(review);
		String message = "review has been updated successfully";
		listAllReview(message);
		
//		Users userByEmail = userDAO.findByEmail(email);
//		if (userByEmail !=null && userByEmail.getUserId() != userById.getUserId()){
//			String message = "couldnt update the user";
//			request.setAttribute("message", message);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("Message.jsp");
//			dispatcher.forward(request, response);
//		}
//		else
//		{
//			Users newUser = new Users(email, fullName, password);
//			userDAO.create(newUser);
//			listUser("New User Created Successfully");
//		}
	
	}

	public void deleteReview() throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("id"));
		reviewDAO.delete(reviewId);
		String message = "The review has been deleted successfully.";
		listAllReview(message);
	}

	public void showReviewForm() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("book_id"));
		BookDAO bookDao = new BookDAO();
		Book book = bookDao.get(bookId);

		HttpSession session = request.getSession();
		session.setAttribute("book", book);

		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		Review existReview = reviewDAO.findByCustomerAndBook(customer.getCustomerId(), bookId);
		String targetPage = "frontend/review_form.jsp";

		if (existReview != null) {
			request.setAttribute("review", existReview);
			targetPage = "frontend/review_info.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(targetPage);
		dispatcher.forward(request, response);
	}

	public void submitReview() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Review newReview = new Review(); 
		newReview.setHeadline(headline);
		newReview.setComment(comment);
		newReview.setRating(rating);
		
		Book book = new Book();
		book.setBookId(bookId);
		newReview.setBook(book);
		
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		newReview.setCustomer(customer);
		
		reviewDAO.create(newReview);
		
		String messagePage = "frontend/review_done.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
		dispatcher.forward (request,response);
		
	}
	
//	public void login() throws ServletException, IOException {
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		boolean loginResult = userDAO.checkLogin(email, password);
//		if (loginResult) {
//			System.out.println("user is authenticated");
//			request.getSession().setAttribute("useremail", email);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
//			dispatcher.forward (request,response);
//		}else
//		{
//			String message = " login failed!";
//			request.setAttribute("message", message);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//			dispatcher.forward (request,response);
//		}
//	}

}
