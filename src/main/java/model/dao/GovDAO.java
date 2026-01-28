package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import model.Database;
import model.entity.GovUser;

public class GovDAO {

	/**
	 * find gov user by email
	 * */
	public GovUser findByEmail(String email) {
		String sql = "SELECT * FROM Government_Users WHERE email = ?";
		GovUser govUser = null;
		try(Connection conn = Database.getConnection();
			 PreparedStatement prep = conn.prepareStatement(sql)){
				prep.setString(1, email);
				try(ResultSet rs = prep.executeQuery();){
					if(rs.next()) {
						govUser = mapResultSetToCitizen(rs);
					}
				}
				
		} catch (Exception e) {
			System.err.println("Error finding govUser by email: " + e.getMessage());
		     e.printStackTrace();
	}
		return govUser;
	}
	
	/*
	 * save the gov-user
	 * */
	public boolean save(GovUser govUser) {
		String sql = "INSERT INTO Government_Users(full_name,email,password_hash,role,department_id) VALUES (?,?,?,?,?)";
		try(Connection conn = Database.getConnection();
				PreparedStatement prep = conn.prepareStatement(sql)) {
			prep.setString(1, govUser.getFullName());
			prep.setString(2, govUser.getEmail());
			prep.setString(3, govUser.getPasswordHash());
			prep.setString(4, govUser.getRole().name());
			prep.setInt(5, govUser.getDepartmentId());
			int affectedRows = prep.executeUpdate();
			return affectedRows > 0;
		} catch (Exception e) {
			 System.err.println("Error saving new govUser " + e.getMessage());
	            e.printStackTrace();
		}
		return false;
	}
	
	/*
	 * helper method
	 * */
	private GovUser mapResultSetToCitizen(ResultSet rs) throws Exception {
	    GovUser govUser = new GovUser();
	    govUser.setUserId(rs.getInt("user_id"));
	    govUser.setDepartmentId(rs.getInt("department_id"));
	    govUser.setEmail(rs.getString("email"));
	    govUser.setFullName(rs.getString("full_name"));
	    govUser.setIsActive(rs.getBoolean("is_active"));
	    govUser.setPasswordHash(rs.getString("password_hash"));
	    govUser.setRoleByName(rs.getString("role"));
	    Timestamp createdAtTs = rs.getTimestamp("created_at");
	    if (createdAtTs != null) {
	        govUser.setCreatedAt(createdAtTs.toLocalDateTime()); 
	    }
	    Timestamp updated_at = rs.getTimestamp("updated_at");
	    if (updated_at != null) {
	    	govUser.setUpdatedAt(updated_at.toLocalDateTime()); 
	    }
	    
	    return govUser;
	}
	

}
