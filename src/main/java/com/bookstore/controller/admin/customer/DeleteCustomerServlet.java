package com.bookstore.controller.admin.customer;


import com.bookstore.service.CustomerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/admin/delete_customer")
public class DeleteCustomerServlet extends HttpServlet {

    public DeleteCustomerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerServices CustomerServices = new CustomerServices(request, response);
        CustomerServices.deleteCustomer();
    }

}
