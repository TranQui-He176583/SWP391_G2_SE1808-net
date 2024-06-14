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
     public Club getClub_Id(int id) {
        
        String sql = "SELECT * FROM Club where status =1 and id=?;";
        Club club = new Club();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } 
        return club;
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
        String detail=rs.getString("detail");
        t.add(new Club(id, name, status, avatar,detail));
     
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
        String detail=rs.getString("detail");
        t.add(new Club(id, name, status, avatar,detail));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    public List<Club> getClubByClubID(String bid) {
        List<Club> t = new ArrayList<>();
                xSql = "select * from blog join club\n" +
"        on club.id = blog.clubID \n" +
"        where blog.id= ?"; 
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, bid);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String name= rs.getString("name"); 
        int status= rs.getInt("status");  
        String avatar= rs.getString("avatar");  
        String detail=rs.getString("detail");
        t.add(new Club(id, name, status, avatar,detail));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    public List<Club> pagingClub(int index){
        List<Club> lst=new ArrayList<>();
        String xSql = "SELECT * FROM club\n " +
            "ORDER BY id desc\n " +
            "LIMIT 4 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*4);
           rs = ps.executeQuery();
           
           while(rs.next()){
                int id = rs.getInt("id");  
        String name= rs.getString("name"); 
        int status= rs.getInt("status");  
        String avatar= rs.getString("avatar");  
        String detail=rs.getString("detail");
        
        lst.add(new Club(id, name, status, avatar,detail));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
     public List<Club> getSearchClubByName(String NameSearch ) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club\n "+"where name like ?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+NameSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {
                int id = rs.getInt("id");  
        String name= rs.getString("name"); 
        int status= rs.getInt("status");  
        String avatar= rs.getString("avatar");  
        String detail=rs.getString("detail");
        
        t.add(new Club(id, name, status, avatar,detail));

     
      }
       rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
     public void changeStatus(int status,int id ) {
         xSql = "UPDATE club \n" +
"        SET Status = ?\n" +
"        WHERE id = ?"; 
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
      public List<Club> getAllClubByStatus(String xStatus) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club where Status=?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1,xStatus);
        rs = ps.executeQuery();
       while(rs.next()) {
         int id = rs.getInt("id");  
        String name= rs.getString("name"); 
        int status= rs.getInt("status");  
        String avatar= rs.getString("avatar");  
        String detail =rs.getString("detail");
        
        t.add(new Club(id, name, status, avatar,detail));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
      }
      
      public Club getClub(String id ) {
      
        xSql = "select * from club\n "+"where id=?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, id);
           rs = ps.executeQuery();
          while(rs.next()) {

            return new Club(rs.getInt(1), 
                rs.getString(2), 
                rs.getInt(3),
                rs.getString(4),
                rs.getString(5));
           }
        }
        catch(Exception e) {
        }
    return null;
    }
      
     public void EditClub(Club c) {
     xSql = "UPDATE club \n" +
"        SET name =? ,\n" +
"        status = ?,\n" +    
"        avatar = ?,\n" +
"        detail = ?\n" +
"        WHERE id = ?"; 
    try {         
      ps = con.prepareStatement(xSql);
      ps.setString(1, c.name);
      ps.setInt(2, c.status);
      ps.setString(3, c.avatar);
      ps.setString(4, c.detail);
      ps.setInt(5, c.id);
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        
     }
     
  }
      

//    public static void main(String[] args) {
//        ClubDAO dao =new ClubDAO();
//        List<Club> lits =dao.pagingClub(2);
//        for(Club c:  lits){
//        System.out.println(c);
//    }
//    }

}