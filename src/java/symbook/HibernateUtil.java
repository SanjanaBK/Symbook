package symbook;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author hp
 */
public class HibernateUtil {

    private static final SessionFactory sessionFactory = buildSessionFactory();
    
    
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            return new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            //throw new ExceptionInInitializerError(ex);
        }
        return null;
    }
}
