/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.security.MessageDigest;
import java.util.*;
import org.apache.tomcat.util.codec.binary.Base64;
public class encodePassword {
    
    
    public String toSHA1(String str) {
        str = str+"ayhlj'jsdjkdk;js;;";
        String rs=null;      
        try {
            byte[] dataBytes = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            rs = Base64.encodeBase64String(md.digest(dataBytes));
            
            
        } catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
}
