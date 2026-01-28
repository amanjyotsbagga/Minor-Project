package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Database;
import model.entity.TestUser;

public class TestDAO {
	
	// add test user 
	public int addTestUser(TestUser tu) {
		int i = 0;
		String sql = "insert into tested (testname, testage) values (?,?)";
		try (Connection conn = Database.getConnection();
				PreparedStatement prep = conn.prepareStatement(sql)) {
			prep.setString(1, tu.getName());
			prep.setInt(2, tu.getAge());
			i = prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
}
