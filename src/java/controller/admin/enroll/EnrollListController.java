/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.enroll;

import dal.EnrollDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import module.Enroll;

/**
 *
 * @author admin
 */
public class EnrollListController extends HttpServlet {

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
            out.println("<title>Servlet EnrollListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnrollListController at " + request.getContextPath() + "</h1>");
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
        EnrollDAO edao = new EnrollDAO();
        String search = request.getParameter("search");
        String pageNo_raw = request.getParameter("pageNo");
        String active_raw = request.getParameter("status");
        try {
            int numberOfPage = 10;
            int pageNo = 1;
            String active = null;
            if (pageNo_raw != null) {
                pageNo = Integer.parseInt(pageNo_raw);
            }

            if (active_raw != null && active_raw.length() > 0) {
                active = active_raw;
            }
            int listSize = edao.getCountListEnroll(search, active);
            int totalPage = (int) Math.floor(listSize / numberOfPage + 1);

            ArrayList<Enroll> enrollList = edao.getEnrollList(search, pageNo, numberOfPage, active);
//                PrintWriter out = response.getWriter();
//                out.print(listUser.size());
            request.setAttribute("status", active);
            request.setAttribute("totalPages", totalPage);
            request.setAttribute("pageNo", pageNo);
            request.setAttribute("search", search);
            request.setAttribute("active", active);
            request.setAttribute("enrollList", enrollList);
            request.setAttribute("page", "enroll");
            request.getRequestDispatcher("enroll-list.jsp").forward(request, response);

        } catch (IOException e) {
            System.out.println("Course List -> " + e);
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
