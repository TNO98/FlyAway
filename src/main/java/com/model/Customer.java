package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customer")
public class Customer {
	
	// Personal Details
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "c_id")
	private int cusId;
	@Column(name = "c_name")
	private String cusName;
	@Column(name = "c_email")
	private String cusEmail;
	@Column(name = "c_phone")
	private String cusPhone;
	@Column(name = "c_address")
	private  String cusAddress;
	@Column(name = "c_passport_number")
	private String passportNumber;
		
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(String cusName, String cusEmail, String cusPhone, String cusAddress, String passportNumber) {
		super();
		this.cusName = cusName;
		this.cusEmail = cusEmail;
		this.cusPhone = cusPhone;
		this.cusAddress = cusAddress;
		this.passportNumber = passportNumber;
	}

	public int getCusId() {
		return cusId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getCusEmail() {
		return cusEmail;
	}

	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}

	public String getCusPhone() {
		return cusPhone;
	}

	public void setCusPhone(String cusPhone) {
		this.cusPhone = cusPhone;
	}

	public String getCusAddress() {
		return cusAddress;
	}

	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}
	
	
	
}
