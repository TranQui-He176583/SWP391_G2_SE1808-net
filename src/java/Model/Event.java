/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.time.LocalDateTime;

/**
 *
 * @author quyka
 */
public class Event {
    int id;
    String name;
    int club_id;
    LocalDateTime date;
    String location;
    String details;
    String avatar;
    boolean status;
    public Event() {
    }

    public Event(int id, String name, int club_id, LocalDateTime date, String location, String details,String avatar,boolean status) {
        this.id = id;
        this.name = name;
        this.club_id = club_id;
        this.date = date;
        this.location = location;
        this.details = details;
        this.avatar=avatar;
        this.status=status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getClub_id() {
        return club_id;
    }

    public void setClub_id(int club_id) {
        this.club_id = club_id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isStatus() {
        return status;
    }

    

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
