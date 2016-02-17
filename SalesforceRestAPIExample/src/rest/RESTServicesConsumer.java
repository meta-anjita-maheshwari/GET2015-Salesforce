package rest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Name : RESTServicesConsumer 
 * Author : Anjita 
 * Date : 16/02/2016 
 * Usage : class to Query Contacts and Create Student using REST HttpPost.
 */
public class RESTServicesConsumer {

	static final String USERNAME = "anjita@salesforce.com";
	static final String PASSWORD = "krishna@7ldMw84MGwfii9cCrUny0asGs";
	static final String LOGINURL = "https://login.salesforce.com";
	static final String GRANTSERVICE = "/services/oauth2/token?grant_type=password";
	static final String CLIENTID = "3MVG9ZL0ppGP5UrCU0gMgib5f4prj.O9e0FlgsDsc.q5hCGh6p0hAuDA5TlBsSNDwsdAsWfGsM8gB0LKKLvuL";
	static final String CLIENTSECRET = "2208794727404487385";
	private static String REST_ENDPOINT = "/services/data";
	private static String API_VERSION = "/v32.0";
	private static String baseUri;
	private static Header oauthHeader;
	private static Header prettyPrintHeader = new BasicHeader("X-PrettyPrint",
			"1");
	private static String studentId;

	public static void main(String[] args) throws ParseException, IOException {

		JSONObject authJsonObject = OAuthServlet.oAuthSessionProvider(LOGINURL,
				USERNAME, PASSWORD, CLIENTID, CLIENTSECRET);

		String loginAccessToken = null;

		try {
			loginAccessToken = authJsonObject.getString("access_token");
		} catch (JSONException jsonException) {
			jsonException.printStackTrace();
		}

		baseUri = "https://ap2.salesforce.com" + REST_ENDPOINT + API_VERSION;
		oauthHeader = new BasicHeader("Authorization", "OAuth "
				+ loginAccessToken);
		System.out.println("oauthHeader1: " + oauthHeader);
		System.out.println("Successful login");
		System.out.println("access token/session ID: " + loginAccessToken);
		System.out.println("baseUri: " + baseUri);

		// Run codes to query, insert, update and delete records in Salesforce
		// using REST API
		queryContacts();
		createStudent();
	}

	/**
	 * Query Contacts using REST HttpGet
	 */
	public static void queryContacts() {
		System.out.println("\n_______________ Contacts QUERY _______________");
		try {

			// Set up the HTTP objects needed to make the request.
			HttpClient httpClient = HttpClientBuilder.create().build();

			String uri = baseUri + "/query?q=SELECT+Id+FROM+Contact";
			System.out.println("Query URL: " + uri);
			HttpGet httpGet = new HttpGet(uri);
			System.out.println("oauthHeader2: " + oauthHeader);
			httpGet.addHeader(oauthHeader);
			httpGet.addHeader(prettyPrintHeader);

			// Make the request.
			HttpResponse response = httpClient.execute(httpGet);

			// Process the result
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode == 200) {
				String response_string = EntityUtils.toString(response
						.getEntity());
				try {
					JSONObject json = new JSONObject(response_string);
					System.out.println("JSON result of Query:\n"
							+ json.toString(1));
					json.getJSONArray("records");

				} catch (JSONException je) {
					je.printStackTrace();
				}
			} else {
				System.out
						.println("Query was unsuccessful. Status code returned is "
								+ statusCode);
				System.out.println("An error has occured. Http status: "
						+ response.getStatusLine().getStatusCode());
				System.out.println(getBody(response.getEntity().getContent()));
				System.exit(-1);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NullPointerException npe) {
			npe.printStackTrace();
		}
	}

	/**
	 * Create Student using REST HttpPost
	 */
	public static void createStudent() {
		System.out.println("\n_______________ Student INSERT _______________");

		String uri = baseUri + "/sobjects/Student__c/";
		try {

			// create the JSON object containing the new student details.
			JSONObject student = new JSONObject();
			student.put("Name", "REST API New");
			student.put("Class__c", "a0928000007Jj3y");
			student.put("Last_Name__c", "Student");

			System.out.println("JSON for student record to be inserted:\n"
					+ student.toString(1));

			// Construct the objects needed for the request
			HttpClient httpClient = HttpClientBuilder.create().build();

			HttpPost httpPost = new HttpPost(uri);
			httpPost.addHeader(oauthHeader);
			httpPost.addHeader(prettyPrintHeader);
			// The message we are going to post
			StringEntity body = new StringEntity(student.toString(1));
			body.setContentType("application/json");
			httpPost.setEntity(body);

			// Make the request
			HttpResponse response = httpClient.execute(httpPost);

			// Process the results
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode == 201) {
				String response_string = EntityUtils.toString(response
						.getEntity());
				JSONObject json = new JSONObject(response_string);
				// Store the retrieved student id to use when we update the student.
				studentId = json.getString("id");
				System.out
						.println("New Student id from response: " + studentId);
			} else {
				System.out
						.println("Insertion unsuccessful. Status code returned is "
								+ statusCode);
			}
		} catch (JSONException e) {
			System.out.println("Issue creating JSON or processing results");
			e.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NullPointerException npe) {
			npe.printStackTrace();
		}
	}

	private static String getBody(InputStream inputStream) {
		String result = "";
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(
					inputStream));
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				result += inputLine;
				result += "\n";
			}
			in.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		return result;
	}
}
