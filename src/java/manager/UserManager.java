/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import symbook.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import pojo.sample;
import symbook.HibernateUtil;

/**
 *
 * @author hp
 */
public class UserManager {
    public boolean checkUserExists(String username){
        SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            List<sample> list = session.createCriteria(sample.class).add(Restrictions.eq("userid",username)).list();
            if(list.isEmpty())
                return false;
            return true;
         
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
        finally {
            sf.getCurrentSession().close();
            
        }
    }
    public boolean checkUserExists(String email,String username){
        boolean res1,res2;
        SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        
        
        try{
         System.out.println("");
        session = sf.openSession();
        List<sample> list = session.createCriteria(sample.class).add(Restrictions.eq("email",email)).list();
        if(list.isEmpty())
            res1=false;
        else
            res1=true;
        list = session.createCriteria(sample.class).add(Restrictions.eq("userid",username)).list();
        if(list.isEmpty())
            res2=false;
        else
            res2=true;
        
        
        
        return res1 && res2;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
        finally {
            sf.getCurrentSession().close();
            
        }
        
    }
    public boolean loginUser(String email,String password){
        boolean res;       
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
        session.beginTransaction();
        List<sample> list;
        list = session.createCriteria(sample.class).add(Restrictions.and(Restrictions.eq("email",email),Restrictions.eq("password",password))).list();
        if(list.isEmpty())
            res=false;
        else
            res=true;
        session.getTransaction().commit();
        return res;
        }
        catch(Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
        finally {
            session.close();
        }
    }
    public boolean registerUser(sample user){
    Session session = HibernateUtil.getSessionFactory().openSession();
    try{
    session.beginTransaction();
    session.save(user);
    session.getTransaction().commit();
    return true;
    }
    catch(Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    
   finally {
            session.close();
        }
    }

    public sample getUser(String email, String password) {
       boolean res;       
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
        session.beginTransaction();
        List<sample> list;
        list = session.createCriteria(sample.class).add(Restrictions.and(Restrictions.eq("email",email),Restrictions.eq("password",password))).list();
        session.getTransaction().commit();
        return list.get(0);
        }
        catch(Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
        finally {
            session.close();
        }
    }
    
}
