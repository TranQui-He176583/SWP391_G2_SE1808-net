/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Event;

import Model.Account;
import Model.AccountDAO;
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
           aList.add(a);
       }
        return aList;
    }
    
}
