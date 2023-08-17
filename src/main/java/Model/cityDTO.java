package Model;

public class cityDTO {

	private String city;
	private int cnt;
	
	public cityDTO(String city, int cnt) {
		super();
		this.city = city;
		this.cnt = cnt;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
