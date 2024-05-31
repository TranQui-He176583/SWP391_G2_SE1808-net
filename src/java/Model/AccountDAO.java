/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;

/**
 *
 * @author quyka
 */
public class AccountDAO extends MyDAO {
     public String insert (Account x) {
     xSql = "insert into Account (id,fullname,password,roleid,email,status,gender) values (?,?,?,?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,x.getId());
      ps.setString(2, x.getFullname());
      ps.setString(3, x.getPassWord());
      ps.setInt(4,x.getRoleId());
      ps.setString(5,x.getEmail());
      ps.setInt(6,x.getStatus());
      ps.setInt(7,x.getGender());
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("Ok");
  }
     
     public int getNumberAccount() {
        xSql = "SELECT MAX(id) as id FROM Account ";
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
     
     
 public boolean checkLogin(String username, String password) {
        xSql = "select *from account where email=? and password=?";     
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, username );
      ps.setString(2, password );
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
 
  public boolean checkAccountExist(String username) {
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
  public boolean checkPhone(String phone,String email) {
        xSql = "select *from account where phone=? ";   
        String xEmail="";
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, phone );
     
      rs = ps.executeQuery();           
      if (rs.next()) {   
          xEmail=rs.getString("email");
          if (xEmail.equalsIgnoreCase(email)==false){
              return false;
          } 
                         
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return true;
    }

 
     public Account getAccount(String username, String password) {
        xSql = "select *from account where email=? and password=?"; 
        Account account = new Account();
      
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, username );
      ps.setString(2, password );
      rs = ps.executeQuery();           
      if (rs.next()) {         
       account.email = username;
        account.fullname= rs.getString("fullname");
        account.gender = rs.getInt("gender");
        account.id = rs.getInt ("id");
        account.passWord = password;
        account.phone = rs.getString("phone");
        account.roleId = rs.getInt("roleId");
        account.status = rs.getInt("status"); 
        account.image = rs.getString("image");
        return account;                   
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return account;
    }
     
     public Account getAccount(String username) {
        xSql = "select *from account where email=? "; 
        Account account = new Account();
      
        try {
      ps = con.prepareStatement(xSql);   
      ps.setString(1, username );
     
      rs = ps.executeQuery();           
      if (rs.next()) {         
       account.email = username;
        account.fullname= rs.getString("fullname");
        account.gender = rs.getInt("gender");
        account.id = rs.getInt ("id");
        account.passWord = rs.getString("password");
        account.phone = rs.getString("phone");
        account.roleId = rs.getInt("roleId");
        account.status = rs.getInt("status"); 
        account.image = rs.getString("image");
        return account;                   
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {      
     } 
        return account;
    }
     
  
     
     public void updatePassWord (String username, String newPassWord) {
     xSql = "UPDATE account SET password = ? WHERE email = ?"; 
     try {         
      ps = con.prepareStatement(xSql);
      ps.setString(1, newPassWord);
      ps.setString(2, username);
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        
     }
     
  }
       public void updateInformation (Account a) {
     xSql = "UPDATE account \n" +
        "SET fullname = ? ,\n" +        
        "  phone = ?,\n" +
        "  gender = ?,\n" +
        "   image = ?\n" +
        "WHERE email = ?"; 
     try {         
      ps = con.prepareStatement(xSql);
      ps.setString(1, a.fullname);
      ps.setString(2, a.phone);
      ps.setInt(3, a.gender);
      ps.setString(4, a.image);
      ps.setString(5, a.email);
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        
     }
     
  }
       public  boolean isValidEmail(String email) {
    if (!email.contains("@")) {
        return false;
    }
    int atIndex = email.lastIndexOf("@");
    if (atIndex == email.length() - 1) {
        return false;
    }
    int firstAtIndex = email.indexOf("@");
    return firstAtIndex == email.lastIndexOf("@");
    
}
  
  
}
