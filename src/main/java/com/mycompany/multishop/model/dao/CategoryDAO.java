/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dao;

import com.mycompany.multishop.controller.util.HibernateUtil;
import com.mycompany.multishop.model.dto.CategoryDTO;
import com.mycompany.multishop.model.entity.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author caelo
 */
public class CategoryDAO {
    
    public void create(CategoryDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            session.save(dto.getEntity());
            transaction.commit();
        } catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
        }
    }
    
    public void update(CategoryDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            session.update(dto.getEntity());
            transaction.commit();
        } catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }
    
    public void delete(CategoryDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            session.delete(dto.getEntity());
            transaction.commit();
        } catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }
    
    public CategoryDTO read(CategoryDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            dto.setEntity(session.get(Category.class, dto.getEntity().getIdCategory()));
            transaction.commit();
        } catch(Exception ex){
            if (transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return dto;
    }
    
    public List readAll(){
        Transaction transaction = null;
        List list = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            String hql = "FROM Category";
            Query query = session.createQuery(hql);
            list = query.getResultList();
        } catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return list;
        
    }
    
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        System.out.println(dao.readAll());
    }
}
