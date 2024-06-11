/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Duong
 */
public class ClubDAO extends MyDAO {

    public void addClub(Club club) {
        String sql = "INSERT INTO Club ( name, status, avatar) VALUES (?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, club.getName());
            ps.setInt(2, club.getStatus());
            ps.setString(3, club.getAvatar());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Club> getClubs() {
        List<Club> clubs = new ArrayList<>();
        String sql = "SELECT * FROM Club where status =1;";
        
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } 
        return clubs;
    }

    public void displayClub() {

    }
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
    
     public int getTotalClub(){
        xSql = "select count(*)from club";     
         
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
    public List<Club> getAllClub() {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club";
       try {
        ps = con.prepareStatement(xSql);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String name= rs.getString("name"); 
        int status= rs.getInt("status");  
        String avatar= rs.getString("avatar");  
        
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

}