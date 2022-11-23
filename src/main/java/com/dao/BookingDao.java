package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.Booking;
import com.utils.HibernateUtil;

public class BookingDao {
	
	public void saveBooking(Booking booking) {
		Transaction tx = null;
		try(Session session=HibernateUtil.getSessionFactory().openSession()) {
			tx=session.beginTransaction();
			session.save(booking);
			tx.commit();
			session.close();
			
			
		} catch (Exception e) {
			if(tx!=null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		
	}
	public List<Booking> getBooking(){
		Session session=HibernateUtil.getSessionFactory().openSession();
		List<Booking> bookings=session.createQuery("from Booking", Booking.class).list();
		
		return bookings;
		
	}
		
}
