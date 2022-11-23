package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "flight")
public class Flight {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "flight_id")
	private int flightId;
	
	@Column(name = "flight_name")
	private String flightName;
	
	@Column(name = "flight_source")
	private String source;
	
	@Column(name = "flight_destination")
	private String destination;
	
	@Column(name = "flight_days",length = 255)
	private String days;
	
	@Column(name = "ticket_price")
	private double ticketPrice;
	
	
	

	public Flight() {
		
	}

	public Flight(String flightName, String source, String destination, String days, double ticketPrice) {
		super();
		this.flightName = flightName;
		this.source = source;
		this.destination = destination;
		this.days = days;
		this.ticketPrice = ticketPrice;
	}

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
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

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public double getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	
	
	@Override
	public String toString() {
		return "Flight [flightId=" + flightId + ", flightName=" + flightName + ", source=" + source + ", destination="
				+ destination + ", days=" + days + ", ticketPrice=" + ticketPrice + "]";
	}
	
	
	
}
