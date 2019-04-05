package com.cdac.mail;
import java.util.Properties;
import com.cdac.otp.OTP2;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
public class SendMail {
	static OTP2 otp=new OTP2();
	static String kl=new String(otp.OTP(6));
	public static void send(String touser)
	{
		String password="78124596";
		String from="ovs.electioncommission@gmail.com";
		String to=touser;
		String sub="Election Commission of India";
		String msg="One Time Password for Online Voting System 2018 SignUp Authentication is:"+kl;
		Properties props=new Properties();
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.socketFactory,class","javax.net.ssl.+");
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.port","587");
		
		Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,password);
			}
		});
		try
		{
			MimeMessage message=new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			Transport.send(message);
			System.out.println("message sent successfully");
			}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	}
		public static String getOTP()
		{
			return kl;
	}
	
}
