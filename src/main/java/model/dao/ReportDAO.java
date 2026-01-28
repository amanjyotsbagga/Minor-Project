package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;

import model.Database;
import model.entity.Report;

public class ReportDAO {
	
	
	
	
	
	
	public int insertReport(Report report) {
		String sql = "INSERT INTO Reports (citizen_id, category_id, location_address, pincode, first_observed_at, title, description, latitude, longitude) "+
	"VALUES (?,?,?,?,?,?,?,?,?)";
		
		try (Connection conn = Database.getConnection();
				PreparedStatement prep = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
			prep.setLong(1, report.getCitizenId());
			prep.setInt(2, report.getCategoryId());
			prep.setString(3, report.getLocationAddress());
			prep.setString(4, report.getPincode());
			String dateString = report.getFirstObservedAt();
			if (dateString != null && !dateString.isEmpty()) {
	            // Converts String -> LocalDate -> java.sql.Date
	            LocalDate localDate = LocalDate.parse(dateString); 
	            prep.setDate(5, java.sql.Date.valueOf(localDate));
	        } else {
	            // Handle error: The DB column is NOT NULL, so this cannot be null.
	            // You might want to throw an exception or set a default (like today).
	            prep.setDate(5, java.sql.Date.valueOf(LocalDate.now())); 
	        }
			
			prep.setString(6, report.getTitle());
			prep.setString(7, report.getDescription());
			prep.setString(8, report.getLatitude());
			prep.setString(9, report.getLongitude());
			int affectedRow = prep.executeUpdate();
			if (affectedRow > 0) {
		        try (ResultSet generatedKeys = prep.getGeneratedKeys()) {
		            if (generatedKeys.next()) {
		                return generatedKeys.getInt(1);
		            }
		        }
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public int getCategoryId(String departmentName, String categoryName) {
	    String sql = "SELECT c.category_id " +
	                 "FROM Categories c " +
	                 "JOIN Departments d ON c.department_id = d.department_id " +
	                 "WHERE d.department_name = ? AND c.category_name = ?";

	    try (Connection conn = Database.getConnection();
	         PreparedStatement prep = conn.prepareStatement(sql)) {

	        prep.setString(1, departmentName); 
	        prep.setString(2, categoryName);

	        try (ResultSet rs = prep.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt("category_id");
	            }
	        }
	    } catch (Exception e) {
	        System.err.println("Error fetching Category ID: " + e.getMessage());
	        e.printStackTrace();
	    }
	    // Return -1 if not found
	    return -1;
	}
	
	
	
	// Add this method to your model.dao.ReportDAO class
	public void saveReportImages(int reportId, List<String> imageUrls) {
	    // SQL to insert image. We set upload_type to 'BEFORE' because this is the initial complaint
	    String sql = "INSERT INTO Report_Media (report_id, file_path, upload_type) VALUES (?, ?, 'BEFORE')";
 
	    try (Connection conn = Database.getConnection(); // Assuming you have a DBConnection class
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        for (String url : imageUrls) {
	            ps.setInt(1, reportId);
	            ps.setString(2, url);
	            
	            // Execute the insert for this specific URL
	            ps.executeUpdate();
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}
