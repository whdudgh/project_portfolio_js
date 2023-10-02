package ezen.porfolio.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import ezen.porfolio.article.dao.MemoDao;
import ezen.porfolio.article.dto.Memo;
import ezen.porfolio.common.dao.DaoFactory;
import ezen.porfolio.member.dto.Member;

/**
 * RDB를 이용한 회원 저장 및 관리(검색, 수정, 삭제) 구현체 
 * @author 조영호
 */
public class JdbcMemberDao implements MemberDao {

	private DataSource dataSource;
	
	public JdbcMemberDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * 신규회원 등록
	 * @param Member 신규멤버
	 * @return 성공여부(등록여부)
	 */
	@Override
	public boolean create(Member member) {
		boolean success = false;
		StringBuilder sb = new StringBuilder();
		
		sb.append(" INSERT INTO member(")
		  .append("    id,")
		  .append("    name,")
		  .append("    email,")
		  .append("    passwd,")
		  .append("    phone,")
		  .append("    birth,")
		  .append("    gender)")
		  .append(" VALUES( ?, ?, ?, ?, ?,  TO_DATE( ?,  'YY-MM-DD'), ? )");
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con= dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPasswd());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getBirth());
			pstmt.setString(7, member.getGender());
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
	
	@Override
	public Member findByUser(String id, String passwd) {
		Member member = null;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT id, name, TO_CHAR(regdate,'YYYY-MM-DD DAY')redate")
		  .append("   FROM member")
		  .append("   WHERE id=? AND passwd=?");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String uid = rs.getString("id");
				String uname = rs.getString("name");
				String regdate = rs.getString("redate");
				member = new Member();
				member.setId(uid);
				member.setName(uname);
				member.setRegdate(regdate);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
					con.close();
			} catch (Exception e) {
			}
		}
		return member;
	}
	
	@Override
	public List<Member> findByAll() {
		List<Member> allList = null;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT id, name, email ,TO_CHAR(regdate,'YYYY-MM-DD DAY')redate")
		  .append("   FROM member");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			allList = new ArrayList<Member>();
			while(rs.next()) {
				String uid = rs.getString("id");
				String uname = rs.getString("name");
				String email = rs.getString("email");
				String regdate = rs.getString("redate");
				Member member = new Member();
				member.setId(uid);
				member.setName(uname);
				member.setEmail(email);
				member.setRegdate(regdate);
				allList.add(member);
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

	// 테스트용 메인
	public static void main(String[] args) throws Exception {
//		Member member = new Member("heeyoung", "1111", "이희영", "heeyoung@gamil.com", null);
//		MemberDao dao = new JdbcMemberDao();
//		dao.create(member);
		System.out.println("등록 완료");
		MemoDao dao = DaoFactory.getInstance().getMemoDao();

//		Member loginMember = dao.findByUser("bangry", "1111");
//		System.out.println(loginMember);
	}


}