package com.bookstore.controller.frontend.order;//package main.java.com.bookstore.controller.frontend.order;

import javax.servlet.annotation.WebServlet;

@WebServlet("/execute-payment")
public class ExecutePaymentServlet {

    public ExecutePaymentServlet() {
        super();
    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PaymentServices paymentServices = new PaymentServices(request,response);
//        try{
//           Payment payment = paymentServices.executePayment();
//           OrderServices orderServices = new OrderServices(request,response);
//            Integer orderId =  orderServices.placeOrderPaypal(payment);
//           //response.getWriter().println("Successful Payment. order ID:"+ orderId);
//
//            HttpSession session = request.getSession();
//            session.setAttribute("orderId",orderId);
//
//            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//            Transaction transaction = payment.getTransactions().get(0);
//
//            session.setAttribute("Payer", payerInfo);
//            session.setAttribute("transaction",transaction);
//
//            String receiptPage = "frontend/payment_receipt.jsp";
//            request.getRequestDispatcher(receiptPage).forward(request,response);
//
//        }catch (PayPalRESTException e){
//            e.printStackTrace();
//            throw new ServletException("Error in executing payment.");
//        }
//    }

}
