package com.bookstore.controller.admin.customer;


import com.bookstore.service.CustomerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/new_customer")
public class showCustomerNewFormServlet extends HttpServlet {

    public showCustomerNewFormServlet() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        CustomerServices customerServices = new CustomerServices(request,response);
        customerServices.newCustomer();
     }

}
