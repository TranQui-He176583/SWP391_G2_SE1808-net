package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model.Club;
import Model.ClubDAO;
import java.io.PrintWriter;

@WebServlet(name = "club_detail", urlPatterns = {"/club_detail"})
public class club_detail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                throw new ServletException("Club id parameter is missing");
            }
            int id = Integer.parseInt(idStr);
            
            
            ClubDAO clubDAO = new ClubDAO();
            Club club = clubDAO.getClubById(id);
            
            if (club == null) {
                throw new ServletException("Club not found for id: " + id);
            }
            
            request.setAttribute("club", club);

            request.getRequestDispatcher("club_detail.jsp").forward(request, response);
            
        } catch (NumberFormatException | ServletException e) {
            // Handle exceptions
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
