/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Setting;
import Model.SettingDAO;
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
@WebServlet(name="settingList", urlPatterns={"/settingList"})
public class settingList extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String indexPage = request.getParameter("index3");
   
    int index3 = 1; // Default to page 1
    if (indexPage != null) {
        index3 = Integer.parseInt(indexPage);
    }

    SettingDAO countdao = new SettingDAO();
    int count = countdao.getTotalSetting();
    int maxPage = (count / 5) + (count % 5 != 0 ? 1 : 0);
    List<Setting> liss = countdao.pagingSetting(index3);
    pr.print(liss.get(1).getName());
    String wrongRegister = (String) request.getSession().getAttribute("wrongRegister");
    request.getSession().removeAttribute("wrongRegister");
    request.setAttribute("listSE", liss);
    request.setAttribute("mPage3", maxPage);
    request.setAttribute("tag3", index3);
    request.setAttribute("wrongRegister", wrongRegister);
    request.getRequestDispatcher("SettingDBoard.jsp").forward(request, response);
 
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
         SettingDAO sdao = new SettingDAO();
         List<Setting> lis= sdao.getSearchSetting(NameSearch);
         request.setAttribute("listSE", lis);
         request.getRequestDispatcher("setting.jsp").forward(request, response);
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
