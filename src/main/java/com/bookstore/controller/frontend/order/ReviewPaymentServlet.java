package com.bookstore.controller.frontend.order;



import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/review_payment")
public class ReviewPaymentServlet extends HttpServlet {

    public ReviewPaymentServlet() {
        super();
    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
//        PaymentServices paymentServices = new PaymentServices(request,response);
//        paymentServices.reviewPayment();
//    }
}
