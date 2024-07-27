package Controller.Manager;

import Model.Account;
import Model.AccountDAO;
import Model.Blog;
import Model.BlogDAO;
import Model.Club;
import Model.ClubDAO;
import Model.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "manager_blogs", urlPatterns = {"/manager_blogs"})
public class manager_blogs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet manager_blogs</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manager_blogs at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    ClubDAO cDAO = new ClubDAO();
    Account a = (Account) session.getAttribute("account");
    BlogDAO bDAO = new BlogDAO();
    EventDAO eDAO = new EventDAO();
    String search = request.getParameter("s");
    String xClub_id = request.getParameter("club_id");
    int cPage = Integer.parseInt(request.getParameter("cPage"));
    AccountDAO aDAO = new AccountDAO();
    List<Blog> eList = new ArrayList<>();
    List<Blog> erList = new ArrayList<>();
    
    if (a == null) {
        request.setAttribute("complete", "Please Login!");
        request.getRequestDispatcher("Home").forward(request, response);
        return;
    } 

    List<Club> cList = cDAO.get_club_manager(a.getId(), "");
    if (search == null) {
        search = "";
    }
    if (xClub_id == null) {
        xClub_id = "0";
    }
    int club_id = Integer.parseInt(xClub_id);
    if (!aDAO.check_Manager(a.getId())) {
        request.setAttribute("complete", "You don't have role manager!");
        request.getRequestDispatcher("Home").forward(request, response);
        return;
    } 

    if (club_id != 0) {
        if (!eDAO.checkManager(a.getId(), club_id)) {
            request.setAttribute("complete", "You don't have role manager!");
            request.getRequestDispatcher("Home").forward(request, response);
            return;
        }
        eList = bDAO.getBlogsByClubId(club_id);
    } else {
        for (Club club : cList) {
            List<Blog> blogs = bDAO.getBlogsByClubId(club.getId());
            eList.addAll(blogs);
        }
    }

    for (Blog blog : eList) {
        Club club = cDAO.getClubById(blog.getClubID());
        if (club != null) {
            blog.setNameclub(club.getName());
        }
    }

    int nPage = eList.size() / 5;
    if (eList.size() % 5 != 0) {
        nPage++;
    }
    if (cPage * 5 > eList.size()) {
        if ((cPage - 1) * 5 > eList.size()) {
            erList = null;
        } else {
            erList = eList.subList((cPage - 1) * 5, eList.size());
        }
    } else {
        erList = eList.subList((cPage - 1) * 5, cPage * 5);
    }

    request.setAttribute("eList", erList);
    request.setAttribute("cList", cList);
    request.setAttribute("nPage", nPage);
    request.setAttribute("club_id", club_id);
    request.setAttribute("search", search);
    request.getRequestDispatcher("blogs_manager.jsp").forward(request, response);
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
