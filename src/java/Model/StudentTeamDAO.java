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
public class StudentTeamDAO extends MyDAO{
     public String add (Student_team st ) {
     xSql = "insert into student_team (id, account_ID, role_ID, team_ID) values (?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,st.getId());
      ps.setInt(2, st.getAccount_ID());
      ps.setInt(3,st.getRole_ID());
      ps.setInt(4,st.getTeam_ID());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("OK!");
  }
    public String EditStudentTeam(Student_team st) {
        xSql = "UPDATE student_team \n" +
"                    SET account_ID = ?\n" +
"                      WHERE team_ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, st.getAccount_ID());
            ps.setInt(2, st.getTeam_ID());
            
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return e.getMessage();
        }
        return "ok";

    }
     public Student_team getStudentTeam(String TeamID) {
      
        xSql = "select * from student_team where team_ID=?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, TeamID);
           rs = ps.executeQuery();
          while(rs.next()) {

            return new Student_team(rs.getInt(1), 
                rs.getInt(2), 
                rs.getInt(3), 
                rs.getInt(4));
           }
        }
        catch(Exception e) {
            System.out.println(e);
        }
    return null;
    }
}
