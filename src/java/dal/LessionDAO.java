/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            while(rs.next()) {
                Lession lession = new Lession(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(lession);
            }
        } catch (SQLException e) {
            System.out.println("getLessionListByCid -> " + e);
        }
        return list;
    }
    
    public ArrayList<Lession> getLessionAttendList(int cid, int userid) {
        ArrayList<Lession> list = new ArrayList<>();
        try {
            String sql = "SELECT l.[LessionID]\n" +
"      ,[LessionName]\n" +
"      ,[LessionDescription]\n" +
"      ,[LessionContent]\n" +
"	  ,a.Attent\n" +
"  FROM [dbo].[Lession] l INNER JOIN [Timetable] t ON l.LessionID = t.LessionID LEFT JOIN [Attend] a ON a.LessionID = l.LessionID WHERE t.ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Lession lession = new Lession(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(lession);
            }
        } catch (SQLException e) {
            System.out.println("getLessionListByCid -> " + e);
        }
        return list;
    }
}
