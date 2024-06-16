/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Task;

import Database.MyDAO;
import Model.*;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
//import Model.*;

/**
 *
 * @author quyka
 */
public class TaskDAO extends MyDAO {
    
    public String insert (Task t) {
     xSql = "insert into task (name,startday,deadline,status,note,event_id,detail,club_id) values (?,?,?,?,?,?,?,?)"; 
     try {    
    ps = con.prepareStatement(xSql);      
    ps.setString(1,t.getName());
    ps.setObject(2, t.getStartTime());
    ps.setObject(3, t.getEndTime());
    ps.setBoolean(4, t.isStatus());
    ps.setString(5,t.getNote());
    ps.setInt (6,t.getEvent_id());
    ps.setString(7,t.getDetails());
    ps.setInt(8,t.getClub_id());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("Ok");
  }
    
   public List<Integer> getAccount(int id) {
        List<Integer> tList = new ArrayList<>();
        String sql = "SELECT * FROM task_account where account_id=?;";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id );
            rs = ps.executeQuery();
            while (rs.next()) {
                int task_id = rs.getInt("task_id");
                tList.add(task_id);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } 
        return tList;
    }
   
  
   public Task getTask(int id) {
       String xSql="select *from task where id= ?;";
       Task t = new Task();
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try {
      ps = con.prepareStatement(xSql);   
      ps.setInt(1, id );
      rs = ps.executeQuery();           
      if (rs.next()) {         
       t.setId(rs.getInt("id"));
       t.setName(rs.getString("name"));
       t.setStartTime(LocalDateTime.parse(rs.getString("startday"),formatter));
       t.setEndTime(LocalDateTime.parse(rs.getString("deadline"),formatter));
       t.setStatus(rs.getBoolean("status"));
       t.setNote(rs.getString("note"));
       t.setEvent_id(rs.getInt("event_id"));
       t.setDetails(rs.getString("detail"));
       t.setClub_id(rs.getInt("club_id"));
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return t;
   } 
  public boolean checkTask(int account_id, int task_id) {
        xSql = "select *from task_account where account_id=? and task_id=?";     
        try {
      ps = con.prepareStatement(xSql);   
      ps.setInt(1,account_id);
      ps.setInt(2,task_id);
      rs = ps.executeQuery();           
      if (rs.next()) {         
          return true;
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return false;
    }
}
