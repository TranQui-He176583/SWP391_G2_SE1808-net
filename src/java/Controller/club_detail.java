package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model.*;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

@WebServlet(name = "club_detail", urlPatterns = {"/club_detail"})
public class club_detail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                throw new ServletException("Club id parameter is missing");
            }
            String xid = request.getParameter("id");
            int id = Integer.parseInt(xid);
            ClubDAO cDAO = new ClubDAO();
            Club c = cDAO.getClubById(id);
            List<Club> lisclub = cDAO.getClubs();
            EventDAO eDAO = new EventDAO();
            BlogDAO bDAO = new BlogDAO();

            Account a = new Account();
            a = (Account) session.getAttribute("account");
            if (a != null) {
                if (eDAO.checkManager(a.getId(), id)) {
                    request.setAttribute("manager", true);
                }
            }

            List<Event> eList = new ArrayList<>();
            eList = eDAO.get_Event_List(id, "", 1);
            request.setAttribute("eList", eList);
            if (c == null) {
                throw new ServletException("Club not found for id: " + id);
            }

            List<Blog> blogs = new ArrayList<>();
            blogs = bDAO.getBlogsByClubId(id);

            request.setAttribute("blogs", blogs);
            if (c == null) {
                throw new ServletException("Club not found for id: " + id);
            }

            request.setAttribute("club", c);
            request.setAttribute("licu", lisclub);

            request.getRequestDispatcher("club_detail.jsp").forward(request, response);

        } catch (NumberFormatException | ServletException e) {
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
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
        return "Club Detail Servlet";
    }

}
