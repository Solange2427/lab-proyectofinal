package controller.orders;
import java.io.IOException;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.*;

import controller.PMF;
import model.entity.*;

@SuppressWarnings("serial")
public class MailServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException {
		resp.setContentType("text/html");
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
		 PersistenceManager pm = PMF.get().getPersistenceManager(); 
		try {
			Order order =(Order)req.getAttribute("order");
			Message emailMessage = new MimeMessage(session);
			emailMessage.setFrom(new
					InternetAddress("mariequrrye@gmail.com", "The Author"));
			emailMessage.addRecipient(Message.RecipientType.TO, new
					InternetAddress(order.getEmail(), "The Reader"));
			emailMessage.setSubject("Pedido Realizado con exito");
			Product prod =  pm.getObjectById(Product.class, order.getProduct());
			String message = "Receptor: "+order.getName()+"\nRUC: "+order.getRuc()+"\nProducto: "+prod.getNombre()+"\nCantidad: "+order.getNumber()+"\nDetalles: "+order.getDetails()+"\nGRACIAS."; 
			emailMessage.setText(message);
			Transport.send(emailMessage);
			resp.getOutputStream().println("Message sent!");
			
			resp.sendRedirect("/orders/view?orderId="+order.getIdOrder());
		} catch (AddressException e) {
		} catch (MessagingException e) {
		}
	}
}