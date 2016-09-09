$(document).ready(function(){
	$('.modal-trigger').leanModal();
	$('.parallax').parallax();

});

function basketInsert(a,b,c,d,e,f,g,h,i,j,k){
	if(k == 0){
		document.basketForm.bid.value = a;
		document.basketForm.bname.value = b;
		document.basketForm.bauthor.value = c;
		document.basketForm.bcompany.value = d;
		document.basketForm.bguk.value = e;
		document.basketForm.byear.value = f;
		document.basketForm.blocation.value = g;
		document.basketForm.bjang.value = h;
		document.basketForm.bimgsrc.value = i;
		document.basketForm.price.value = j;
		document.basketForm.submit();
	}else{
		alert("대여 중 입니다");
		return;
	}
	
//	document.basketForm.bid.value = a;
//	document.basketForm.bname.value = b;
//	document.basketForm.bauthor.value = c;
//	document.basketForm.bcompany.value = d;
//	document.basketForm.bguk.value = e;
//	document.basketForm.byear.value = f;
//	document.basketForm.blocation.value = g;
//	document.basketForm.bjang.value = h;
//	document.basketForm.bimgsrc.value = i;
//	document.basketForm.price.value = j;
//	document.basketForm.submit();
}

function pay(a,b){
	location.href = "book_order.jsp?sum=" + a + "&count=" + b;
}

function del(bid){
//	alert(bid);
	//location.href = "basket_del.jsp?bid=" + bid;
	$.ajax({
        type: 'get'
      , url: 'basket_del.jsp?bid=' + bid
      , dataType : 'html'
      , success: function(data) {
         $("#aja").html(data);
        }
      });
}

function bannap(bid){
	//alert(bid);
	$.ajax({
        type: 'get'
      , url: "basket_bannap.jsp?bid=" + bid
      , dataType : 'html'
      , success: function(data) {
         $("#ajaxx").html(data);
        }
      });
	
	//location.href = "basket_bannap.jsp?bid=" + bid;
}

function payinfo(a,b,c,d){
	$.ajax({
			type : 'get',
			url : 'pay_ajax.jsp?bname=' + a + "&price=" + b + "&date=" + c,
			dataType : 'html',
			success : function(data) {
				$("#ajaxyo" + d).html(data);
			}
	});
}

