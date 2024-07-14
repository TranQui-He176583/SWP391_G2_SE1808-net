/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;

/**
 *
 * @author pc
 */
public class StudentClubDAO extends MyDAO{
     public String add (student_club sc ) {
     xSql = "insert into student_club (account_ID, club_ID, role_ID, team_ID) values (?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,sc.getAccount_ID());
      ps.setInt(2, sc.getClub_ID());
      ps.setInt(3,sc.getRole_ID());
      ps.setInt(4,sc.getTeam_ID());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("OK!");
  }
     
     public boolean checkUserExist(String username) {
        xSql = "select *from account where fullname=? ";     
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, username );
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
//     public static void main(String[] args) {
//        StudentClubDAO dao = new StudentClubDAO();
//         System.out.println(dao.checkUserExist(" Quí"));
//    }
}
