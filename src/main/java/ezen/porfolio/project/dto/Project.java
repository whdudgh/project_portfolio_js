package ezen.porfolio.project.dto;

/**
 * 프로젝트 클래스
 * @author 조영호
 */
public class Project {
	
	private int p_id;
	private String name;
	private int participatio;
	private String start_date;
	private String end_date;
	private String detaile;
	private String skills;
	
	public Project() {}

	public Project(int p_id, String name, int participatio, String start_date, String end_date, String detaile,String skills) {
		this.p_id = p_id;
		this.name = name;
		this.participatio = participatio;
		this.start_date = start_date;
		this.end_date = end_date;
		this.detaile = detaile;
		this.skills = skills;
	}
	
	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParticipatio() {
		return participatio;
	}

	public void setParticipatio(int participatio) {
		this.participatio = participatio;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getDetaile() {
		return detaile;
	}

	public void setDetaile(String detaile) {
		this.detaile = detaile;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	@Override
	public String toString() {
		return "Project [p_id=" + p_id + ", name=" + name + ", participatio=" + participatio + ", start_date="
				+ start_date + ", end_date=" + end_date + ", detaile=" + detaile + ", skills=" + skills + "]";
	}
}
