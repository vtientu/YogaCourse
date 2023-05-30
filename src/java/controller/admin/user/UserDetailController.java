/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.user;

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
public class UserDetailController extends HttpServlet {

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
            out.println("<title>Servlet UserDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetailController at " + request.getContextPath() + "</h1>");
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
            String type = request.getParameter("type");
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            if (a == null) {
                response.sendRedirect("../home?action=login");
            } else {
                if (a.getRole().getRid() != 4) {
                    response.sendRedirect("../home");
                } else {
                    if (type == null) {
                        response.sendRedirect("user-manager");
                    } else {
                        switch (type) {
                            case "add":
                                request.setAttribute("type", type);
                                request.getRequestDispatcher("user-detail.jsp").forward(request, response);
                                break;
                            case "edit":
                                UserDAO udao = new UserDAO();
                                String aid_raw = request.getParameter("aid");
                                if (aid_raw != null) {
                                    int aid = Integer.parseInt(aid_raw);
                                    Account acc = udao.getAccountByAid(aid);
                                    request.setAttribute("user", acc);
                                    request.setAttribute("type", type);
                                    request.getRequestDispatcher("user-detail.jsp").forward(request, response);
                                } else {
                                    response.sendRedirect("user-manager");
                                }
                                break;
                            default:
                                response.sendRedirect("user-manager");
                                break;
                        }
                    }
                }
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("doGet -> UserDetail " + e);
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
        processRequest(request, response);
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
