package spring.ict06team1.midpj.dto;

public class TestAddressDTO {

	// private int userId; // FK - mvc_address_tbl - user_id
	private String userAddress; //  mvc_address_tbl - user_address

	public TestAddressDTO() {
		super();
	}

	public TestAddressDTO(String userAddress) {
		super();
		this.userAddress = userAddress;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	@Override
	public String toString() {
		return "AddressDTO [userAddress=" + userAddress + "]";
	}
}
