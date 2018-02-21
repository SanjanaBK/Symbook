/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.BookManager;
import manager.BookUserManager;
import pojo.Book;
import pojo.Book_Users;

/**
 *
 * @author hp
 */
public class BorrowBookServlet extends HttpServlet {

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
        String lender = request.getParameter("lender");
        String borrower = request.getParameter("borrower");
        String book = request.getParameter("book");
        
        BookManager bm = new BookManager();
        Book bookL = bm.getBook(book,lender);
        BookUserManager bum = new BookUserManager();
        Book_Users bookB = new Book_Users();
        bookB.setAuthor(bookL.getAuthor());
        bookB.setBorrower(borrower);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
        Date date = new Date();
        bookB.setDate(new java.sql.Date(date.getDate()));
        bookB.setGenre(bookL.getGenre());
        bookB.setLender(bookL.getUser());
        bookB.setName(bookL.getName());
        bookB.setRdate(null);
        bookB.setStatus(2);
        bookB.setType(bookL.getType());
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
