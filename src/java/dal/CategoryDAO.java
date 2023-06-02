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

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT [CategoryID]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Active]\n"
                    + "  FROM [dbo].[Category] WHERE [Active] = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Category cate = new Category(rs.getInt(1), rs.getString(2), rs.getBoolean(3));
                list.add(cate);
            }
        } catch (SQLException e) {
            System.out.println("getCategoryList -> " + e);
        }
        return list;
    }
}
