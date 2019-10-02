function addGroupCart(item_id,groups_id){
	$.ajax({
		url:"../addtocart?itemid="+item_id+"&gid="+groups_id,
		type:"get",
		success:function(data){
			if(data==1){
				alert("添加成功");
			}else{
				alert("不可添加其他團商品");
			}
		},
	})
}