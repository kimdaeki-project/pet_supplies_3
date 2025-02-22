/**
 * 
 */

var count=1;

$("#file").on("click", ".remove", function() {
	alert("파일을 삭제하겠습니까?");
	$(this).parent().remove();
	count--;
});

$("#add").click(function() {
	if(count<6){
		$("#file").append('<div class="form-group"> <label for="file"> File :</label> <input type="file" class="form-control files" name="files"> <i class="fas fa-paw remove" style="font-size:24px"></i></div>');
		count++;                     
	}else {
		alert("파일은 최대 5개 까지 가능");
	}
});


/////////////////////////////////////////////////

$("#contents").summernote({
	height: 300,
	toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ]
	
});// $("#contents").summernote

$("#btn").click(function() {
	//title, contents 데이터 유무 검증
	var title = $("#title").val();
	var contents = $("#contents").summernote('code');
	
	var ch3 = true;
	$(".files").each(function() {
		if($(this).val()==""){
			ch3 = false;
		}
	});
	
	var ch1 = title !="";
	var ch2 = $("#contents").summernote('isEmpty');
	
	if(ch1 && !ch2 && ch3){
		//form 전송(submit event 강제 발생)
	/*	contents Server null이 될때
		$("#con").val(contents);*/
		
		$("#frm").submit();
	}else {
		//submit event 종료
		alert("필수 요소는 다 입력하세요");
		event.preventDefault();
	}
	
});


/////////////////////////////////////////////////