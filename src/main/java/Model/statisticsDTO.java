package Model;

public class statisticsDTO {

	private String age;
	private String review;
	private int cnt;
	

	public statisticsDTO(String age,int cnt) {
		this.age = age;
		this.cnt = cnt;
	}
	
	public statisticsDTO(String review) {
		this.review = review;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
	
}
