/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Blog;
import Model.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author pc
 */
@WebServlet(name="blogTimeASC", urlPatterns={"/blogTimeASC"})
public class blogTimeASC extends HttpServlet {
   
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
         String indexPage = request.getParameter("index2");
   
    int index2 = 1; // Default to page 1
    if (indexPage != null) {
        index2 = Integer.parseInt(indexPage);
    }
    BlogDAO bdao = new BlogDAO();
    int count = bdao.getTotalBlog();
    int maxPage = (count / 4) + (count % 4 != 0 ? 1 : 0);
    List<Blog> BlogTime2 = bdao.getAllBlogByTime2(index2);
   
//    out.print(listBlog.get(0).getImage());
    request.setAttribute("listBL", BlogTime2);
    request.setAttribute("mPage2", maxPage);
    request.setAttribute("tag2", index2);

    request.getRequestDispatcher("BlogsDBoard2.jsp").forward(request, response);
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
    PrintWriter out = response.getWriter();
    String Search = request.getParameter("search");
    BlogDAO bdao = new BlogDAO();
    List<Blog> listByTitle = bdao.getSearchBlogByTitle(Search);
    List<Blog> listByClub = bdao.getSearchBlogByCLub(Search);

    // Combine the two lists
    List<Blog> combinedList = new ArrayList<>(listByTitle);
    combinedList.addAll(listByClub);

    // Remove duplicates
    Set<Blog> uniqueBlogs = new HashSet<>(combinedList);
    combinedList = new ArrayList<>(uniqueBlogs);

    request.setAttribute("listBL", combinedList);
    request.getRequestDispatcher("BlogsDBoard2.jsp").forward(request, response);
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
