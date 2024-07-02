/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quyka
 */
public class EventDAO extends MyDAO {
      public String insert (Event x) {
     xSql = "insert into Event (name,club_id,time,location,details,avatar) values (?,?,?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);      
      ps.setString(1,x.getName());
      ps.setInt(2, x.getClub_id());
      ps.setObject(3, x.getDate());
      ps.setString(4, x.getLocation());
      ps.setString(5, x.getDetails());
      ps.setString(6,x.getAvatar());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("Ok");
  }
    
       public int get_Event_List_Npage(int club_Id,String search ) {
      
         int count =0;
     if (club_Id ==0 ){
        if (search.equals("")) {
             xSql = "select * from event  ";
             try{
                  ps = con.prepareStatement(xSql);
                 
             } catch(Exception e){
                 
             }
             
        }  else {
                 xSql = "SELECT * FROM event WHERE name LIKE ? ";
                 try{
                      ps = con.prepareStatement(xSql);
                 ps.setString(1,"%"+search+"%");    
               
             } catch(Exception e){
                
             }
        }
         
     }  else {
         if (search.equals("")) {
             xSql = "select * from event where club_id =? ";
             try{
                  ps = con.prepareStatement(xSql);
                 ps.setInt(1, club_Id);
                
             } catch(Exception e){
                 
             }
        } else {
             xSql = "SELECT * FROM event WHERE club_id = ? AND name LIKE ? ";
             try{
        ps = con.prepareStatement(xSql);
                 ps.setInt(1, club_Id);  
                 ps.setString(2,"%"+search+"%");
                
             } catch(Exception e){
                 
             }
         }
   }    
       try {       
        rs = ps.executeQuery();
        
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
       while(rs.next()) {
          count++;
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return count;
    }
    
     public int getId_newEvent () {
       xSql = "SELECT *  FROM event ORDER BY id DESC LIMIT 1;";
       try {
        ps = con.prepareStatement(xSql);
        rs = ps.executeQuery();
       
         
       if (rs.next()) {
          return (rs.getInt("id"));      
      }
      rs.close();
      ps.close();
     }
     catch(Exception    e) {
        e.printStackTrace();
     }
       return 1;
   }
    
    
   public List<Event> get_Event_List(int club_Id,String search ,int cPage) {
        List<Event> eList = new ArrayList<>();
          cPage = (cPage-1)*9;
     if (club_Id ==0 ){
        if (search.equals("")) {
             xSql = "select * from event where club_id >0 ORDER BY id DESC LIMIT 9 OFFSET ? ";
             try{
                  ps = con.prepareStatement(xSql);
                 ps.setInt(1, cPage);
             } catch(Exception e){
                 
             }
             
        }  else {
                 xSql = "SELECT * FROM event WHERE name LIKE ? and club_id>0 ORDER BY id DESC limit 9 offset ?;";
                 try{
                      ps = con.prepareStatement(xSql);
                 ps.setString(1,"%"+search+"%");    
                 ps.setInt(2, cPage);
             } catch(Exception e){
                
             }
        }
         
     }  else {
         if (search.equals("")) {
             xSql = "select * from event where club_id =? ORDER BY id DESC LIMIT 9 OFFSET ?";
             try{
                  ps = con.prepareStatement(xSql);
                 ps.setInt(1, club_Id);
                 ps.setInt(2, cPage);
             } catch(Exception e){
                 
             }
        } else {
             xSql = "SELECT * FROM event WHERE club_id = ? AND name LIKE ? ORDER BY id DESC LIMIT 9 OFFSET ?;";
             try{
        ps = con.prepareStatement(xSql);
                 ps.setInt(1, club_Id);  
                 ps.setString(2,"%"+search+"%");
                 ps.setInt(3, cPage);
             } catch(Exception e){
                 
             }
         }
   }    
       try {       
        rs = ps.executeQuery();
        
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
       while(rs.next()) {
           Event e = new Event();
        e.setId( rs.getInt("id"));
        e.setName(rs.getString("name"));
        e.setAvatar(rs.getString("avatar"));
        e.setClub_id(club_Id);
        e.setDate(LocalDateTime.parse(rs.getString("time"),formatter));
        e.setLocation(rs.getString("location"));
        e.setDetails(rs.getString("details"));
        eList.add(e);
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(eList);
    } 


    public Event getEvent(int event_Id) {
       
        xSql = "select * from event where id =?";
         Event event = new Event();
       try {
        ps = con.prepareStatement(xSql);
        ps.setInt(1, event_Id);
        rs = ps.executeQuery();
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
         
       if (rs.next()) {
          
        event.setId( rs.getInt("id"));
        event.setName(rs.getString("name"));
        event.setAvatar(rs.getString("avatar"));
        event.setClub_id(rs.getInt("club_id"));
        event.setDate(LocalDateTime.parse(rs.getString("time"),formatter));
        event.setLocation(rs.getString("location"));
        event.setDetails(rs.getString("details"));
        
      }
      rs.close();
      ps.close();
     }
     catch(Exception    e) {
        e.printStackTrace();
     }
    return  event;
    } 
    public int getTotalEvent(){
        xSql = "select count(*)from event";     
         
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
    
    public int getTotalEventByStatus0(){
        xSql = "select count(*)from event where status =0";     
         
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
    
    public int getTotalEventByStatus1(){
        xSql = "select count(*)from event where status =1";     
         
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
    
    public int getTotalEventByStatus2(){
        xSql = "select count(*)from event where status =2";     
         
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
    
    public List<Event> getAllEvent() {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event";
       try {
        ps = con.prepareStatement(xSql);
        rs = ps.executeQuery();
       while(rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int club_id = rs.getInt("club_id");
            LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
            String location = rs.getString("location");
            String details = rs.getString("details");
            String avatar = rs.getString("avatar");
            
            
            Event event = new Event(id, name, club_id, time, location, details,avatar);
            t.add(event);
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    public String updateEvent(Event e) {
       
        xSql = "UPDATE Event SET name = ?, avatar = ?, club_id=? ,time=?,location=?,details=? WHERE id = ?;";
       
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, e.getName());
        ps.setString(2,e.getAvatar());
        ps.setInt(3,e.getClub_id());
        ps.setObject(4, e.getDate());  
        ps.setString(5, e.getLocation());
        ps.setString(6, e.getDetails());
        ps.setInt(7,e.getId());
        ps.executeUpdate();
      rs.close();
      ps.close();
     }
     catch(Exception ex) {
        return ex.getMessage();
     }
    return  "ok";
    } 
    
     public boolean checkManager(int account_id, int club_id) {
        xSql = "select *from student_club where account_id=? and club_id=?";     
        try {
      ps = con.prepareStatement(xSql);   
      ps.setInt(1,account_id);
      ps.setInt(2,club_id);
      rs = ps.executeQuery();           
      if (rs.next()) {         
       int role = rs.getInt("role_id");
       if (role == 1) {
           return true;
       }
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return false;
    }
    public List<Event> getAllEventByClubID(String ClubID){
         List<Event> t = new ArrayList<>();
         xSql = "select * from event where club_id =? ORDER BY id DESC LIMIT 5";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, ClubID);
        rs = ps.executeQuery();
       while(rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int club_id = rs.getInt("club_id");
            LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
            String location = rs.getString("location");
            String details = rs.getString("details");
            String avatar = rs.getString("avatar");
            Event event = new Event(id, name, club_id, time, location, details,avatar);
            t.add(event);
     
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
//        EventDAO dao =new EventDAO();
//        List<Event> list= dao.getAllEventByClubID("1");
//        for(Event e:list){
//          System.out.println(e);
//    }
//}
}
