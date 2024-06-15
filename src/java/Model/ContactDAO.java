package Model;

import Database.MyDAO;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactDAO extends MyDAO {

    public void saveContact(Contact contact) {
        String sql = "INSERT INTO contact (name, subject, details, email, phonenumber) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getSubject());
            ps.setString(3, contact.getDetails());
            ps.setString(4, contact.getEmail());
            ps.setString(5, contact.getPhonenumber());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
