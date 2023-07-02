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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import planthouse.dto.Cart;
import planthouse.dto.Item;
import planthouse.dto.Order;
import planthouse.dto.OrderDetail;
import planthouse.dto.Product;
import planthouse.dto.User;
import planthouse.utils.DBUtils;

/**
 *
 * @author leyen
 */
public class OrderDAO {

    public void addOrder(User user, Cart cart) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into [order](OrderDate,UserId,Status,Total) values(?,?,?,?)";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, date);
                pstm.setString(2, user.getUserID());
                pstm.setBoolean(3, false);
                pstm.setDouble(4, cart.getTotalMoney());
                pstm.executeUpdate();

                //addOrderLine
                String sqlID = "select top 1 OrderId from [order] "
                        + " order by OrderId desc";
                pstm = con.prepareStatement(sqlID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    int orderId = rs.getInt("OrderId");
                    for (Item item : cart.getCart().values()) {
                        String sqlOrderLine = "insert into "
                                + "[orderline](OrderId,ProductId,OrderQuantity,ProductOrderPrice) "
                                + "values(?,?,?,?)";
                        PreparedStatement pstm2 = con.prepareStatement(sqlOrderLine);
                        pstm2.setInt(1, orderId);
                        pstm2.setInt(2, item.getProduct().getId());
                        pstm2.setInt(3, item.getQuantity());
                        pstm2.setDouble(4, item.getProduct().getPrice());
                        pstm2.executeUpdate();

                    }
                }

            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public List<Product> getTopOrderProduct() throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Product> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT COUNT(Orderid) as total, OrderLine.productid, Product.ID as id, Product.name as name, Product.category as category, Product.ImgPath as imgpath, Product.Price as price, "
                        + "                                               Product.Adddate as adddate, Product.Describe as describe, Product.Quantity as quantity "
                        + "						FROM (OrderLine inner join [Product] on Product.ID=OrderLine.ProductId) "
                        + "						GROUP BY productid, Product.ID, Product.name, Product.category, Product.ImgPath, Product.Price, "
                        + "						Product.Adddate, Product.Describe, Product.Quantity "
                        + "						order by total desc "
                        + "						offset 0 rows "
                        + "						fetch next 10 rows only;";
                pstm = con.prepareStatement(sql);

                rs = pstm.executeQuery();

                while (rs.next()) {
                    list.add(new Product(rs.getInt("id"), rs.getString("name"),
                            rs.getString("category"), rs.getInt("quantity"),
                            rs.getString("imgpath"), rs.getDouble("price"),
                            "", rs.getString("describe")));
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

//    public HashMap<Integer, List<OrderDetail>> getOrderHistory(String userid) throws SQLException {
//        Connection con = null;
//        PreparedStatement pstm = null;
//        ResultSet rs = null;
//        HashMap<Integer, List<OrderDetail>> map = new HashMap<>();
//        try {
//            con = DBUtils.getConnection();
//            if (con != null) {
//                String sql = "select * from ([order] inner join [orderline] on order.orderid=orderline.orderid) where userid = ?";
//            }
//
//        } catch (Exception e) {
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (pstm != null) {
//                pstm.close();
//            }
//            if (pstm != null) {
//                pstm.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//        return map;
//    }}
    public List<Order> getListOrder(User user) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Order> list = new ArrayList<>();
        UserDAO udao = new UserDAO();

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select * from [order] where userid = ?";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, user.getUserID());
                rs = pstm.executeQuery();
                while (rs.next()) {
//                    [OrderId]
//      ,[OrderDate]
//      ,[ShipDate]
//      ,[UserId]
//      ,[Status]
//      ,[Total]
                    String shipDate = rs.getString("ShipDate");
                    if (shipDate == null) {
                        shipDate = "";
                    }

                    list.add(new Order(rs.getInt("orderid"), rs.getString("OrderDate"), shipDate, user, rs.getBoolean("status"), rs.getDouble("Total")));
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<OrderDetail> getOrder(String orderId) throws SQLException {
        List<OrderDetail> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  select o.[OrderId] "
                        + "      ,[ProductId] "
                        + "      ,[OrderQuantity] "
                        + "      ,[ProductOrderPrice] "
                        + "      ,[OrderDate] "
                        + "      ,[ShipDate] "
                        + "      ,[UserId] "
                        + "      ,[Status] "
                        + "      ,[Total]  from ([order] o inner join [orderline] ol on o.orderid=ol.orderid) where o.[OrderId] =?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, orderId);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    Product product = pdao.getProduct(rs.getInt("ProductId")+"");
                    list.add(new OrderDetail(rs.getInt("OrderId"), product, rs.getInt("OrderQuantity"), rs.getDouble("ProductOrderPrice")));
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
        return list;
    }
}
