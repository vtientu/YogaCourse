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
import module.Role;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {

    public Account loginAccount(String email, String password) {
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
                    + "  WHERE a.Email = ? AND a.Password = ? AND a.Active = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            Common c = new Common();
            st.setString(1, email);
            st.setString(2, c.convertPassToMD5(password));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt("RoleId"), rs.getString("RoleName"));
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
                acc.setRole(role);
                return acc;
            }
        } catch (SQLException e) {
            System.out.println("loginAccount -> " + e);
        }
        return null;
    }
    
    public Account loginWithAccountGoogle(String email) {
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
                    + "  WHERE a.Email = ? AND a.Active = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            Common c = new Common();
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt("RoleId"), rs.getString("RoleName"));
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
                acc.setRole(role);
                return acc;
            }
        } catch (SQLException e) {
            System.out.println("loginWithAccountGoogle -> " + e);
        }
        return null;
    }

    public boolean checkEmailExists(String email) {
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
                    + "  WHERE a.Email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("loginAccount -> " + e);
        }
        return false;
    }

    public boolean registerAccount(Account a) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([Firstname]\n"
                    + "           ,[Lastname]\n"
                    + "           ,[Phone]\n"
                    + "           ,[Email]\n"
                    + "           ,[Password])\n"
                    + "     VALUES\n"
                    + "           (? ,? ,? ,? ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            Common c = new Common();
            st.setString(1, a.getFirstName());
            st.setString(2, a.getLastName());
            st.setString(3, a.getPhone());
            st.setString(4, a.getEmail());
            st.setString(5, c.convertPassToMD5(a.getPassword()));
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("registerAccount -> " + e);
        }
        return false;
    }

    public ArrayList<Account> getUserList(String keySearch, int pageNo, int numberOfPage, String status) {
        ArrayList<Account> list = new ArrayList<>();
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
                    + "  ON a.RoleId = r.RoleID\n ";
            if (keySearch != null) {
                sql += " WHERE (a.Firstname LIKE ? OR a.[Email] LIKE ? OR a.Lastname LIKE ? OR a.Phone = ?)";
            }

            if (keySearch != null && status != null) {
                sql += " AND a.Active = " + status;
            } else if (keySearch == null && status != null) {
                sql += " WHERE a.Active = " + status;
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

            while (rs.next()) {
                Role role = new Role(rs.getInt("RoleId"), rs.getString("RoleName"));
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
                acc.setRole(role);
                list.add(acc);
            }

        } catch (SQLException e) {
            System.out.println("getUserList(): " + e);
        }
        return list;
    }
    
    public int getCountUserList(String keySearch, String status) {
        try {

            String sql = "SELECT COUNT(AccountID)\n"
                    + " FROM account a ";

            if (keySearch != null && keySearch.length() > 0) {
                sql += " WHERE (a.Firstname LIKE ? OR a.[Email] LIKE ? OR a.Lastname LIKE ? OR a.Phone = ?) ";
            }

            if (keySearch != null && keySearch.length() > 0 && status != null && status.length() > 0) {
                sql += " AND a.Active = " + status;
            } else if ((keySearch == null || keySearch.length() == 0) && status != null) {
                sql += " WHERE a.Active = " + status;
            }

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCountUserList -> " + e);
        }
        return -1;
    }
    
    public boolean changeStatus(int aid) {
        try {
            String sql = " UPDATE account\n"
                    + "SET\n"
                    + " [Active] = CASE WHEN [Active] = 0 THEN 1 ELSE 0 END \n"
                    + " WHERE AccountID = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("changeStatus -> " + e);
        }
        return false;
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
            Common c = new Common();
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt("RoleId"), rs.getString("RoleName"));
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
                acc.setRole(role);
                return acc;
            }
        } catch (SQLException e) {
            System.out.println("getAccountByAid -> " + e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        ArrayList<Account> list = udao.getUserList("", 1, 10, "1");
        System.out.println(udao.getCountUserList(null, "1"));
    }
}
