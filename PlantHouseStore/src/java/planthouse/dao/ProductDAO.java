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
import planthouse.dto.Product;
import planthouse.utils.DBUtils;

/**
 *
 * @author leyen
 */
public class ProductDAO {

    public List<Product> getListProduct(String search) throws SQLException {
        List<Product> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select *"
                        + " from [Product] where name like ? or Describe like ? or category = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, "%" + search + "%");
                pstm.setString(2, "%" + search + "%");
                pstm.setString(3, "%" + search + "%");
                rs = pstm.executeQuery();
                while (rs.next()) {
                    productList.add(new Product(rs.getInt("id"), rs.getString("name"),
                            rs.getString("category"), rs.getInt("Quantity"),
                            rs.getString("ImgPath"), rs.getDouble("Price"),
                            rs.getString("Adddate"), rs.getString("Describe")));
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
        return productList;
    }

    public int getProductCount(String search, String category) throws SQLException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (category == "") {
                    String sql = "select count(*) as total "
                            + " from [Product] where name like ? or Describe like ?";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, "%" + search + "%");
                    pstm.setString(2, "%" + search + "%");

                } else {
                    String sql = "select count(*) as total "
                            + " from [Product] where category = ? and ( name like ? or Describe like ?)";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, category);
                    pstm.setString(2, "%" + search + "%");
                    pstm.setString(3, "%" + search + "%");
                }

                rs = pstm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("total");
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
        return 0;
    }

    public List<Product> getListProductByPage(String search, int limit, int page,
            String colSort, String sortType, String category) throws SQLException {

        List<Product> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (category != "") {
                    sql = "select * "
                            + " from [Product] "
                            + " where category = ? and (name like ? or Describe like ?)"
                            + " order by " + colSort + " " + sortType + " offset " + (page - 1) * limit + " rows "
                            + " fetch next ? rows only; ";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, category);
                    pstm.setString(2, "%" + search + "%");
                    pstm.setString(3, "%" + search + "%");

                    pstm.setInt(4, limit);
                } else {
                    sql = "select * "
                            + " from [Product] "
                            + " where name like ? or Describe like ?"
                            + " order by " + colSort + " " + sortType + " offset " + (page - 1) * limit + " rows "
                            + " fetch next ? rows only; ";
                    pstm = conn.prepareStatement(sql);

                    pstm.setString(1, "%" + search + "%");
                    pstm.setString(2, "%" + search + "%");

                    pstm.setInt(3, limit);
                }

                rs = pstm.executeQuery();
                while (rs.next()) {
                    productList.add(new Product(rs.getInt("id"), rs.getString("name"),
                            rs.getString("category"), rs.getInt("Quantity"),
                            rs.getString("ImgPath"), rs.getDouble("Price"),
                            rs.getString("Adddate"), rs.getString("Describe")));
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
        return productList;
    }

    public Product getProduct(String id) throws SQLException {
        Product product = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select *"
                        + " from [Product] where id = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, id);

                rs = pstm.executeQuery();
                if (rs.next()) {
                    product = new Product(rs.getInt("id"), rs.getString("name"),
                            rs.getString("category"), rs.getInt("Quantity"),
                            rs.getString("ImgPath"), rs.getDouble("Price"), rs.getString("Adddate"), rs.getString("Describe"));
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
        return product;
    }

    public List<Product> getListTop(String colSort) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select top 10 * from [product] order by " + colSort + " desc";
                pstm = con.prepareStatement(sql);

                rs = pstm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int quantity = rs.getInt("Quantity");
                    String name = rs.getString("name");
                    String category = rs.getString("category");
                    String imgPath = rs.getString("ImgPath");
                    Double price = rs.getDouble("Price");
                    String addDate = rs.getString("Adddate");
                    String describe = rs.getString("Describe");
                    Product p = new Product(id, name, category, quantity, imgPath, price, addDate, describe);
                    list.add(p);
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
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    //CRUD: CREATE
    public Long insert(Product Product) throws ClassNotFoundException  {
        String sql = "INSERT INTO [Product]"               
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";    
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql); 
            ps.setInt(1, Product.getId());
            ps.setString(2, Product.getName());
            ps.setString(3, Product.getCategory());
            ps.setInt(4, Product.getQuantity());
            ps.setString(5, Product.getImgPath());
            ps.setDouble(6, Product.getPrice());
            ps.setDate(7, java.sql.Date.valueOf(java.time.LocalDate.now()));
            ps.setString(8, Product.getDescribe());
            ps.executeUpdate();
        }
        catch (SQLException ex) {
            System.out.println("Product insertion failed due to internal error :(" + ex.getMessage());
        }
        return null;
    }

     //CRUD: READ
//    public ProductDTO load(int id) throws ClassNotFoundException {
//        String sql = "select * from Product where ID = ?";
//        try {
//            Connection conn = DBUtils.getConnection();      //connect to SQL
//            PreparedStatement ps = conn.prepareStatement(sql);      //convert the string "sql" to an SQL statement                       
//            ps.setInt(1, id);      //parse value of "id" to the "?" placeholder at the SQL statement   
//            ResultSet rs = ps.executeQuery();       //execute the SQL statement   
//            if (rs.next()){     //rs.next() read data in the table row by row
////                This method returns a boolean value specifying whether the ResultSet object contains more rows. 
////                If there are no rows next to its current position this method returns false, else returns true
//                int ID = rs.getInt("ID");
//                String Name = rs.getString("Name");
//                String cat_ID = rs.getString("cat_ID");
//                int Quantity = rs.getInt("Quantity");
//                String ImgPath =rs.getString("ImgPath");
//                int Price = rs.getInt("Price");
//                String Adddate = rs.getString("AddDate");
//                String Description = rs.getString("Describe");
//                
//                return new Product(ID, Name, cat_ID, Quantity, ImgPath, Price, Adddate, Description);
//               }
//        }
//        catch (SQLException ex) {
//            System.out.println("Failed to load product's detail due to internal error :(" + ex.getMessage());
//        }
//        return null;
 //   }
    
    //CRUD: UPDATE
    public boolean update(Product Product) throws ClassNotFoundException{
        String sql = "UPDATE [Product] SET Name = ?, category = ?, Quantity = ?, ImgPath = ?, Price = ?, Describe = ? "
                + "WHERE ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Product.getName());
            ps.setString(2, Product.getCategory());
            ps.setInt(3, Product.getQuantity());
            ps.setString(4, Product.getImgPath());
            ps.setDouble(5, Product.getPrice());
            ps.setString(6, Product.getDescribe());
            ps.setInt(7, Product.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Failed to update product's detail due to internal error :(" + ex.getMessage());
        }
        return false;
    }
     
    //CRUD: DELETE
    public boolean delete(int ID) throws ClassNotFoundException{
        String sql = "DELETE FROM [Product] WHERE ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Deletion fail due to internal error :(" + ex.getMessage());
        }
        return false;
    }
           
    public boolean checkIdDuplication (int id) throws ClassNotFoundException, SQLException  {
        List<Product> list = getListProduct("");
        for (int i=0; i<list.size(); i++) {
            if (list.get(i).getId()==id) return true;
        }
        return false;
    }
    
     public List<Product> getRecords(int skip, int numOfRow, String category) throws ClassNotFoundException {  
        List<Product> list = new ArrayList<>();        
        String sql = "SELECT * FROM [Product] ORDER BY "+category+ " DESC"; 
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps;
            if (numOfRow==10) {
                sql+=" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = conn.prepareStatement(sql);     
                ps.setInt(1, skip);
                ps.setInt(2, numOfRow);
            }
            else {
                ps = conn.prepareStatement(sql);
            }     
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               
                list.add(new Product(rs.getInt("id"), rs.getString("name"),
                            rs.getString("category"), rs.getInt("Quantity"),
                            rs.getString("ImgPath"), rs.getDouble("Price"), rs.getString("Adddate"), rs.getString("Describe")));
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("Query user error!" + ex.getMessage());
        }
        return list;	 
    }    

}
