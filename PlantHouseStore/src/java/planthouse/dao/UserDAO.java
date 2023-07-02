/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import planthouse.dto.User;
import planthouse.utils.DBUtils;

/**
 *
 * @author leyen
 */
public class UserDAO {

    public User checklogin(String userID, String password) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from [User] "
                        + "where userID = ? and password = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userID);
                pstm.setString(2, password);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    user = new User(rs.getString("userID"), "",
                            rs.getString("fullName"), rs.getString("phone"), rs.getString("address"), rs.getString("city"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
 public User getUser(String userID) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from [User] "
                        + "where userID = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userID);
               
                rs = pstm.executeQuery();
                if (rs.next()) {
                    user = new User(rs.getString("userID"), "",
                            rs.getString("fullName"), rs.getString("phone"), rs.getString("address"), rs.getString("city"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
//   
    public boolean updateUser(User user) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pstm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "update [User] "
                        + "set fullname = ?, phone = ?, address=?, city=?"
                        + " where userID=?";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, user.getFullName());
                pstm.setString(2, user.getPhone());
                pstm.setString(3, user.getAddress());
                pstm.setString(4, user.getCity());
                pstm.setString(5, user.getUserID());                
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select userID from [User] where userID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean insert(User user) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pstm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into "
                        + "[User](userID,fullName,phone,password,role)"
                        + " values(?,?,?,?,?)";
                pstm=con.prepareStatement(sql);
                pstm.setString(1, user.getUserID());
                pstm.setString(2, user.getFullName());
                pstm.setString(3, user.getPhone());
                pstm.setString(4, user.getPassword());
                pstm.setString(5, "US");
                check = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return check;
    }
    public List<User> getUserList() throws ClassNotFoundException {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users"; 
        try {
            //connect to database (SQL Server)
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String UserID = rs.getString("UserID");
                String Role = rs.getString("Role");
                String Password = rs.getString("passwords");
                String FullName = rs.getString("FullName");
                String Phone =  rs.getString("Phone");
                String Address = rs.getString("Address");
                String City = rs.getString("City");
                int Point = rs.getInt("Point");
                String RegisterDate = rs.getString("RegisterDate");
                
                User user =  new User(rs.getString("userID"), "",
                            rs.getString("fullName"), rs.getString("phone"), rs.getString("address"), rs.getString("city"),rs.getString("RegisterDate"));
                list.add(user);
            }
            return list;
        }
        catch (SQLException ex) {
            System.out.println("Query user error!" + ex.getMessage());
        }
        return list;	
    }
    
         public int getNumberOfSignup(int half, int month) throws ClassNotFoundException {
         List<User> list = getUserList(); 
         int count=0;
         for (int i=0; i<list.size(); i++) {
             String a = list.get(i).getRegisterDate();
             String[] arrOfStr = a.split("-");
             int m = Integer.parseInt(arrOfStr[1]);
             int day = Integer.parseInt(arrOfStr[2].substring(0, 2));
             if (half==1) {
                  if (m==month&&day>=1&&day<15) count++;
             }
             else if (m==month&&day>=15&&day<=28) count++;
         }
         return count;
     }
}
