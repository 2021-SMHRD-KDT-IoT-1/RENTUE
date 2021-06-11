package com.model;

public class MessageDTO {
	
	private int msg_num;
	private String rent_id;
	private String msg_title;
	private String msg_text;
	
	public MessageDTO(int msg_num, String rent_id, String msg_title, String msg_text) {
		super();
		this.msg_num = msg_num;
		this.rent_id = rent_id;
		this.msg_title = msg_title;
		this.msg_text = msg_text;
	}

	public MessageDTO(String rent_id, String msg_title, String msg_text) {
		super();
		this.rent_id = rent_id;
		this.msg_title = msg_title;
		this.msg_text = msg_text;
	}

	public int getMsg_num() {
		return msg_num;
	}

	public String getRent_id() {
		return rent_id;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public String getMsg_text() {
		return msg_text;
	}
		
}
