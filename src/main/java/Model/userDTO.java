package Model;

public class userDTO {

	public String nickname;
	public String age;
	public String city;
	public String preletter;
	public String nextletter;
	public String review;
	
	public userDTO(String nick, String age, String city, String preletter) {
		this.nickname = nick;
		this.city = city;
		this.age = age;
		this.preletter = preletter;
	}
	
	public userDTO(String age, String city, String preletter) {
		this.age = age;
		this.city = city;
		this.preletter = preletter;
	}

	public userDTO(String nickname, String nextletter, int review) {
		this.nickname = nickname;
		this.nextletter = nextletter;
		
		if(review == 100) {
			this.review = "매우 도움이 됐다.";
		} else if(review == 75) {
			this.review = "어느정도 도움이 됐다.";
		} else if(review == 50) {
			this.review = "보통이다.";
		} else if(review == 25) {
			this.review = "별로 도움이 안됐다.";
		} else {
			this.review = "전혀 도움이 안됐다.";
		}
		
		
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPreletter() {
		return preletter;
	}

	public void setPreletter(String preletter) {
		this.preletter = preletter;
	}

	public String getNextletter() {
		return nextletter;
	}

	public void setNextletter(String nextletter) {
		this.nextletter = nextletter;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
}
