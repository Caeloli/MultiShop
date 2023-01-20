/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dto;

import com.mycompany.multishop.model.entity.Product;

/**
 *
 * @author caelo
 */
public class ProductDTO {
    private Product entity;

    public ProductDTO() {
        this.entity = new Product();
    }

    public Product getEntity() {
        return entity;
    }

    public void setEntity(Product entity) {
        this.entity = entity;
    }
    
}
