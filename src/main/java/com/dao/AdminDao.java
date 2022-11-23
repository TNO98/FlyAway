package com.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.Admin;
import com.utils.HibernateUtil;

public class AdminDao {
	
	// save admin into database
	public void saveAdmin(Admin admin) {
		Transaction tx= null;
		try (Session session=HibernateUtil.getSessionFactory().openSession()){
			tx=session.beginTransaction();
			session.save(admin);
			tx.commit();
			session.close();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
	}
	// get admin by email and pass
	public Admin getAdmin( String email , String password) {
		Admin admin =null;
		Session session=HibernateUtil.getSessionFactory().openSession();
		
		String query = "from Admin as a where a.email=:e and a.password=:p";
		
		Query<Admin> q =session.createQuery(query, Admin.class);
		q.setParameter("e", email);
		q.setParameter("p", password);
		try {
			admin = q.uniqueResult();
		}
		catch (Exception e) {
			throw new RuntimeException("Some error occured  while retrieving Admin "+e);
		}
		finally {
			session.close();
		}	
		return admin;
		
	}
	
	public int updateAdmin(int adminId, String adminPassword) {
		
		Transaction tx= null;
		int updatedRow =0;
		try (Session session=HibernateUtil.getSessionFactory().openSession()){
			
			tx=session.beginTransaction();
			
			String query="update Admin a set password=:p where a.adminId=:i";
			
			@SuppressWarnings("rawtypes")
			Query q=session.createQuery(query);
			q.setParameter("p", adminPassword);
			q.setParameter("i", adminId);
			updatedRow=q.executeUpdate();			
			tx.commit();
			session.close();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		return updatedRow;
	}

}
