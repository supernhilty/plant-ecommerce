/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import planthouse.dao.OrderDAO;
import planthouse.dao.ProductDAO;
import planthouse.dto.Product;

/**
 *
 * @author leyen
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
        if (action == null) {

            ProductDAO pdao = new ProductDAO();
            OrderDAO odao = new OrderDAO();
            List<Product> productListNewItem = pdao.getListTop("addDate");
            List<Product> bestSellerList = odao.getTopOrderProduct();
            request.setAttribute("newItemList", productListNewItem);
            request.setAttribute("bestSellerList", bestSellerList);
            //request.getRequestDispatcher("userhome.jsp").forward(request, response);
        } else if ("detail".equals(action)) {
            String productID = request.getParameter("id");

            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(productID);

            HttpSession session = request.getSession();
            if (product != null) {
                session.setAttribute("DETAIL_PRODUCT", product);
                request.getRequestDispatcher("productdetail.jsp").forward(request, response);
            }

        } else if ("pagingProductList".equals(action)) {

            ProductDAO dao = new ProductDAO();
            String category = request.getParameter("category");
            if(category==null){
                category="";
            }
            String colSort = request.getParameter("colSort");
            String sortType = request.getParameter("sortType");
            if (colSort == null) {
                colSort = "id";
            }
            if (sortType == null) {
                sortType = "";
            }

            int totalProduct = dao.getProductCount(search, category);
            int productPerPage = 12;
            int numPage = (int) Math.ceil((double) totalProduct / (double) productPerPage);
            int curPage;

            try {
                curPage = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                curPage = 1;
            }

            List<Product> list = dao.getListProductByPage(search, productPerPage, curPage, colSort, sortType, category);
            //so phan tu cua mot trang
            request.setAttribute("PAGING_LIST", list);
            //so trang
            request.setAttribute("NUM_PAGE", numPage);
            request.setAttribute("page", curPage);
            request.getRequestDispatcher("shop.jsp").forward(request, response);

        } else if ("productdetail".equals(action)) {
            String id = request.getParameter("id");
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(id);
            request.setAttribute("productdetail", product);
            request.getRequestDispatcher("productdetail.jsp").forward(request, response);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
