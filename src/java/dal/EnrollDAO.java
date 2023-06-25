/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}
