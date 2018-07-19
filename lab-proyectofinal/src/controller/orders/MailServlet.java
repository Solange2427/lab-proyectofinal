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

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Order;


@SuppressWarnings("serial")
public class MailServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException {
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();
		PersistenceManager       pm       =       PMF.get().getPersistenceManager(); 

		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
			
			Message emailMessage = new MimeMessage(session);
			try {
				Key  k =  KeyFactory.createKey(Order.class.getSimpleName(), new Long(req.getParameter("id")).longValue()); 
				Order o =  pm.getObjectById(Order.class, k);   

				emailMessage.setFrom(new InternetAddress("mquispeyn@unsa.edu.pe"));
				emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(Usuario.getEmail()));
				emailMessage.setSubject("REY DE REYES");
				String message = "Su pedido registrado \n"+ "Receptor: "+o.getName()+"\nRUC: "+o.getRuc()
				+"\nEmail: "+o.getEmail()+"\nProducto:"	+o.getProduct()+"\nCantidad: "+o.getNumber()+"\nDetalles: "+o.getDetails()+"\nMUCHAS GRACIAS, VUELVA PRONTO!";
				emailMessage.setText(message);
				Transport.send(emailMessage);
				resp.getOutputStream().println("Message sent!PEDIDO REGISTRADO, REVISE SU CORREO"); 
//			
		} catch (AddressException e) {} catch (MessagingException e) {
		}
			
	}
}