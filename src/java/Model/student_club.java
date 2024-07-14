/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author pc
 */
public class student_club {
    int account_ID;
    int club_ID;
    int role_ID;
    int team_ID;

    public student_club() {
    }

    public student_club(int account_ID, int club_ID, int role_ID, int team_ID) {
        this.account_ID = account_ID;
        this.club_ID = club_ID;
        this.role_ID = role_ID;
        this.team_ID = team_ID;
    }

    public int getAccount_ID() {
        return account_ID;
    }

    public void setAccount_ID(int account_ID) {
        this.account_ID = account_ID;
    }

    public int getClub_ID() {
        return club_ID;
    }

    public void setClub_ID(int club_ID) {
        this.club_ID = club_ID;
    }

    public int getRole_ID() {
        return role_ID;
    }

    public void setRole_ID(int role_ID) {
        this.role_ID = role_ID;
    }

    public int getTeam_ID() {
        return team_ID;
    }

    public void setTeam_ID(int team_ID) {
        this.team_ID = team_ID;
    }
    
    
}
