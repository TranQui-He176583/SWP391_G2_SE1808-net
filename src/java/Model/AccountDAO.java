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
     xSql = "insert into Account (id,fullname,password,roleid,email) values (?,?,?,?,?)"; 
     try {    
      ps = con.prepareStatement(xSql);
      ps.setInt(1,x.getId());
      ps.setString(2, x.getFullname());
      ps.setString(3, x.getPassWord());
      ps.setInt(4,x.getRoleId());
      ps.setString(5,x.getEmail());
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
     
     
 public boolean checkAccount(String username, String password) {
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
     
}
