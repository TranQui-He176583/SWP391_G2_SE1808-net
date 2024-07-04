/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author pc
 */
public class UserDAO extends MyDAO{
     public String add (Account u ) {
     xSql = "insert into account (id,password,roleid,status,fullname,email,phone,gender,image) values (?,?,?,?,?,?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,u.getId());
      ps.setString( 2, u.getPassWord());
      ps.setInt(3,u.getRoleId());
      ps.setInt(4,u.getStatus());
      ps.setString(5, u.getFullname());
      ps.setString(6,u.getEmail());
      ps.setString(7,u.getPhone());
      ps.setInt(8,u.getStatus());
      ps.setInt( 9,u.getGender());
      ps.setString(9,u.getImage());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("OK!");
  }
     
     public List<Account> getAllUsers() {
        List<Account> t = new ArrayList<>();
        xSql = "select * from account";
       try {
        ps = con.prepareStatement(xSql);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String password= rs.getString("password");  
        int roleId= rs.getInt("roleId");  
        int status= rs.getInt("status");  
        String fullname= rs.getString("fullname");  
        String email= rs.getString("email");  
        String phone= rs.getString("phone");  
        int gender= rs.getInt("gender");  
        String image= rs.getString("image");  
        String note= rs.getString("note");  
        t.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image, note));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
     

    public List<Account> getAllUsersByRoleID(String xRoleId) {
        List<Account> t = new ArrayList<>();
        xSql = "select * from account where roleId=?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, xRoleId);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String password= rs.getString("password");  
        int roleId= rs.getInt("roleId");  
        int status= rs.getInt("status");  
        String fullname= rs.getString("fullname");  
        String email= rs.getString("email");  
        String phone= rs.getString("phone");  
        int gender= rs.getInt("gender");  
        String image= rs.getString("image"); 
        String note= rs.getString("note");  
        t.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image,note));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
//    public String getAllUsersByRoleID(String xRoleId) {
//        List<Account> t = new ArrayList<>();
//        xSql = "select * from account where roleId=?";
//       try {
//        ps = con.prepareStatement(xSql);
//        ps.setString(1, xRoleId);
//        rs = ps.executeQuery();
//       while(rs.next()) {
//        int id = rs.getInt("id");  
//        String password= rs.getString("password");  
//        int roleId= rs.getInt("roleId");  
//        int status= rs.getInt("status");  
//        String fullname= rs.getString("fullname");  
//        String email= rs.getString("email");  
//        String phone= rs.getString("phone");  
//        int gender= rs.getInt("gender");  
//        String image= rs.getString("image");  
//        t.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image));
//     
//      }
//      rs.close();
//      ps.close();
//     }
//     catch(Exception e) {
//        return e.getMessage();
//     }
//    return("ok");
//    }
       public List<Account> getAllUsersByStatus(String xStatus) {
        List<Account> t = new ArrayList<>();
        xSql = "select * from account where Status=?";
       try {
        ps = con.prepareStatement(xSql);
        ps.setString(1,xStatus);
        rs = ps.executeQuery();
       while(rs.next()) {
        int id = rs.getInt("id");  
        String password= rs.getString("password");  
        int roleId= rs.getInt("roleId");  
        int status= rs.getInt("status");  
        String fullname= rs.getString("fullname");  
        String email= rs.getString("email");  
        String phone= rs.getString("phone");  
        int gender= rs.getInt("gender");  
        String image= rs.getString("image");  
        String note= rs.getString("note");  
        t.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image,note));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
    
    public Account getUser(String id ) {
      
        xSql = "select * from account\n "+"where id=?";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, id);
           rs = ps.executeQuery();
          while(rs.next()) {

            return new Account(rs.getInt(1), 
                rs.getString(2), 
                rs.getInt(3),
                rs.getInt(4),
                rs.getString(5), 
                rs.getString(6), 
                rs.getString(7), 
                rs.getInt(8), 
                rs.getString(9),
                rs.getString(10));
           }
        }
        catch(Exception e) {
        }
    return null;
    }
    public void changeStatus(int status,int id ) {
         xSql = "UPDATE account \n" +
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
    
    public int getNumberUser() {
        xSql = "select max(id) as id from account";
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
    public boolean checkUserExist(String username) {
        xSql = "select *from account where email=? ";     
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
    
    
    public int getTotalUser(){
        xSql = "select count(*)from account";     
         
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
    public int getTotalUserByStatus1(){
        xSql = "select count(*)from account where status = 1";     
         
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
    public int getTotalUserByStatus0(){
        xSql = "select count(*)from account where status = 0";     
         
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
    public List<Account> pagingUser(int index){
        List<Account> lst=new ArrayList<>();
        String xSql = "SELECT * FROM account\n " +
            "ORDER BY id desc\n " +
            "LIMIT 5 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, (index-1)*5);
           rs = ps.executeQuery();
           
           while(rs.next()){
              int id = rs.getInt("id");  
              String password= rs.getString("password");  
              int roleId= rs.getInt("roleId");  
              int status= rs.getInt("status");  
              String fullname= rs.getString("fullname");  
              String email= rs.getString("email");  
              String phone= rs.getString("phone");  
              int gender= rs.getInt("gender");  
              String image= rs.getString("image");  
              String note= rs.getString("note");  
              lst.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image,note));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
    public List<Account> getSearchUser(String NameSearch ) {
        List<Account> t = new ArrayList<>();
        xSql = "select * from account\n "+"where fullname like ? or email like ?\n"
               +"ORDER BY id desc\n " 
               +"LIMIT 5";
        try {
           ps = con.prepareStatement(xSql);
           ps.setString(1, "%"+NameSearch+"%");
           ps.setString(2, "%"+NameSearch+"%");
           rs = ps.executeQuery();
          while(rs.next()) {

            int id = rs.getInt("id");  
            String password= rs.getString("password");  
            int roleId= rs.getInt("roleId");  
            int status= rs.getInt("status");  
            String fullname= rs.getString("fullname");  
            String email= rs.getString("email");  
            String phone= rs.getString("phone");  
            int gender= rs.getInt("gender");  
            String image= rs.getString("image");  
            String note= rs.getString("note");  
            t.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image,note));
     
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
    }
 public String EditUser(int roleId,int status,String fullname,String phone,int gender, String note, int id) {
     xSql = "UPDATE account \n" +
"        SET roleId =? ,\n" +
"         Status = ?,\n" +    
"         fullname = ?,\n" +
"        phone = ?,\n" +
"        gender = ?,\n" +
"        note = ?\n" +
"        WHERE id = ?"; 
     try {         
      ps = con.prepareStatement(xSql);
      ps.setInt(1,roleId);
      ps.setInt(2,status);
      ps.setString(3, fullname);
      ps.setString(4, phone);
      ps.setInt(5, gender);
      ps.setString(6, note);
      ps.setInt(7,id);
      
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return "ok";
 }
 
  public Account getManagerByClubID(String XroleID,String XclubID){
        xSql = "select *from student_club join club join account \n" +
"on account.id = student_club.account_ID and club.id = student_club.club_ID\n" +
"where student_club.role_ID =? and club.id=?"; 
        Account account = new Account();
      
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, XroleID );
      ps.setString(2, XclubID );
      rs = ps.executeQuery();           
      if (rs.next()) {       
        account.id = rs.getInt ("id");
        account.passWord = rs.getString("password");
        account.roleId = rs.getInt("roleId");
        account.status = rs.getInt("status"); 
        account.fullname= rs.getString("fullname");
        account.email = rs.getString("email");
        account.phone = rs.getString("phone");
        account.gender = rs.getInt("gender");
        account.image = rs.getString("image");
        account.note = rs.getString("note");
        return account;                   
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return account;
    }
  
    public boolean checkNameExist(String username) {
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
//    public static void main(String[] args) {
//        UserDAO dao =new UserDAO();
//        Account a = dao.getManagerByClubID("2", "1");
//        System.out.println(a.getFullname());
//    }
    
   
    }
    

