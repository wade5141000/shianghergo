package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.comment_store;

public interface comment_storeDao {

	public void savecomment_store (comment_store cs);

	public List<comment_store> getComment_store(Integer store_id);

}
