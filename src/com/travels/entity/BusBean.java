package com.travels.entity;
public class BusBean {
	private int busid;
	private String bustype;
	private String busnumber;
	private int capacity;
	private int travelid;
	
	public int getTravelid() {
		return travelid;
	}
	public void setTravelid(int travelid) {
		this.travelid = travelid;
	}
	public int getBusid() {
		return busid;
	}
	public void setBusid(int bus_id) {
		this.busid = bus_id;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getBusnumber() {
		return busnumber;
	}
	public void setBusnumber(String busnumber) {
		this.busnumber = busnumber;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
}
