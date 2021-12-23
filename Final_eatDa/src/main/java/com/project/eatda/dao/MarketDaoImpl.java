package com.project.eatda.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.CartProductDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ProductLikeDto;
import com.project.eatda.dto.ReviewDto;

@Repository
public class MarketDaoImpl implements MarketDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ProductDto> takeProductList(int num) {
		//1 : 1 - 9
		//2 : 10- 18
		//3 : 19- 27
		ArrayList<Integer> parameter = new ArrayList<Integer>();
		List<ProductDto> list = null;
	
		parameter.add((num==1?num:num*9-8));
		parameter.add((num==1?num*9:num*9));
		
		try {
			list = sqlSession.selectList(NAMESPACE_MARKET+"productList", parameter);
		} catch (Exception e) {
			System.out.println("takeProductList DAO ERROR");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int paging() {
		int productCount = 0;
		
		
		try {
			productCount = sqlSession.selectOne(NAMESPACE_MARKET+"paging");
		} catch (Exception e) {
			System.out.println("paging DAO ERROR");
			e.printStackTrace();
		}
		
		return productCount;
	}

	@Override
	public List<ProductDto> likeProductList(String user_id) {
		List<ProductDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE_MARKET+"likeProductList", user_id);
		} catch (Exception e) {
			System.out.println("likeProductList DAO ERROR");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDto> hashTagSearch(String tagName) {
		List<ProductDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE_MARKET+"hashTagSearch", tagName);
		} catch (Exception e) {
			System.out.println("hashTagSearch DAO ERROR");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProductDto getProduct(String p_id) {
		ProductDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE_MARKET+"getProduct", p_id);
		} catch (Exception e) {
			System.out.println("getProduct DAO ERROR");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<ProductDto> searchKeyword(String tagName) {
		List<ProductDto> list = null;
		tagName = "%" + tagName + "%";
		
		try {
			list = sqlSession.selectList(NAMESPACE_MARKET+"searchKeyword", tagName);
		} catch (Exception e) {
			System.out.println("searchKeyword DAO ERROR");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int putShoppingBag(CartProductDto cpDto) {
		int res = 0;
		
		try {
			CartProductDto dto = sqlSession.selectOne(NAMESPACE_MARKET+"isProduct", cpDto);
			
			if (dto != null) {
				res = -1;
			} else {
				res = sqlSession.insert(NAMESPACE_MARKET+"putShoppingBag", cpDto);
			}
		} catch (Exception e) {
			System.out.println("putShoppingBag DAO ERROR");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ReviewDto> getReview(String p_id) {
		List<ReviewDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE_MARKET+"getReview", p_id);
		} catch (Exception e) {
			System.out.println("getReview DAO ERROR");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int likeProductInsert(ProductLikeDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE_MARKET+"likeProductInsert", dto);
		} catch (Exception e) {
			System.out.println("likeProductInsert DAO ERROR");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteProductLike(ProductLikeDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE_MARKET+"deleteProductLike", dto);
		} catch (Exception e) {
			System.out.println("deleteProductLike DAO ERROR");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<CartProductDto> getCartList(String user_id) {
		List<CartProductDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE_MARKET+"getCartList", user_id);
		} catch (Exception e) {
			System.out.println("getCartList DAO ERROR");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int deleteProductBag(List<String> list) {
		int idx = 0;
		int count = 0;
		
		try {
			CartProductDto dto = new CartProductDto();;
			dto.setUser_id(list.get(list.size()-1));
			
			while (idx < list.size()-1) {
				dto.setP_id(list.get(idx));
				count += sqlSession.delete(NAMESPACE_MARKET+"deleteProductBag", dto);
				idx++;
			}
		} catch (Exception e) {
			System.out.println("deleteProductBag DAO ERROR");
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
