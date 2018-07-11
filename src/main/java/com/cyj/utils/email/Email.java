package com.cyj.utils.email;


import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Properties;

public class Email {
	
	// 发送信息到用户的登录邮箱
	public static String sendEmail(String email) throws Exception{
		String random="";
		try {
			final Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", "smtp.qq.com");
			props.put("mail.user", "1249629019@qq.com");
			props.put("mail.password", "myhfrcbezkwpjfgh");
			// 开启ssl加密，如果没有ssl加密，会报530错误
			MailSSLSocketFactory sf;
			sf = new MailSSLSocketFactory();

			sf.setTrustAllHosts(true);
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.socketFactory", sf);
			Authenticator authenticator = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String userName = props.getProperty("mail.user");
					String password = props.getProperty("mail.password");
					return new PasswordAuthentication(userName, password);
				}
			};
			Session mailSession = Session.getInstance(props, authenticator);
			MimeMessage message = new MimeMessage(mailSession);

			// 发件人
			InternetAddress form = new InternetAddress(
					props.getProperty("mail.user"));
			message.setFrom(form);
			// 收件人
			InternetAddress to = new InternetAddress(email);
			message.setRecipient(RecipientType.TO, to);
			// 设置抄送
			// InternetAddress cc=new InternetAddress("")
			// 设置邮件标题
			message.setSubject("请及时接收验证码");
			random=(int)((Math.random()*9+1)*100000)+"";
			// 设置邮箱的内容体
			message.setContent("尊敬的用户，您正在注册TOLD博客网，验证码："+random+",如非本人操作，请忽略此邮箱！",
					"text/html;charset=UTF-8");
			// 发送邮件
 			Transport.send(message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			random="";
			System.out.println("邮箱有误");
//			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
		return random;

	}

}
