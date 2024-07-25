package Controller;

import Model.Account;
import Model.Club;
import Model.ClubDAO;
import Util.MailHandler;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "add_member", urlPatterns = {"/add_member"})
public class add_member extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        ClubDAO cDAO = new ClubDAO();
        String clubIdStr = request.getParameter("clubId");
        int clubId = Integer.parseInt(clubIdStr);

        try {
            cDAO.insertMember(account.getId(), clubId);
            response.sendRedirect("ClubList");
            MailHandler mailHandler = new MailHandler();
            String mail = account.getEmail();
            String subject = "Thank you";
            String details = "Cảm ơn bạn đã quan tâm đến câu lạc bộ của chúng tôi.<br>Chúng tôi đã nhận được đơn đăng ký của bạn, chúng tôi sẽ phản hồi bạn sớm.<br>Chúc bạn có 1 ngày tốt đẹp!!!";
            mailHandler.SendMail(mail, subject, details);
        } catch (Exception e) {
            e.printStackTrace();
            pr.println("<html><body>");
            pr.println("<h3>Something went wrong. Please try again later.</h3>");
            pr.println("</body></html>");

        } finally {
            pr.close();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
