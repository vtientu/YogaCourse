/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.course;

import dal.CourseDAO;
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
import module.Course;

/**
 *
 * @author admin
 */
public class CourseDetailsController extends HttpServlet {

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
            out.println("<title>Servlet CourseDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseDetailsController at " + request.getContextPath() + "</h1>");
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
            Account a = (Account) session.getAttribute("account");
            String cid_raw = request.getParameter("cid");
            String action = request.getParameter("action");
            if (a == null || a.getRole().getRid() < 3 || action == null) {
                response.sendRedirect("../home");
            } else {
                CourseDAO cdao = new CourseDAO();
                if (action.equals("update") || action.equals("create")) {
                    if (action.equals("update")) {
                        if (cid_raw == null) {
                            response.sendRedirect("course-manager");
                        } else {
                            int cid = Integer.parseInt(cid_raw);
                            Course course = cdao.getCourseById(cid);
                            request.setAttribute("courseModule", course);
                        }
                    }
                    ArrayList<Category> categoryList = cdao.getCategoryList();
                    request.setAttribute("categoryList", categoryList);
                    request.setAttribute("action", action);
                    request.setAttribute("page", "course");
                    request.getRequestDispatcher("course-detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("course-manager");
                }
            }
        } catch (IOException | NumberFormatException e) {
            System.out.println("CourseDetails -> doGet: " + e);
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
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            String action = request.getParameter("action");
            String courseName = request.getParameter("courseName");
            int categoryID = Integer.parseInt(request.getParameter("category"));
            int totalDay = Integer.parseInt(request.getParameter("totalDay"));
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            String description = request.getParameter("description");
            Course course = new Course(0, courseName, price, discount, description, totalDay, null, true, new Category(categoryID, null, true), a);
            CourseDAO cdao = new CourseDAO();
            if (action.equals("create")) {
                if (cdao.createCourse(course)) {
                    session.setAttribute("message", "Create new course successful!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Create new course fail!");
                    session.setAttribute("messageColor", "red");
                }
            } else if (action.equals("update")) {
                int cid = Integer.parseInt(request.getParameter("cid"));
                course.setCourseID(cid);
                if (cdao.updateCourse(course)) {
                    session.setAttribute("message", "Update course successful!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Update course fail!");
                    session.setAttribute("messageColor", "red");
                }
            }
            response.sendRedirect("course-manager");
        } catch (IOException | NumberFormatException e) {
            System.out.println("courseDetails -> " + e);
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
