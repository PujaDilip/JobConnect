package com.servlet;
import com.dao.*;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.entity.User;

import jakarta.servlet.Registration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.DB.*;

@WebServlet("/add_user")
public class RegisterUserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String fname=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String skill=req.getParameter("skill");
			String experience=req.getParameter("experience");
			String pwd=req.getParameter("password");
			
			UserDAO dao=new UserDAO(DBConnect.getConn());
			
			User u=new User(fname,email,pwd,phno,skill,experience,"User");
			boolean f=dao.addUser(u);
			
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("succMsg","Registered succesfully ");
				session.setAttribute("msgStatus", "success");
				resp.sendRedirect("login.jsp");
				
			}
			else {
				session.setAttribute("succMsg","Something went wrong ");
				session.setAttribute("msgStatus", "fail");
				resp.sendRedirect("signup.jsp");
			}
			
			
			
			
			/* Registration successRegistration main */
			// SMTP server information
						String host = "smtp.gmail.com";
						String port = "587";
						String mailFrom = "jobportal828@gmail.com";
						String password = "ypdflooxidokcsrk";

						// outgoing message information
						String mailTo =email; 
						String subject = "Registration complete ";
						String message = "Thank you for regisering with JobConnect,\r\n"
								+ "Hope we help you find job you are looking for.Thank you."
								
								+ "Warmly,\r\n"
								+ " JobConnect Team\r\n"
								+ "** Please note: Do not reply to this email. This email is sent from an unattended mailbox. Replies will not be read ";

						SendMailServlet mailer = new SendMailServlet();

						try {

							mailer.sendPlainTextEmail(host, port, mailFrom, password, mailTo, subject, message);
							System.out.println("Email sent.");
						} catch (Exception ex) {
							System.out.println("Failed to sent email.");
							ex.printStackTrace();
						}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void sendPlainTextEmail(String host, String port, final String userName, final String password,
			String toAddress, String subject, String message) throws AddressException, MessagingException {

		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};

		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		Message msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		// set plain text message
		msg.setText(message);

		// sends the e-mail
		Transport.send(msg);

	}

}
