/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.user;

import dal.CommonDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import module.Account;
import module.Role;

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
                        UserDAO udao = new UserDAO();
                        ArrayList<Role> roleList = udao.getRoleList();
                        switch (type) {
                            case "add":
                                request.setAttribute("roleList", roleList);
                                request.setAttribute("type", type);
                                request.getRequestDispatcher("user-detail.jsp").forward(request, response);
                                break;
                            case "edit":
                                String aid_raw = request.getParameter("aid");
                                if (aid_raw != null) {
                                    int aid = Integer.parseInt(aid_raw);
                                    CommonDAO cdao = new CommonDAO();
                                    Account acc = cdao.getAccountByAid(aid);
                                    request.setAttribute("roleList", roleList);
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
        try {
            String type = request.getParameter("type");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String rid_raw = request.getParameter("role");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            int rid = Integer.parseInt(rid_raw);

            HttpSession session = request.getSession();

            if (rid_raw == null || phone == null || email == null) {
                session.setAttribute("message", "Must fill in the fields!");
                session.setAttribute("messageColor", "red");
            }

            Account acc = new Account();
            acc.setFirstName(firstName);
            acc.setLastName(lastName);
            acc.setRole(new Role(rid, null));
            acc.setPhone(phone);
            acc.setEmail(email);

            UserDAO udao = new UserDAO();

            if (type.equals("edit")) {
                String aid_raw = request.getParameter("aid");
                int aid = Integer.parseInt(aid_raw);
                acc.setAid(aid);
                if (udao.updateAccount(acc)) {
                    session.setAttribute("message", "Update account success!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Update account fail!");
                    session.setAttribute("messageColor", "red");
                }
            } else if (type.equals("add")) {
                String password = request.getParameter("password");
                if (password == null) {
                    session.setAttribute("message", "Must fill in the fields!");
                    session.setAttribute("messageColor", "red");
                } else {
                    acc.setPassword(password);
                }
                if (udao.createAccount(acc)) {
                    session.setAttribute("message", "Create new account success!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Create new account fail!");
                    session.setAttribute("messageColor", "red");
                }
            }
            response.sendRedirect("user-manager");
        } catch (NumberFormatException e) {
            System.out.println("DoPost -> AdminUserDetail: " + e);
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
