package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.comment_item;

public interface comment_itemDao {

	
	public void savecomment_Item(comment_item ci);

	public double getAverageScoreByItemId(Integer id);
	
	public List<comment_item> getComment_item(Integer item_id);
}
