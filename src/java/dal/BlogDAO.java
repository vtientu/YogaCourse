/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import module.Blog;

/**
 *
 * @author admin
 */
public class BlogDAO extends DBContext {

    public ArrayList<Blog> getBlogList(int pageNo, int numberOfPage) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT [BlogID]\n"
                    + "      ,[CreateBy]\n"
                    + "      ,[PublishedDate]\n"
                    + "      ,[Title]\n"
                    + "      ,[Content]\n"
                    + "      ,[Status]\n"
                    + "      ,[Image]\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  WHERE [Status] = 1 ";

            sql += " ORDER BY [BlogID] ASC OFFSET " + ((pageNo - 1) * numberOfPage) + " ROWS\n"
                    + "FETCH NEXT " + numberOfPage + " ROWS ONLY ;";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            CommonDAO cdao = new CommonDAO();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt(1));
                blog.setPublishedDate(rs.getDate(3));
                blog.setTitle(rs.getString(4));
                blog.setContent(rs.getString(5));
                blog.setStatus(rs.getInt(6));
                blog.setImage(rs.getString(7));
                blog.setCreateBy(cdao.getAccountByAid(rs.getInt(2)));
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println("getBlogList -> " + e);
        }
        return list;
    }

    public int getCountBlogList() {
        try {
            String sql = "SELECT COUNT([BlogID])\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  WHERE [Status] = 1 ";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCountBlogList -> " + e);
        }
        return -1;
    }
}
