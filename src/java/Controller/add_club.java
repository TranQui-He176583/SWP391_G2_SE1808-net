/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

/**
 *
 * @author Duong
 */
@WebServlet(name = "add_club", urlPatterns = {"/add_club"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class add_club extends HttpServlet {

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
        request.getRequestDispatcher("add_club.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String name = request.getParameter("name");
        Part xAvatar = request.getPart("avatar");
        String xDetail = request.getParameter("detail");
        String category = request.getParameter("category");
        String specialCharPattern = "^[a-zA-Z0-9 ]+$";
        boolean checkValid = true;

        if (name.equals("")) {
            request.setAttribute("invalidName", "Club name cannot be empty!");
            checkValid = false;
        } else if (name.length() > 500) {
            request.setAttribute("invalidName", "Club name cannot exceed 500 characters!");
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
        } else if (xDetail.length() > 20) {
            request.setAttribute("invalidDetail", "Club Detail cannot exceed 20 characters!");
            checkValid = false;
        }

        if (xAvatar == null || xAvatar.getSize() == 0) {
            request.setAttribute("invalidImage", "Club Avatar cannot be empty!");
            checkValid = false;
        } else {
            String fileName = xAvatar.getSubmittedFileName();
            request.setAttribute("avatar", fileName);
        }

        if(category.equals("")){
            request.setAttribute("invalidCategory", "Category must be choose");
            checkValid = false;
        }
        if (checkValid == false) {
            request.setAttribute("name", name);
            request.setAttribute("detail", xDetail);
            request.getRequestDispatcher("add_club.jsp").forward(request, response);
        } else {
            String imageURL = saveUploadedFile(request);
            Club c = new Club(0, name, 0, imageURL, xDetail, category);
            cDAO.addClub(c);
            response.sendRedirect("ClubList");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
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
            return "";
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
    }// </editor-fold>

}
