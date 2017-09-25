package com.zdnet.utils;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	private final Properties prop = new Properties();
	private final Session session;
	private final Message msg;
	private final Transport transport;
	
	
	public static class Builder{
		private final String mailContent;
		private final String toAddress;
		
		private String debug = "true";
		private String auth = "true";
		private String host = "smtp.163.com";
		private String protocol = "smtp";
		
		private String subject = "验证邮件";
		private String fromAddress= "xzdGet2y@163.com";
		private String fromCount = "xzdGet2y";
		private String fromPassword = "ccx140166";
		public Builder Debug(String debug) {
			this.debug = debug;
			return this;
		}
		public Builder Subject(String subject) {
			this.subject = subject;
			return this;
		}
		public Builder Auth(String auth) {
			this.auth = auth;
			return this;
		}
		public Builder Host(String host) {
			this.host = host;
			return this;
		}
		public Builder FromCount(String fromCount) {
			this.fromCount = fromCount;
			return this;
		}
		public Builder FromAddress(String fromAddress) {
			this.fromAddress = fromAddress;
			return this;
		}
		public Builder FromPassword(String fromPassword) {
			this.fromPassword = fromPassword;
			return this;
		}
		public Builder(String mailContent, String toAddress) {
			this.mailContent = mailContent;
			this.toAddress = toAddress;
		}
		public Builder Protocol(String protocol) {
			this.protocol = protocol;
			return this;
		}
		public MailSender send() throws Exception{
			return new MailSender(this);
		}
		
	}
	private MailSender(Builder builder) throws Exception{
		prop.setProperty("mail.debug", builder.debug);
		prop.setProperty("mail.smtp.auth", builder.auth);
		prop.setProperty("mail.host", builder.host);
		prop.setProperty("mail.transport.protocol",builder.protocol);
		
		session = Session.getInstance(prop);
		msg = new MimeMessage(session);
		transport = session.getTransport();
		msg.setSubject(builder.subject);
		msg.setFrom(new InternetAddress(builder.fromAddress,"仲恺豆瓣"));
		transport.connect(builder.fromCount,builder.fromPassword);
		msg.setText(builder.mailContent);
		transport.sendMessage(msg, new Address[] {new InternetAddress(builder.toAddress)});
	}
	
}
