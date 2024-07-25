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
public class TeamDAO extends MyDAO{
    public String add (Team t ) {
     xSql = "insert into team (id,name,image,details,status,clubID) values (?,?,?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,t.getId());
      ps.setString( 2, t.getName());
      ps.setString(3,t.getImage());
      ps.setString(4,t.getDetails());
      ps.setInt(5, t.getStatus());
      ps.setInt(6,t.getClubID());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("OK!");
  }
     public List<Team> getAllCLubByClubID(String ClubID) {
        List<Team> t = new ArrayList<>();
        xSql = "select * from team \n"
              + "where clubID= ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, ClubID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                String details = rs.getString("details");
                int status =rs.getInt("status");
                int clubID =rs.getInt("clubID");
                t.add(new Team(id, name, image, details, status, clubID));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }
      public int getTotalTeamByClubID( String ClubID) {
        xSql = "select count(*)from team where clubID=?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, ClubID);
            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
      public Team getTeam(String id) {
      
        xSql = "select * from team where id=?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, id);
           rs = ps.executeQuery();
          while(rs.next()) {

            return new Team(rs.getInt(1), 
                rs.getString(2), 
                rs.getString(3), 
                rs.getString(4), 
                rs.getInt(5), 
                rs.getInt(6));
           }
        }
        catch(Exception e) {
 //           System.out.println(e);
        }
    return null;
    }
      
      public String EdiTeam(Team t) {
        xSql = "UPDATE team \n" +
"                    SET name = ?,\n" +
"                      image = ?,\n" +
"                      details = ?,\n" +
"                      status = ?\n" +
"                      WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getImage());
            ps.setString(3, t.getDetails());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getId());
            
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return e.getMessage();
        }
        return "ok";

    }
      
     public int getId_newTeam () {
       xSql = "SELECT *  FROM team ORDER BY id DESC LIMIT 1;";
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
     
     public boolean checkTeamExist(String xClubID, String TeamName) {
        xSql = "select *from team where clubID=? and name=?";     
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, xClubID );
      ps.setString(2, TeamName );
     
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
        public void changeStatus(int status,int id ) {
         xSql = "UPDATE team \n" +
"        SET status = ?\n" +
"        WHERE id = ? "; 
     try {       
      ps = con.prepareStatement(xSql);
      ps.setInt(1, status);
      ps.setInt(2,id);
    
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
       
     }
     
 }
      
//     public static void main(String[] args) {
//        TeamDAO dao =new TeamDAO();
//        
//        
//            System.out.println(dao.EdiTeam(t));
//        
//    }
}
