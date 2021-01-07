package com.studdype.test.model.dao.board.book;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BookDto;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 등록된 도서 총 개수
	@Override
	public int selectTotalRegisterBookNum(int s_no) {
		int totalRegisterBookNum = 0;
		System.out.println("스터디 번호(매개변수) : "+s_no);
		try {
			totalRegisterBookNum = sqlSession.selectOne(NAMESPACE+"selectTotalRegisterBookNum", s_no);
			System.out.println("쿼리 이후 : "+totalRegisterBookNum);
			System.out.println("쿼리 이후 : "+s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectTotalRegisterBookNum");
			e.printStackTrace();
		}
		return totalRegisterBookNum;
	}

	// 화면에 보여줄 해당 페이지 도서 리스트(4개)
	@Override
	public List<BookDto> selectPageBookList(Map pageMap) {
		List<BookDto> pageBookList = new ArrayList<BookDto>();
		
		try {
			pageBookList = sqlSession.selectList(NAMESPACE+"selectPageBookList", pageMap);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectPageBookList");
			e.printStackTrace();
		}
		return pageBookList;
	}
	
	

}