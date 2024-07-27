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
public class NotificationsDAO extends MyDAO{
        public List<Notifications> getAllNotifications() {
        List<Notifications> t = new ArrayList<>();
        xSql = "select * from notifications";
       try {
        ps = con.prepareStatement(xSql);
        rs = ps.executeQuery();
       while(rs.next()) {
        int NotificationID = rs.getInt("NotificationID");
            String Title = rs.getString("Title");
            String Content = rs.getString("Content");
            int RecipientID = rs.getInt("RecipientID");
            LocalDateTime SendDate = rs.getTimestamp("SendDate").toLocalDateTime();
            int Status = rs.getInt("Status");
            
            Notifications notif = new Notifications(NotificationID, Title, Content, RecipientID, SendDate, Status);
            t.add(notif);
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
       
        
      public int getTotalNotification(){
        xSql = "select count(*)from notifications";     
         
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
        
//        public static void main(String[] args) {
//        NotificationsDAO dao = new NotificationsDAO();
//        List<Notifications> list = dao .getAllNotifications();
//        for(Notifications a: list){
//            System.out.println(a.Content);
//        }
//        }
}
