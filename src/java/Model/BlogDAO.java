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
public class BlogDAO extends MyDAO{
     public List<Blog> pagingBlog(int index){
        List<Blog> lst=new ArrayList<>();
        String xSql = "SELECT * FROM blog\n " +
            "ORDER BY id desc\n " +
            "LIMIT 6 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*6);
           rs = ps.executeQuery();
           
           while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID =rs.getInt("clubID");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String image = rs.getString("image");
                int status = rs.getInt("status");
           lst.add(new Blog(id, name, details, clubID, time, image, status));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
     public int getTotalBlog(){
        xSql = "select count(*)from blog";     
         
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
      public List<Blog> getSearchBlogByTitle(String TitleSearch ) {
        List<Blog> t = new ArrayList<>();
        xSql = "select * from blog\n "+"where name like ?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+TitleSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID =rs.getInt("clubID");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String image = rs.getString("image");
                int status = rs.getInt("status");
             t.add(new Blog(id, name, details, clubID, time, image, status));
     
      }
       rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
      
      public List<Blog> getSearchBlogByCLub(String ClubSearch ) {
        List<Blog> t = new ArrayList<>();
        xSql = "select * from blog join club on club.id =blog.clubID\n "+"where club.name like ?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+ClubSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID =rs.getInt("clubID");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String image = rs.getString("image");
                int status = rs.getInt("status");
             t.add(new Blog(id, name, details, clubID, time, image, status));
     
      }
       rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    public Blog getBlog(String id) {
    xSql = "select * from blog where id=?";
    try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, id);
        rs = ps.executeQuery();
        while (rs.next()) {
            return new Blog(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getObject(5, LocalDateTime.class),
                rs.getString(6),
                rs.getInt(7)
            );
        }
    } catch (Exception e) {
        // Handle exception
    }
    return null;
}     public void changeStatus(int status,int id ) {
         xSql = "UPDATE blog \n" +
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
     public String add (Blog b ) {
     xSql = "insert into account (id,name,details,time,clubID,image,Status) values (?,?,?,?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,b.getId());
      ps.setString( 2, b.getName());
      ps.setString(3,b.getDetails());
      ps.setObject(4, b.getTime());
      ps.setInt(5, b.getClubID());
      ps.setString(6,b.getImage());
      ps.setInt(7,b.getStatus());
     
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("OK!");
  }
      public List<Club> getCLubByClubID(String ClubID) {
        List<Club> t = new ArrayList<>();
                xSql = "select * from  blog join club\n" +
"        on blog.clubID=club.id \n" +
"        where clubID= ?"; 
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, ClubID);
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
        public int getNumberBlog() {
        xSql = "select max(id) as id from blog";
       int number =3;
        try {
      ps = con.prepareStatement(xSql);   
      rs = ps.executeQuery();      
     
      if (rs.next()) {   
       number = rs.getInt("id");  
       return number;
                             }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
       
     } 
        return number;
    }
       public List<Blog> getAllBlogByStatus(String xStatus) {
        List<Blog> t = new ArrayList<>();
        xSql = "select * from blog where Status=?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1,xStatus);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID =rs.getInt("clubID");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String image = rs.getString("image");
                int status = rs.getInt("status");
             t.add(new Blog(id, name, details, clubID, time, image, status));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
//       public static void main(String[] args) {
//        BlogDAO dao =new BlogDAO();
//        List<Blog> list =dao.getSearchBlogByCLub("Vovinam");
//        for(Blog a: list){
//            System.out.println(a);
//        }
//    }
}
