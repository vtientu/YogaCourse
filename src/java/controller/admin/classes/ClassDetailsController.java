/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.classes;

import dal.ClassDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import module.Account;
import module.Classes;
import module.Course;

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
            String action = request.getParameter("action");
            ClassDAO cdao = new ClassDAO();
            UserDAO udao = new UserDAO();
            if (action.equals("update") || action.equals("create")) {
                if (action.equals("update")) {
                    if (cid_raw == null) {
                        response.sendRedirect("class-manager");
                    } else {
                        int cid = Integer.parseInt(cid_raw);
                        Classes classModule = cdao.getClassByID(cid);
                        request.setAttribute("classModule", classModule);
                    }
                }
                ArrayList<Account> listTrainer = udao.getAccountListByRole(2);
                ArrayList<Course> courseList = cdao.getCourseList();
                request.setAttribute("courseList", courseList);
                request.setAttribute("trainerList", listTrainer);
                request.setAttribute("action", action);
                request.setAttribute("page", "class");
                request.getRequestDispatcher("class-detail.jsp").forward(request, response);
            } else {
                response.sendRedirect("class-manager");
            }
        } catch (IOException | NumberFormatException e) {
            System.out.println("ClassDetails -> doGet: " + e);
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
            ClassDAO cdao = new ClassDAO();
            HttpSession session = request.getSession();

            if (action.equals("delete")) {
                int cid = Integer.parseInt(request.getParameter("cid"));
                if (cdao.deleteClass(cid)) {
                    session.setAttribute("message", "Delete Class successful!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Delete Class fail!");
                    session.setAttribute("messageColor", "red");
                }
            } else {
                SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm");
                SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm:ss");
                String className = request.getParameter("className");
                int courseID = Integer.parseInt(request.getParameter("course"));
                int trainerID = Integer.parseInt(request.getParameter("trainer"));
                java.util.Date parsedTime = inputFormat.parse(request.getParameter("startTime"));
                String formattedTime = outputFormat.format(parsedTime);

                Time startTime = Time.valueOf(formattedTime);
                parsedTime = inputFormat.parse(request.getParameter("endTime"));
                formattedTime = outputFormat.format(parsedTime);
                Time endTime = Time.valueOf(formattedTime);
                int limitMember = Integer.parseInt(request.getParameter("limitMember"));
                Course course = new Course();
                course.setCourseID(courseID);
                Account trainer = new Account();
                trainer.setAid(trainerID);
                Classes cla = new Classes(0, className, startTime, endTime, null, limitMember, trainer, course, null, null);
                if (action.equals("update")) {
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    cla.setClassID(cid);
                    if (cdao.updateClass(cla)) {
                        session.setAttribute("message", "Update Class successful!");
                        session.setAttribute("messageColor", "green");
                    } else {
                        session.setAttribute("message", "Update Class fail!");
                        session.setAttribute("messageColor", "red");
                    }
                } else if (action.equals("create")) {
                    if (cdao.createClass(cla)) {
                        session.setAttribute("message", "Create Class successful!");
                        session.setAttribute("messageColor", "green");
                    } else {
                        session.setAttribute("message", "Create Class fail!");
                        session.setAttribute("messageColor", "red");
                    }
                }
            }
            response.sendRedirect("class-manager");
        } catch (NumberFormatException e) {
            System.out.println("LessionDetails -> doPost: " + e);
        } catch (ParseException ex) {
            Logger.getLogger(ClassDetailsController.class.getName()).log(Level.SEVERE, null, ex);
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
