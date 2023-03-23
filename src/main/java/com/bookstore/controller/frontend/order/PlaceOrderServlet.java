package com.bookstore.controller.frontend.order;//package main.java.com.bookstore.controller.frontend.order;


import com.bookstore.service.OrderServices;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/place_order")
public class PlaceOrderServlet extends HttpServlet {

    public PlaceOrderServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderServices orderServices = new OrderServices(request, response);
        try {
            orderServices.placeOrder();
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
    }

}
