package com.bookstore.controller.admin.user;

import com.bookstore.service.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/admin/update_user")
public class UpdateUserServlet extends HttpServlet {

    public UpdateUserServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServices userServices = new UserServices(request, response);
        userServices.updateUser();
    }

}
