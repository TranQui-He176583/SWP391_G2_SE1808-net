/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.sql.Date;
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
   public List<Event> get_Event_In_Club(int club_Id) {
        List<Event> eList = new ArrayList<>();
        xSql = "select * from event where club_id =?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setInt(1, club_Id);
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
   
   public List<Event> get_Event_Index(int i) {
        List<Event> eList = new ArrayList<>();
        xSql = "SELECT * FROM event ORDER BY id LIMIT 9 OFFSET ?;";
       try {
           i=(i-1)*9;
        ps = con.prepareStatement(xSql);
        ps.setInt(1, i);
        rs = ps.executeQuery();
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
       while(rs.next()) {
           Event e = new Event();
        e.setId( rs.getInt("id"));
        e.setName(rs.getString("name"));
        e.setAvatar(rs.getString("avatar"));
        e.setClub_id(rs.getInt("club_id"));
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
    
}
