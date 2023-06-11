/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import module.Classes;

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
                clas.setTrainer(cdao.getAccountByAid(rs.getInt(2)));
                clas.setCourse(cdao.getCourseByID(rs.getInt(3)));
                list.add(clas);
            }
        } catch (SQLException e) {
            System.out.println("getClassByCID -> " + e);
        }
        return list;
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
    
    public static void main(String[] args) {
        ClassDAO cdao = new ClassDAO();
        ArrayList<Classes> list = cdao.getClassList(9, 1, 6);
        System.out.println(list.size());
    }
}
