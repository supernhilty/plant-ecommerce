/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.controller;

import java.io.IOException;
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
import planthouse.dao.UserDAO;
import planthouse.dto.Cart;
import planthouse.dto.Order;
import planthouse.dto.OrderDetail;
import planthouse.dto.User;

/**
 *
 * @author leyen
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if ("buy".equals(action)) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null) {
                if (user.getPhone() == null || user.getAddress() == null || user.getAddress().isEmpty() || user.getPhone().isEmpty()) {
                    request.setAttribute("addressrequired", "Please add phone and address!");
                    request.getRequestDispatcher("profie.jsp").forward(request, response);
                } else {
                    Cart cart = (Cart) session.getAttribute("cart");
                    OrderDAO odao = new OrderDAO();
                    odao.addOrder(user, cart);
                    session.setAttribute("cart", null);

                    session.setAttribute("cartlist", null);
                    session.setAttribute("totalprice", null);
                    session.setAttribute("totalquantity", null);
                    request.setAttribute("buymessage", "Buy successfully!");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("messagelogin", "Login to continue!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else if ("HistoryTransaction".equals(action)) {
            String uid = request.getParameter("userid");
            OrderDAO odao = new OrderDAO();
            UserDAO udao = new UserDAO();
            User user = udao.getUser(uid);
            List<Order> list = odao.getListOrder(user);
            request.setAttribute("listorder", list);
            request.getRequestDispatcher("transaction.jsp").forward(request, response);
        }else if("detailorder".equals(action)){
            String oid= request.getParameter("orderid");
            OrderDAO odao = new OrderDAO();
            List<OrderDetail> list = odao.getOrder(oid);
            request.setAttribute("orderdetail", list);
            request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
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
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
