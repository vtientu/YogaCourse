/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.ClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import module.Account;
import module.Classes;
import module.Course;
import module.Feedback;

/**
 *
 * @author admin
 */
public class ClassDetailsController extends HttpServlet {

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
            out.println("<title>Servlet ClassDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassDetailsController at " + request.getContextPath() + "</h1>");
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
            String cid_raw = request.getParameter("cid");
            if (cid_raw == null) {
                response.sendRedirect("home");
            } else {
                int cid = Integer.parseInt(cid_raw);
                ClassDAO cdao = new ClassDAO();
                Classes clas = cdao.getClassByID(cid);
                if (clas != null) {
                    ArrayList<Feedback> listFeedback = cdao.getFeedbackListByCid(clas.getCourse().getCourseID());
                    request.setAttribute("listFeed", listFeedback);
                    request.setAttribute("classModule", clas);
                    request.getRequestDispatcher("user/class-details.jsp").forward(request, response);
                } else {
                    response.sendRedirect("class");
                }
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Class Detail -> doGet: " + e);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if(a == null) {
            response.sendRedirect("home");
        } else {
            String cid_raw = request.getParameter("cid");
            String rate_raw = request.getParameter("rate");
            String description = request.getParameter("description");
            String classId_raw = request.getParameter("classId");
            int cid = Integer.parseInt(cid_raw);
            int rate = Integer.parseInt(rate_raw);
            int classId = Integer.parseInt(classId_raw);
            Course c = new Course();
            c.setCourseID(cid);
            Feedback fb = new Feedback(0, rate, description, a, c);
            ClassDAO cdao = new ClassDAO();
            cdao.addComment(fb);
            response.sendRedirect("class-details?cid=" + classId);
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
