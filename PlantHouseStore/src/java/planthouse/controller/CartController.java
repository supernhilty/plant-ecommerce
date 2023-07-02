/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import planthouse.dao.ProductDAO;
import planthouse.dto.Cart;
import planthouse.dto.Item;
import planthouse.dto.Product;

/**
 *
 * @author leyen
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        String id = request.getParameter("id");
        

        if ("removeitem".equals(action)) {
            int pid = Integer.parseInt(id);
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                cart.delete(pid);
                session.setAttribute("cart", cart);
                session.setAttribute("cartlist", Cart.getItemlist(cart));
                session.setAttribute("totalprice", cart.getTotalMoney());
            session.setAttribute("totalquantity", cart.getTotalCount());
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
        } else if ("buyone".equals(action)) {

        } else if ("addtocart".equals(action)) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(id);
            Item item = new Item(product, quantity);
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            cart.add(item);
            session.setAttribute("cart", cart);
            session.setAttribute("cartlist", Cart.getItemlist(cart));

            String message = "Add " + quantity + " " + product.getName() + " successfully!";
             session.setAttribute("totalprice", cart.getTotalMoney());
            session.setAttribute("totalquantity", cart.getTotalCount());
            request.setAttribute("productdetail", product);
            request.setAttribute("addmessage", message);
            request.getRequestDispatcher("productdetail.jsp").forward(request, response);

        } else if ("buyall".equals(action)) {
            request.getRequestDispatcher("buy.jsp").forward(request, response);
        } else if ("update".equals(action)) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            int pid = Integer.parseInt(id);
            for (Item item : cart.getCart().values()) {
                if (item.getProduct().getId() == (pid)) {
                    item.setQuantity(quantity);
                }
            }

            session.setAttribute("cart", cart);
            session.setAttribute("totalprice", cart.getTotalMoney());
            session.setAttribute("totalquantity", cart.getTotalCount());
            session.setAttribute("cartlist", Cart.getItemlist(cart));
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
