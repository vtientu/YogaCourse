package controller.admin.lession;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.LessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import module.Classes;
import module.Lession;

/**
 *
 * @author admin
 */
public class LessonDetailsController extends HttpServlet {

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
            out.println("<title>Servlet LessonDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonDetailsController at " + request.getContextPath() + "</h1>");
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
        try {
            String action = request.getParameter("action");
            LessionDAO ldao = new LessionDAO();
            HttpSession session = request.getSession();

            if (action.equals("delete")) {
                int lid = Integer.parseInt(request.getParameter("lid"));
                if (ldao.deleteLession(lid)) {
                    session.setAttribute("message", "Delete lession successful!");
                    session.setAttribute("messageColor", "green");
                } else {
                    session.setAttribute("message", "Delete lession fail!");
                    session.setAttribute("messageColor", "red");
                }
            } else {
                String lessionName = request.getParameter("name");
                String lessionDescription = request.getParameter("description");
                int cid = Integer.parseInt(request.getParameter("cid"));
                Classes cla = new Classes();
                cla.setClassID(cid);
                Lession lession = new Lession(0, lessionName, lessionDescription, null, cla);
                if (action.equals("update")) {
                    int lid = Integer.parseInt(request.getParameter("lid"));
                    lession.setLessionID(lid);
                    if (ldao.updateLession(lession)) {
                        session.setAttribute("message", "Update lession successful!");
                        session.setAttribute("messageColor", "green");
                    } else {
                        session.setAttribute("message", "Update lession fail!");
                        session.setAttribute("messageColor", "red");
                    }
                } else if (action.equals("create")) {
                    if (ldao.createLession(lession)) {
                        session.setAttribute("message", "Create lession successful!");
                        session.setAttribute("messageColor", "green");
                    } else {
                        session.setAttribute("message", "Create lession fail!");
                        session.setAttribute("messageColor", "red");
                    }
                }
            }
            response.sendRedirect("lession-manager");
        } catch (NumberFormatException e) {
            System.out.println("LessionDetails -> doPost: " + e);
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
