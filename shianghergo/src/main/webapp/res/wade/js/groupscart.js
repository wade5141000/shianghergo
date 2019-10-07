function changeGroupAmount(id,types){
		if($("#"+id).text()==1 && types ==2){
			alert("商品數量不可低於1")
		}else{
			var total2 = $("#gtotal").text();
			$.ajax({
				url:"http://localhost:8080/shianghergo/changeGroupsAmount?id="+id+"&type="+types+"&total="+total2,
				type:"get",
				success:function(data){
					list = data.split(",");
					$("#gtotal").text(list[0]);
					$("#"+list[2]).html(list[1]);
					$("#"+id+"a").text(list[3]);
					
				},
			})
		}
	}


function gdeletetr(it,id){
		if(confirm("是否刪除商品?")){
			$.ajax({
				url:"http://localhost:8080/shianghergo/deletegroups?id="+id,
				type:"get",
				success:function(data){
					var gitems = JSON.parse(data);
					var total = 0;
					var lens = gitems.length;
					for(var i=0; i<gitems.length ;i++){
						total += gitems[i].price * gitems[i].amount;
					}
					
					$(it.parentNode.parentNode).remove();
					$("#gtotal").text(total);
					$("#gits").text(lens);
					
				},
			})
			
		}
		
	}
