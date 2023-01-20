/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dao;

import com.mycompany.multishop.controller.util.HibernateUtil;
import com.mycompany.multishop.model.dto.ProductDTO;
import com.mycompany.multishop.model.entity.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author caelo
 */
public class ProductDAO {
    
    public void create(ProductDTO dto){
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
    
    public void update(ProductDTO dto){
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
    
    public void delete(ProductDTO dto){
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
    
    public List readAllFromCategory (ProductDTO dto){
        Transaction transaction = null;
        List list = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            String hql = "FROM Product WHERE ID_CATEGORY =  :ID_CATEGORY"; // Only works when the data is not gonna be modified
            Query query = session.createQuery(hql);
            query.setParameter("ID_CATEGORY", dto.getEntity().getIdCategory());
            list = query.getResultList();
        }catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return list;
    }
    
    public ProductDTO read(ProductDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            dto.setEntity(session.get(Product.class, dto.getEntity().getIdProduct()));
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
            String hql = "FROM Product";
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
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = new ProductDTO();
        List list = dao.readAll();
        System.out.println(list.size());
        
    }
}
