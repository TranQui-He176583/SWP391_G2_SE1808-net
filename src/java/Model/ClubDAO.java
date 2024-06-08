/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class ClubDAO extends MyDAO{
    public List<Club> getAllCLubByAccountID(String AccountID) {
        List<Club> t = new ArrayList<>();
                xSql = "select * from account join student_club join club\n" +
"        on account.id = student_club.accountID and student_club.clubID=club.id \n" +
"        where accountID= ?"; 
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, AccountID);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String name= rs.getString("name"); 
        int status= rs.getInt("status");  
        String avatar= rs.getString("email");  
        
        t.add(new Club(id, name, status, avatar));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    public static void main(String[] args) {
        ClubDAO dao=new ClubDAO();
        List<Club>list= dao.getAllCLubByAccountID("1");
        for(Club a: list){
            System.out.println(a);
        }
        
    }
}
