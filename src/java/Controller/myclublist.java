package Controller;

import Model.Account;
import Model.Club;
import Model.ClubDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name="MyClubListServlet", urlPatterns={"/myclublist"})
public class myclublist extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyClubListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyClubListServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account currentUser = (Account) request.getSession().getAttribute("account");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ClubDAO clubDAO = new ClubDAO();
        List<Club> clubs = clubDAO.getClubListByUserId(currentUser.getId());
        request.setAttribute("clubs", clubs);
        request.getRequestDispatcher("MyCList.jsp").forward(request, response);
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
