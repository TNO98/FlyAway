package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "admin_id")
	private  int adminId;
	@Column(name = "email")
	private  String email;
	@Column(name = "password")
	private  String password;
	
	
	
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	


	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", userName=" + email + ", password=" + password + "]";
	}
	
}
