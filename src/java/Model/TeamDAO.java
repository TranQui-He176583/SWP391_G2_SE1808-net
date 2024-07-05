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
//     public static void main(String[] args) {
//        TeamDAO dao =new TeamDAO();
//        
//        
//            System.out.println(dao.EdiTeam(t));
//        
//    }
}
