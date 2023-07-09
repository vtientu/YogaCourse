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
import module.Enroll;
import module.Payment;

/**
 *
 * @author admin
 */
public class EnrollDAO extends DBContext {

    public boolean purchasePayment(Payment payment) {
        try {
            String sql = "INSERT INTO [dbo].[Payment]\n"
                    + "           ([CardNumber]\n"
                    + "           ,[Expires]\n"
                    + "           ,[CardholderName]\n"
                    + "           ,[CVC])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, payment.getCardNumber());
            st.setString(2, payment.getExpires());
            st.setString(3, payment.getCardName());
            st.setString(4, payment.getCvc());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("purchasePayment -> " + e);
        }
        return false;
    }

    public boolean createEnroll(Enroll enroll) {
        try {
            purchasePayment(enroll.getPayment());
            String sql = "SELECT TOP (1) [PaymentID]\n"
                    + "      ,[CardNumber]\n"
                    + "      ,[Expires]\n"
                    + "      ,[CardholderName]\n"
                    + "      ,[CVC]\n"
                    + "  FROM [YogaCenter].[dbo].[Payment]\n"
                    + "  ORDER BY [PaymentID] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sql = "INSERT INTO [dbo].[Enroll]\n"
                        + "           ([PaymentID]\n"
                        + "           ,[totalPrice]\n"
                        + "           ,[AccountID]\n"
                        + "           ,[ClassID])\n"
                        + "     VALUES\n"
                        + "           (?, ?, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, rs.getInt(1));
                st.setDouble(2, enroll.getTotalPrice());
                st.setInt(3, enroll.getAccount().getAid());
                st.setInt(4, enroll.getClassOrder().getClassID());
                st.executeUpdate();
                return true;
            }
            return false;
        } catch (SQLException e) {
            System.out.println("createEnroll -> " + e);
        }
        return false;
    }

    public ArrayList<Enroll> getEnrollList(String keySearch, int pageNo, int numberOfPage, String action) {
        ArrayList<Enroll> list = new ArrayList<>();
        try {
            String sql = "SELECT [EnrollID]\n"
                    + "      ,[PaymentID]\n"
                    + "      ,[EnrollDate]\n"
                    + "      ,[totalPrice]\n"
                    + "      ,[status]\n"
                    + "      ,e.[AccountID]\n"
                    + "      ,e.[ClassID]\n"
                    + "  FROM [dbo].[Enroll] e INNER JOIN [Account] a\n"
                    + "  ON e.AccountID = a.AccountID INNER JOIN [Class] c\n"
                    + "  ON c.[ClassID] = e.[ClassID]"
                    + "  WHERE 1 = 1";
            if (keySearch != null) {
                sql += " AND (a.Firstname LIKE ? OR a.[Email] LIKE ? OR a.Lastname LIKE ? OR a.Phone = ?)";
            }

            if (action != null) {
                sql += " AND e.[status] = " + action;
            }

            sql += " ORDER BY a.AccountID ASC OFFSET " + ((pageNo - 1) * numberOfPage) + " ROWS\n"
                    + "FETCH NEXT " + numberOfPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);

            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
                st.setString(2, "%" + keySearch + "%");
                st.setString(3, "%" + keySearch + "%");
                st.setString(4, "%" + keySearch + "%");
            }

            ResultSet rs = st.executeQuery();

            CommonDAO cdao = new CommonDAO();
            ClassDAO clasDAO = new ClassDAO();
            while (rs.next()) {
                Account a = cdao.getAccountByAid(rs.getInt(6));
                Classes c = clasDAO.getClassByID(rs.getInt(7));
                Payment p = cdao.getPaymentById(rs.getInt(2));
                Enroll enroll = new Enroll();
                enroll.setEnrollID(rs.getInt(1));
                enroll.setPayment(p);
                enroll.setEnrollDate(rs.getDate(3));
                enroll.setTotalPrice(rs.getDouble(4));
                enroll.setStatus(rs.getBoolean(5));
                enroll.setAccount(a);
                enroll.setClassOrder(c);
                list.add(enroll);
            }
        } catch (SQLException e) {
            System.out.println("getEnrollList -> " + e);
        }
        return list;
    }

    public int getCountListEnroll(String keySearch, String action) {
        try {
            String sql = "SELECT COUNT([EnrollID])\n"
                    + "  FROM [dbo].[Enroll] e INNER JOIN [Account] a\n"
                    + "  ON e.AccountID = a.AccountID INNER JOIN [Class] c\n"
                    + "  ON c.[ClassID] = e.[ClassID]"
                    + "  WHERE 1 = 1";
            if (keySearch != null) {
                sql += " AND (a.Firstname LIKE ? OR a.[Email] LIKE ? OR a.Lastname LIKE ? OR a.Phone = ?)";
            }

            if (action != null) {
                sql += " AND e.[status] = " + action;
            }

            PreparedStatement st = connection.prepareStatement(sql);

            if (keySearch != null) {
                st.setString(1, "%" + keySearch + "%");
                st.setString(2, "%" + keySearch + "%");
                st.setString(3, "%" + keySearch + "%");
                st.setString(4, "%" + keySearch + "%");
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCountListEnroll -> " + e);
        }
        return 0;
    }

    public ArrayList<Integer> getListLessionID(int classID) {
        ArrayList<Integer> list = new ArrayList<>();
        try {
            String sql = "SELECT tb.LessionID FROM Timetable tb WHERE tb.ClassID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println("getListLessionID -> " + e);
        }
        return list;
    }

    public boolean insertAttendInLession(int aid, int classID) {
        try {
            String sql = "SELECT e.EnrollID FROM Enroll e WHERE e.ClassID = ? AND e.AccountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            st.setInt(2, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ArrayList<Integer> listLession = getListLessionID(classID);
                if (listLession != null && !listLession.isEmpty()) {
                    for (Integer i : listLession) {
                        sql = "INSERT INTO [dbo].[Attend]\n"
                                + "           ([EnrollID]\n"
                                + "           ,[LessionID])\n"
                                + "     VALUES\n"
                                + "           (?, ?)";
                        st = connection.prepareStatement(sql);
                        st.setInt(1, rs.getInt(1));
                        st.setInt(2, i);
                        st.executeUpdate();
                    }
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println("insertAttendInLession -> " + e);
        }
        return false;
    }
}
