package com.bookstore.controller.admin.category;


import com.bookstore.service.CategoryServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/admin/list_category")
public class ListCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ListCategoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryServices CategoryServices = new CategoryServices(request, response);
        CategoryServices.listCategory("test");
    }


}
