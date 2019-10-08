package com.project.splace.member.model.vo;

public class MailVO {

private String from;
private String to;
private String subject;
private String contents;
private String temp;

public MailVO() {}



public MailVO(String from, String to, String subject, String contents, String temp) {
	super();
	this.from = from;
	this.to = to;
	this.subject = subject;
	this.contents = contents;
	this.temp = temp;
}





public String getFrom() {
	return from;
}


public void setFrom(String from) {
	this.from = from;
}


public String getTo() {
	return to;
}


public void setTo(String to) {
	this.to = to;
}


public String getSubject() {
	return subject;
}


public void setSubject(String subject) {
	this.subject = subject;
}


public String getContents() {
	return contents;
}


public void setContents(String contents) {
	this.contents = contents;
}


public String getTemp() {
	return temp;
}

public void setTemp(String temp) {
	this.temp = temp;
}





}
