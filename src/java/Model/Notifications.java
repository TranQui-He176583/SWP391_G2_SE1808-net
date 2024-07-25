/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDateTime;

/**
 *
 * @author pc
 */
public class Notifications {
      int NotificationID ;
      String Title ;
      String Content ;
      int RecipientID;
      LocalDateTime SendDate;
      int Status ;

    public Notifications() {
    }

    public Notifications(int NotificationID, String Title, String Content, int RecipientID, LocalDateTime SendDate, int Status) {
        this.NotificationID = NotificationID;
        this.Title = Title;
        this.Content = Content;
        this.RecipientID = RecipientID;
        this.SendDate = SendDate;
        this.Status = Status;
    }

    public int getNotificationID() {
        return NotificationID;
    }

    public void setNotificationID(int NotificationID) {
        this.NotificationID = NotificationID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public int getRecipientID() {
        return RecipientID;
    }

    public void setRecipientID(int RecipientID) {
        this.RecipientID = RecipientID;
    }

    public LocalDateTime getSendDate() {
        return SendDate;
    }

    public void setSendDate(LocalDateTime SendDate) {
        this.SendDate = SendDate;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
      
      
}
