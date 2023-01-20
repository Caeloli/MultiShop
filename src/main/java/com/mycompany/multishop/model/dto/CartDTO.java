/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dto;

import com.mycompany.multishop.model.entity.Cart;


/**
 *
 * @author caelo
 */

public class CartDTO {

    private Cart entity;
    
    public CartDTO(){
        entity = new Cart();
    }

    public Cart getEntity() {
        return entity;
    }

    public void setEntity(Cart entity) {
        this.entity = entity;
    }
    
    
}
