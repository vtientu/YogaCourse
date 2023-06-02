/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import module.Account;

/**
 *
 * @author admin
 */
public class HomeController extends HttpServlet {

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
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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
            String action = "default";

            if (request.getParameter("action") != null) {
                action = request.getParameter("action");
            }

            switch (action) {
                case "login":
                    request.setAttribute("action", action);
                    request.getRequestDispatcher("user/login.jsp").forward(request, response);
                    break;
                case "register":
                    request.setAttribute("action", action);
                    request.getRequestDispatcher("user/login.jsp").forward(request, response);
                    break;
                case "logout":
                    HttpSession session = request.getSession();
                    session.removeAttribute("account");
                    request.setAttribute("page", "home");
                    response.sendRedirect("home");
                    break;
                default:
                    request.setAttribute("page", "home");
                    request.getRequestDispatcher("user/home.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            System.out.println("doGet -> home:" + e);
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
        String action = request.getParameter("submit");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Account a = udao.loginAccount(email, password);
        if (a != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            response.sendRedirect("home");
        } else {
            request.setAttribute("messageLogin", "Email or password incorrect!");
            request.setAttribute("action", "login");
            request.getRequestDispatcher("user/login.jsp").forward(request, response);
        }
    }

    public void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        Account a = new Account();
        a.setFirstName(firstName);
        a.setLastName(lastName);
        a.setEmail(email);
        a.setPhone(phone);
        a.setPassword(password);
        UserDAO udao = new UserDAO();

        if (udao.checkEmailExists(email)) {
            request.setAttribute("messageLogin", "Email was registered!");
            request.setAttribute("action", "login");
            request.getRequestDispatcher("user/login.jsp").forward(request, response);
        } else {
            if (udao.registerAccount(a)) {
                request.setAttribute("messageLogin", "Register successful!");
                request.setAttribute("action", "login");
                request.getRequestDispatcher("user/login.jsp").forward(request, response);
            } else {
                request.setAttribute("messageRegister", "Register fail!");
                request.setAttribute("action", "register");
                request.getRequestDispatcher("user/login.jsp").forward(request, response);
            }
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
