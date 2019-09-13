package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.CartBean;
import com.shianghergo.model.ItemBean;

public interface CartDao {
	
	void saveToCart(ItemBean ib,Long member_id);
	List<CartBean> getCartItems(Long member_id);
	
	CartBean getCartBeanById(Long cart_id);
	int deleteCartBeanById(Long cart_id);
}
