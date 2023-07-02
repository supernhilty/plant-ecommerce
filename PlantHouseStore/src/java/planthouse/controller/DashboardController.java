
package planthouse.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import planthouse.dao.ProductDAO;
import planthouse.dao.UserDAO;
import planthouse.dto.Product;
import planthouse.dto.User;
@WebServlet(name = "DashboardController", urlPatterns = {"/admin"})
public class DashboardController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        
        
        //Session check
        HttpSession session = request.getSession(false); //retrieve current session. If there's no session -> return null
        User currentUser = null;
        if (session != null) { 
            currentUser = (User) session.getAttribute("usersession");
         }
         if (currentUser == null) {
            log("Debug: Redirect to login page" + currentUser);            
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
         
         //navigate to dashboard.jsp (main page)
         if (action == null || action.equalsIgnoreCase("main")) {
            UserDAO userDAO = new UserDAO();
            List<User> userList = userDAO.getUserList();
            int userNum = userList.size();
            int j1 = userDAO.getNumberOfSignup(1, 1);
            int j2 = userDAO.getNumberOfSignup(2, 1);
            int f1 = userDAO.getNumberOfSignup(1, 2);
            int f2 = userDAO.getNumberOfSignup(2, 2);
            int m1 = userDAO.getNumberOfSignup(1, 3);
            int m2 = userDAO.getNumberOfSignup(2, 3);
            int m = m1+m2;
                    
            ProductDAO productDAO = new ProductDAO();
            List<Product> productList = productDAO.getListProduct("");
            int productNum = productList.size();

            int[] data = {userNum,productNum,j1,j2,f1,f2,m1,m2,m};
            request.setAttribute("data", data);
            RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);
         }
        
        //Product
         ProductDAO productDAO = new ProductDAO();
            if (action.equals("productlist")) {
                int pageid;
                try {
                    String spageid = request.getParameter("page");  
                    pageid = Integer.parseInt(spageid);  
                } catch (NumberFormatException e) {
                    pageid = 1;
                }
                int skip=0;
                if (pageid!=1) {
                   skip=pageid-1;
                   skip=skip*10;
                }
                List<Product> list = productDAO.getRecords(skip, 10, "ID");
                request.setAttribute("list",list);
                
                RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("listexport")) {
                String category = request.getParameter("category");  
                List<Product> list = productDAO.getRecords(0, 0, category); 
                request.setAttribute("list",list);
                RequestDispatcher rd = request.getRequestDispatcher("productExport.jsp");
                rd.forward(request, response);
            }
            
            //Add product
            else if (action.equals("addproduct")) {
                request.setAttribute("action","productcreate");
                RequestDispatcher rd = request.getRequestDispatcher("productCreate.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("productcreate")) {
                List<Product> list = productDAO.getListProduct("");
                int ID = list.size();
                String Name = request.getParameter("Name");
                String category_ID = request.getParameter("category_ID");
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                String ImgPath = request.getParameter("ImgPath");
                int Price = Integer.parseInt(request.getParameter("Price"));
                String AddDate = getDate();
                String Description = request.getParameter("Description");
                Product product = new Product(ID, Name, category_ID, Quantity, ImgPath, Price, AddDate, Description);
                productDAO.insert(product);
                
                List<Product> plist = productDAO.getRecords(0, 10, "ID");
                request.setAttribute("list", plist);
                RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("productdetails")) {
                int ID = Integer.parseInt(request.getParameter("ID"));      
                Product product =  productDAO.getProduct(ID+"");
                request.setAttribute("object", product);
                RequestDispatcher rd = request.getRequestDispatcher("productDetails.jsp");
                rd.forward(request, response);
            }
            
             else if (action.equals("productedit")) {
                int ID = Integer.parseInt(request.getParameter("ID"));      
                Product product =  productDAO.getProduct(ID+"");
                request.setAttribute("object",product);
                request.setAttribute("action","productupdate");
                RequestDispatcher rd = request.getRequestDispatcher("productEdit.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("productupdate")) {
                Product Product = new Product();
                Product.setId(Integer.parseInt(request.getParameter("ID")));
                Product.setName(request.getParameter("Name"));
                Product.setCategory(request.getParameter("category_ID"));
                Product.setQuantity(Integer.parseInt(request.getParameter("Quantity")));
                Product.setImgPath(request.getParameter("ImgPath"));
                Product.setPrice(Integer.parseInt(request.getParameter("Price")));
                Product.setDescribe(request.getParameter("Description"));
                productDAO.update(Product);
                
                request.setAttribute("action","productdetails");
                request.setAttribute("object", Product);
                request.getRequestDispatcher("productDetails.jsp").forward(request, response);
            }
            else if (action.equals("productdelete")) {
                int ID = Integer.parseInt(request.getParameter("ID"));  
                productDAO.delete(ID);
                
                List<Product> plist = productDAO.getRecords(0, 10, "ID");
                request.setAttribute(action, ID);
                request.setAttribute("list", plist);
                RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
                rd.forward(request, response);
            }
        
    }
     public String getDate() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
        return dtf.format(now);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
