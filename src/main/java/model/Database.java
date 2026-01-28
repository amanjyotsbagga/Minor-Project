package model;
import java.sql.Connection;
import java.sql.SQLException;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class Database {
	
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = System.getenv("DB_URL");
	private static final String USERNAME = System.getenv("DB_USER"); 
	private static final String PASSWORD = System.getenv("DB_PASSWORD"); // 
		private static HikariDataSource dataSource;
	static {
		try {
			Class.forName(DRIVER);
			
			HikariConfig config = new HikariConfig();
			
			config.setJdbcUrl(URL);
			config.setUsername(USERNAME);
			config.setPassword(PASSWORD);
			config.setMaximumPoolSize(5); // add 10 when we go to paid on server
			config.setMinimumIdle(1); // 2 after paid
			config.setIdleTimeout(30000);
			config.setMaxLifetime(600000); // 1800000 after paid
			config.setConnectionTimeout(10000); // 20000 after paid
			config.addDataSourceProperty("cachePrepStmts", "true");
			config.addDataSourceProperty("prepStmtCacheSize", "250");
			config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
			
			dataSource = new HikariDataSource(config);
			System.out.println("HikariCP Connection Pool Initialized.");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to initialize HikariCP", e);
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
}