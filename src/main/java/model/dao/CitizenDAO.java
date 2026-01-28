package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import model.Database;
import model.entity.Citizen;

public class CitizenDAO {
	
/**
 * Insertion method
 * **/
	public Citizen save(Citizen citizen) {
		String sql = "INSERT INTO Citizens(full_name, email, password_hash, phone_number, address, civic_points, is_active, verification_token, is_verified)"
				+"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = Database.getConnection();
			 PreparedStatement prep = conn.prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS)) {
			    prep.setString(1, citizen.getFullName());
	            prep.setString(2, citizen.getEmail());
	            prep.setString(3, citizen.getPasswordHash());
	            prep.setString(4, citizen.getPhoneNumber()); 
	            prep.setString(5, citizen.getAddress());    
	            prep.setInt(6, citizen.getCivicPoints() != null ? citizen.getCivicPoints() : 0);
	            prep.setBoolean(7, citizen.getIsActive() != null ? citizen.getIsActive() : true);
	            prep.setString(8, citizen.getVerificationToken()); 
	            prep.setBoolean(9, citizen.getIsVerified() != null ? citizen.getIsVerified() : false);
	            
	            int affectedRows = prep.executeUpdate();
	            
	            if (affectedRows > 0) {
	                try (ResultSet generatedKeys = prep.getGeneratedKeys()) {
	                    if (generatedKeys.next()) {
	                        citizen.setId(generatedKeys.getLong(1));
	                        return citizen;
	                    }
	                }
	            }
		} catch (Exception e) {
			 System.err.println("Error saving new citizen: " + e.getMessage());
	            e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * update citizen OTP
	 * **/
	public boolean updateVerificationToken(Citizen savedCitizen) {
		String sql = "UPDATE Citizens SET verification_token = ? WHERE citizen_id = ?";
		try (Connection conn = Database.getConnection();
			  PreparedStatement prep = conn.prepareStatement(sql)) {
			prep.setString(1, savedCitizen.getVerificationToken());
			prep.setLong(2, savedCitizen.getId());
			int updateSuccess = prep.executeUpdate();
			if(updateSuccess > 0) {
				return true;
			}
		} catch (Exception e) {
			 System.err.println("Error saving new citizenVerificationToken(otp): " + e.getMessage());
	            e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * if citizen put correct OTP then Update the verifyCitizen to true
	 * **/
	
	public boolean verifyCitizen(long citizenId) {
	    String sql = "UPDATE Citizens SET is_verified = true, verification_token = NULL WHERE citizen_id = ?";
	    
	    try (Connection conn = Database.getConnection();
	         PreparedStatement prep = conn.prepareStatement(sql)) {
	        
	        prep.setLong(1, citizenId);
	        
	        int affectedRows = prep.executeUpdate();
	        return affectedRows > 0;
	        
	    } catch (Exception e) {
	        System.err.println("Error verifying citizen: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}
	
	/**
	 * find the citizen by email
	 * **/
	public Citizen findByEmail(String email) {
	    String sql = "SELECT * FROM Citizens WHERE email = ?";
	    Citizen citizen = null;
	    
	    try (Connection conn = Database.getConnection();
	         PreparedStatement prep = conn.prepareStatement(sql)) {
	        
	        prep.setString(1, email);
	        
	        try (ResultSet rs = prep.executeQuery()) {
	            if (rs.next()) {
	                citizen = mapResultSetToCitizen(rs);
	            }
	        }
	        
	    } catch (Exception e) {
	        System.err.println("Error finding citizen by email: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return citizen;
	}
	
	/**
	 * find the phoneNumber 
	 * **/
	public boolean findPhoneNumber(String phoneNumber) {
		if (phoneNumber == null || phoneNumber.isEmpty()) {
	        return false;
	    }
		String sql = "SELECT 1 FROM Citizens WHERE phone_number = ? LIMIT 1";
		try (Connection conn = Database.getConnection();
				PreparedStatement prep = conn.prepareStatement(sql)) {
			prep.setString(1, phoneNumber);	
			try (ResultSet rs = prep.executeQuery()){
			return rs.next();
			}
		} catch (SQLException e) {
			System.err.println("Error finding PhoneNumber: " + e.getMessage());
	        e.printStackTrace();
		}
		return false;
	}
	
	
	/**
	 * Update citizen details **/
	public boolean updateCitizenDetails(Citizen citizen) {
		String sql = "UPDATE Citizens SET full_name = ?, password_hash = ?, phone_number = ?, address = ? WHERE citizen_id = ?";
		try (Connection conn = Database.getConnection();
				PreparedStatement prep = conn.prepareStatement(sql)) {
			prep.setString(1, citizen.getFullName());
			prep.setString(2, citizen.getPasswordHash());
			prep.setString(3, citizen.getPhoneNumber());
			prep.setString(4, citizen.getAddress());
			prep.setLong(5, citizen.getId());
			
			int affectedRow = prep.executeUpdate();
			
			return affectedRow > 0;
			
		} catch (Exception e) {
	        System.err.println("Error updating citizen-Details : " + e.getMessage());
	        e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	/**
	 * update last login
	 * **/
	public boolean updateLastLogin(String email) {
		String sql = "UPDATE Citizens SET last_login = ? WHERE email = ? ";
		Timestamp now = new Timestamp(new Date().getTime());
		try (Connection conn = Database.getConnection();
				PreparedStatement prep = conn.prepareStatement(sql)) {
			 prep.setTimestamp(1, now);
			 prep.setString(2, email);
			 int affectedRow = prep.executeUpdate();
			 return affectedRow > 0; 
		} catch (Exception e) {
			System.err.println("Error updating last login for email : "+email+ e.getMessage());
	        e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
	/**
	 * helper method for storing citizen info to citizen object
	 * **/
	private Citizen mapResultSetToCitizen(ResultSet rs) throws Exception {
	    Citizen citizen = new Citizen();
	    citizen.setId(rs.getLong("citizen_id"));
	    citizen.setFullName(rs.getString("full_name"));
	    citizen.setEmail(rs.getString("email"));
	    citizen.setPasswordHash(rs.getString("password_hash"));
	    citizen.setPhoneNumber(rs.getString("phone_number"));
	    citizen.setAddress(rs.getString("address"));
	    citizen.setCivicPoints(rs.getInt("civic_points"));
	    citizen.setIsActive(rs.getBoolean("is_active"));
	    citizen.setVerificationToken(rs.getString("verification_token"));
	    citizen.setIsVerified(rs.getBoolean("is_verified"));
	    
	    Timestamp createdAtTs = rs.getTimestamp("created_at");
	    if (createdAtTs != null) {
	        citizen.setCreatedAt(createdAtTs.toLocalDateTime()); 
	    }
	    Timestamp lastLoginTs = rs.getTimestamp("last_login");
	    if (lastLoginTs != null) {
	        citizen.setLastLogin(lastLoginTs.toLocalDateTime());
	    }
	    
	    return citizen;
	}
	
}