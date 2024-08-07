/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
import Model.*;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author quyka
 */
@WebServlet(name = "changeInformation", urlPatterns = {"/changeInformation"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class changeInformation extends HttpServlet {

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
            out.println("<title>Servlet changeInformation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeInformation at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String UPLOAD_DIR = "assets/img/avatar";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        Part xImage = request.getPart("image");
        AccountDAO aDAO = new AccountDAO();
        // pr.print(xImage.getSize());
        String xFullName = request.getParameter("fullname");
        String xEmail = request.getParameter("email");
        String xPhone = request.getParameter("phone");
        String xGender = request.getParameter("gender");
        boolean check =true;
        
        if (xFullName.equals("")) {
            check =false;
            request.setAttribute("wrongName", "Fullname can't null!");
       
        }
        if (xGender == null) {
            check =false;
           
            request.setAttribute("wrongGender", "Please choose gender!");
            
        }
        
        
        if (aDAO.checkPhone(xPhone, xEmail) == false && xPhone.equals("") == false) {
            check =false;
            request.setAttribute("wrongPhone", "This phone number is registered to another account!");            
        } 
        
        if (xPhone.equals("")==false) {
            if ( (xPhone.length()!= 10 && xPhone.length()!= 11) || xPhone.matches("^[0-9]+$") == false) {
                check =false;
                request.setAttribute("wrongPhone", "Phone Number only 10 or 11 digit!");
            }
        }
        
        if (check==false) {
            request.setAttribute("phone", xPhone);
           request.getRequestDispatcher("changeInformation.jsp").forward(request, response);
        } else {

            int gender = Integer.parseInt(xGender);
            HttpSession session = request.getSession();
            Account a = new Account();
            a = (Account) session.getAttribute("account");
            String imageURL = "";
            if (xImage.getSize() == 0) {
                imageURL = a.getImage();
            } else {
                imageURL = saveUploadedFile(request);
                if (a.getImage() != null) {
                    File file = new File("D:\\SWP\\Project\\SWP391_G2_SE1808-net\\Swp\\build\\web\\" + a.getImage());
                    file.delete();

                }

            }

            a.setFullname(xFullName);
            a.setGender(gender);
            a.setImage(imageURL);

            a.setPhone(xPhone);

            aDAO.updateInformation(a);
            request.setAttribute("completeChange", "Change Information Susscess!");
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        }
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
        String uploadPath = "assets/img/avatar/";

        Part part = request.getPart("image");
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
}
