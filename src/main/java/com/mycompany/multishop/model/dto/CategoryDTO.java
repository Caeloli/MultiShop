/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dto;

import com.mycompany.multishop.model.entity.Category;

/**
 *
 * @author caelo
 */
public class CategoryDTO {
    
    private Category entity;
    
    public CategoryDTO(){
        entity = new Category();
    }

    public Category getEntity() {
        return entity;
    }

    public void setEntity(Category entity) {
        this.entity = entity;
    }
    
    
    
}
