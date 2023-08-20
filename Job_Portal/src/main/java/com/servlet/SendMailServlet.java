package com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

import org.apache.naming.java.javaURLContextFactory;
import org.eclipse.tags.shaded.org.apache.bcel.generic.AALOAD;

import com.DB.DBConnect;
import com.dao.AppliedJobsDAO;
import com.dao.UserDAO;
import com.entity.Jobs;
import com.entity.User;
import com.entity.Applied_jobs;

@WebServlet("/send_mail")
public class SendMailServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int job_id = Integer.parseInt(req.getParameter("job_id"));
			int user_id = Integer.parseInt(req.getParameter("user_id"));

			Applied_jobs a = new Applied_jobs();

			a.setJob_id(job_id);
			a.setUser_id(user_id);

			HttpSession session = req.getSession();

			AppliedJobsDAO dao = new AppliedJobsDAO(DBConnect.getConn());
			boolean f = dao.addAppliedJobs(a);

			
			String company = req.getParameter("company");
			String mail = req.getParameter("email");
			String name = req.getParameter("name");

			// SMTP server information
			String host = "smtp.gmail.com";
			String port = "587";
			String mailFrom = "jobportal828@gmail.com";
			String password = "ypdflooxidokcsrk";

			// outgoing message information
			String mailTo = mail;
			String subject = "Thank you for applying to " + company;
			String message = "Hi " + name + " ,\r\n" + "Thank you for your interest in " + company
					+ " ! Your application has been received and we will do our best to review it within 3-5 business days, but appreciate your patience as we receive a high volume of applications.\r\n"
					+ "If your background is a fit, you will hear from us with regard to next steps. We look forward to meeting you!\r\n"
					+ "Warmly,\r\n" + company + " People Team\r\n"
					+ "** Please note: Do not reply to this email. This email is sent from an unattended mailbox. Replies will not be read ";

			SendMailServlet mailer = new SendMailServlet();

			try {

				mailer.sendPlainTextEmail(host, port, mailFrom, password, mailTo, subject, message);

				session.setAttribute("succMsg", "Job applied succesfully");
				session.setAttribute("msgStatus", "success");
			} catch (Exception ex) {
				session.setAttribute("succMsg", "Something went wrong");
				session.setAttribute("msgStatus", "fail");
				ex.printStackTrace();
			}
			resp.sendRedirect("home.jsp");

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
