package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.CartBean;
import com.shianghergo.model.ItemBean;

public interface CartService {
	void saveToCart(ItemBean ib,Long member_id);
	
	List<CartBean> getCartItems(Long member_id);
	
	CartBean getCartBeanById(Long cart_id);
	
	CartBean updateCartBeanById(Long cart_id,String type);
	int deleteCartBeanById(Long cart_id);
}
