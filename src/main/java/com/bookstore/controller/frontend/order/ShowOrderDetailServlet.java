package com.bookstore.controller.frontend.order;


import com.bookstore.service.OrderServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/show_order_detail")
public class ShowOrderDetailServlet extends HttpServlet {
  
    public ShowOrderDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.showOrderDetailForCustomer();
	}
	
}
