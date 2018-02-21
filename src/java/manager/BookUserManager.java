/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Book_Users;
import symbook.HibernateUtil;

/**
 *
 * @author hp
 */
public class BookUserManager {

public boolean checkBookExists(String book,String user){
    
    List<Book_Users> list;
        SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            list = session.createCriteria(Book_Users.class).add(Restrictions.and(Restrictions.eq("lender",user),Restrictions.eq("name",book))).list();
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


public boolean AddBook(Book_Users book){
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

public List<Book_Users> getBooksList(String lender){
List<Book_Users> books;
    SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            books = session.createCriteria(Book_Users.class).add(Restrictions.and(Restrictions.eq("lender",lender),Restrictions.eq("status",1))).list();
            return books;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
        finally{
            sf.getCurrentSession().close();
        }


}


public List<Book_Users> getBooksList(String borrower,int type){

    List<Book_Users> books;
    SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            books = session.createCriteria(Book_Users.class).add(Restrictions.and(Restrictions.eq("borrower",borrower),Restrictions.eq("status",type))).list();
            return books;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
        finally{
            sf.getCurrentSession().close();
        }
}
    
}
