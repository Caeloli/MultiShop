/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.multishop.controller.servlet;

import com.mycompany.multishop.model.dao.CartDAO;
import com.mycompany.multishop.model.dao.ProductDAO;
import com.mycompany.multishop.model.dto.CartDTO;
import com.mycompany.multishop.model.dto.ProductDTO;
import com.mycompany.multishop.model.entity.Cart;
import com.mycompany.multishop.model.entity.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author caelo
 */
@WebServlet(name = "DisplayCartServlet", urlPatterns = {"/DisplayCartServlet"})
public class DisplayCartServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        CartDAO cdao = new CartDAO();
        CartDTO cdto = new CartDTO();
        ProductDAO pdao = new ProductDAO();
        ProductDTO pdto = new ProductDTO();
        cdto.getEntity().setIdUser(user.getIdUser());
        List listCart = cdao.readAllFromUser(cdto);
        List products = new ArrayList();
        for(int i=0; i<listCart.size();i++){
            Cart cart = (Cart) listCart.get(i);
            pdto.getEntity().setIdProduct(cart.getIdProduct());
            ProductDTO newProductDTO = new ProductDTO();
            newProductDTO = pdao.read(pdto);
            products.add(newProductDTO.getEntity());
        }
        
        request.setAttribute("cart", listCart);
        request.setAttribute("products", products);
        RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
        rd.forward(request, response);
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
