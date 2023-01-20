/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.multishop.model.dao;

import com.mycompany.multishop.controller.util.HibernateUtil;
import com.mycompany.multishop.model.dto.UserDTO;
import com.mycompany.multishop.model.entity.User;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.List;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author caelo
 */
public class UserDAO {
    
    public void create(UserDTO dto){
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
    
    public void update(UserDTO dto){
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
    
    public void delete(UserDTO dto){
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
    
    public UserDTO readFromEmail(UserDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            String hql = "FROM User WHERE EMAIL =  :EMAIL_DB"; // Only works when the data is not gonna be modified
            Query query = session.createQuery(hql);
            query.setParameter("EMAIL_DB", dto.getEntity().getEmail());
            if(query.getResultList().isEmpty())
                dto = null;
            else
                dto.setEntity((User) query.getResultList().get(0));
        }catch(Exception ex){
            if(transaction != null){
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return dto;
    }
    
    public UserDTO read(UserDTO dto){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            //Start transaction
            transaction = session.beginTransaction();
            dto.setEntity(session.get(User.class, dto.getEntity().getIdUser()));
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
            String hql = "FROM User";
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
    
    public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeySpecException {
        UserDAO dao = new UserDAO();
        UserDTO dto = new UserDTO();
        
        dto.getEntity().setEmail("caeloleame@gmail.com");
        
        dto = dao.readFromEmail(dto);
        
        System.out.println(dto);        
    }
    
}