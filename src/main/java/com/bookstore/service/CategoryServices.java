package com.bookstore.service;


import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class CategoryServices {

	private CategoryDAO categoryDAO ;
	private HttpServletRequest request;
	private HttpServletResponse response;

	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		categoryDAO = new CategoryDAO();
		
	}
		
	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory",listCategory);
		if (message !=null) {
			request.setAttribute("message",listCategory);
		}		
		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	
	}
	
//	public void listCategory() throws ServletException, IOException {
//	listCategory (null);
//	}


	public void createCategory() throws ServletException, IOException {

		String Name = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(Name);

		if (existCategory != null) {
			String message = "Couldn't create Category. A Category with name " + Name + " already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			Category newCategory = new Category(Name);
			categoryDAO.create(newCategory);
			String message = "new Category Created Successfully";
			listCategory(message);
		}
	}

	public void editCategory() throws ServletException, IOException {
		Integer CategoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(CategoryId);
		request.setAttribute("category", category);
		String editPage = "category_form.jsp";

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateCategory() throws ServletException, IOException {

		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("name");

		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(categoryName);

		if (categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()) {
			String message = "Couldn't update the category."+" A category with name "+ categoryName + " already exist.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			String message = "category has been updated";
			listCategory(message);
		}
	}

	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		BookDAO bookDAO = new BookDAO();
		long numberOfBooks = bookDAO.countByCategory(categoryId);
		String message;
		if (numberOfBooks > 0) {
			message = "could not delete the category (ID: %d) because it contains some books";
			String.format(message, numberOfBooks);
		} else {
			categoryDAO.delete(categoryId);
			 message = "the Category " + categoryId + " has been deleted successfully";
		}
		listCategory(message);
	}

}
