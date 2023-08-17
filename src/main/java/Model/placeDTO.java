package Model;

public class placeDTO {
	String placeid;
	String quiz;
	String explanation;
	String latitude;
	String longitude;
	String path;
	
	public placeDTO(String placeid, String quiz, String explanation, String latitude, String longitude, String path) {
		this.placeid = placeid;
		this.quiz = quiz;
		this.explanation = explanation;
		this.latitude = latitude;
		this.longitude = longitude;
		this.path = path;
	}

	public String getPlaceid() {
		return placeid;
	}

	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}

	public String getQuiz() {
		return quiz;
	}

	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
	
	
	
}

