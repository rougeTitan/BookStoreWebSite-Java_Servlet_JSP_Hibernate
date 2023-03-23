package com.bookstore.controller.admin.order;


import com.bookstore.service.OrderServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/view_orders")
public class ViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewOrdersServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderServices orderServices = new OrderServices(request, response);
        orderServices.listOrderByCustomer();
    }

}
