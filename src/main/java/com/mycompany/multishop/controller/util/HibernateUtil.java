/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.controller.util;

import com.mycompany.multishop.model.dto.UserDTO;
import com.mycompany.multishop.model.entity.Cart;
import com.mycompany.multishop.model.entity.User;
import com.mycompany.multishop.model.entity.Category;
import com.mycompany.multishop.model.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author caelo
 */
public class HibernateUtil {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();
                configuration.configure("hibernate.cfg.xml");
                configuration.addAnnotatedClass(User.class);
                configuration.addAnnotatedClass(Category.class);
                configuration.addAnnotatedClass(Product.class);
                configuration.addAnnotatedClass(Cart.class);
                sessionFactory = configuration.buildSessionFactory();
            } catch (Error e) {
                System.out.println("Error");
                e.printStackTrace();
                return null;
            }
        }
        return sessionFactory;
    }
}
