package com.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.Flight;
import com.utils.HibernateUtil;

public class FlightDao {
	
	// save a flight to database
	public void saveFlight(Flight flight) {
		Transaction tx = null;
		try(Session session=HibernateUtil.getSessionFactory().openSession()) {
			tx=session.beginTransaction();
			session.save(flight);
			tx.commit();
			session.close();
			
		} catch (Exception e) {
			if(tx!=null) {
				tx.rollback();
			}
			e.printStackTrace();
			
		}
	}
	
	// get flights
	public List<Flight> getFlightList(String source, String destination, String day) {
		List<Flight> flightList = null;
		
		Session session =HibernateUtil.getSessionFactory().openSession();
		
		String query= "from Flight f where f.source=:s and f.destination=:d and f.days like :y";
		
		Query<Flight> q=session.createQuery(query, Flight.class);
		q.setParameter("s", source);
		q.setParameter("d", destination);
		q.setParameter("y", "%"+day+"%");

		flightList= q.list();		
		return flightList;
		
	}
	
	public List<Flight> allFlightList(){
		
		Session session=HibernateUtil.getSessionFactory().openSession();
		List<Flight> fl= session.createQuery("from Flight",Flight.class).list();
		session.close();
		return fl;
		
	}

}
