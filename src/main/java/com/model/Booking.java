package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "booking")
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int bookingId;
	private String cName;
	private String cEmail;
	private String cPassport;
	private String mobile;
	
	private String source;
	private String destination;
	private String dateOfBooking;
	private String flightName;
	private int noOfPerson;
	private double totalTicketPrice;
	
	
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getDateOfBooking() {
		return dateOfBooking;
	}
	public void setDateOfBooking(String dateOfBooking) {
		this.dateOfBooking = dateOfBooking;
	}
	
	public String getcPassport() {
		return cPassport;
	}
	public void setcPassport(String cPassport) {
		this.cPassport = cPassport;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public int getNoOfPerson() {
		return noOfPerson;
	}
	public void setNoOfPerson(int noOfPerson) {
		this.noOfPerson = noOfPerson;
	}
	public double getTotalTicketPrice() {
		return totalTicketPrice;
	}
	public void setTotalTicketPrice(double totalTicketPrice) {
		this.totalTicketPrice = totalTicketPrice;
	}
		

}
