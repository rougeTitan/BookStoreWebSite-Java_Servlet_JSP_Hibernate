package com.bookstore.service;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServices {

	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Users user;
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;

	public UserServices(){
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
	}

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		userDAO = new UserDAO();
	}
//	public UserServices(HttpServletRequest request, HttpServletResponse response) {
//		this.request = request;
//		this.response = response;
//		userDAO = new UserDAO(entityManager);
//	}

//	public void listUser(String message) throws ServletException, IOException {
//		List<Users> listUsers = userDAO.listAll();
//		request.setAttribute("listUsers", listUsers);
//
//		if (message != null) {
//			request.setAttribute("Message", message);
//		}
//
//		String listPage = "user_list.jsp";
//		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
//		requestDispatcher.forward(request, response);
//
//	}

	public void listUser() throws ServletException, IOException {
		listUser(null);
	}

	public void listUser(String message) throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();
		request.setAttribute("listUsers", listUsers);

		if (message != null) {
			request.setAttribute("Message", message);
		}

		String listPage = "user_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}


	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		Users existUser = userDAO.findByEmail(email);
		if (existUser !=null) {
			String message = "couldn't create user. A user with email " +email+ " already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			Users newUser = new Users(email, password,fullName);
			userDAO.create(newUser);
			listUser("New User Created Successfully");
		}
//		Users newUser = new Users( email, fullName, password);
//		userDAO.create(newUser);
	}
	
	public void editUser() throws ServletException, IOException{
		Integer userId = Integer.parseInt(request.getParameter("id"));
		Users user = userDAO.get(userId);
		String editPage = "user_form.jsp";
		
		request.setAttribute("user", user);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage );
		requestDispatcher.forward(request, response);
	}

	public void updateUser() throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");

		Users userById = userDAO.get(userId);
		Users userByEmail = userDAO.findByEmail(email);

		if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
			String message = "couldn't update the user User with email " + email + " already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			Users newUser = new Users(email, fullName, password);
			userDAO.create(newUser);
			listUser("New User Created Successfully");
		}

//		Users user = new Users(userId,email, fullName, password);
//		userDAO.update(user);
//		String message = "User has been updated successfully";
//		listUser(message);
	}

	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		userDAO.delete(userId);
		String message = "User has been deleted successfully";
		listUser(message);
	}

	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean loginResult = userDAO.checkLogin(email, password);
		if (loginResult) {
			System.out.println("user is authenticated");
			request.getSession().setAttribute("useremail", email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);
		} else {
			String message = " login failed!";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
