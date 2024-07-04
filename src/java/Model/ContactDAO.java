package Model;

import Database.MyDAO;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
     public List<Contact> pagingContact(int index){
        List<Contact> lst=new ArrayList<>();
        String xSql = "SELECT * FROM contact\n " +
            "ORDER BY id\n " +
            "LIMIT 5 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*5);
           rs = ps.executeQuery();
           
           while(rs.next()){
               int id= rs.getInt("id");
               String email=rs.getString("email");
               String subject=rs.getString("subject");
               String details= rs.getString("details");
               String phonenumber=rs.getString("phonenumber");
               String name=rs.getString("name");
               int status=rs.getInt("status");
        lst.add(new Contact(id, email, subject, details, phonenumber, name, status));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
     
    public List<Contact> SortContactByNameASC(int index){
        List<Contact> lst=new ArrayList<>();
        String xSql = "SELECT * FROM contact\n " +
            "ORDER BY name\n " +
            "LIMIT 5 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*5);
           rs = ps.executeQuery();
           
           while(rs.next()){
               int id= rs.getInt("id");
               String email=rs.getString("email");
               String subject=rs.getString("subject");
               String details= rs.getString("details");
               String phonenumber=rs.getString("phonenumber");
               String name=rs.getString("name");
               int status=rs.getInt("status");
        lst.add(new Contact(id, email, subject, details, phonenumber, name, status));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
    
    public List<Contact> SortContactByNameDESC(int index){
        List<Contact> lst=new ArrayList<>();
        String xSql = "SELECT * FROM contact\n " +
            "ORDER BY name DESC\n " +
            "LIMIT 5 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*5);
           rs = ps.executeQuery();
           
           while(rs.next()){
               int id= rs.getInt("id");
               String email=rs.getString("email");
               String subject=rs.getString("subject");
               String details= rs.getString("details");
               String phonenumber=rs.getString("phonenumber");
               String name=rs.getString("name");
               int status=rs.getInt("status");
        lst.add(new Contact(id, email, subject, details, phonenumber, name, status));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
    public int getTotalContact(){
        xSql = "select count(*)from contact";     
         
        try {
           ps = con.prepareStatement(xSql);
          
           rs = ps.executeQuery();
          while(rs.next()) {

            return rs.getInt(1);
        }
        }
        catch(Exception e) {
        }
    return 0;
    }
    public int getTotalContactBySearch (String nameSearch){
        xSql = "select count(*) from contact\n "+"where name like ? or email like ? or subject like ?";
         
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+nameSearch+"%");
           ps.setString(2, "%"+nameSearch+"%");
           ps.setString(3, "%"+nameSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {

            return rs.getInt(1);
        }
        }
        catch(Exception e) {
        }
    return 0;
    }
     public Contact getContact(String id ) {
      
        xSql = "select * from contact\n "+"where id=?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, id);
           rs = ps.executeQuery();
          while(rs.next()) {
            return new Contact(rs.getInt(1), 
                rs.getString(2), 
                rs.getString(3),
                rs.getString(4),
                rs.getString(5), 
                rs.getString(6),   
                rs.getInt(7));
           }
        }
        catch(Exception e) {
        }
    return null;
    }
     public void changeStatus(int status,int id ) {
         xSql = "UPDATE contact \n" +
"        SET status = ?\n" +
"        WHERE id = ?"; 
     try {       
      ps = con.prepareStatement(xSql);
      ps.setInt(1, status);
      ps.setInt(2,id);
      
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
       
     }
     
 }
     public String EditContact(Contact c) {
        xSql = "UPDATE contact \n"
                + "        SET email =? ,\n"
                + "        subject = ?,\n"
                + "        details = ?,\n"
                + "        phonenumber =?,\n"
                + "        name = ?\n"
                + "        WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, c.getEmail());
            ps.setString(2, c.getSubject());
            ps.setString(3, c.getDetails());
            ps.setString(4, c.getPhonenumber());
            ps.setString(5, c.getName());
            ps.setInt(6, c.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return e.getMessage();
        }
        return "ok";

    }
     
     public List<Contact> getSearchContact(String NameSearch,int index ) {
        List<Contact> t = new ArrayList<>();
        xSql = "select * from contact\n "+"where name like ? or email like ? or subject like ?"+
                "ORDER BY id\n " +
                "LIMIT 5 OFFSET ?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+NameSearch+"%");
           ps.setString(2, "%"+NameSearch+"%");
           ps.setString(3, "%"+NameSearch+"%");
           ps.setInt(4, (index-1)*5);
           rs = ps.executeQuery();
          while(rs.next()) {

            int id= rs.getInt("id");
            String email=rs.getString("email");
            String subject=rs.getString("subject");
            String details= rs.getString("details");
            String phonenumber=rs.getString("phonenumber");
            String name=rs.getString("name");
            int status=rs.getInt("status");
            t.add(new Contact(id, email, subject, details, phonenumber, name, status));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
     public int getTotalContactByStatus (String xStatus){
        xSql = "select count(*) from contact\n "+"where status=?";
         
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, xStatus);
           rs = ps.executeQuery();
          while(rs.next()) {

            return rs.getInt(1);
        }
        }
        catch(Exception e) {
        }
    return 0;
    }
    public List<Contact> getAllContactByStatus(String xStatus, int index) {
        List<Contact> t = new ArrayList<>();
        xSql = "select * from contact where status=?"+
                "ORDER BY id\n " +
                "LIMIT 5 OFFSET ?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1,xStatus);
        ps.setInt(2, (index-1)*5);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id= rs.getInt("id");
            String email=rs.getString("email");
            String subject=rs.getString("subject");
            String details= rs.getString("details");
            String phonenumber=rs.getString("phonenumber");
            String name=rs.getString("name");
            int status=rs.getInt("status");
            t.add(new Contact(id, email, subject, details, phonenumber, name, status));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
//     public static void main(String[] args) {
//        ContactDAO dao = new ContactDAO();
//        List<Contact> list= dao.getSearchContact("q", 1);
//        for(Contact c: list){
//            System.out.println(c);
//        }
//        
//    }
    
}
