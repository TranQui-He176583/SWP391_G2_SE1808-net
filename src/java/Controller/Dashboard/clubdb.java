
package Controller.DashBoard;



import Model.Club;
import Model.ClubDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author pc
 */
@WebServlet(name="clubdb", urlPatterns={"/clubdb"})
public class clubdb extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
         String indexPage = request.getParameter("index");
   
    int index = 1; // Default to page 1
    if (indexPage != null) {
        index = Integer.parseInt(indexPage);
    }

    ClubDAO cdao = new ClubDAO();
    int count = cdao.getTotalClub();
    int maxPage = (count / 4) + (count % 4 != 0 ? 1 : 0);

    List<Club> listClub = cdao.pagingClub(index);
    request.setAttribute("listCLB", listClub);
    request.setAttribute("mPage", maxPage);
    request.setAttribute("tag", index);

    request.getRequestDispatcher("clubDboard.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String NameSearch =request.getParameter("search");
         ClubDAO bdao = new ClubDAO();
         List<Club> list= bdao.getSearchClubByName(NameSearch);
        
         request.setAttribute("listCLB", list);
         
         request.getRequestDispatcher("clubDboard.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
