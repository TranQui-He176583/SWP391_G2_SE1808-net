/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Event;


import Model.*;
import java.util.*;

/**
 *
 * @author quyka
 */
public class get_aList {
    
     public  List<Account> gettList ( int id ) {
      List<Integer> iList = new ArrayList<>();
      AccountDAO aDAO = new AccountDAO();
      ClubDAO cDAO = new ClubDAO();
      iList = cDAO.get_AccountId(id);
      List<Account> aList = new ArrayList<>();
        for (int i=0;i<iList.size();i++) {
           Account a = new Account();
            a=aDAO.getAccount(iList.get(i));
            aList.add(a);
        }
        return aList;
    }
   
}
