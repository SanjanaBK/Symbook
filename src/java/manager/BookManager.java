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

    public List<Book> getBooks(String user,String type){
        List<Book> list;
        SessionFactory sf= HibernateUtil.getSessionFactory();
        Session session;
        try{
            System.out.println("");
            session = sf.openSession();
            list = session.createCriteria(Book.class).add(Restrictions.and(Restrictions.eq("user",user),Restrictions.eq("status",Integer.parseInt(type)))).list();
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
     
}
