/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import module.Category;
import module.Course;

/**
 *
 * @author admin
 */
public class CourseDAO extends DBContext {

    public int countCourseList(String keySearch, String status, String cateID) {
        try {
            String sql = "SELECT COUNT([CourseID])\n"
                    + "  FROM [dbo].[Course] c WHERE 1=1 ";

            if (keySearch != null) {
                sql += " AND c.CourseName LIKE ? ";
            }

            if (status != null) {
                sql += " AND c.Active = " + status;
            }
            
            if (cateID != null) {
                sql += " AND c.CategoryID = " + cateID;
            }

            PreparedStatement st = connection.prepareStatement(sql);
            if (keySearch != null && keySearch.length() > 0) {
                st.setString(1, "%" + keySearch + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("countCourseList -> " + e);
        }
        return -1;
    }

    public ArrayList<Course> getCourseList(String keySearch, int pageNo, int numberOfPage, String status, String cateID) {
        ArrayList<Course> list = new ArrayList<>();
        try {
            String sql = "SELECT [CourseID]\n"
                    + "      ,c.[CategoryID]\n"
                    + "      ,[CreateBy]\n"
                    + "      ,[CourseName]\n"
                    + "      ,[Price]\n"
                    + "      ,[Discount]\n"
                    + "      ,[Description]\n"
                    + "      ,[TotalDay]\n"
                    + "      ,[Image]\n"
                    + "      ,c.[Active]\n"
                    + "	  ,cate.CategoryName\n"
                    + "  FROM [dbo].[Course] c INNER JOIN [Category] cate ON c.CategoryID = cate.CategoryID WHERE 1=1 ";
            if (keySearch != null) {
                sql += " AND c.CourseName LIKE ? ";
            }

            if (status != null) {
                sql += " AND c.Active = " + status;
            }
            
            if (cateID != null) {
                sql += " AND c.CategoryID = " + cateID;
            }

            sql += " ORDER BY c.CourseID ASC OFFSET " + ((pageNo - 1) * numberOfPage) + " ROWS\n"
                    + "FETCH NEXT " + numberOfPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);
            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
            }
            ResultSet rs = st.executeQuery();
            CommonDAO cdao = new CommonDAO();
            while (rs.next()) {
                Category category = new Category(rs.getInt(2), rs.getString(11), true);
                Course course = new Course();
                course.setCourseID(rs.getInt(1));
                course.setCategory(category);
                course.setCreateBy(cdao.getAccountByAid(rs.getInt(3)));
                course.setCourseName(rs.getString(4));
                course.setPrice(rs.getDouble(5));
                course.setDiscount(rs.getDouble(6));
                course.setDescription(rs.getString(7));
                course.setTotalDay(rs.getInt(8));
                course.setImage(rs.getString(9));
                course.setActive(rs.getBoolean(10));
                list.add(course);
            }
        } catch (SQLException e) {
            System.out.println("getCourseList -> " + e);
        }
        return list;
    }

    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT [CategoryID]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Active]\n"
                    + "  FROM [dbo].[Category]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1), rs.getString(2), rs.getBoolean(3));
                list.add(category);
            }
        } catch (SQLException e) {
            System.out.println("getCategoryList -> " + e);
        }
        return list;
    }

    public Course getCourseById(int cid) {
        try {
            String sql = "SELECT [CourseID]\n"
                    + "      ,c.[CategoryID]\n"
                    + "      ,[CreateBy]\n"
                    + "      ,[CourseName]\n"
                    + "      ,[Price]\n"
                    + "      ,[Discount]\n"
                    + "      ,[Description]\n"
                    + "      ,[TotalDay]\n"
                    + "      ,[Image]\n"
                    + "      ,c.[Active]\n"
                    + "	  ,cate.CategoryName\n"
                    + "  FROM [dbo].[Course] c INNER JOIN [Category] cate ON c.[CategoryID] = cate.[CategoryID] WHERE c.[CourseID] = ? ";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CommonDAO cdao = new CommonDAO();
            if (rs.next()) {
                Category category = new Category(rs.getInt(2), rs.getString(11), true);
                Course course = new Course();
                course.setCourseID(rs.getInt(1));
                course.setCategory(category);
                course.setCreateBy(cdao.getAccountByAid(rs.getInt(3)));
                course.setCourseName(rs.getString(4));
                course.setPrice(rs.getDouble(5));
                course.setDiscount(rs.getDouble(6));
                course.setDescription(rs.getString(7));
                course.setTotalDay(rs.getInt(8));
                course.setImage(rs.getString(9));
                course.setActive(rs.getBoolean(10));
                return course;
            }
        } catch (SQLException e) {
            System.out.println("getCourseById -> " + e);
        }
        return null;
    }

    public boolean changeStatus(int cid) {
        try {
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET [Active] = CASE WHEN [Active] = 0 THEN 1 ELSE 0 END\n"
                    + " WHERE [CourseID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("changeStatus -> " + e);
        }
        return false;
    }

    public boolean createCourse(Course course) {
        try {
            String sql = "INSERT INTO [dbo].[Course]\n"
                    + "           ([CategoryID]\n"
                    + "           ,[CreateBy]\n"
                    + "           ,[CourseName]\n"
                    + "           ,[Price]\n"
                    + "           ,[Discount]\n"
                    + "           ,[Description]\n"
                    + "           ,[TotalDay]\n"
                    + "           ,[Image])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?, ? ,? ,? ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course.getCategory().getCategoryID());
            st.setInt(2, course.getCreateBy().getAid());
            st.setString(3, course.getCourseName());
            st.setDouble(4, course.getPrice());
            st.setDouble(5, course.getDiscount());
            st.setString(6, course.getDescription());
            st.setInt(7, course.getTotalDay());
            st.setString(8, course.getImage());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("createCourse -> " + e);
        }
        return false;
    }

    public boolean updateCourse(Course course) {
        try {
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET [CategoryID] = ?\n"
                    + "      ,[CourseName] = ?\n"
                    + "      ,[Price] = ?\n"
                    + "      ,[Discount] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[TotalDay] = ?\n"
                    + "      ,[Image] = ?\n"
                    + " WHERE [Course].[CourseID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course.getCategory().getCategoryID());
            st.setString(2, course.getCourseName());
            st.setDouble(3, course.getPrice());
            st.setDouble(4, course.getDiscount());
            st.setString(5, course.getDescription());
            st.setInt(6, course.getTotalDay());
            st.setString(7, course.getImage());
            st.setInt(8, course.getCourseID());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateCourse -> " + e);
        }
        return false;
    }
}
