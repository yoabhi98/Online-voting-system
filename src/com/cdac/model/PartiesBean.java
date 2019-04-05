package com.cdac.model;

import java.util.List;

public class PartiesBean {
	private String PartyName,LeaderName;
	private long votes;
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPartyName() {
		return PartyName;
	}
	public void setPartyName(String partyName) {
		PartyName = partyName;
	}
	public String getLeaderName() {
		return LeaderName;
	}
	public void setLeaderName(String leaderName) {
		LeaderName = leaderName;
	}
	public long getVotes() {
		return votes;
	}
	public void setVotes(long votes) {
		this.votes = votes;
	}
}
