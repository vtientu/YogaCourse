/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.CategoryDAO;
import dal.ClassDAO;
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
import module.Category;
import module.Classes;

/**
 *
 * @author admin
 */
public class ClassController extends HttpServlet {

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
            out.println("<title>Servlet ClassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassController at " + request.getContextPath() + "</h1>");
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
        String pageNo_raw = request.getParameter("pageNo");
        String cateID_raw = request.getParameter("cid");
        try {
            int numberOfPage = 6;
            int pageNo = 1;
            int cateID = 0;
            ClassDAO cdao = new ClassDAO();
            if (pageNo_raw != null) {
                pageNo = Integer.parseInt(pageNo_raw);
            }
            
            if(cateID_raw != null) {
                cateID = Integer.parseInt(cateID_raw);
            }
            
            int listSize = cdao.getCountClassList(cateID);
            int totalPage = (int) Math.floor(listSize / numberOfPage + 1);
            ArrayList<Classes> listClass = cdao.getClassList(cateID, pageNo, numberOfPage);
//                PrintWriter out = response.getWriter();
//                out.print(listUser.size());
            CategoryDAO cateDAO = new CategoryDAO();
            ArrayList<Category> listCate = cateDAO.getCategoryList();
            request.setAttribute("totalPages", totalPage);
            request.setAttribute("pageNo", pageNo);
            request.setAttribute("listCate", listCate);
            request.setAttribute("cid", cateID);
            request.setAttribute("listClass", listClass);
            request.setAttribute("page", "class");
            request.getRequestDispatcher("user/class.jsp").forward(request, response);
        } catch (IOException e) {
            System.out.println("Elective List -> " + e);
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
