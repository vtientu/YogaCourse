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
import module.Classes;
import module.Course;
import module.Feedback;

/**
 *
 * @author admin
 */
public class ClassDAO extends DBContext {

    CommonDAO cdao = new CommonDAO();

    public ArrayList<Classes> getClassList(int cateID, int pageNo, int numberOfPage) {
        ArrayList<Classes> list = new ArrayList<>();
        try {
            String sql = "SELECT [Class].[ClassID]\n"
                    + "      ,[Class].[TrainerID]\n"
                    + "      ,[Class].[CourseID]\n"
                    + "      ,[Class].[ClassName]\n"
                    + "      ,[Class].[StartTime]\n"
                    + "      ,[Class].[EndTime]\n"
                    + "      ,[Class].[DayOfWeek]"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  INNER JOIN [Category] ON [Course].[CategoryID] = [Category].[CategoryID] ";

            if (cateID != 0) {
                sql += " WHERE [Category].[CategoryID] = ? ";
            }

            sql += " ORDER BY [ClassID] ASC OFFSET " + ((pageNo - 1) * numberOfPage) + " ROWS\n"
                    + "FETCH NEXT " + numberOfPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);
            if (cateID != 0) {
                st.setInt(1, cateID);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classes clas = new Classes();
                clas.setClassID(rs.getInt(1));
                clas.setClassName(rs.getString(4));
                clas.setStartTime(rs.getTime(5));
                clas.setEndTime(rs.getTime(6));
                clas.setDayOfWeek(rs.getString(7));
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                list.add(clas);
            }
        } catch (SQLException e) {
            System.out.println("getClassByCID -> " + e);
        }
        return list;
    }

    public Classes getClassByID(int cid) {
        try {
            String sql = "SELECT [Class].[ClassID]\n"
                    + "      ,[Class].[TrainerID]\n"
                    + "      ,[Class].[CourseID]\n"
                    + "      ,[Class].[ClassName]\n"
                    + "      ,[Class].[StartTime]\n"
                    + "      ,[Class].[EndTime]\n"
                    + "      ,[Class].[DayOfWeek]"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  WHERE [Class].[ClassID] = ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classes clas = new Classes();
                clas.setClassID(rs.getInt(1));
                clas.setClassName(rs.getString(4));
                clas.setStartTime(rs.getTime(5));
                clas.setEndTime(rs.getTime(6));
                clas.setDayOfWeek(rs.getString(7));
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                return clas;
            }
        } catch (SQLException e) {
            System.out.println("getClassByID -> " + e);
        }
        return null;
    }

    public int getCountClassList(int cateID) {
        try {
            String sql = "SELECT COUNT([Class].[ClassID])\n"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  INNER JOIN [Category] ON [Course].[CategoryID] = [Category].[CategoryID] ";
            if (cateID != 0) {
                sql += " WHERE [Category].[CategoryID] = ? ";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            if (cateID != 0) {
                st.setInt(1, cateID);
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCountClassList -> " + e);
        }
        return -1;
    }

    public ArrayList<Feedback> getFeedbackListByCid(int cid) {
        ArrayList<Feedback> list = new ArrayList<>();
        try {
            String sql = "SELECT [FeedbackID]\n"
                    + "      ,[MemberID]\n"
                    + "      ,[CourseID]\n"
                    + "      ,[Rating]\n"
                    + "      ,[Description]\n"
                    + "  FROM [dbo].[Feedback] WHERE CourseID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = cdao.getAccountByAid(rs.getInt(2));
                Course c = cdao.getCourseByID(rs.getInt(3));
                Feedback fb = new Feedback();
                fb.setFeedbackID(rs.getInt(1));
                fb.setAccount(a);
                fb.setCourse(c);
                fb.setRating(rs.getInt(4));
                fb.setDescription(rs.getString(5));
                list.add(fb);
            }
        } catch (SQLException e) {
            System.out.println("getFeedbackListByCid -> " + e);
        }
        return list;
    }

    public boolean addComment(Feedback fb) {
        try {
            String sql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([MemberID]\n"
                    + "           ,[CourseID]\n"
                    + "           ,[Rating]\n"
                    + "           ,[Description])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, fb.getAccount().getAid());
            st.setInt(2, fb.getCourse().getCourseID());
            st.setInt(3, fb.getRating());
            st.setString(4, fb.getDescription());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addComment -> " + e);
        }
        return false;
    }

    public static void main(String[] args) {
        ClassDAO cdao = new ClassDAO();
        ArrayList<Classes> list = cdao.getClassList(9, 1, 6);
        System.out.println(list.size());
    }
}
