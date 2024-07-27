/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Event;

import Model.Account;
import Model.AccountDAO;
import Model.Club;
import Model.ClubDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quyka
 */
public class get_aList {


     public List<Account> gettList(int club_id) {

        List<Account> aList = new ArrayList<>();
       List<Integer> iList = new ArrayList<>();
       ClubDAO cDAO = new ClubDAO();
       AccountDAO aDAO = new AccountDAO();
       iList = cDAO.get_AccountId(club_id);
       for (int i=0;i<iList.size();i++) {
           Account a = new Account();
           a = aDAO.getAccount(iList.get(i));
         if (a.getEmail()!=null) {
             aList.add(a);
         }  
           
       }
        return aList;
   }
    
 public List<Club> get(int account_id) {
        List<Club> cList = new ArrayList<>();
       List<Integer> iList = new ArrayList<>();
       ClubDAO cDAO = new ClubDAO();
       AccountDAO aDAO = new AccountDAO();
       iList = cDAO.get_ClubId(account_id);
       
       for (int i=0;i<iList.size();i++) {
           Club c = new Club();
           c = cDAO.getClubById(iList.get(i));
           cList.add(c);
       }
        return cList;
   }
 }
