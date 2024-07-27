package Controller;

import Model.*;
import Util.MailHandler;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class add_club
 */
@WebServlet(name = "add_club", urlPatterns = {"/add_club"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class add_club extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet add_club</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_club at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add_club.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String name = request.getParameter("name");
        Part xAvatar = request.getPart("avatar");
        String xDetail = request.getParameter("detail");
        String category = request.getParameter("category");
        String specialCharPattern = "^[a-zA-Z\\p{L}\\s]+$";
        boolean checkValid = true;
        String urllink = "http://localhost:9999/SWP/clubdb";

        MailHandler mailHandler = new MailHandler();
        String recipientEmail = "swp391g2k17@gmail.com";

        try {
            if (name.equals("")) {
                request.setAttribute("invalidName", "Club name cannot be empty!");
                checkValid = false;
            } else if (name.length() > 35) {
                request.setAttribute("invalidName", "Club name cannot exceed 35 characters!");
                checkValid = false;
            } else if (!name.matches(specialCharPattern)) {
                request.setAttribute("invalidName", "Club name cannot contain special characters!");
                checkValid = false;
            }

            ClubDAO cDAO = new ClubDAO();
            List<Club> existingClubs = cDAO.getClubs();
            for (Club club : existingClubs) {
                if (club.getName().equalsIgnoreCase(name)) {
                    request.setAttribute("invalidName", "Club name already exists!");
                    checkValid = false;
                    break;
                }
            }

            if (xDetail.equals("")) {
                request.setAttribute("invalidDetail", "Club Detail cannot be empty!");
                checkValid = false;
            } else if (xDetail.length() > 500) {
                request.setAttribute("invalidDetail", "Club Detail cannot exceed 500 characters!");
                checkValid = false;
            }

            if (xAvatar == null || xAvatar.getSize() == 0) {
                request.setAttribute("invalidImage", "Club Avatar cannot be empty!");
                checkValid = false;
            } else {
                String fileName = xAvatar.getSubmittedFileName();
                request.setAttribute("avatar", fileName);
            }

            if (category.equals("")) {
                request.setAttribute("invalidCategory", "Category must be chosen");
                checkValid = false;
            }

            if (!checkValid) {
                request.setAttribute("name", name);
                request.setAttribute("detail", xDetail);
                request.getRequestDispatcher("add_club.jsp").forward(request, response);
            } else {
                String imageURL = saveUploadedFile(request);
                Club c = new Club(0, name, 0, imageURL, xDetail, category);
                HttpSession session = request.getSession();
                Account accountId = (Account) session.getAttribute("account");
                try {
                    cDAO.addClub(c);
                    c.setId(cDAO.getNumberClub());
                    cDAO.insertMn(accountId.getId(), c.getId());
                    mailHandler.SendMail(recipientEmail, "Have someone add a new club", "A new club: " + name + "<br>Click to active: " + urllink);
                    response.sendRedirect("ClubList");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "An error occurred while adding the club. Please try again.");
                    request.getRequestDispatcher("add_club.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while adding the club. Please try again.");
            request.getRequestDispatcher("add_club.jsp").forward(request, response);
        }
    }

    String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
        String uploadPath = "assets/img/anhclb/";
        Part part = request.getPart("avatar");
        String fileName = getUniqueFileName(part);
        String filePath = uploadPath + fileName;

        String applicationPath = request.getServletContext().getRealPath("");
        String absoluteFilePath = applicationPath + File.separator + filePath;

        part.write(absoluteFilePath);

        File uploadedFile = new File(absoluteFilePath);
        if (uploadedFile.exists()) {
            return filePath;
        } else {
            throw new IOException("File upload failed.");
        }
    }

    String getUniqueFileName(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        String fileExtension = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
        String newFileName = System.currentTimeMillis() + fileExtension;
        return newFileName;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
