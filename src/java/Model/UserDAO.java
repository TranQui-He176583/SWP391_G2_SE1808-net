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
        t.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image));
     
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
                rs.getString(9));
           }
        }
        catch(Exception e) {
        }
    return null;
    }
    public void delete(String uid ) {
     xSql = "delete from account where id=?";
     try {
        ps = con.prepareStatement(xSql);
       
        ps.setString(1, uid);
        ps.executeUpdate();
        ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
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
   
    public List<Account> pagingUser(int index, int XroleId ){
        List<Account> lst=new ArrayList<>();
        String xSql = "SELECT * FROM account where roleId=?\n " +
            "ORDER BY id desc\n " +
            "LIMIT 5 OFFSET ?";
         try {
           ps = con.prepareStatement(xSql);
           ps.setInt(1, XroleId);
           ps.setInt(2, (index-1)*5);
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
        lst.add(new Account(id, password, roleId, status, fullname, email, phone, gender, image));

      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(lst);
    }
    
    }
    
