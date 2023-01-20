/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.multishop.controller.servlet;

import com.mycompany.multishop.model.dao.CategoryDAO;
import com.mycompany.multishop.model.dto.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author caelo
 */
@MultipartConfig
@WebServlet(name = "CreateCategoryServlet", urlPatterns = {"/CreateCategoryServlet"})
public class CreateCategoryServlet extends HttpServlet {

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
        
        String name = request.getParameter("newCategoryName");
        String desc = request.getParameter("newDescription");
        //Get Image parameter
        Part part = request.getPart("inputCategoryImg");
        String fileName = part.getSubmittedFileName();
        //Get path
        String path = getServletContext().getRealPath("\\img");
        System.out.println("path: "+ path);
        File file1 = new File(path);
        System.out.println("El archivo 1 existe? " + file1.exists());
        path += File.separator + fileName;
            //Upload file
        uploadFile(part.getInputStream(), path);
        
        CategoryDAO dao = new CategoryDAO();
        CategoryDTO dto = new CategoryDTO();
        
        dto.getEntity().setName(name);
        dto.getEntity().setDescription(desc);
        dto.getEntity().setImgPath("img/"+fileName);
        dao.create(dto);
        
        response.sendRedirect("CreateServlet");
        
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

    
    public boolean uploadFile(InputStream is, String path){
        boolean test = false;
        try{
            byte[] bytes = new byte[is.available()];
            is.read();
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(bytes);
            fos.flush();
            fos.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
