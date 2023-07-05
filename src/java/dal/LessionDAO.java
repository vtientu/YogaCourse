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
import module.Lession;

/**
 *
 * @author admin
 */
public class LessionDAO extends DBContext {

    public ArrayList<Lession> getLessionListByCid(int cid) {
        ArrayList<Lession> list = new ArrayList<>();
        try {
            String sql = "SELECT l.[LessionID]\n"
                    + "      ,[LessionName]\n"
                    + "      ,[LessionDescription]\n"
                    + "      ,[LessionContent]\n"
                    + "  FROM [dbo].[Lession] l INNER JOIN [Timetable] t ON l.LessionID = t.LessionID WHERE t.ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lession lession = new Lession(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null);
                list.add(lession);
            }
        } catch (SQLException e) {
            System.out.println("getLessionListByCid -> " + e);
        }
        return list;
    }

    public ArrayList<Lession> getLessionListByCidAdmin(String cid, String keySearch, int pageNo, int numberPerPage) {
        ArrayList<Lession> list = new ArrayList<>();
        try {
            String sql = "SELECT l.[LessionID]\n"
                    + "      ,[LessionName]\n"
                    + "      ,[LessionDescription]\n"
                    + "      ,[LessionContent]"
                    + "      ,t.[ClassID]\n"
                    + "  FROM [dbo].[Lession] l INNER JOIN [Timetable] t ON l.LessionID = t.LessionID WHERE 1 = 1 ";

            if (cid != null) {
                sql += " AND t.ClassID = " + cid;
            }

            if (keySearch != null) {
                sql += " AND (l.LessionName LIKE ? OR l.LessionDescription LIKE ? )";
            }

            sql += " ORDER BY l.[LessionID] ASC OFFSET " + ((pageNo - 1) * numberPerPage) + " ROWS\n"
                    + "FETCH NEXT " + numberPerPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);
            ClassDAO cdao = new ClassDAO();
            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
                st.setString(2, "%" + keySearch + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classes clas = cdao.getClassByID(rs.getInt(5));
                Lession lession = new Lession(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), clas);
                list.add(lession);
            }
        } catch (SQLException e) {
            System.out.println("getLessionListByCidAdmin -> " + e);
        }
        return list;
    }

    public static void main(String[] args) {
        LessionDAO ldao = new LessionDAO();
        double count = ldao.getCountLessionListByCidAdmin("2", null);
        int roundedCount = (int) Math.ceil(count / 10);
        System.out.println(roundedCount);
    }

    public int getCountLessionListByCidAdmin(String cid, String keySearch) {
        try {
            String sql = "SELECT COUNT(l.[LessionID])\n"
                    + "  FROM [dbo].[Lession] l INNER JOIN [Timetable] t ON l.LessionID = t.LessionID WHERE 1 = 1 ";

            if (cid != null) {
                sql += " AND t.ClassID = " + cid;
            }

            if (keySearch != null) {
                sql += " AND ( l.LessionName LIKE ? OR l.LessionDescription LIKE ? )";
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
            System.out.println("getLessionListByCidAdmin -> " + e);
        }
        return 0;
    }

    public boolean updateLession(Lession lession) {
        try {
            String sql = "UPDATE [dbo].[Lession]\n"
                    + "   SET [LessionName] = ?\n"
                    + "      ,[LessionDescription] = ?\n"
                    + " WHERE [LessionID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lession.getLessionName());
            st.setString(2, lession.getLessionDescription());
            st.setInt(3, lession.getLessionID());
            st.executeUpdate();

            sql = "DELETE FROM [dbo].[Timetable]\n"
                    + "      WHERE [LessionID] = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, lession.getLessionID());
            st.executeUpdate();

            sql = "INSERT INTO [dbo].[Timetable]\n"
                    + "           ([ClassID]\n"
                    + "           ,[LessionID])\n"
                    + "     VALUES\n"
                    + "           (?, ?)";
            st = connection.prepareStatement(sql);
            st.setInt(1, lession.getClassModule().getClassID());
            st.setInt(2, lession.getLessionID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateLession -> " + e);
        }
        return false;
    }

    public boolean deleteLession(int lid) {
        try {
            String sql = "DELETE FROM [dbo].[Attend]\n"
                    + "      WHERE [LessionID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lid);
            st.executeUpdate();

            sql = "DELETE FROM [dbo].[Timetable]\n"
                    + "      WHERE [LessionID] = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, lid);
            st.executeUpdate();

            sql = "DELETE FROM [dbo].[Lession]\n"
                    + "      WHERE [LessionID] = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, lid);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("deleteLession -> "  + e);
        }
        return false;
    }

    public boolean createLession(Lession lession) {
        try {
            String sql = "INSERT INTO [dbo].[Lession]\n"
                    + "           ([LessionName]\n"
                    + "           ,[LessionDescription]\n"
                    + "           ,[LessionContent])\n"
                    + "     VALUES\n"
                    + "           (?, ?, null)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lession.getLessionName());
            st.setString(2, lession.getLessionDescription());
            st.executeUpdate();

            sql = "SELECT TOP 1 l.LessionID FROM Lession l ORDER BY l.LessionID DESC";
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sql = "INSERT INTO [dbo].[Timetable]\n"
                        + "           ([ClassID]\n"
                        + "           ,[LessionID])\n"
                        + "     VALUES\n"
                        + "           (?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, lession.getClassModule().getClassID());
                st.setInt(2, rs.getInt(1));
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("createLession -> " + e);
        }
        return false;
    }

    public ArrayList<Lession> getLessionAttendList(int cid, int userid) {
        ArrayList<Lession> list = new ArrayList<>();
        try {
            String sql = "SELECT l.[LessionID]\n"
                    + "      ,[LessionName]\n"
                    + "      ,[LessionDescription]\n"
                    + "      ,[LessionContent]\n"
                    + "	  ,a.Attent\n"
                    + "  FROM [dbo].[Lession] l INNER JOIN [Timetable] t ON l.LessionID = t.LessionID LEFT JOIN [Attend] a ON a.LessionID = l.LessionID WHERE t.ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lession lession = new Lession(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null);
                list.add(lession);
            }
        } catch (SQLException e) {
            System.out.println("getLessionListByCid -> " + e);
        }
        return list;
    }
}
