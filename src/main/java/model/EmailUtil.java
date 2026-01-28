package model;

import com.sendgrid.*;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;
import java.io.IOException;

public class EmailUtil {

    // --- IMPORTANT ---

    private static final String SENDGRID_API_KEY = System.getenv("EMAIL_API");
    private static final String SENDER_EMAIL = "setu.verify@gmail.com"; 

    /**
     * Sends an email using the SendGrid API.
     * @param toEmail The recipient's email address.
     * @param subject The subject of the email.
     * @param body The HTML content of the email.
     * @throws IOException if the SendGrid API call fails.
     */
    public static void sendEmail(String toEmail, String subject, String body) throws IOException {
        
        Email from = new Email(SENDER_EMAIL);
        Email to = new Email(toEmail);
        Content content = new Content("text/html", body);
        Mail mail = new Mail(from, subject, to, content);

        SendGrid sg = new SendGrid(SENDGRID_API_KEY);
        Request request = new Request();

        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            
            Response response = sg.api(request);

            // Log the result for debugging
            System.out.println("EmailUtil: Sending email to " + toEmail);
            System.out.println("EmailUtil: SendGrid Status Code: " + response.getStatusCode());
            
            // Check for failure
            if (response.getStatusCode() < 200 || response.getStatusCode() >= 300) {
                System.err.println("EmailUtil: FAILED to send email.");
                System.err.println("EmailUtil: Response Body: " + response.getBody());
                throw new IOException("SendGrid API request failed with status code: " + response.getStatusCode());
            }

        } catch (IOException ex) {
            System.err.println("EmailUtil: Error sending email to " + toEmail);
            ex.printStackTrace();
            // Re-throw the exception so the calling thread knows it failed
            throw ex; 
        }
    }
}