/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Database.MyDAO;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class BlogDAO extends MyDAO {

    public String addBlog(Blog blog) {
        String sql = "INSERT INTO blog ( name, details, clubID, image, time) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, blog.getName());
            ps.setString(2, blog.getDetails());
            ps.setInt(3, blog.getClubID());
            ps.setString(4, blog.getImage());
            Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now());
            ps.setTimestamp(5, timestamp);
            ps.setInt(6, blog.getStatus());

            ps.executeUpdate();
        } catch (SQLException e) {
            return e.getMessage();
        }
        return "ok";
    }

    public List<Blog> pagingBlog(int index) {
        List<Blog> lst = new ArrayList<>();
        String xSql = "SELECT * FROM blog\n "
                + "ORDER BY id desc\n "
                + "LIMIT 4 OFFSET ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, (index - 1) * 4);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID = rs.getInt("clubID");
                String image = rs.getString("image");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int status = rs.getInt("status");
                lst.add(new Blog(id, name, details, clubID, image, time, status));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (lst);
    }

    public Blog getBlogByID(int id) {
        Blog blog = null;
        try {
            String sql = "SELECT * FROM blog WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                blog = new Blog();
                blog.setID(rs.getInt("id"));
                blog.setName(rs.getString("name"));
                blog.setDetails(rs.getString("details"));
                blog.setClubID(rs.getInt("clubID"));
                blog.setImage(rs.getString("image"));
                blog.setStatus(rs.getInt("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return blog;
    }

    public int getTotalBlog() {
        xSql = "select count(*)from blog";

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

    public List<Blog> getSearchBlogByTitle(String TitleSearch) {
        List<Blog> t = new ArrayList<>();
        xSql = "select * from blog\n " + "where name like ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + TitleSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID = rs.getInt("clubID");
                String image = rs.getString("image");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int status = rs.getInt("status");
                t.add(new Blog(id, name, details, clubID, image, time, status));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Blog> getSearchBlogByCLub(String ClubSearch) {
        List<Blog> t = new ArrayList<>();
        xSql = "select * from blog join club on club.id =blog.clubID\n " + "where club.name like ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + ClubSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID = rs.getInt("clubID");
                String image = rs.getString("image");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int status = rs.getInt("status");
                t.add(new Blog(id, name, details, clubID, image, time, status));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Blog getBlog(String blog_ID) {
        xSql = "select * from blog where id =?";
        Blog blog = new Blog();
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, blog_ID);
            rs = ps.executeQuery();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            if (rs.next()) {
                blog.setID(rs.getInt("id"));
                blog.setName(rs.getString("name"));
                blog.setDetails(rs.getString("details"));
                blog.setClubID(rs.getInt("clubID"));
                blog.setImage(rs.getString("image"));
                blog.setTime(LocalDateTime.parse(rs.getString("time"), formatter));
                blog.setStatus(rs.getInt("status"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blog;
    }

    public void changeStatus(int status, int id) {
        xSql = "UPDATE blog \n"
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

//    public String add(Blog b) {
//        xSql = "insert into blog (id,name,details,clubID,image,Status) values (?,?,?,?,?,?,?)";
//        try {
//            ps = con.prepareStatement(xSql);
//            ps.setInt(1, b.getId());
//            ps.setString(2, b.getName());
//            ps.setString(3, b.getDetails());
//            ps.setInt(5, b.getClubID());
//            ps.setString(6, b.getImage());
//            
//            ps.setInt(7, b.getStatus());
//
//            ps.executeUpdate();
//            ps.close();
//        } catch (Exception e) {
//            return (e.getMessage());
//        }
//        return ("OK!");
//    }
    public int getNumberBlog() {
        xSql = "select max(id) as id from blog";
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

    public List<Blog> getAllBlogByStatus(String xStatus) {
        List<Blog> t = new ArrayList<>();
        xSql = "select * from blog where Status=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xStatus);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID = rs.getInt("clubID");
                String image = rs.getString("image");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int status = rs.getInt("status");
                t.add(new Blog(id, name, details, clubID, image, time, status));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void EditBlog(Blog b) {
        xSql = "UPDATE blog \n"
                + "        SET name =? ,\n"
                + "        details = ?,\n"
                + "        image = ?,\n"
                + "        time = ?,\n"
                + "        Status = ?\n"
                + "        WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, b.name);
            ps.setString(2, b.details);
            ps.setString(3, b.image);
            ps.setObject(4, b.time);
            ps.setInt(5, b.status);
            ps.setInt(6, b.id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {

        }

    }

    public List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM blog";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setID(rs.getInt("id"));
                blog.setName(rs.getString("name"));
                blog.setDetails(rs.getString("details"));
                blog.setClubID(rs.getInt("clubID"));
                blog.setImage(rs.getString("image"));
                Timestamp timestamp = rs.getTimestamp("time");
                if (timestamp != null) {
                    blog.setTime(timestamp.toLocalDateTime());
                } else {
                    blog.setTime(null); // or set to a default value
                }
                blog.setStatus(rs.getInt("status"));
                blogs.add(blog);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public List<Blog> getAllBlogByTime1(int index) {
        List<Blog> lst = new ArrayList<>();
        String xSql = "SELECT * FROM blog\n "
                + "ORDER BY time desc\n "
                + "LIMIT 4 OFFSET ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, (index - 1) * 4);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID = rs.getInt("clubID");
                String image = rs.getString("image");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int status = rs.getInt("status");
                lst.add(new Blog(id, name, details, clubID, image, time, status));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (lst);
    }

    public List<Blog> getAllBlogByTime2(int index) {
        List<Blog> lst = new ArrayList<>();
        String xSql = "SELECT * FROM blog\n "
                + "ORDER BY time ASC\n "
                + "LIMIT 4 OFFSET ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, (index - 1) * 4);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String details = rs.getString("details");
                int clubID = rs.getInt("clubID");
                String image = rs.getString("image");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int status = rs.getInt("status");
                lst.add(new Blog(id, name, details, clubID, image, time, status));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (lst);
    }

    public void addClubNameToBlogs(List<Blog> blogs) {
        try {
            String sql = "SELECT club.name FROM club INNER JOIN blog ON club.id = blog.clubID WHERE blog.id = ?";
            ps = con.prepareStatement(sql);

            for (Blog blog : blogs) {
                ps.setInt(1, blog.getClubID());
                rs = ps.executeQuery();

                if (rs.next()) {
                    String clubName = rs.getString("name");
                    blog.setNameclub(clubName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public String getClubNameByClubID(int clubID) {
        String clubName = null;
        try {
            String sql = "SELECT name FROM club WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, clubID);
            rs = ps.executeQuery();

            if (rs.next()) {
                clubName = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return clubName;
    }

    public List<Blog> getBlogsByClubId(int id) {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT * FROM blog WHERE clubID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog();
                blog.setID(rs.getInt("id"));
                blog.setName(rs.getString("name"));
                blog.setDetails(rs.getString("details"));
                blog.setClubID(rs.getInt("clubID"));
                blog.setImage(rs.getString("image"));
                Timestamp timestamp = rs.getTimestamp("time");
                if (timestamp != null) {
                    blog.setDate(timestamp.toLocalDateTime());
                } else {
                    blog.setDate(null);
                }
                blog.setStatus(rs.getInt("status"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return blogs;
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        Blog b = new Blog();
        b.getClubID();
    }

}
