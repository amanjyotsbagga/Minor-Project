package model.entity;

import java.time.LocalDateTime;

public class Citizen {
	private Long id;
	private String fullName;
	private String email;
	private String passwordHash;
	private String phoneNumber;
	private String address;
	private Integer civicPoints;
	private LocalDateTime createdAt;
	private LocalDateTime lastLogin;
	private Boolean isActive;
	private String verificationToken;
	private Boolean isVerified;

	public Citizen() {
	}

	public Citizen(Long id, String fullName, String email, String passwordHash, String phoneNumber, String address,
			Integer civicPoints, LocalDateTime createdAt, LocalDateTime lastLogin, Boolean isActive,
			String verificationToken, Boolean isVerified) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.passwordHash = passwordHash;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.civicPoints = civicPoints;
		this.createdAt = createdAt;
		this.lastLogin = lastLogin;
		this.isActive = isActive;
		this.verificationToken = verificationToken;
		this.isVerified = isVerified;
	}

	public Citizen(String fullName, String email, String passwordHash, String phoneNumber, String address) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.passwordHash = passwordHash;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.civicPoints = 0;
		this.isActive = true;
		this.isVerified = false;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getCivicPoints() {
		return civicPoints;
	}

	public void setCivicPoints(Integer civicPoints) {
		this.civicPoints = civicPoints;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(LocalDateTime lastLogin) {
		this.lastLogin = lastLogin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getVerificationToken() {
		return verificationToken;
	}

	public void setVerificationToken(String verificationToken) {
		this.verificationToken = verificationToken;
	}

	public Boolean getIsVerified() {
		return isVerified;
	}

	public void setIsVerified(Boolean isVerified) {
		this.isVerified = isVerified;
	}
	@Override
    public String toString() {
        return "Citizen [id=" + id + ", fullName=" + fullName + ", email=" + email + ", isActive=" + isActive 
                + ", createdAt=" + createdAt + "]";
    }
	
	

}