import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sforce.soap.enterprise.LoginResult;
import com.sforce.soap.enterprise.SessionHeader;
import com.sforce.soap.enterprise.SforceServiceLocator;
import com.sforce.soap.enterprise.SoapBindingStub;
import com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactBindingStub;
import com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactServiceLocator;

/**
 * Name : WebServiceCallout 
 * Author : Anjita 
 * Date : 15/02/2016 
 * Usage : class to Query Contacts and Create Student using SOAP.
 */
public class WebServiceCallout {
	public static void main(String[] args) {
		System.out.println("start of program");
		try { 
			SoapBindingStub bind = (SoapBindingStub) new SforceServiceLocator()
					.getSoap();					
			// Get a stub for calling enterprise WSDL's login method in order to get SessionID
			LoginResult lr = bind.login("anjita@salesforce.com", "krishna@7ldMw84MGwfii9cCrUny0asGs");

			// Create a sessionHeader object and set its sessionId property to sessionId received in loginResult object
			SessionHeader sh = new SessionHeader();
			sh.setSessionId(lr.getSessionId());

			// Create a service locator object for your custom web service
			WebServiceContactServiceLocator locator = new WebServiceContactServiceLocator();

			// Get URL for your custom web service
			URL url = new URL(locator.getWebServiceContactAddress());

			// Create a stub for your custom web service with URL for your service and locator as parameters
			WebServiceContactBindingStub stub = new WebServiceContactBindingStub(
					url, locator);

			// Set the header property of stub with name "SessionHeader" and value as sh-sessionHeader object created above
			stub.setHeader(locator.getWebServiceContactAddress(),
					"SessionHeader", sh);

			System.out.println(stub.queryForContact("Select Name From Contact"));
			String inputStr = "11-11-2012";
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date inputDate = dateFormat.parse(inputStr);
			System.out.println(stub.createNewStudent("WebServiceStudent1", "a0928000007Jj3y", "Female", inputDate));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}