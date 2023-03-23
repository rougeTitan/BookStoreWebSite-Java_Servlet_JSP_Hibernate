package com.bookstore.controller.frontend;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@WebFilter("/*")
public class CommonFilter implements Filter {
	
	private final CategoryDAO categoryDAO;
	

    public CommonFilter() {
    	categoryDAO = new CategoryDAO();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String path = httpServletRequest.getRequestURI().substring(httpServletRequest.getContextPath().length());
		
		if (!path.startsWith("/admin/")) {
			
	        List<Category> listCategory = categoryDAO.listAll();
			request.setAttribute("listCategory", listCategory);
			
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
