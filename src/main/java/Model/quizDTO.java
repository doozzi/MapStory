package Model;

public class quizDTO {
	private String quiz;
	private String placeid;
	private String quiz_type;
	private String quiz_ex;
	private String answer;
	private String quiz_path;
	
	public quizDTO(String quiz, String placeid, String quiz_type, String quiz_ex, String answer, String quiz_path) {
		super();
		this.quiz = quiz;
		this.placeid = placeid;
		this.quiz_type = quiz_type;
		this.quiz_ex = quiz_ex;
		this.answer = answer;
		this.quiz_path = quiz_path;
	}
	
	public String getQuiz() {
		return quiz;
	}
	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}
	public String getPlaceid() {
		return placeid;
	}
	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}
	public String getQuiz_type() {
		return quiz_type;
	}
	public void setQuiz_type(String quiz_type) {
		this.quiz_type = quiz_type;
	}
	public String getQuiz_ex() {
		return quiz_ex;
	}
	public void setQuiz_ex(String quiz_ex) {
		this.quiz_ex = quiz_ex;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuiz_path() {
		return quiz_path;
	}
	public void setQuiz_path(String quiz_path) {
		this.quiz_path = quiz_path;
	}
	
	
}
