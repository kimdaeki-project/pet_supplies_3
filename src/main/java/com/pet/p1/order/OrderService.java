package com.pet.p1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.p1.member.MemberVO;
import com.pet.p1.orderInfo.OrderInfoVO;

@Service
public class OrderService {

		@Autowired
		private OrderDAO orderDAO;
		
		
		
		
		public int orderCart(OrderVO orderVO) throws Exception{
			return orderDAO.orderCart(orderVO);
		}
		
		public OrderVO orderSelectOne(MemberVO memberVO)throws Exception{
			return orderDAO.orderSelectOne(memberVO);
		}
		public int orderInfoInsert(OrderInfoVO orderInfoVO)throws Exception{
			return orderDAO.orderInfoInsert(orderInfoVO);
		}
		public List<OrderInfoVO> orderInfoList(MemberVO memberVO)throws Exception{
			return orderDAO.orderInfoList(memberVO);
		}
}
