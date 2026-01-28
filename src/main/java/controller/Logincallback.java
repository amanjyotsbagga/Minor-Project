package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.CitizenDAO;
import model.entity.Citizen;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/Logincallback")
public class Logincallback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Logincallback() {
		super();
	}
	
	// --- !! IMPORTANT !! ---
    // Store these securely! Don't hard-code them in a real app.
    // Read them from a .properties file or environment variables.
    private static final String CLIENT_ID = System.getenv("CLIENT_ID");
    private static final String CLIENT_SECRET = System.getenv("CLIENT_SECRET");
    
    // This MUST exactly match one of the URIs in your Google Console
    private static final String REDIRECT_URI = "https://ionstack.site/Logincallback";
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// --- STEP 1: Get the authorization code ---
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            // Error: Google didn't give us a code.
            response.sendRedirect("citizen/login.jsp?error=Google-Login-Failed");
            return;
        }

        String accessToken = null;
        try {
            // --- STEP 2: Exchange the code for an Access Token ---
            
            // Build the parameter string for the POST request
            StringBuilder postData = new StringBuilder();
            postData.append("code=").append(URLEncoder.encode(code, "UTF-8"));
            postData.append("&client_id=").append(URLEncoder.encode(CLIENT_ID, "UTF-8"));
            postData.append("&client_secret=").append(URLEncoder.encode(CLIENT_SECRET, "UTF-8"));
            postData.append("&redirect_uri=").append(URLEncoder.encode(REDIRECT_URI, "UTF-8"));
            postData.append("&grant_type=").append(URLEncoder.encode("authorization_code", "UTF-8"));
            String parameters = postData.toString();

            // Open connection to Google's token endpoint
            URL url = new URL("https://oauth2.googleapis.com/token");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true); // We are sending data

            // Write the parameters
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = parameters.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Read the JSON response (which contains the access token)
            StringBuilder jsonResponse = new StringBuilder();
            try (BufferedReader br = new BufferedReader(
                    new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                String responseLine = null;
                while ((responseLine = br.readLine()) != null) {
                    jsonResponse.append(responseLine.trim());
                }
            }
            
            // Parse the JSON to get the access_token
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(jsonResponse.toString(), JsonObject.class);
            accessToken = jsonObject.get("access_token").getAsString();
            
        } catch (Exception e) {
            // Failed to get token
            e.printStackTrace();
            response.sendRedirect("citizen/login.jsp?error=Token-Exchange-Failed");
            return;
        }


        // --- STEP 3: Use the Access Token to get User Info ---
        
        String userProfileJson = null;
        if (accessToken != null) {
            try {
                // Make a GET request to the Google People API
                String peopleApiUrl = "https://people.googleapis.com/v1/people/me?personFields=names,emailAddresses";
                URL url = new URL(peopleApiUrl);
                
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                
                // Set the Authorization header (our "valet key")
                connection.setRequestProperty("Authorization", "Bearer " + accessToken);

                // Read the JSON response (the user's profile)
                StringBuilder responseBuilder = new StringBuilder();
                try (BufferedReader br = new BufferedReader(
                        new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                    String responseLine = null;
                    while ((responseLine = br.readLine()) != null) {
                        responseBuilder.append(responseLine.trim());
                    }
                }
                userProfileJson = responseBuilder.toString();

            } catch (Exception e) {
                // Failed to get user info
                e.printStackTrace();
                response.sendRedirect("citizen/login.jsp?error=Profile-Fetch-Failed");
                return;
            }
        }
        
        // --- STEP 4: Parse the User Info ---
        //String displayName = null;
        String email = null;
        
        try {
            Gson gson = new Gson();
            JsonObject profileObject = gson.fromJson(userProfileJson, JsonObject.class);
            
            // Get the "names" array
//            JsonArray namesArray = profileObject.getAsJsonArray("names");
//            if (namesArray != null && namesArray.size() > 0) {
//                // Get the first name object
//                JsonObject nameObject = namesArray.get(0).getAsJsonObject();
//                // Get the "displayName"
//                displayName = nameObject.get("displayName").getAsString();
//            }
            
            // Get the "emailAddresses" array
            JsonArray emailArray = profileObject.getAsJsonArray("emailAddresses");
            if (emailArray != null && emailArray.size() > 0) {
                // Get the first email object
                JsonObject emailObject = emailArray.get(0).getAsJsonObject();
                // Get the "value" (the actual email)
                email = emailObject.get("value").getAsString();
            } 

        } catch (Exception e) {
            // Failed to parse user info
            e.printStackTrace();
            response.sendRedirect("citizen/login.jsp?error=Profile-Parse-Failed");
            return;
        }
        
        if(email == null || email.isEmpty()) {
        	String error = URLEncoder.encode("The google not have information about you", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
		    return;
        }
        
        CitizenDAO citizenDao = new CitizenDAO();
		Citizen citizen = citizenDao.findByEmail(email);
		
		if (citizen == null) {
        	String error = URLEncoder.encode("Account not found or This google account not registered in the Setu portal.", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
            return;
        }
		
		if (!citizen.getIsVerified()) {
            Registration.sendVerificationOtp(citizen, citizenDao, request, response);
            return;
        }
		
		try {
        	HttpSession session = request.getSession(true);        	
        	session.setAttribute("citizen", citizen);


            //update last login for user :
            boolean lastLogin  = citizenDao.updateLastLogin(citizen.getEmail());
            if (lastLogin) {
				System.out.println("Last login update for email : "+citizen.getEmail());
			}
            
            // Redirect to the citizen dashboard/home page
            response.sendRedirect(request.getContextPath() + "/citizen/dashboard.jsp"); 
            
		} catch (Exception e) {
			System.err.println("Error storing user in session ! " + e.getMessage());
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}