package com.cdac.model;

public class NominationBean {
private String CandidateName,PartyName,CandidateEmail,CandidatePass,Address,Mobile,gender;
private String Status;
private int votes;

public int getVotes() {
	return votes;
}
public void setVotes(int votes) {
	this.votes = votes;
}

public String getStatus() {
	return Status;
}
public void setStatus(String status) {
	Status = status;
}

private long CandidateAadhar;


public long getCandidateAadhar() {
	return CandidateAadhar;
}
public void setCandidateAadhar(long candidateAadhar) {
	CandidateAadhar = candidateAadhar;
}
public String getMobile() {
	return Mobile;
}
public void setMobile(String mobile) {
	Mobile = mobile;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getCandidateName() {
	return CandidateName;
}
public void setCandidateName(String candidateName) {
	CandidateName = candidateName;
}
public String getPartyName() {
	return PartyName;
}
public void setPartyName(String partyName) {
	PartyName = partyName;
}

public String getCandidateEmail() {
	return CandidateEmail;
}
public void setCandidateEmail(String candidateEmail) {
	CandidateEmail = candidateEmail;
}
public String getCandidatePass() {
	return CandidatePass;
}
public void setCandidatePass(String candidatePass) {
	CandidatePass = candidatePass;
}
}