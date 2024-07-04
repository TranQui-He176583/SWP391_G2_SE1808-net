/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Task;

import Model.Account;
import Model.AccountDAO;
import Model.Task.*;
import java.util.*;

/**
 *
 * @author quyka
 */
public class getTask {
   // List<Task> tList=  new ArrayList<>();
    public  List<Task> gettList ( int id,String search,int cPage ) {
      List<Integer> iList = new ArrayList<>();
      TaskDAO tDAO = new TaskDAO();
      iList = tDAO.getAccount(id);
      List<Task> tList = new ArrayList<>();
        for (int i=0;i<iList.size();i++) {
            Task t = new Task();
            t=tDAO.getTask(iList.get(i),search);
            if (t.getName()!=null) {
                tList.add(t);  
            }
                      
        }
        Collections.reverse(tList);
        List<Task> ttList = new ArrayList<>();
       if (cPage*10<=tList.size()) { 
        ttList = tList.subList((cPage-1)*10, cPage*10);
       } else {
           ttList = tList.subList((cPage-1)*10, tList.size());
       }
        return ttList;
    }
    
     public  int gett_nPage ( int id,String search ) {
      List<Integer> iList = new ArrayList<>();
      TaskDAO tDAO = new TaskDAO();
      iList = tDAO.getAccount(id);
      List<Task> tList = new ArrayList<>();
        for (int i=0;i<iList.size();i++) {
            Task t = new Task();
            t=tDAO.getTask(iList.get(i),search);
            tList.add(t);            
        }
        int nPage = tList.size();
        nPage = nPage/10;
        if (tList.size()%10!=0) {
            nPage++;
        }
        return nPage;
    }
     
     public  Map<String, Boolean> gettList ( int task_id ) {
      List<Integer> iList = new ArrayList<>();
      TaskDAO tDAO = new TaskDAO();
      iList = tDAO.get_userTask(task_id);
      AccountDAO aDAO = new AccountDAO();
       Map<String, Boolean> aMap = new HashMap<>(); 
      
        for (int i=0;i<iList.size();i++) {
            Account a = new Account();
           a = aDAO.getAccount(iList.get(i));
            aMap.put(a.getEmail(), true);
        }    
        return aMap;
    }
     
      public static void gettListt ( int task_id ) {
      List<Integer> iList = new ArrayList<>();
      TaskDAO tDAO = new TaskDAO();
      iList = tDAO.get_userTask(task_id);
      AccountDAO aDAO = new AccountDAO();
       Map<String, Boolean> aMap = new HashMap<>(); 
      
        for (int i=0;i<iList.size();i++) {
            Account a = new Account();
            System.out.println(iList.get(i));
           a = aDAO.getAccount(iList.get(i));
            System.out.println(a.getEmail());
            aMap.put(a.getEmail(), true);
            System.out.println(aMap.get(a.getEmail()));
        }    
     
    }
      public static void main(String[] args) {
          gettListt(21);
    }
     
}
