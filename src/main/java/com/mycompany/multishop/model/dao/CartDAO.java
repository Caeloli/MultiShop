/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dao;

import com.mycompany.multishop.controller.util.HibernateUtil;
import com.mycompany.multishop.model.dto.CartDTO;
import com.mycompany.multishop.model.entity.Cart;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author caelo
 */
public class CartDAO {
    
    public void create(CartDTO dto){
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
    
    public void update(CartDTO dto){
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
    
    public void delete(CartDTO dto){
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
    
    public CartDTO readFromIdProduct(CartDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            String hql = "FROM Cart WHERE ID_PRODUCT =  :ID_PRODUCT"; // Only works when the data is not gonna be modified
            Query query = session.createQuery(hql);
            query.setParameter("ID_PRODUCT", dto.getEntity().getIdProduct());
            if(query.getResultList().isEmpty())
                dto = null;
            else
                dto.setEntity((Cart) query.getResultList().get(0));
            
        } catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return dto;
        
    }
    
    public CartDTO read(CartDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            dto.setEntity(session.get(Cart.class, dto.getEntity().getIdCart()));
            transaction.commit();
        } catch(Exception ex){
            if (transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return dto;
    }
    
    public List readAllFromUser(CartDTO dto){
        Transaction transaction = null;
        List list = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            String hql = "FROM Cart WHERE ID_USER =  :ID_USER"; // Only works when the data is not gonna be modified
            Query query = session.createQuery(hql);
            query.setParameter("ID_USER", dto.getEntity().getIdUser());
            list = query.getResultList();
        } catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return list;
    }
    
    public List readAll(){
        Transaction transaction = null;
        List list = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            String hql = "FROM Cart";
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
    
}
