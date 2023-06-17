/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.Common;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import module.Account;

/**
 *
 * @author admin
 */
@MultipartConfig
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String action = request.getParameter("action");
        if (acc == null || action == null) {
            response.sendRedirect("home");
        } else if (action.equals("profile") || action.equals("changepassword")) {
            request.setAttribute("action", action);
            request.getRequestDispatcher("user/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
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
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            UserDAO udao = new UserDAO();
            if (a != null) {
                if (action.equals("profile")) {
                    a.setFirstName(request.getParameter("firstName"));
                    a.setLastName(request.getParameter("lastName"));
                    a.setGender(Integer.parseInt(request.getParameter("gender")));
                    a.setPhone(request.getParameter("phone"));
                    a.setAddress(request.getParameter("address"));
                    if (udao.updateProfile(a)) {
                        request.setAttribute("messageProfile", "Update information successful!");
                    } else {
                        request.setAttribute("messageProfile", "Update information fail!");
                    }
                } else if (action.equals("changepassword")) {
                    String cpassword = request.getParameter("cpassword");
                    Common c = new Common();
                    if (!c.convertPassToMD5(cpassword).equals(a.getPassword())) {
                        request.setAttribute("messagePassword", "Current password incorrect!");
                    } else {
                        String password = request.getParameter("npassword");
                        if (udao.changePassword(a.getAid(), password)) {
                            request.setAttribute("messagePassword", "Change password successful!");
                        } else {
                            request.setAttribute("messagePassword", "Change password fail!");
                        }
                    }
                } else if (action.equals("changeavatar")) {
                    Part filePart = request.getPart("avatar");
                    String fileName = filePart.getSubmittedFileName();
                    String realPart = request.getServletContext().getRealPath("/user/assets/img");
                    if (!Files.exists(Paths.get(realPart))) {
                        Files.createDirectories(Paths.get(realPart));
                    }
                    filePart.write(realPart + "/" + fileName);
                    if (udao.changeAvatar(a.getAid(),  "user/assets/img/" + fileName)) {
                        a.setAvatar("user/assets/img/" + fileName);
                        request.setAttribute("messageProfile", "Change Avatar successful!");
                    } else {
                        request.setAttribute("messageProfile", "Change Avatar fail!");
                    }
                    action = "profile";
                }
                request.setAttribute("action", action);
                request.getRequestDispatcher("user/profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("home?action=login");
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Profile Controller -> do Post" + e);
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
