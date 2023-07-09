/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.ClassDAO;
import dal.EnrollDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import module.Account;
import module.Classes;
import module.Enroll;
import module.Payment;

/**
 *
 * @author admin
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String cid_raw = request.getParameter("cid");
            Account a = (Account) session.getAttribute("account");
            if (cid_raw != null && a != null) {
                int cid = Integer.parseInt(cid_raw);
                ClassDAO cdao = new ClassDAO();
                Classes clas = cdao.getClassByID(cid);
                if (clas != null) {
                    request.setAttribute("classOrder", clas);
                    request.getRequestDispatcher("user/checkout.jsp").forward(request, response);
                } else {
                    response.sendRedirect("class");
                }
            } else {
                if (a == null) {
                    response.sendRedirect("home?action=login");
                } else if (cid_raw == null) {
                    response.sendRedirect("class");
                }
            }
        } catch (ServletException | IOException e) {
            System.out.println("Checkout -> doGet: " + e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String cardNumber = request.getParameter("cardNumber");
            String expires = request.getParameter("expires");
            String cardName = request.getParameter("cardName");
            String cvc = request.getParameter("cvc");
            int cid = Integer.parseInt(request.getParameter("cid")) ;
            PrintWriter out = response.getWriter();
            out.print(cid);
            System.out.println(cid);
            Payment payment = new Payment();
                payment.setCardNumber(cardNumber);
                payment.setExpires(expires);
                payment.setCardName(cardName);
                payment.setCvc(cvc);
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            if(a == null) {
                response.sendRedirect("home?action=login");
            } else {
                ClassDAO cdao = new ClassDAO();
                double totalPrice = cdao.getClassByID(cid).getCourse().getPrice() - (cdao.getClassByID(cid).getCourse().getPrice() * cdao.getClassByID(cid).getCourse().getDiscount());
                Enroll enroll = new Enroll();
                    enroll.setAccount(a);
                    enroll.setPayment(payment);
                    enroll.setTotalPrice(totalPrice);
                    enroll.setClassOrder(cdao.getClassByID(cid));
                EnrollDAO edao = new EnrollDAO();
                if(edao.createEnroll(enroll)) {
                    if(edao.insertAttendInLession(a.getAid(), cid)) {
                        System.out.println("Successful!");
                    } else {
                        System.out.println("fail");
                    }
                    
                    session.setAttribute("message", "Order class succesful!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Order class failure!");
                    session.setAttribute("messageColor", "red");
                }
                response.sendRedirect("class");
            }
        } catch (IOException | NumberFormatException e) {
            System.out.println("Checkout -> doPost: " + e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
