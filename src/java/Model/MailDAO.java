/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class MailDAO extends MyDAO{
     public String addSent (Mail m ) {
     xSql = "insert into mail (id, name, subject, context, time) values (?, ?, ?, ?, ?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,m.getId());
      ps.setString( 2, m.getName());
      ps.setString( 3, m.getSubject());
      ps.setString(4,m.getContext());
      Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now());
      ps.setTimestamp(5, timestamp);
     
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("OK!");
  }
     
     
      public List<Mail> getAllSent() {
        List<Mail> t = new ArrayList<>();
        xSql = "select * from mail";
       try {
        ps = con.prepareStatement(xSql);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String name= rs.getString("name");  
        String subject = rs.getString("subject");
        String context= rs.getString("context");  
        LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
        
        t.add(new Mail(id,name,subject,context,time));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    
    public int getTotalSent(){
        xSql = "select count(*)from mail";     
         
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
    
    public List<Mail> pagingSent(int index){
        List<Mail> lst=new ArrayList<>();
        String xSql = "SELECT * FROM mail\n " +
            "ORDER BY id desc\n " +
            "LIMIT 10 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*10);
           rs = ps.executeQuery();
           
           while(rs.next()){
              int id = rs.getInt("id");  
              String name= rs.getString("name"); 
              String subject = rs.getString("subject");
              String context= rs.getString("context");  
              LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
        
        lst.add(new Mail(id,name,subject,context,time));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
    public int getNumberSent() {
        xSql = "select max(id) as id from mail";
       int number =3;
        try {
      ps = con.prepareStatement(xSql);   
      rs = ps.executeQuery();      
     
      if (rs.next()) {   
       number = rs.getInt("id");  
       return number;
                             }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
       
     } 
        return number;
    }
    
    public List<Mail> getSearchMail(String NameSearch ) {
        List<Mail> t = new ArrayList<>();
        xSql = "select * from mail\n "+"where name like ? or subject like ? or context like ?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+NameSearch+"%");
           ps.setString(2, "%"+NameSearch+"%");
           ps.setString(3, "%"+NameSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {

             int id = rs.getInt("id");  
              String name= rs.getString("name"); 
              String subject = rs.getString("subject");
              String context= rs.getString("context");  
              LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
        
              t.add(new Mail(id,name,subject,context,time));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    
    public Mail getMailSent(String id ) {
      
        xSql = "select * from mail\n "+"where id=?";
        Mail m = new Mail();
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, id);
           rs = ps.executeQuery();
           DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
           if (rs.next()) {
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setSubject(rs.getString("subject"));
                m.setContext(rs.getString("context"));
                m.setTime(LocalDateTime.parse(rs.getString("time"),formatter));
                
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }
//    public static void main(String[] args) {
//        MailDAO dao = new MailDAO();
//        List<Mail> list =dao.pagingSent(1);
//        for(Mail m: list){
//            System.out.println(m.id);
//        }
//    }
     
}
