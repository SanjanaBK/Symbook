/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Register;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.UserManager;
import pojo.sample;
/**
 *
 * @author hp
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean res;
        sample user= new sample();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String username = request.getParameter("username");
            UserManager manager = new UserManager();
            if(!manager.checkUserExists(email,username)){
                System.out.print("skfnd");
                
                user.setEmail(email);
                user.setFlags(0);
                user.setName(request.getParameter("name"));
                user.setPassword(password);
                user.setUserid(request.getParameter("username"));
                user.setVerified(0);
                String s = request.getParameter("dob");
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s);
                System.out.print("skfnd");
                
                user.setDob(new java.sql.Date(date.getDate()));
                
                res = manager.registerUser(user);
            } else {
                res = false;
            }
            if(res){
                HttpSession session = request.getSession();
                session.setAttribute("username",request.getParameter("username"));
                response.sendRedirect("login.jsp");
                
            }
            else{
            HttpSession session = request.getSession();
            session.setAttribute("message","Sorry! You could not be registered. Try with a different username or email id.");
            response.sendRedirect("register.jsp");
            }
        }
        catch(Exception e){
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
