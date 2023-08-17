package Model;

public class letterDTO {
	private String letter;
	private int cnt;
	
	public letterDTO(String letter, int cnt) {
		this.letter = letter;
		this.cnt = cnt;
	}

	public String getLetter() {
		return letter;
	}

	public void setLetter(String letter) {
		this.letter = letter;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
