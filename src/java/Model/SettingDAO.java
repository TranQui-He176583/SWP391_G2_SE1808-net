/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class SettingDAO extends MyDAO{
     public void changeStatus(int Status,int IdSetting ) {
         xSql = "UPDATE setting \n" +
"        SET Status = ?\n" +
"        WHERE IdSetting = ?"; 
     try {       
      ps = con.prepareStatement(xSql);
      ps.setInt(1, Status);
      ps.setInt(2,IdSetting);
      
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
       
     }
     
 }
      public int getTotalSetting(){
        xSql = "select count(*)from setting";     
         
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
     
   public List<Setting> pagingSetting(int index){
        List<Setting> lst=new ArrayList<>();
        String xSql = "SELECT * FROM setting\n " +
            "ORDER BY IdSetting desc\n " +
            "LIMIT 5 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*5);
           rs = ps.executeQuery();
           
           while(rs.next()){
              int IdSetting = rs.getInt("IdSetting");  
              String Name= rs.getString("Name");  
              int IdType= rs.getInt("IdType");  
              int IdForm = rs.getInt("IdForm");
              int IdClub = rs.getInt("IdClub");
              int IdBlog = rs.getInt("IdBlog");
              int IdStudent = rs.getInt("IdStudent");
              int IdEvent = rs.getInt("IdEvent");
              int Status= rs.getInt("Status");  
              LocalDateTime DateCreate = rs.getTimestamp("DateCreate").toLocalDateTime();
              LocalDateTime DateModify = rs.getTimestamp("DateModify").toLocalDateTime();
              
        lst.add(new Setting(IdSetting, Name, IdType, IdForm, IdClub, IdBlog, IdStudent, IdEvent, Status, DateCreate, DateModify));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
   
    public List<Setting> getSearchSetting(String NameSearch ) {
        List<Setting> t = new ArrayList<>();
        xSql = "select * from setting\n "+"where name like ?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+NameSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {

            int IdSetting = rs.getInt("IdSetting");  
              String Name= rs.getString("Name");  
              int IdType= rs.getInt("IdType");  
              int IdForm = rs.getInt("IdForm");
              int IdClub = rs.getInt("IdClub");
              int IdBlog = rs.getInt("IdBlog");
              int IdStudent = rs.getInt("IdStudent");
              int IdEvent = rs.getInt("IdEvent");
              int Status= rs.getInt("Status");  
              LocalDateTime DateCreate = rs.getTimestamp("DateCreate").toLocalDateTime();
              LocalDateTime DateModify = rs.getTimestamp("DateModify").toLocalDateTime();
              
        t.add(new Setting(IdSetting, Name, IdType, IdForm, IdClub, IdBlog, IdStudent, IdEvent, Status, DateCreate, DateModify));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    
     public List<Setting> getAllSettingByStatus(String xStatus) {
        List<Setting> t = new ArrayList<>();
        xSql = "select * from setting where Status=?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1,xStatus);
        rs = ps.executeQuery();
       while(rs.next()) {
        int IdSetting = rs.getInt("IdSetting");  
              String Name= rs.getString("Name");  
              int IdType= rs.getInt("IdType");  
              int IdForm = rs.getInt("IdForm");
              int IdClub = rs.getInt("IdClub");
              int IdBlog = rs.getInt("IdBlog");
              int IdStudent = rs.getInt("IdStudent");
              int IdEvent = rs.getInt("IdEvent");
              int Status= rs.getInt("Status");  
              LocalDateTime DateCreate = rs.getTimestamp("DateCreate").toLocalDateTime();
              LocalDateTime DateModify = rs.getTimestamp("DateModify").toLocalDateTime();
              
        t.add(new Setting(IdSetting, Name, IdType, IdForm, IdClub, IdBlog, IdStudent, IdEvent, Status, DateCreate, DateModify));
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
   }
     
     public List<Setting> getAllSettingByType(String xIdType) {
        List<Setting> t = new ArrayList<>();
        xSql = "select * from setting where IdType=?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1,xIdType);
        rs = ps.executeQuery();
       while(rs.next()) {
        int IdSetting = rs.getInt("IdSetting");  
              String Name= rs.getString("Name");  
              int IdType= rs.getInt("IdType");  
              int IdForm = rs.getInt("IdForm");
              int IdClub = rs.getInt("IdClub");
              int IdBlog = rs.getInt("IdBlog");
              int IdStudent = rs.getInt("IdStudent");
              int IdEvent = rs.getInt("IdEvent");
              int Status= rs.getInt("Status");  
              LocalDateTime DateCreate = rs.getTimestamp("DateCreate").toLocalDateTime();
              LocalDateTime DateModify = rs.getTimestamp("DateModify").toLocalDateTime();
              
        t.add(new Setting(IdSetting, Name, IdType, IdForm, IdClub, IdBlog, IdStudent, IdEvent, Status, DateCreate, DateModify));
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
   }
//    public static void main(String[] args) {
//        SettingDAO dao = new SettingDAO();
//        List<Setting> list = dao.pagingSetting(1);
//        for(Setting s: list){
//            System.out.println(s.IdType);
//        }
//    }
}
