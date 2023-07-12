/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.LessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import module.Account;
import org.apache.catalina.ha.ClusterSession;

/**
 *
 * @author admin
 */
public class AttendController extends HttpServlet {

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
            out.println("<title>Servlet AttendController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        LessionDAO ldao = new LessionDAO();
        if (a != null) {
            String lid_raw = request.getParameter("lid");
            String[] listAttend_raw = request.getParameterValues("attend");
            if (lid_raw != null) {
                if (listAttend_raw != null) {
                    int[] listAttend = new int[listAttend_raw.length];
                    for (int i = 0; i < listAttend_raw.length; i++) {
                        listAttend[i] = Integer.parseInt(listAttend_raw[i]);
                    }
                    ldao.updateAttend(Integer.parseInt(lid_raw), listAttend);
                } else {
                    ldao.updateAttend(Integer.parseInt(lid_raw), null);
                }
                session.setAttribute("message", "Update attend successful!");
                session.setAttribute("messageColor", "green");
            } else {
                session.setAttribute("message", "Update attend fail!");
                session.setAttribute("messageColor", "red");
            }
        }
        response.sendRedirect("class");
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
