package com.stms.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailSender {
	private static String to;
	private static String from = "no-reply@stms.cf";
	private static String subject;
	
	public static void sendMail(String addressTo, String userTo, String addressFrom, String mysubject, String body) 
	{
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  null);

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("nkosingphiless@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(addressTo));
			message.setSubject("Please confirm your STMS registration");
			message.setText(""
					+ "Click here to comfirm your registration"
					+ "");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}