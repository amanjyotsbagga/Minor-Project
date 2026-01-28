package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.dao.ReportDAO;
import model.entity.Citizen;
import model.entity.Report;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@WebServlet("/SubmitGrievanceServlet")
@MultipartConfig(
	    maxFileSize = 1024 * 1024 * 10, // 10MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
	)
public class SubmitGrievanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Cloudinary cloudinary;
	
	@SuppressWarnings("unchecked")
	@Override
    public void init() throws ServletException {
        Map config = new HashMap();
        config.put("cloud_name", "dn6hkqmrt");
        config.put("api_key", System.getenv("api_key"));
        config.put("api_secret", System.getenv("api_secret"));
        config.put("secure", true);
        cloudinary = new Cloudinary(config);
    }
	
	
	public SubmitGrievanceServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Citizen citizen = (Citizen) session.getAttribute("citizen");
		Long citizenId = citizen.getId();
		if(citizenId == null) {
			String error = URLEncoder.encode("you can not Submit the report first login! or the session expire Re-login then try again", "UTF-8");
		    response.sendRedirect("citizen/login.jsp?error=" + error);
            return;
		}
		 String department = request.getParameter("department");
         String category = request.getParameter("category");
         String subject = request.getParameter("subject");
         String description = request.getParameter("description");
         String location = request.getParameter("location");
         String pincode = request.getParameter("pincode");
         String dateObserved = request.getParameter("dateObserved");
         String latitude = request.getParameter("latitude");
         String longitude = request.getParameter("longitude");
         ReportDAO reportDAO = new ReportDAO(); 
         List<String> imageUrls = new ArrayList<>();
        	 try {
                 // 3. Handle File Uploads
                 Collection<Part> parts = request.getParts();
                 
                 for (Part part : parts) {
                     // Check if the part is the file input AND has content
                     if (part.getName().equals("attachments") && part.getSize() > 0) {
                         
                         // Log for debugging
                         System.out.println("Processing file: " + part.getSubmittedFileName() + " Size: " + part.getSize());
                         
                         String imageUrl = uploadToCloudinary(part);
                         if (imageUrl != null) {
                             imageUrls.add(imageUrl);
                             System.out.println("Uploaded successfully: " + imageUrl);
                         } else {
                             System.err.println("Failed to upload file: " + part.getSubmittedFileName());
                         }
                     }
                 }
        	 
        	 System.out.println("department, category : "+department+" , "+category);
             // Get category ID from your database based on department and category
             int categoryId = reportDAO.getCategoryId(department, category);
             System.out.println("category id : "+categoryId);
             Report report = new Report(citizenId, categoryId, location, pincode, dateObserved,subject , description, latitude, longitude);
             // Insert into Reports table
             int reportId = reportDAO.insertReport(report);
             if(reportId != 0) {
            	// If the report was saved and we have images, save them to Report_Media
            	    if (imageUrls != null && !imageUrls.isEmpty()) {
            	        reportDAO.saveReportImages(reportId, imageUrls);
            	    }
             // Redirect with success message
             response.sendRedirect("citizen/submitTest.jsp?success=true&reportId=" + reportId);
             }else {
            	 response.sendRedirect("citizen/submitTest.jsp?error=true");
             }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	@SuppressWarnings("unchecked")
    private String uploadToCloudinary(Part filePart) {
        try {
            // FIX: Read bytes into memory. This is more stable than passing the InputStream directly.
            byte[] fileBytes = filePart.getInputStream().readAllBytes();
            
            if(fileBytes.length == 0) return null;

            // Upload to Cloudinary
            Map<String, Object> uploadResult = cloudinary.uploader().upload(
                fileBytes,
                ObjectUtils.asMap("resource_type", "auto")
            );
            
            return (String) uploadResult.get("url");
            
        } catch (Exception e) {
            System.err.println("Cloudinary Upload Error: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
	
	
	

}
