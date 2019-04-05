package com.cdac.model;

public class RegistrationBean {

	private String uname,fname,udob,address,uemail,password;
    private String ucontact,Status,gender;
   
public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

private long Aadhar;
 
	

	private String ugender;
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public long getAadhar() {
		return Aadhar;
	}

	public void setAadhar(long aadhar) {
		Aadhar = aadhar;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getUcontact() {
		return ucontact;
	}

	public void setUcontact(String ucontact) {
		this.ucontact = ucontact;
	}

	public String getUgender() {
		return ugender;
	}

	public void setUgender(String gender) {
		this.ugender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUdob() {
		return udob;
	}

	public void setUdob(String udob) {
		this.udob = udob;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
