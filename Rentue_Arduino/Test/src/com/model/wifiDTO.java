package com.model;

public class wifiDTO {

	private String flon;
	private String flat;
	private String chars;
	private String w_date;
	
	
	public wifiDTO(String flon, String flat, String chars, String w_date ) {
		super();
		this.flon = flon;
		this.flat = flat;
		this.chars = chars;
		this.w_date =  w_date;
	}
	
	public wifiDTO(String chars) {
		super();

		this.chars = chars;
	}
	
	
	
	public String getW_date() {
		return w_date;
	}

	public void setW_date(String w_date) {
		this.w_date = w_date;
	}

	public wifiDTO() {
		super();
	}
	

	public String getFlon() {
		return flon;
	}
	public void setFlon(String flon) {
		this.flon = flon;
	}
	public String getFlat() {
		return flat;
	}
	public void setFlat(String flat) {
		this.flat = flat;
	}

	public String getChars() {
		return chars;
	}
	public void setChars(String chars) {
		this.chars = chars;
	}
		
}
