package spring.ict06team1.midpj.dto;

import java.sql.Date;

public class TestUserDTO {


	// 멤버변수
	private int userId; // PK => mvc_user_tbl - user_id
	private String userName; 	// mvc_user_tbl - user_name
	private Date regDate; 		// mvc_user_tbl - reg_date
	private TestAddressDTO addressDTO; // mvc_address_tbl 내포,  - user_id가 FK
	

	// 디폴트 생성자
	public TestUserDTO() {
		super();
	}

	// 매개변수 생성자
	public TestUserDTO(int userId, String userName, Date regDate, TestAddressDTO addressDTO) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.regDate = regDate;
		this.addressDTO = addressDTO;
	}

	// getter, setter
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public TestAddressDTO getAddressDTO() {
		return addressDTO;
	}

	public void setAddressDTO(TestAddressDTO addressDTO) {
		this.addressDTO = addressDTO;
	}

	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userName=" + userName + ", regDate=" + regDate + ", addressDTO="
				+ addressDTO + "]";
	}
}
