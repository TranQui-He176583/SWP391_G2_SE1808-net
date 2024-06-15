/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Task;

import Model.Task.*;
import java.util.*;

/**
 *
 * @author quyka
 */
public class getTask {
   // List<Task> tList=  new ArrayList<>();
    public  List<Task> gettList ( int id ) {
      List<Integer> iList = new ArrayList<>();
      TaskDAO tDAO = new TaskDAO();
      iList = tDAO.getAccount(id);
      List<Task> tList = new ArrayList<>();
        for (int i=0;i<iList.size();i++) {
            Task t = new Task();
            t=tDAO.getTask(iList.get(i));
            tList.add(t);            
        }
        return tList;
    }
}
