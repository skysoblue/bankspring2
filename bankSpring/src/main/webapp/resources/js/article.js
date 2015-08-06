var article = {
		loaded : false
}
article.load = function(div,url) {
	
		$(div).empty();
		$(div).load(url);
}
article.search = function($url) {
		$.ajax({
			url : $url,	
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			success : function(data) {
				alert('%%%%%%%%%%%%%%%'+data);
				var table = '<table class="tab">';
				table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';
				$.each(data,function(){
					table += '<tr>';
					table += '<td>'+this.artSeq+'</td><td>'+this.userid+
					'</td><td>'+this.name+'</td><td>'+this.title+'</td><td>'+this.postingDate+'</td>';
					table += '</tr>';
				});
				table += '</table>';
				
				$('.box').empty();
				$('.box').html(table);
				
			},
			error : function() {
				alert('데이터가 존재하지 않습니다.');
			}
		});
	
}
article.write = function($url,$data) {
	$('#btnWrite').on('click',function(){
		
		$.ajax({
			url : $url,
			type : 'POST',
			data : $data,
			dataType : 'json',
			contentType : 'application/json',
			success : function(data) {
				if (data==null) {
					$('.box').html('<p>등록된 데이터가 없습니다.<p>');
				}else{
					var table = '<table class="tab">';
					table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';
					$.each(data,function(){
						table += '<tr>';
						table += '<td>'+this.artSeq+'</td><td>'+this.userid+
						'</td><td>'+this.name+'</td><td>'+this.title+'</td><td>'+this.postingDate+'</td>';
						table += '</tr>';
					});
					table += '</table>';
					$('.box').html(table);
				}
			}
		});
	});
}		











