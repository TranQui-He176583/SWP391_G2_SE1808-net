/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Duong
 */
public class ClubDAO extends MyDAO {

    public void addClub(Club club) {
        String sql = "INSERT INTO Club ( name, status, avatar, detail, category) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, club.getName());
            ps.setInt(2, club.getStatus());
            ps.setString(3, club.getAvatar());
            ps.setString(4, club.getDetail());
            ps.setString(5, club.getCategory());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getaList(int club_id) {
        List<Integer> aList = new ArrayList<>();
        String sql = "SELECT * FROM student_club where club_id=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, club_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int i = rs.getInt("account_id");
                aList.add(i);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aList;
    }

    public List<Account> getAllAccountByClubId(int clubId) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT a.* "
                + "FROM account a "
                + "JOIN student_club sc ON a.id = sc.account_id "
                + "WHERE sc.club_id = ? and sc.status = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, clubId);
            ps.setInt(2, 1);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String password = rs.getString("password");
                int roleId = rs.getInt("roleId");
                int status = rs.getInt("status");
                String fullName = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int gender = rs.getInt("gender");
                String image = rs.getString("image");
                String note = rs.getString("note");

                Account account = new Account(id, password, roleId, status, fullName, email, phone, gender, image, note);
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accounts;
    }
    
    public List<Account> getUnapprovedAccountsByClubId(int clubId) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT a.* "
                + "FROM account a "
                + "JOIN student_club sc ON a.id = sc.account_id "
                + "WHERE sc.club_id = ? and sc.status = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, clubId);
            ps.setInt(2, 0);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String password = rs.getString("password");
                int roleId = rs.getInt("roleId");
                int status = rs.getInt("status");
                String fullName = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int gender = rs.getInt("gender");
                String image = rs.getString("image");
                String note = rs.getString("note");

                Account account = new Account(id, password, roleId, status, fullName, email, phone, gender, image, note);
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accounts;
    }
    
    public void deleteMember(int accountId, int clubid) {
        xSql = "DELETE FROM student_club \n"
                + "        WHERE account_id = ? AND club_id = ?\n";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, accountId);
            ps.setInt(2, clubid);
            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {

        }

    }
    
    public int getNumberClub() {
        xSql = "select max(id) as id from club";
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
    
    public String insertMn(int account_id, int club_id) {
        xSql = "insert into student_club (account_id,club_id,role_id,status) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setInt(2, club_id);
            ps.setInt(3, 1);
            ps.setInt(4, 0);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }
    
    public String insertMember(int account_id, int club_id) {
        xSql = "insert into student_club (account_id,club_id,role_id,status) values (?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, account_id);
            ps.setInt(2, club_id);
            ps.setInt(3, 2);
            ps.setInt(4, 0);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return (e.getMessage());
        }
        return ("Ok");
    }
    
    
    public void changeStatusclubID(int accountId, int clubid) {
        xSql = "UPDATE student_club \n"
                + "        SET status = 1\n"
                + "        WHERE account_id = ? AND club_id = ?\n";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, accountId);
            ps.setInt(2, clubid);
            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {

        }

    }

    public List<Club> getClubs() {
        List<Club> clubs = new ArrayList<>();
        String sql = "SELECT * FROM Club where status =1;";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setCategory(rs.getString("category"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }

    public List<Integer> get_AccountId(int club_id) {
        List<Integer> iList = new ArrayList<>();
        String sql = "SELECT * FROM student_club where club_id =? and role_id=0;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, club_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("account_id");
                iList.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return iList;
    }

    public List<Integer> get_ClubId(int account_id) {
        List<Integer> iList = new ArrayList<>();
        String sql = "SELECT * FROM student_club where account_id =? and role_id=1;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, account_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("club_id");
                iList.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return iList;
    }

    public void displayClub() {

    }

    public Club getClubById(int id) {
        Club club = null;
        String sql = "SELECT * FROM Club WHERE id = ? and status = 1";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setDetail(rs.getString("detail"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return club;
    }

    public Club getClub_Id(int id) {

        String sql = "SELECT * FROM Club where status =1 and id=?;";
        Club club = new Club();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setDetail(rs.getString("detail"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return club;
    }

    public List<Club> getAllCLubByAccountID(String AccountID) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from account join student_club join club\n"
                + "        on account.id = student_club.account_ID and student_club.club_ID=club.id \n"
                + "        where account_ID= ? and role_id=1";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, AccountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");
                t.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Club> getClubListByUserId(int accountId) {
        List<Club> clubs = new ArrayList<>();
        String sql = "SELECT c.* FROM Club c INNER JOIN student_club sc ON c.id = sc.club_id WHERE sc.account_id = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setDetail(rs.getString("detail"));
                club.setCategory(rs.getString("category"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }

    public List<Club> get_club_manager(int account_id, String search) {
        List<Club> clubs = new ArrayList<>();
        String sql = "select club.id, club.status,club.name,club.avatar,club.category,club.detail  from account join student_club join club on account.id = student_club.account_ID and student_club.club_ID=club.id where account_ID= ? and role_id=1 and club.status=1 and club.name like ?;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, account_id);
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setDetail(rs.getString("detail"));
                club.setCategory(rs.getString("category"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }

    public int getTotalClub() {
        xSql = "select count(*)from club";

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

    public int getTotalClubByVoThuat() {
        xSql = "SELECT COUNT(*) FROM club WHERE category LIKE '%Võ thuật%'";

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

    public int getTotalClubByHocThuat() {
        xSql = "SELECT COUNT(*) FROM club WHERE category LIKE '%Học thuật%'";

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

    public int getTotalClubByNgheThuat() {
        xSql = "SELECT COUNT(*) FROM club WHERE category LIKE '%Nghệ thuật%'";

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

    public int getTotalClubByCongDong() {
        xSql = "SELECT COUNT(*) FROM club WHERE category LIKE '%Cộng đồng%'";

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

    public List<Club> getAllClub() {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");

                String detail = rs.getString("detail");
                String category = rs.getString("category");
                t.add(new Club(id, name, status, avatar, detail, category));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Club> getClubByClubID(String bid) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from blog join club\n"
                + "        on club.id = blog.clubID \n"
                + "        where blog.id= ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");
                t.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Club> pagingClub(int index) {
        List<Club> lst = new ArrayList<>();
        String xSql = "SELECT * FROM club\n "
                + "ORDER BY id desc \n "
                + "LIMIT 5 OFFSET ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");
                lst.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (lst);
    }

    public List<Club> getSearchClubByName(String NameSearch) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club\n " + "where name like ? or detail like ?"
                + "ORDER BY id desc\n "
                + "LIMIT 5";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + NameSearch + "%");
            ps.setString(2, "%" + NameSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");

                t.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Club> getSearchClubByManager(String ManagerSearch) {
        List<Club> t = new ArrayList<>();
        xSql = "SELECT *\n"
                + "FROM club\n"
                + "JOIN student_club ON club.id = student_club.club_id\n"
                + "JOIN account ON account.id = student_club.account_ID \n"
                + "WHERE account.fullname LIKE ?;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + ManagerSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");

                t.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void changeStatus(int status, int id) {
        xSql = "UPDATE club \n"
                + "        SET Status = ?\n"
                + "        WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {

        }

    }

    public List<Club> getAllClubByStatus(String xStatus) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club where Status=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xStatus);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");

                t.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Club getClub(String id) {

        xSql = "select * from club\n " + "where id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new Club(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int get_club_event_id(int event_id) {

        xSql = "select * from event where id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, event_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (rs.getInt("club_id"));
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public int get_club_blog_id(int blog_id) {

        xSql = "select * from blog where id=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, blog_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (rs.getInt("clubID"));
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public String EditClub(Club c) {
        xSql = "UPDATE club \n"
                + "        SET name =? ,\n"
                + "        status = ?,\n"
                + "        avatar = ?,\n"
                + "        detail = ?\n"
                + "        WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, c.getName());
            ps.setInt(2, c.getStatus());
            ps.setString(3, c.getAvatar());
            ps.setString(4, c.getDetail());
            ps.setInt(5, c.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            return e.getMessage();
        }
        return "ok";

    }

    public Club getNameByBlogID(String XblogID) {
        xSql = "select *from club join blog \n"
                + "on club.id = blog.clubID \n"
                + "where blog.id=?";
        Club club = new Club();

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, XblogID);
            rs = ps.executeQuery();
            if (rs.next()) {
                club.id = rs.getInt("id");
                club.name = rs.getString("name");
                club.status = rs.getInt("status");
                club.avatar = rs.getString("avatar");
                club.detail = rs.getString("detail");

                return club;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return club;
    }

    public List<Club> searchClubsByName(String name) {
        List<Club> clubs = new ArrayList<>();
        String sql = "SELECT * FROM Club WHERE name LIKE ? AND status = 1";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }

    public List<Club> getClubsByCategory(String category) {
        List<Club> clubs = new ArrayList<>();
        String sql = "SELECT * FROM Club WHERE category = ? AND status = 1";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setDetail(rs.getString("detail"));
                club.setCategory(rs.getString("category"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }

    public List<Club> getClubByCategories(String xCategory, int index) {
        List<Club> clubs = new ArrayList<>();
        String sql = "SELECT * FROM Club WHERE category = ?"
                + "ORDER BY id desc \n "
                + "LIMIT 5 OFFSET ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, xCategory);
            ps.setInt(2, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club();
                club.setId(rs.getInt("id"));
                club.setName(rs.getString("name"));
                club.setStatus(rs.getInt("status"));
                club.setAvatar(rs.getString("avatar"));
                club.setDetail(rs.getString("detail"));
                club.setCategory(rs.getString("category"));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }

    public int getTotalClubByCategory(String xCategory) {
        xSql = "select count(*)from club where category =?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xCategory);
            rs = ps.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Club> getAllClubByCategory(String xCategory) {
        List<Club> t = new ArrayList<>();
        xSql = "select * from club WHERE category = ? \n"
                + "ORDER BY id desc\n "
                + "LIMIT 5";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xCategory);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                String detail = rs.getString("detail");
                String category = rs.getString("category");
                t.add(new Club(id, name, status, avatar, detail, category));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

//    public static void main(String[] args) {
//        ClubDAO dao = new ClubDAO();
//        
//           System.out.println( dao.getTotalClubByCategory("Cộng Đồng"));
//        
//        
//    }
}
