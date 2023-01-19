/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author caelo
 */
@Entity
@Table(name = "User")

public class User {
    
    @Id @Column(name = "ID_USER")
    private int idUser;
    @Column(name = "TYPE")
    private int type;
    @Column(name = "FIRST_NAME")
    private String firstName;
    @Column(name = "PATERNAL_NAME")
    private String paternalName;
    @Column(name = "MATERNAL_NAME")
    private String maternalName;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "ADDRESS")
    private String address;

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPaternalName() {
        return paternalName;
    }

    public void setPaternalName(String paternalName) {
        this.paternalName = paternalName;
    }

    public String getMaternalName() {
        return maternalName;
    }

    public void setMaternalName(String maternalName) {
        this.maternalName = maternalName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    
}
