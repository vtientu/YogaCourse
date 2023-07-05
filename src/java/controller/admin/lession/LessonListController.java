/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.lession;

import dal.ClassDAO;
import dal.LessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import module.Classes;
import module.Lession;

/**
 *
 * @author admin
 */
public class LessonListController extends HttpServlet {

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
            out.println("<title>Servlet LessonListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonListController at " + request.getContextPath() + "</h1>");
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
        LessionDAO ldao = new LessionDAO();
        String search = request.getParameter("search");
        String pageNo_raw = request.getParameter("pageNo");
        String cid_raw = request.getParameter("cid");
        try {
            int numberOfPage = 10;
            int pageNo = 1;
            String cid = "1";
            if (pageNo_raw != null) {
                pageNo = Integer.parseInt(pageNo_raw);
            }

            if (cid_raw != null && cid_raw.length() > 0) {
                cid = cid_raw;
            }
            
            double listSize = ldao.getCountLessionListByCidAdmin(cid, search);
            int totalPage = (int) Math.ceil(listSize / numberOfPage );
            ClassDAO cdao = new ClassDAO();
            ArrayList<Classes> listClass = cdao.getClassListAll();
            ArrayList<Lession> listLesson = ldao.getLessionListByCidAdmin(cid, search, pageNo, numberOfPage);
//                PrintWriter out = response.getWriter();
//                out.print(listUser.size());
            request.setAttribute("cid", cid);
            request.setAttribute("totalPages", totalPage);
            request.setAttribute("pageNo", pageNo);
            request.setAttribute("search", search);
            request.setAttribute("lessonList", listLesson);
            request.setAttribute("classList", listClass);
            request.setAttribute("page", "lesson");
            request.getRequestDispatcher("lesson-list.jsp").forward(request, response);

        } catch (IOException e) {
            System.out.println("Lesson List -> " + e);
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
