package Controller;

import Model.Contact;
import Model.ContactDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "addContact", urlPatterns = {"/addContact"})
public class addContact extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public addContact() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        String details = request.getParameter("details");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");

        // Validate the form
        Map<String, String> errors = validateForm(name, subject, details, email, phonenumber);
        if (!errors.isEmpty()) {
            for (Map.Entry<String, String> error : errors.entrySet()) {
                request.setAttribute(error.getKey(), error.getValue());
            }
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Create new contact object if no errors
        Contact newContact = new Contact();
        newContact.setName(name);
        newContact.setSubject(subject);
        newContact.setDetails(details);
        newContact.setEmail(email);
        newContact.setPhonenumber(phonenumber);

        ContactDAO contactDAO = new ContactDAO();
        try {
            contactDAO.saveContact(newContact);
            request.setAttribute("send", "Done!!!");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Map<String, String> validateForm(String name, String subject, String details, String email, String phonenumber) {
        Map<String, String> errors = new HashMap<>();

        if (name == null || name.isEmpty()) {
            errors.put("errorName", "Name is required.");
        }
        if (subject == null || subject.isEmpty()) {
            errors.put("errorSubject", "Subject is required.");
        }
        if (details == null || details.isEmpty()) {
            errors.put("errorDetails", "Message details are required.");
        }
        if (email == null || email.isEmpty() || !email.matches("\\b[\\w.%-]+@[\\w.-]+\\.[A-Za-z]{2,4}\\b")) {
            errors.put("errorEmail", "Valid email is required.");
        }
        if (phonenumber == null || phonenumber.isEmpty() || !phonenumber.matches("\\d{10}")) {
            errors.put("errorPhonenumber", "Valid phone number is required.");
        }

        return errors;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
