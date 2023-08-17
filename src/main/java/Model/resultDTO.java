package Model;

public class resultDTO {

	private String nickname;
	private String placeid;
	private String quiz;
	private String quiz_set;
	private int score;

	public resultDTO(String nickname, String placeid, String quiz, String quiz_set, int playtime, int score) {
		this.nickname = nickname;
		this.placeid = placeid;
		this.quiz = quiz;
		this.quiz_set = quiz_set;
		this.score = score;
	}

	public resultDTO(String nickname, String placeid, String quiz, String quiz_set, int score) {
		this.nickname = nickname;
		this.placeid = placeid;
		this.quiz = quiz;
		this.quiz_set = quiz_set;
		this.score = score;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getQuiz_set() {
		return quiz_set;
	}
	public void setQuiz_set(String quiz_set) {
		this.quiz_set = quiz_set;
	}

	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
}
