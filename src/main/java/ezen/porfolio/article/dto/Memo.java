package ezen.porfolio.article.dto;

/**
 * 게시판 글 저장 클래스
 * @author 조영호
 *
 */
public class Memo {
	
	private int m_id;
	private String content;
	private String write_date;
	private String id;
	private String writer;
	
	public Memo(){}

	public Memo(int m_id, String content, String write_date, String id, String writer) {
		this.m_id = m_id;
		this.content = content;
		this.write_date = write_date;
		this.id = id;
		this.writer = writer;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Memo [m_id=" + m_id + ", content=" + content + ", write_date=" + write_date + ", id=" + id + ", writer="
				+ writer + "]";
	}

	

}
