package ezen.porfolio.member.dto;

/**
 * JAVA Bean규약에 따라 만든 재사용 가능한 컴포넌트
 * @author 조영호
 *
 */
public class Member {
	
	private String id;
	private String name;
	private String email;
	private String passwd;
	private String phone;
	private String birth;
	private String regdate;
	private String gender;
	
	public Member(){}
	
	public Member(String id, String name, String email, String passwd, String phone, String birth, String regdate, String gender) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.passwd = passwd;
		this.phone = phone;
		this.birth = birth;
		this.regdate = regdate;
		this.gender = gender;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", email=" + email + ", passwd=" + passwd + ", phone=" + phone
				+ ", birth=" + birth + ", regdate=" + regdate + ", gender=" + gender + "]";
	}

	
	
	
	
}
