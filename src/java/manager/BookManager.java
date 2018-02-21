package manager;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Book;
import pojo.sample;
import symbook.HibernateUtil;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hp
 */
public class BookManager {
    
    public List<Book> getBooks(String user,String book){
        List<Book> list;
        SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            list = session.createCriteria(Book.class).add(Restrictions.and(Restrictions.ne("user",user),Restrictions.eq("name",book),Restrictions.eq("status",0))).list();
            return list;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
        finally {
            sf.getCurrentSession().close();
           
        }
        
    }
    public List<Book> getBooks(String user,int type){
        List<Book> list;
        SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            list = session.createCriteria(Book.class).add(Restrictions.and(Restrictions.eq("user",user),Restrictions.eq("status",type))).list();
            return list;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
        finally {
            sf.getCurrentSession().close();
           
        }    
    }

    public boolean addBook(Book book){
    Session session = HibernateUtil.getSessionFactory().openSession();
    try{
    session.beginTransaction();
    session.save(book);
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
}
