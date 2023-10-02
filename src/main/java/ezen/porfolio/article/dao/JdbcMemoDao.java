package ezen.porfolio.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import ezen.porfolio.article.dto.Memo;
import ezen.porfolio.common.dao.DaoFactory;
import ezen.porfolio.member.dto.Member;

/**
 * RDB를 이용한 게시글 저장 및 목록 구현체 
 * @author 조영호
 */
public class JdbcMemoDao implements MemoDao {

	private DataSource dataSource;
	
	public JdbcMemoDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * 신규글 등록
	 * @param Memo 신규멤버
	 * @return 성공여부(등록여부)
	 */
	@Override
	public boolean create(Memo memo) {
		boolean success = false;
		StringBuilder sb = new StringBuilder();
		
		sb.append(" INSERT INTO memo(")
		  .append("    m_id,")
		  .append("    content,")
		  .append("    id,")
		  .append("    writer)")
		  .append(" VALUES( memo_seq.NEXTVAL, ?, ?, ?)");
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con= dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, memo.getContent());
			pstmt.setString(2, memo.getId());
			System.out.println("create메소드"+memo.getWriter());
			pstmt.setString(3, memo.getWriter());
			pstmt.executeUpdate();
			success = true;
			System.out.println("등록성공");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
					con.close();
			} catch (Exception e) {
			}
		}
		return success;
	}
	
	@Override//작성날짜, 이름, 내용 write_date ,name, content
	public List<Memo> findByAll() {
		List<Memo> allList = null;
		StringBuilder sb = new StringBuilder();

		sb.append(" SELECT TO_CHAR(write_date, 'yyyy-MM-DD DAY') write_date, id, content, writer")
		  .append(" FROM memo");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			allList = new ArrayList<Memo>();
			while(rs.next()) {
				String write_date = rs.getString("write_date");
				String id = rs.getString("id");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Memo memo = new Memo();
				memo.setWrite_date(write_date);
				memo.setId(id);
				memo.setContent(content);
				memo.setWriter(writer);
				allList.add(memo);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
			}
		}
		return allList;
	}
	
	@Override
	public int getCountAll() {
		int count = 0;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT COUNT(*) cnt")
		  .append(" FROM memo");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null)  con.close();
			} catch (Exception e) {}
		}
		return count;
		
		
	}
	
	@Override
	public List<Memo> findByAll(int requestPage, int elementSize) {
		List<Memo>  list = null;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT  page, write_date,    content,    writer")
		  .append(" FROM (  SELECT  ceil(ROWNUM / ?) page,   write_date,   content,   writer")
		  .append("         FROM (  SELECT   to_char(m1.write_date, 'yyyy-MM-DD HH24:MI') write_date, m1.content content,  m2.name writer")
		  .append("                 FROM memo m1")
		  .append("                     JOIN member m2 ON m1.id = m2.id")
		  .append("                 ORDER BY m_id DESC) )")
		  .append(" WHERE  page = ?");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, elementSize);
			pstmt.setInt(2, requestPage);
			rs = pstmt.executeQuery();
			list = new ArrayList<Memo>();
			while (rs.next()) {			
				String writeDate = rs.getString("write_date");
				String content = rs.getString("content");
				// 웹 페이지 줄바꿈 처리
				content = content.replaceAll("\r", "<br>");
				String writer = rs.getString("writer");
				Memo memo = new Memo();
				memo.setWrite_date(writeDate);
				memo.setContent(content);
				memo.setWriter(writer);
				list.add(memo);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null)  con.close();
			} catch (Exception e) {}
		}
		return list;
	}

	// 테스트용 메인
	public static void main(String[] args) throws Exception {
//		Member member = new Member("heeyoung", "1111", "이희영", "heeyoung@gamil.com", null);
//		MemberDao dao = new JdbcMemberDao();
//		dao.create(member);
		System.out.println("등록 완료");
		MemoDao dao = DaoFactory.getInstance().getMemoDao();
		List<Memo> memos = dao.findByAll();
		for (Memo memo : memos) {
			System.out.println(memo);
		}
//		Member loginMember = dao.findByUser("bangry", "1111");
//		System.out.println(loginMember);
	}
}