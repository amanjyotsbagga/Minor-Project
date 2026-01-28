package model.entity;

import java.time.LocalDateTime;

public class GovUser {
	private Integer userId;
    private String fullName;
    private String email;
    private String passwordHash;
    private UserRole role;
    private Integer departmentId;
    private Boolean isActive;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    public GovUser() {
	}
	public GovUser(Integer userId, String fullName, String email, String passwordHash, UserRole role,
			Integer departmentId, Boolean isActive, LocalDateTime createdAt, LocalDateTime updatedAt) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.email = email;
		this.passwordHash = passwordHash;
		this.role = role;
		this.departmentId = departmentId;
		this.isActive = isActive;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public GovUser(String fullName, String email, String passwordHash, UserRole role, Integer departmentId,
			Boolean isActive, LocalDateTime createdAt, LocalDateTime updatedAt) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.passwordHash = passwordHash;
		this.role = role;
		this.departmentId = departmentId;
		this.isActive = isActive;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	
	
	public GovUser(String fullName, String email, String passwordHash, Integer departmentId) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.passwordHash = passwordHash;
		this.departmentId = departmentId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswordHash() {
		return passwordHash;
	}
	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}
	public UserRole getRole() {
		return role;
	}
	public void setRole(UserRole role) {
		this.role = role;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	 /**
     * HELPER METHOD: 
     * Allows setting the role using a String directly.
     * Handles the 'valueOf' logic internally.
     */
    public void setRoleByName(String roleName) {
        try {
            // implicit usage of valueOf inside the Enum's own class scope
            this.role = UserRole.valueOf(roleName);
        } catch (IllegalArgumentException e) {
            System.err.println("Invalid Role Name provided: " + roleName);
            // You might want to set a default or throw a custom exception here
        }
    }

	public enum UserRole {
        SUPER_ADMIN,
        DEPARTMENT_ADMIN,
        OPERATOR,
        WORKER
    }
}
