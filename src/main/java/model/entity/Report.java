package model.entity;

public class Report {
	// IDs
    private int reportId;
    private Long citizenId;
    private int categoryId;
    
    // New Fields (Location & Date)
    private String locationAddress;
    private String pincode;
    private String firstObservedAt; // Stored as String ("YYYY-MM-DD") as requested

    // Report Details
    private String title;
    private String description;
    
    // Coordinates (BigDecimal is best for SQL DECIMAL precision)
    private String latitude;
    private String  longitude;
	public Report(int reportId, Long citizenId, int categoryId, String locationAddress, String pincode,
			String firstObservedAt, String title, String description, String latitude, String longitude) {
		super();
		this.reportId = reportId;
		this.citizenId = citizenId;
		this.categoryId = categoryId;
		this.locationAddress = locationAddress;
		this.pincode = pincode;
		this.firstObservedAt = firstObservedAt;
		this.title = title;
		this.description = description;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public Report(Long citizenId, int categoryId, String locationAddress, String pincode, String firstObservedAt,
			String title, String description, String latitude, String longitude) {
		super();
		this.citizenId = citizenId;
		this.categoryId = categoryId;
		this.locationAddress = locationAddress;
		this.pincode = pincode;
		this.firstObservedAt = firstObservedAt;
		this.title = title;
		this.description = description;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public Long getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(Long citizenId) {
		this.citizenId = citizenId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getLocationAddress() {
		return locationAddress;
	}
	public void setLocationAddress(String locationAddress) {
		this.locationAddress = locationAddress;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getFirstObservedAt() {
		return firstObservedAt;
	}
	public void setFirstObservedAt(String firstObservedAt) {
		this.firstObservedAt = firstObservedAt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
    
    
}
