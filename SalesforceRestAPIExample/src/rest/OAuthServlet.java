package rest;

import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/**
 * Name : OAuthServlet 
 * Author : Anjita 
 * Date : 16/02/2016 
 * Usage : OAuthServlet class for setting login credentials of salesforce.
 */
public class OAuthServlet {

	public static JSONObject oAuthSessionProvider(String loginHost, String username,
			String password, String clientId, String secret)
			throws HttpException, IOException, JSONException {
		// Set up an HTTP client that makes a connection to REST API.
	     
        // Step 0:  Connect to SalesForce.
        System.out.println("Getting a token");
        String tokenUrl = loginHost + "/services/oauth2/token";
        HttpClient httpclient = new HttpClient();
        PostMethod post = new PostMethod(tokenUrl);     
        post.addParameter("grant_type", "password");
        post.addParameter("client_id", clientId);
        post.addParameter("client_secret", secret);
        post.addParameter("username", username);
        post.addParameter("password", password);
        System.out.println(post.toString());
        try {
            httpclient.executeMethod(post);
            try {
                JSONObject authResponse = new JSONObject(new JSONTokener(new InputStreamReader(post.getResponseBodyAsStream())));
                System.out.println("Auth response: " + authResponse.toString(2));
                return authResponse;
            } catch (JSONException e) {
                e.printStackTrace();                
            }
        } catch (HttpException e1) {
            e1.printStackTrace();
        } catch (IOException e1) {
            e1.printStackTrace();
        } finally {
            post.releaseConnection();
        }   
		
		return null;
	}
}
