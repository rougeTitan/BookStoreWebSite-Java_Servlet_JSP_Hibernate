package com.bookstore.controller.admin.category;


import com.bookstore.service.CategoryServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/admin/delete_category")
public class DeleteCategoryServlet extends HttpServlet {

    public DeleteCategoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryServices CategoryServices = new CategoryServices( request, response);
        CategoryServices.deleteCategory();
    }

}
