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
public class Setting {
    int IdSetting;
    String Name;
    int IdType;
    int IdForm;
    int IdClub;
    int IdBlog;
    int IdStudent;
    int IdEvent;
    int Status;
    LocalDateTime DateCreate;
    LocalDateTime DateModify;
    

    public Setting() {
    }

    public Setting(int IdSetting, String Name, int IdType, int IdForm, int IdClub, int IdBlog, int IdStudent, int IdEvent, int Status, LocalDateTime DateCreate, LocalDateTime DateModify) {
        this.IdSetting = IdSetting;
        this.Name = Name;
        this.IdType = IdType;
        this.IdForm = IdForm;
        this.IdClub = IdClub;
        this.IdBlog = IdBlog;
        this.IdStudent = IdStudent;
        this.IdEvent = IdEvent;
        this.Status = Status;
        this.DateCreate = DateCreate;
        this.DateModify = DateModify;
    }

    public int getIdSetting() {
        return IdSetting;
    }

    public void setIdSetting(int IdSetting) {
        this.IdSetting = IdSetting;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getIdType() {
        return IdType;
    }

    public void setIdType(int IdType) {
        this.IdType = IdType;
    }

    public int getIdForm() {
        return IdForm;
    }

    public void setIdForm(int IdForm) {
        this.IdForm = IdForm;
    }

    public int getIdClub() {
        return IdClub;
    }

    public void setIdClub(int IdClub) {
        this.IdClub = IdClub;
    }

    public int getIdBlog() {
        return IdBlog;
    }

    public void setIdBlog(int IdBlog) {
        this.IdBlog = IdBlog;
    }

    public int getIdStudent() {
        return IdStudent;
    }

    public void setIdStudent(int IdStudent) {
        this.IdStudent = IdStudent;
    }

    public int getIdEvent() {
        return IdEvent;
    }

    public void setIdEvent(int IdEvent) {
        this.IdEvent = IdEvent;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public LocalDateTime getDateCreate() {
        return DateCreate;
    }

    public void setDateCreate(LocalDateTime DateCreate) {
        this.DateCreate = DateCreate;
    }

    public LocalDateTime getDateModify() {
        return DateModify;
    }

    public void setDateModify(LocalDateTime DateModify) {
        this.DateModify = DateModify;
    }
    

   
    
    
    
    
    
    
    
    
}
