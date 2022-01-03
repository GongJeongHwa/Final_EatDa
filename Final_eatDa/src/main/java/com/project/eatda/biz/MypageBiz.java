package com.project.eatda.biz;

import java.util.List;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.CouponDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.OrderProductDto;
import com.project.eatda.dto.ReviewDto;
import com.project.eatda.dto.SubscriptionDto;

public interface MypageBiz {
	
	//구독내역
	public SubscriptionDto subscriptionList(SubscriptionDto dto);
	
	//쿠폰함
	public List<CouponDto> couponList(CouponDto dto);
	
	//블로그 찜
	public List<BlogDto> blogLikeList(String user_id);
	
	//주문한 상품
	public List<OrderProductDto> marketOrderList(String user_id);
	
	//주문내역
	public List<OrderDto> marketOrderList2(OrderDto dto);
	
	//리뷰 작성
	public int registReview(ReviewDto dto);

	
}
 