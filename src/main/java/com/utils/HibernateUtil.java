package com.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.model.Admin;
import com.model.Booking;
import com.model.Flight;

public class HibernateUtil {
	private static SessionFactory sf;
	
	public static SessionFactory getSessionFactory() {
		if(sf!=null) return sf;
		//creating cfg obj and providing db and class mapping info
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		cfg.addAnnotatedClass(Admin.class);
		cfg.addAnnotatedClass(Flight.class);
		cfg.addAnnotatedClass(Booking.class);
		
		//build and return sessionfactory obj
		sf=cfg.buildSessionFactory();
		return sf;
		
	}

}
