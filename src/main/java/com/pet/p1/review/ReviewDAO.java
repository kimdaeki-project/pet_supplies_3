package com.pet.p1.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.board.BoardDAO;
import com.pet.p1.board.BoardVO;
import com.pet.p1.util.Pager;

@Repository
public class ReviewDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.p1.review.ReviewDAO.";

	public int boardReplyUpdate(BoardVO boardVO) throws Exception {
		return sqlSession.update(NAMESPACE + "boardReplyUpdate", boardVO);
	}

	public int boardReply(BoardVO boardVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "boardReply", boardVO);
	}

	@Override
	public long boardCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "boardCount", pager);
	}

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "boardList", pager);
	}

	public List<BoardVO> pboardList(long productNum) throws Exception {
		return sqlSession.selectList(NAMESPACE + "pboardList", productNum);
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "boardSelect", num);
	}

	@Override
	public int boardWrite(BoardVO boardVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "boardWrite", boardVO);
	}

	@Override
	public int boardDelete(long num) throws Exception {
		return sqlSession.delete(NAMESPACE + "boardDelete", num);
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return sqlSession.update(NAMESPACE + "boardUpdate", boardVO);
	}

	@Override
	public int hitUpdate(long num) throws Exception {
		return sqlSession.update(NAMESPACE + "hitUpdate", num);
	}

	public long minNum(long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "minNum", num);
	}

	public long maxNum(long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "maxNum", num);
	}

	public List<Long> rNum() throws Exception {
		return sqlSession.selectList(NAMESPACE + "rNum");
	}

	public List<BoardVO> reviewNull(long productNum) throws Exception {
		return sqlSession.selectList(NAMESPACE + "reviewNull", productNum);
	}
}
