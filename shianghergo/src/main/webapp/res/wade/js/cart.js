function changeAmount(id,types){
		if($("#"+id).text()==1 && types ==2){
			alert("商品數量不可低於1")
		}else{
			var total2 = $("#total").text();
			$.ajax({
				url:"http://localhost:8080/shianghergo/changeAmount?id="+id+"&type="+types+"&total="+total2,
				type:"get",
				success:function(data){
					var cartitems = JSON.parse(data);
					var itotal = 0;
					for(var q=0  ; q<cartitems.length ; q++){
						if(cartitems[q].amount >= 18) {
							itotal += Math.round((cartitems[q].price * cartitems[q].amount) * 0.7);
						}else if(cartitems[q].amount >= 12) {
							itotal += Math.round((cartitems[q].price * cartitems[q].amount) * 0.8);
						}else if(cartitems[q].amount >= 6) {
							itotal += Math.round((cartitems[q].price * cartitems[q].amount) * 0.9);
						}else {
							itotal += cartitems[q].price * cartitems[q].amount;
						}
						
						if(cartitems[q].id == id){
							var smalls = 0;
							if(cartitems[q].amount >= 18) {
								smalls += Math.round((cartitems[q].price * cartitems[q].amount) * 0.7);
								var result = smalls + " (滿18件，享7折)";
								$("#"+id+"a").text(result);
							}else if(cartitems[q].amount >= 12) {
								smalls += Math.round((cartitems[q].price * cartitems[q].amount) * 0.8);
								var result = smalls + " (滿12件，享8折)";
								$("#"+id+"a").text(result);
							}else if(cartitems[q].amount >= 6) {
								smalls += Math.round((cartitems[q].price * cartitems[q].amount) * 0.9);
								var result = smalls + " (滿6件，享9折)";
								$("#"+id+"a").text(result);
							}else {
								smalls += cartitems[q].price * cartitems[q].amount;
								$("#"+id+"a").text(smalls);
							}
							
							$("#"+id).html(cartitems[q].amount);
						}
					}
//					list = data.split(",");
//					$("#total").text(list[0]);
//					$("#"+id).html(newAmount); // 1是新的數量
//					$("#"+id+"a").text(list[3]); // 3是小記
					
					$("#total").text(itotal);
				},
			})
		}
	}
	
	function deletetr(it,id){
		if(confirm("是否刪除商品?")){
			$.ajax({
				url:"http://localhost:8080/shianghergo/delete?id="+id,
				type:"get",
				success:function(data){
					
					var gitems = JSON.parse(data);
					var atotal = 0;
					var lens = gitems.length;
//					for(var i=0; i<gitems.length ;i++){
//						atotal += gitems[i].price * gitems[i].amount;
//					}
					
					for(var i=0; i<gitems.length ;i++){
						if(gitems[i].amount >= 18){
							atotal += Math.round((gitems[i].price * gitems[i].amount) * 0.7);
						}else if(gitems[i].amount >= 12){
							atotal += Math.round((gitems[i].price * gitems[i].amount) * 0.8);
						}else if(gitems[i].amount >= 6){
							atotal += Math.round((gitems[i].price * gitems[i].amount) * 0.9);
						}else{
							atotal += gitems[i].price * gitems[i].amount;
						}
					}
					
					$(it.parentNode.parentNode).remove();
					$("#total").text(atotal);
					$("#its").text(lens);
					
				},
			})
			
		}
		
	}
	
	
	