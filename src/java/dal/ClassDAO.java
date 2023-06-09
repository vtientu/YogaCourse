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
import module.Category;
import module.Classes;
import module.Course;
import module.Feedback;

/**
 *
 * @author admin
 */
public class ClassDAO extends DBContext {

    CommonDAO cdao = new CommonDAO();

    public ArrayList<Classes> getClassList(int cateID, int pageNo, int numberOfPage, String keySearch) {
        ArrayList<Classes> list = new ArrayList<>();
        try {
            String sql = "SELECT [Class].[ClassID]\n"
                    + "      ,[Class].[TrainerID]\n"
                    + "      ,[Class].[CourseID]\n"
                    + "      ,[Class].[ClassName]\n"
                    + "      ,[Class].[StartTime]\n"
                    + "      ,[Class].[EndTime]\n"
                    + "      ,[Class].[DayOfWeek]"
                    + "      ,[Class].[LimitMember]"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  INNER JOIN [Category] ON [Course].[CategoryID] = [Category].[CategoryID] ";

            if (keySearch != null) {
                sql += " WHERE ([Class].[ClassName] LIKE ?  OR [Course].[CourseName] LIKE ? )";
            }

            if (cateID != 0 && keySearch != null) {
                sql += " AND [Category].[CategoryID] = " + cateID;
            } else if (cateID != 0 && keySearch == null) {
                sql += " WHERE [Category].[CategoryID] = " + cateID;
            }

            sql += " ORDER BY [ClassID] ASC OFFSET " + ((pageNo - 1) * numberOfPage) + " ROWS\n"
                    + "FETCH NEXT " + numberOfPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);
            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
                st.setString(2, "%" + keySearch + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classes clas = new Classes();
                clas.setClassID(rs.getInt(1));
                clas.setClassName(rs.getString(4));
                clas.setStartTime(rs.getTime(5));
                clas.setEndTime(rs.getTime(6));
                clas.setDayOfWeek(rs.getString(7));
                clas.setLimitMember(rs.getInt(8));
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                list.add(clas);
            }
        } catch (SQLException e) {
            System.out.println("getClassByCID -> " + e);
        }
        return list;
    }

    public ArrayList<Account> getListMemberByClassID(int cid) {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT e.AccountID FROM Enroll e WHERE e.ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Account a = cdao.getAccountByAid(rs.getInt(1));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println("getListMemberByClassID -> " + e);
        }
        return list;
    }

    public boolean createClass(Classes cla) {
        try {
            String sql = "INSERT INTO [dbo].[Class]\n"
                    + "           ([TrainerID]\n"
                    + "           ,[CourseID]\n"
                    + "           ,[ClassName]\n"
                    + "           ,[LimitMember]\n"
                    + "           ,[StartTime]\n"
                    + "           ,[EndTime])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cla.getTrainer().getAid());
            st.setInt(2, cla.getCourse().getCourseID());
            st.setString(3, cla.getClassName());
            st.setInt(4, cla.getLimitMember());
            st.setTime(5, cla.getStartTime());
            st.setTime(6, cla.getEndTime());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("createClass -> " + e);
        }
        return false;
    }

    public boolean updateClass(Classes cla) {
        try {
            String sql = "UPDATE [dbo].[Class]\n"
                    + "   SET [TrainerID] = ?\n"
                    + "      ,[CourseID] = ?\n"
                    + "      ,[ClassName] = ?\n"
                    + "      ,[LimitMember] = ?\n"
                    + "      ,[StartTime] = ?\n"
                    + "      ,[EndTime] = ?\n"
                    + " WHERE ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cla.getTrainer().getAid());
            st.setInt(2, cla.getCourse().getCourseID());
            st.setString(3, cla.getClassName());
            st.setInt(4, cla.getLimitMember());
            st.setTime(5, cla.getStartTime());
            st.setTime(6, cla.getEndTime());
            st.setInt(7, cla.getClassID());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("updateClass -> " + e);
        }
        return false;
    }

    public ArrayList<Classes> getClassListAll() {
        ArrayList<Classes> list = new ArrayList<>();
        try {
            String sql = "SELECT [Class].[ClassID]\n"
                    + "      ,[Class].[TrainerID]\n"
                    + "      ,[Class].[CourseID]\n"
                    + "      ,[Class].[ClassName]\n"
                    + "      ,[Class].[StartTime]\n"
                    + "      ,[Class].[EndTime]\n"
                    + "      ,[Class].[DayOfWeek]"
                    + "      ,[Class].[LimitMember]"
                    + "  FROM [dbo].[Class]  ";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classes clas = new Classes();
                clas.setClassID(rs.getInt(1));
                clas.setClassName(rs.getString(4));
                clas.setStartTime(rs.getTime(5));
                clas.setEndTime(rs.getTime(6));
                clas.setDayOfWeek(rs.getString(7));
                clas.setLimitMember(rs.getInt(8));
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                list.add(clas);
            }
        } catch (SQLException e) {
            System.out.println("getClassListAll -> " + e);
        }
        return list;
    }

    public ArrayList<Course> getCourseList() {
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
                    + "  FROM [dbo].[Course] c INNER JOIN [Category] cate ON c.CategoryID = cate.CategoryID ";
            PreparedStatement st = connection.prepareStatement(sql);
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
            System.out.println("getCOurseList -> " + e);
        }
        return list;
    }

    public ArrayList<Classes> getClassListAdmin(String cateID, String courseID, int pageNo, int numberOfPage, String keySearch) {
        ArrayList<Classes> list = new ArrayList<>();
        try {
            String sql = "SELECT [Class].[ClassID]\n"
                    + "      ,[Class].[TrainerID]\n"
                    + "      ,[Class].[CourseID]\n"
                    + "      ,[Class].[ClassName]\n"
                    + "      ,[Class].[StartTime]\n"
                    + "      ,[Class].[EndTime]\n"
                    + "      ,[Class].[DayOfWeek]"
                    + "      ,[Class].[LimitMember]"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  INNER JOIN [Category] ON [Course].[CategoryID] = [Category].[CategoryID] WHERE 1 = 1";

            if (keySearch != null && keySearch.length() > 0) {
                sql += " AND ([Class].[ClassName] LIKE ? OR [Course].[CourseName] LIKE ?)";
            }

            if (cateID != null && cateID.length() > 0) {
                sql += " AND [Category].[CategoryID] = " + cateID;
            }

            if (courseID != null && courseID.length() > 0) {
                sql += " AND [Course].[CourseID] = " + courseID;
            }

            sql += " ORDER BY [ClassID] ASC OFFSET " + ((pageNo - 1) * numberOfPage) + " ROWS\n"
                    + "FETCH NEXT " + numberOfPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);
            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
                st.setString(2, "%" + keySearch + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classes clas = new Classes();
                clas.setClassID(rs.getInt(1));
                clas.setClassName(rs.getString(4));
                clas.setStartTime(rs.getTime(5));
                clas.setEndTime(rs.getTime(6));
                clas.setDayOfWeek(rs.getString(7));
                clas.setLimitMember(rs.getInt(8));
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                list.add(clas);
            }
        } catch (SQLException e) {
            System.out.println("getClassListAdmin -> " + e);
        }
        return list;
    }

    public int getCountClassListAdmin(String cateID, String courseID, String keySearch) {
        try {
            String sql = "SELECT COUNT([Class].[ClassID])\n"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  INNER JOIN [Category] ON [Course].[CategoryID] = [Category].[CategoryID] WHERE 1 = 1";

            if (keySearch != null && keySearch.length() > 0) {
                sql += " AND [Class].[ClassName] LIKE ? ";
            }

            if (cateID != null && cateID.length() > 0) {
                sql += " AND [Category].[CategoryID] = " + cateID;
            }

            if (courseID != null && courseID.length() > 0) {
                sql += " AND [Course].[CourseID] = " + courseID;
            }

            PreparedStatement st = connection.prepareStatement(sql);
            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getClassListAdmin -> " + e);
        }
        return 0;
    }

    public boolean checkAccountMemberInClass(int aid, int cid) {
        try {
            String sql = "SELECT [EnrollID]\n"
                    + "      ,[EnrollDate]\n"
                    + "      ,[totalPrice]\n"
                    + "      ,[status]\n"
                    + "      ,[AccountID]\n"
                    + "      ,e.[ClassID]\n"
                    + "  FROM [dbo].[Enroll] e INNER JOIN [Class] c ON e.ClassID = c.ClassID\n"
                    + "  WHERE e.[AccountID] = ? AND c.[CourseID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.setInt(2, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkAccountMemberInClass -> " + e);
        }
        return false;
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
                    + "      ,[Class].[LimitMember]"
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
                clas.setLimitMember(rs.getInt(8));
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                return clas;
            }
        } catch (SQLException e) {
            System.out.println("getClassByID -> " + e);
        }
        return null;
    }

    public int getTotalMemberInClass(int cid) {
        try {
            String sql = "SELECT COUNT(EnrollID) FROM Enroll e INNER JOIN Class c ON e.ClassID = c.ClassID WHERE e.ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalMemberInClass -> " + e);
        }
        return 0;
    }

    public boolean deleteClass(int cid) {
        try {
            String sql = "DELETE FROM [dbo].[Timetable]\n"
                    + "      WHERE [ClassID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.executeUpdate();

            sql = "";

            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public int getCountClassList(int cateID, String keySearch) {
        try {
            String sql = "SELECT COUNT([Class].[ClassID])\n"
                    + "  FROM [dbo].[Class] INNER JOIN [Course]\n"
                    + "  ON [Class].[CourseID] = [Course].[CourseID]\n"
                    + "  INNER JOIN [Category] ON [Course].[CategoryID] = [Category].[CategoryID] ";
            if (keySearch != null) {
                sql += " WHERE ([Class].[ClassName] LIKE ? OR [Course].[CourseName] LIKE ?)";
            }

            if (cateID != 0 && keySearch != null) {
                sql += " AND [Category].[CategoryID] = " + cateID;
            } else if (cateID != 0 && keySearch == null) {
                sql += " WHERE [Category].[CategoryID] = " + cateID;
            }

            PreparedStatement st = connection.prepareStatement(sql);
            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
                st.setString(2, "%" + keySearch + "%");
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

    public boolean checkFeedbackExists(int aid, int cid) {
        try {
            String sql = "SELECT [FeedbackID]\n"
                    + "      ,[MemberID]\n"
                    + "      ,[CourseID]\n"
                    + "      ,[Rating]\n"
                    + "      ,[Description]\n"
                    + "  FROM [dbo].[Feedback] WHERE [CourseID] = ? AND [MemberID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkFeedbackExists -> " + e);
        }
        return false;
    }

    public void deleteFeedback(int aid, int cid) {
        try {
            String sql = "DELETE FROM [dbo].[Feedback]\n"
                    + "      WHERE [MemberID] = ? AND [CourseID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.setInt(2, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("checkFeedbackExists -> " + e);
        }
    }

    public boolean addComment(Feedback fb) {
        try {
            if (checkFeedbackExists(fb.getAccount().getAid(), fb.getCourse().getCourseID())) {
                deleteFeedback(fb.getAccount().getAid(), fb.getCourse().getCourseID());
            }
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

}
