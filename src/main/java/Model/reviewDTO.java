package Model;

public class reviewDTO {
	private String review;
	private int cnt;
	
	
	public reviewDTO(String review, int cnt) {
		super();
		this.review = review;
		this.cnt = cnt;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
