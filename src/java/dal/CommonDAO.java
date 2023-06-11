/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import module.Account;
import module.Blog;
import module.Category;
import module.Classes;
import module.Course;
import module.Lession;
import module.Role;

/**
 *
 * @author admin
 */
public class CommonDAO extends DBContext {

    public Category getCategoryByID(int cateID) {
        try {
            String sql = "SELECT [CategoryID]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Active]\n"
                    + "  FROM [dbo].[Category]\n"
                    + "  WHERE [CategoryID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category cate = new Category(rs.getInt(1), rs.getString(2), rs.getBoolean(3));
                return cate;
            }
        } catch (SQLException e) {
            System.out.println("getCategoryByID -> " + e);
        }
        return null;
    }

    public Role getRoleByID(int roleID) {
        try {
            String sql = "SELECT [RoleID]\n"
                    + "      ,[RoleName]\n"
                    + "  FROM [dbo].[Role]\n"
                    + "  WHERE [RoleID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                return role;
            }
        } catch (SQLException e) {
            System.out.println("getRoleByID -> " + e);
        }
        return null;
    }

    public Account getAccountByAid(int aid) {
        try {
            String sql = "SELECT [AccountID]\n"
                    + "      ,a.[RoleId]\n"
                    + "      ,[Firstname]\n"
                    + "      ,[Lastname]\n"
                    + "      ,[Avatar]\n"
                    + "      ,[Gender]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[Address]\n"
                    + "      ,[Password]\n"
                    + "      ,[Active]\n"
                    + "	  ,r.[RoleName]\n"
                    + "  FROM [dbo].[Account] a INNER JOIN [Role] r\n"
                    + "  ON a.RoleId = r.RoleID\n"
                    + "  WHERE [AccountID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account();
                acc.setAid(rs.getInt("AccountID"));
                acc.setFirstName(rs.getString("FirstName"));
                acc.setLastName(rs.getString("LastName"));
                acc.setAvatar(rs.getString("Avatar"));
                acc.setGender(rs.getInt("Gender"));
                acc.setPhone(rs.getString("Phone"));
                acc.setEmail(rs.getString("Email"));
                acc.setAddress(rs.getString("Address"));
                acc.setPassword(rs.getString("Password"));
                acc.setActive(rs.getBoolean("Active"));
                acc.setRole(getRoleByID(rs.getInt("RoleId")));
                return acc;
            }
        } catch (SQLException e) {
            System.out.println("getAccountByAid -> " + e);
        }
        return null;
    }

    public Blog getBlogByID(int blogID) {
        try {
            String sql = "SELECT [BlogID]\n"
                    + "      ,[CreateBy]\n"
                    + "      ,[PublishedDate]\n"
                    + "      ,[Title]\n"
                    + "      ,[Content]\n"
                    + "      ,[Status]\n"
                    + "      ,[Image]\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  WHERE [BlogID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt(1));
                blog.setPublishedDate(rs.getDate(3));
                blog.setTitle(rs.getString(4));
                blog.setContent(rs.getString(5));
                blog.setStatus(rs.getInt(6));
                blog.setImage(rs.getString(7));
                blog.setCreateBy(getAccountByAid(rs.getInt(2)));
                return blog;
            }
        } catch (SQLException e) {
            System.out.println("getBlogByID -> " + e);
        }
        return null;
    }

    public Course getCourseByID(int courseID) {
        try {
            String sql = "SELECT [CourseID]\n"
                    + "      ,[CategoryID]\n"
                    + "      ,[CreateBy]\n"
                    + "      ,[CourseName]\n"
                    + "      ,[Price]\n"
                    + "      ,[Discount]\n"
                    + "      ,[Description]\n"
                    + "      ,[TotalDay]\n"
                    + "      ,[Image]\n"
                    + "      ,[Active]\n"
                    + "  FROM [dbo].[Course]\n"
                    + "  WHERE [CourseID] = ? AND [Active] = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getInt(1));
                course.setCourseName(rs.getString(4));
                course.setPrice(rs.getDouble(5));
                course.setDiscount(rs.getDouble(6));
                course.setDescription(rs.getString(7));
                course.setTotalDay(rs.getInt(8));
                course.setImage(rs.getString(9));
                course.setActive(rs.getBoolean(10));
                course.setCategory(getCategoryByID(rs.getInt(2)));
                course.setCreateBy(getAccountByAid(rs.getInt(3)));
                return course;
            }
        } catch (SQLException e) {
            System.out.println("getCourseByID -> " + e);
        }
        return null;
    }

    public Lession getLessionByID(int lessionID) {
        try {
            String sql = "SELECT [LessionID]\n"
                    + "      ,[RoomID]\n"
                    + "      ,[DayOfWeek]\n"
                    + "  FROM [dbo].[Lession]\n"
                    + "  WHERE [LessionID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessionID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Lession lession = new Lession();
                lession.setLessionID(rs.getInt(1));
                return lession;
            }
        } catch (SQLException e) {
            System.out.println("getLessionByID -> " + e);
        }
        return null;
    }

    public ArrayList<Lession> getLessionListByCID(int classID) {
        ArrayList<Lession> list = new ArrayList<>();
        try {
            String sql = "SELECT [Lession].[LessionID]\n"
                    + "      ,[Lession].[RoomID]\n"
                    + "      ,[Lession].[DayOfWeek]\n"
                    + "  FROM [dbo].[Lession] INNER JOIN [Timetable]\n"
                    + "  ON [Lession].[LessionID] = [Timetable].[LessionID]\n"
                    + "  WHERE [Timetable].[ClassID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lession lession = new Lession();
                lession.setLessionID(rs.getInt(1));
                list.add(lession);
            }
        } catch (SQLException e) {
            System.out.println("getLessionListByCID -> " + e);
        }
        return list;
    }

    public ArrayList<Account> getAccountListByCID(int classID) {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT [AccountID]\n"
                    + "      ,[RoleId]\n"
                    + "      ,[Firstname]\n"
                    + "      ,[Lastname]\n"
                    + "      ,[Avatar]\n"
                    + "      ,[Gender]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[Address]\n"
                    + "      ,[Password]\n"
                    + "      ,[Active]\n"
                    + "  FROM [dbo].[Account] INNER JOIN [ClassMember]\n"
                    + "  ON [Account].[AccountID] = [ClassMember].[MemberID]\n"
                    + "  WHERE [ClassMember].[ClassID] =? AND [Active] = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setAid(rs.getInt("AccountID"));
                acc.setFirstName(rs.getString("FirstName"));
                acc.setLastName(rs.getString("LastName"));
                acc.setAvatar(rs.getString("Avatar"));
                acc.setGender(rs.getInt("Gender"));
                acc.setPhone(rs.getString("Phone"));
                acc.setEmail(rs.getString("Email"));
                acc.setAddress(rs.getString("Address"));
                acc.setPassword(rs.getString("Password"));
                acc.setActive(rs.getBoolean("Active"));
                acc.setRole(getRoleByID(rs.getInt("RoleId")));
                list.add(acc);
            }
        } catch (SQLException e) {
            System.out.println("getAccountListByCID -> " + e);
        }
        return list;
    }

    public Classes getClassByCID(int classID) {
        try {
            String sql = "SELECT [ClassID]\n"
                    + "      ,[TrainerID]\n"
                    + "      ,[CourseID]\n"
                    + "      ,[ClassName]\n"
                    + "  FROM [dbo].[Class]\n"
                    + "  WHERE [ClassID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                Classes clas = new Classes();
                    clas.setClassID(rs.getInt(1));
                    clas.setClassName(rs.getString(4));
                    clas.setTrainer(getAccountByAid(rs.getInt(2)));
                    clas.setCourse(getCourseByID(rs.getInt(3)));
                    return clas;
            }
        } catch (SQLException e) {
            System.out.println("getClassByCID -> " + e);
        }
        return null;
    }
}
