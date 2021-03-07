
package com.learn.iut_ecommerce.dao;

import com.learn.iut_ecommerce.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cat){
    
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId=(int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
        
    }
    
    public List<Category> getCategories()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list=query.list();
        return list;
    
    }
    
    public Category getCategoryById(int cid)
    {
        Category cat=null;
        try {
            Session session = this.factory.openSession();
             cat = session.get(Category.class, cid);
             session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    
    }
}
