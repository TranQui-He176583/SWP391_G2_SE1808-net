/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quyka
 */
public class EventDAO extends MyDAO {

    public String insert(Event x) {
        xSql = "insert into Event (name,club_id,time,location,details,avatar,status) values (?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getName());
            ps.setInt(2, x.getClub_id());
            ps.setObject(3, x.getDate());
            ps.setString(4, x.getLocation());
            ps.setString(5, x.getDetails());
            ps.setString(6, x.getAvatar());
            ps.setBoolean(7, x.isStatus());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }

    public int getNumberEvent() {
        xSql = "select max(id) as id from event";
        int number = 3;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            if (rs.next()) {
                number = rs.getInt("id");
                return number;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {

        }
        return number;
    }

    public boolean checkMember(int account_id, int club_id) {
        xSql = "select *from student_club where account_id=? and club_id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setInt(2, club_id);
            rs = ps.executeQuery();
            if (rs.next()) {

                return true;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkstatusMember(int account_id, int club_id) {
        xSql = "select *from student_club where account_id=? and club_id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setInt(2, club_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int status = rs.getInt("status");
                if (status == 1) {
                    return true;
                } else {
                    return false;
                }
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkRegister(int account_id, String event_id) {

        xSql = "select *from account_event where account_id=? and event_id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setString(2, event_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return true;
    }

    public List<account_event> getAccount_Event(int event_id) {
        List<account_event> aeList = new ArrayList<>();
        xSql = "select * from account_event where event_id= ? and status = 0";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, event_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int account_id = rs.getInt("account_id");
                account_event ae = new account_event(id, account_id, event_id, rs.getBoolean("status"));
                aeList.add(ae);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (aeList);
    }

    public List<account_event> getAccount_Event1(int event_id) {
        List<account_event> aeList = new ArrayList<>();
        xSql = "select * from account_event where event_id= ? and status = 1";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, event_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int account_id = rs.getInt("account_id");
                account_event ae = new account_event(id, account_id, event_id, rs.getBoolean("status"));
                aeList.add(ae);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (aeList);
    }

    public String insertAccount_Event(int account_id, String event_id) {
        xSql = "insert into account_event (account_id, event_id, status) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setString(2, event_id);
            ps.setBoolean(3, false);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }

    public String insertMember_Event(int account_id, String event_id) {
        xSql = "insert into account_event (account_id, event_id, status) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setString(2, event_id);
            ps.setBoolean(3, true);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }

    public String delete_Event(int event_id) {
        xSql = " update event set status = 0 where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, event_id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }

    public String accept(int ae_id) {
        xSql = " update account_event set status = 1 where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, ae_id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }

    public String delete(int ae_id) {
        xSql = " delete from account_event where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, ae_id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }

    public int get_Event_List_Npage(int club_Id, String search) {

        int count = 0;
        if (club_Id == 0) {
            if (search.equals("")) {
                xSql = "select * from event where status =1 ";
                try {
                    ps = con.prepareStatement(xSql);

                } catch (Exception e) {

                }

            } else {
                xSql = "SELECT * FROM event WHERE (name LIKE ?  ) and status =1 ";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setString(1, "%" + search + "%");

                } catch (Exception e) {

                }
            }

        } else {
            if (search.equals("")) {
                xSql = "select * from event where club_id =? and status =1 ";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setInt(1, club_Id);

                } catch (Exception e) {

                }
            } else {
                xSql = "SELECT * FROM event WHERE club_id = ? AND ( name LIKE ? ) and status =1 ";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setInt(1, club_Id);
                    ps.setString(2, "%" + search + "%");
                } catch (Exception e) {

                }
            }
        }
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Event> get_Event_List(int club_Id, String search, int cPage) {
        List<Event> eList = new ArrayList<>();
        cPage = (cPage - 1) * 9;
        if (club_Id == 0) {
            if (search.equals("")) {
                xSql = "select * from event where status=1 ORDER BY id DESC LIMIT 9 OFFSET ? ";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setInt(1, cPage);
                } catch (Exception e) {

                }

            } else {
                xSql = "SELECT * FROM event WHERE ( name LIKE ? ) and status=1 ORDER BY id DESC limit 9 offset ?;";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setString(1, "%" + search + "%");
                    ps.setInt(2, cPage);
                } catch (Exception e) {

                }
            }

        } else {
            if (search.equals("")) {
                xSql = "select * from event where club_id =? and status=1 ORDER BY id DESC LIMIT 9 OFFSET ?";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setInt(1, club_Id);
                    ps.setInt(2, cPage);
                } catch (Exception e) {

                }
            } else {
                xSql = "SELECT * FROM event WHERE club_id = ? AND (name LIKE ? ) and status =1 ORDER BY id DESC LIMIT 9 OFFSET ?;";
                try {
                    ps = con.prepareStatement(xSql);
                    ps.setInt(1, club_Id);
                    ps.setString(2, "%" + search + "%");
                    ps.setInt(3, cPage);
                } catch (Exception e) {

                }
            }
        }
        try {
            rs = ps.executeQuery();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            while (rs.next()) {
                Event e = new Event();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setAvatar(rs.getString("avatar"));
                e.setClub_id(rs.getInt("club_id"));
                e.setDate(LocalDateTime.parse(rs.getString("time"), formatter));
                e.setLocation(rs.getString("location"));
                e.setDetails(rs.getString("details"));
                e.setStatus(rs.getBoolean("status"));
                eList.add(e);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (eList);
    }

    public Event getEvent(int event_Id) {

        xSql = "select * from event where id =? and status =1";
        Event event = new Event();
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, event_Id);
            rs = ps.executeQuery();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            if (rs.next()) {

                event.setId(rs.getInt("id"));
                event.setName(rs.getString("name"));
                event.setAvatar(rs.getString("avatar"));
                event.setClub_id(rs.getInt("club_id"));
                event.setDate(LocalDateTime.parse(rs.getString("time"), formatter));
                event.setLocation(rs.getString("location"));
                event.setDetails(rs.getString("details"));
                event.setStatus(rs.getBoolean("status"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return event;
    }

    public int getTotalEvent() {
        xSql = "select count(*)from event";

        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalEventByStatus0() {
        xSql = "select count(*)from event where status =0";

        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalEventByStatus1() {
        xSql = "select count(*)from event where status =1";

        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalEventByStatus2() {
        xSql = "select count(*)from event where status =2";

        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Event> getAllEvent() {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");

                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Event> getAllEvent1() {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event where status = 1 and  time >= DATE(NOW()) + INTERVAL 1 DAY AND time < DATE(NOW()) + INTERVAL 2 DAY;  ";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");

                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public String updateEvent(Event e) {

        xSql = "UPDATE Event SET name = ?, avatar = ?, club_id=? ,time=?,location=?,details=?,status=? WHERE id = ?;";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getAvatar());
            ps.setInt(3, e.getClub_id());
            ps.setObject(4, e.getDate());
            ps.setString(5, e.getLocation());
            ps.setString(6, e.getDetails());
            ps.setInt(8, e.getId());
            ps.setBoolean(7, e.isStatus());
            ps.executeUpdate();
            rs.close();
            ps.close();
        } catch (Exception ex) {
            return ex.getMessage();
        }
        return "ok";
    }

    public boolean checkManager(int account_id, int club_id) {
        xSql = "select *from student_club where account_id=? and club_id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setInt(2, club_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int role = rs.getInt("role_id");
                if (role == 1) {
                    return true;
                }
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return false;
    }

    public List<Event> getAllEventByClubID(String ClubID) {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event where club_id =? ORDER BY id DESC LIMIT 5";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, ClubID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Event> getEventByClubID(String ClubID) {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event where club_id =? and status = 1 ORDER BY id ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, ClubID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Event> get_eList_search(int ClubID, String search) {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event where club_id =? and status = 1 and name like ? ORDER BY id desc ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, ClubID);
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public String get_eList_search1(String ClubID, String search) {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event where club_id =? and status = 1 and name like ? ORDER BY id desc ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, ClubID);
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            return e.getMessage();
        }
        return ("ok");
    }

    public List<Event> geteListdate(String ClubID) {
        List<Event> t = new ArrayList<>();
        xSql = "select * from event where club_id =? and time>CURRENT_TIMESTAMP ORDER BY id desc ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, ClubID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int club_id = rs.getInt("club_id");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                String location = rs.getString("location");
                String details = rs.getString("details");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Event event = new Event(id, name, club_id, time, location, details, avatar, status);
                t.add(event);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

}
