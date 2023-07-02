/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import planthouse.dao.UserDAO;
import planthouse.dto.User;
import planthouse.errorhandle.UserError;

/**
 *
 * @author leyen
 */
public class SignUpController extends HttpServlet {

     private final String ERROR = "signup.jsp";
    private final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            boolean check = true;
            UserError userError = new UserError();
            if (userID.length() > 10 || userID.length() < 5) {
                userError.setUserIDError("User Name length must be [5, 10]");
                check = false;
            }
            if (fullName.length() > 50 || fullName.length() < 5) {
                userError.setFullNameError("Full Name length must be [5, 50]");
                check = false;
            }
            if (phone.length() > 12 || phone.length() < 10) {
                userError.setPhoneError("Phone length must be [10, 12]");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("Wrong confirm!");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                User user = new User(userID, password, fullName, phone);
                boolean checkDuplicate = dao.checkDuplicate(userID);
                if (checkDuplicate) {
                    userError.setUserIDError("Username " + userID + " has already existed!");
                    request.setAttribute("USER_ERROR", userError);
                } else {
                    boolean checkInsert = dao.insert(user);
                    if (checkInsert) {
                        url = SUCCESS;
                        request.setAttribute("USER_MESSAGE", "Create account successfully! Login to continue!");
                    } else {
                        userError.setMessageError("Can not create user");
                        request.setAttribute("USER_ERROR", userError);
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
