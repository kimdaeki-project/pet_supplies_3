package com.pet.p1.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.member.MemberVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSession sqlSessions;
	
	private final String NAMESPACE="com.pet.p1.cart.CartDAO.";
	
	public List<CartVO> cartList(MemberVO memberVO) throws Exception{
		return sqlSessions.selectList(NAMESPACE+"cartList",memberVO);
	}

}
