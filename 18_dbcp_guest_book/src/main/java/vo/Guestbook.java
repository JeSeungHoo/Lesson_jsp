package vo;

public class Guestbook {
	private int id; // 방명록 번호
	private String guestName; // 방명록 작성자
	private String password; // 방명록 비밀번호
	private String message; // 방명록 내용

	public Guestbook() {
	}

	public Guestbook(int id, String guestName, String password, String message) {
		super();
		this.id = id;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Guestbook [id=" + id + ", guestName=" + guestName + ", password=" + password + ", message=" + message
				+ "]";
	}

}
