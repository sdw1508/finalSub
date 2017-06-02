<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="ctxx" value="${pageContext.request.contextPath }/resources/temp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Beauty Mate</title>

  <!-- GOOGLE FONT -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,600,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

  <!-- PLUGINS CSS STYLE -->
  <link href="${ctx }/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/selectbox/select_option1.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet" media="screen">
  <link href="${ctx }/resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/isotope/isotope.min.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/datepicker/datepicker.min.css" rel="stylesheet">
  <link href="${ctx }/resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css" rel="stylesheet">

  <!-- CUSTOM CSS -->
  <link href="${ctx }/resources/css/style.css" rel="stylesheet">
  <link href="${ctx }/resources/css/default.css" rel="stylesheet" id="option_color">

  <!-- FAVICON -->
  <link href="${ctx }/resources/img/favicon.png" rel="shortcut icon">
  
  
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="${ctxx}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    
    

<style>
  /* Paste this css to your style sheet file or under head tag */
  /* This only works with JavaScript,
  if it's not present, don't show loader */
  .no-js #loader { display: none;  }
  .js #loader { display: block; position: absolute; left: 100px; top: 0; }
  .se-pre-con {
  	position: fixed;
  	left: 0px;
  	top: 0px;
  	width: 100%;
  	height: 100%;
  	z-index: 9999;
  	background: url(plugins/simple-pre-loader/images/loader-64x/Preloader_2.gif) center no-repeat #fff;
  }
  </style>

</head>
<body class="body-wrapper static">
  <div class="se-pre-con"></div>
  <div class="main-wrapper">
    <!-- HEADER -->
    <header id="pageTop" class="header">

      <!-- TOP INFO BAR -->
      <div class="top-info-bar">
          
        <div class="container">
            
          <div class="top-bar-right">
            <ul class="list-inline">
                <li><select id="sel">
                          <option value="0"></option>
                          <option value="1">브랜드</option>
                          <option value="2">제품</option>
                         
                        </select></li>
                <li> <input id="search" type="text" placeholder="화장품을 검색해보세요" > <a target="_blank" href="#" class="btn btn-primary first-btn waves-effect waves-light scale-up">search</a></li>
                  <li><a id="login" target="_blank" href="#" class="btn btn-primary first-btn waves-effect waves-light scale-up">LOGIN</a></li>
                <li><a id="login" target="_blank" href="#" class="btn btn-primary first-btn waves-effect waves-light scale-up">JOIN</a></li>
                 
                
            </ul>
              
          </div>
           
        </div>
      </div>

      <!-- NAVBAR -->
      <nav id="menuBar" class="navbar navbar-default lightHeader" role="navigation">
        <div class="container">

          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"><img src="${ctx }/resources/img/logo.png" alt="logo" ></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="active">
                <a href="index.html">HOME</a>
              </li>
                <li class=" dropdown singleDrop">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">PICKMETEM</a>
               
              </li>
              <li class=" dropdown singleDrop">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">RANKING</a>
               
              </li>
              <li class=" dropdown megaDropMenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">REVIEW</a>
               
              </li>
              <li class=" dropdown singleDrop">
                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">BeautyTip</a>
                
              </li>
              <li class=" dropdown singleDrop">
                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MY Pouch</a>
                
              </li>
             
            </ul>
          </div>

<!-- USER SECTION -->
      <section class="clearfix userSection padding">
        <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <ul class="list-inline squareBtn">
                <li class="li"><a href="user-dashboard.html" class="btn btn-common">Account Dashboard</a></li>
                <li class="li"><a href="user-profile.html" class="btn btn-common btn-theme">Profile</a></li>
                <li class="li"><a href="address.html" class="btn btn-common">Address</a></li>
                <li class="li"><a href="all-order.html" class="btn btn-common">All Orders</a></li>
                <li class="li"><a href="wishlist.html" class="btn btn-common">Wishlist</a></li>
              </ul>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="innerWrapper">
                <div class="orderBox  patternbg">
                    리뷰
                </div>
                <div class="profile">
                  <div class="row">
                    <div class="col-md-2 col-sm-3 col-xs-12">
                      <div class="thumbnail">
                        <img src="http://www.dongkoo.com/uploads/product/%EB%8B%A5%ED%84%B0%EB%AA%A8%EB%8D%94%EB%82%98%ED%97%A4%EC%96%B4%ED%86%A0%EB%8B%89.png" 
                        width="270px" height="270px" alt="profile-image">
                        <div class="caption">
                          <a href="#" class="btn btn-primary btn-block" role="button">Change Avatar</a>
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="col-md-10 col-sm-9 col-xs-12">
                        <form class="form-horizontal" action="${ctx}/review/remove.do" method="post">
                          <div class="form-group">
                            <label for="" class="col-md-2 col-sm-3 control-label">Title</label>
                            <div class="col-md-10 col-sm-9">
                              <input type="text" class="form-control" id="" placeholder="" readonly="readonly" value="${review.reviewTitle }">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="" class="col-md-2 col-sm-3 control-label">Content</label>
                            <div class="col-md-10 col-sm-9">
                                <textarea class="form-control" id="" placeholder="" readonly="readonly">${review.reviewContent }</textarea>
                            </div>
                          </div>
                          <input type="hidden" name="reviewNo" id="reviewNo"  value="${review.reviewNo }">
                          <div class="text-right">
                           <a class="btn btn-common btn-theme" href="${ctx}/review/modify.do?reviewNo=${review.reviewNo}" >수정</a>
                           <button type="submit" class="btn btn-common btn-theme" id ="removeBtn">삭제</button> 
                           <a class="btn btn-common btn-theme" href="${ctx }/review/listpage.do">리뷰목록</a>
                           </div>                                          
                        </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
                    
      
      
              <div class="row">
          <div class="col-xs-12">
            <div class="tabCommon tabOne singleTab">
              <ul class="nav nav-tabs">
              <div class="text-left">
              <input type="button" class="btn btn-common btn-theme" value="Reply(2)"> 
              </div>
              </ul>
              <div class="tab-content patternbg">
               <div id="reviews" class="tab-pane fade in active">
					   
					   
			  <c:forEach items="${review.replys }" var="reply" varStatus="status">            
                  <li class="replyLi" data-reply=${reply.replyNo }>
                  <div class="blogCommnets">
                    <div class="media">
                      <a class="media-left" href="#">
                        <img class="media-object" src="http://placehold.it/70x70" alt="Image">
                      </a>
                      <div class="media-body">
                        <h4 class="media-heading">리뷰작성자</h4>
                        <h5><span><i class="fa fa-calendar" aria-hidden="true"></i>날짜</span></h5>
                        <p class="timeline-body" >${reply.replyContent }</p>
                        <button class="btn btn-link">Reply</button>
                        <div class="text-right">
                        <input class="timeline-header" type="hidden" name ="${reply.replyNo }" id ="${reply.replyNo }" value="${reply.replyNo }"/>
                        
          
<!--                          <FORM NAME="myForm" method=post action=""> -->
<!-- 							<input type="button" class="glyphicon glyphicon-cog pull-right" style="padding:10px" VALUE="Textarea 추가" onclick="addBox(this.form)"/> -->
<!-- 						</FORM> -->
<!-- 						<input type="checkbox" data-toggle="toggle"   id="toggle-two" data-on="수정취소" data-off="수정" id="toggle-two"> -->
						
<!--                          <button type="submit" class="btn btn-common btn-theme" id="replyModBtn">수정</button> -->
						<div class="timeline-footer">
                         <a style="padding:10px" data-toggle="modal"
								data-target="#modifyModal"><i class="fa fa-pencil"aria-hidden="true"></i></a>
                         <a style="padding:10px" href="javascript:removeReply(${reply.replyNo});"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
						</div>
                          </div>
                      </div>
                    </div>
                  </div>
            	</li>
                  </c:forEach> 
<!--                     <div class="media mediaMargin"> -->
<!--                       <a class="media-left" href="#"> -->
<!--                         <img class="media-object" src="http://placehold.it/70x70" alt="Image"> -->
<!--                       </a> -->
<!--                       <div class="media-body"> -->
<!--                         <h4 class="media-heading">대댓글 제목</h4> -->
<!--                         <h5><span><i class="fa fa-calendar" aria-hidden="true"></i>날짜</span></h5> -->
<!--                         <p>내용</p> -->
<!--                         <button class="btn btn-link">Reply</button> -->
                        
<!--                       </div> -->
                    </div>
                  </div>
                  <div class="commentsForm">
                    <h3>leave a comment</h3>
<!--                   <form action="" method="POST" role="form"> -->
                      <div class="form-group">
                        <textarea class="form-control" rows="3"  name ="replyContent" placeholder="Type Your Comment"></textarea>
                      </div>
<!--                       <div class="form-group form-half form-left"> -->
<!--                         <input type="text" class="form-control" id="" placeholder="Name"> -->
<!--                       </div> -->
<!--                       <div class="form-group form-half form-right"> -->
<!--                         <input type="email" class="form-control" id="" placeholder="Email"> -->
<!--                       </div> -->
                    <div class="text-right">
                        <button type="button" class="btn btn-common btn-theme" id="replyAddBtn">댓글 작성</button>
                    </div>
            </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
        


   
     

  <!-- JAVASCRIPTS -->
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script src="${ctx }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="${ctx }/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
  <script src="${ctx }/resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
  <script src="${ctx }/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
  <script src="${ctx }/resources/plugins/isotope/isotope.min.js"></script>
  <script src="${ctx }/resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
  <script src="${ctx }/resources/plugins/isotope/isotope-triger.min.js"></script>
  <script src="${ctx }/resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
  <script src="${ctx }/resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
  <script src="${ctx }/resources/plugins/syotimer/jquery.syotimer.min.js"></script>
  <script src="${ctx }/resources/js/custom.js"></script>



<script>
//   $(function() {
//     $('#toggle-two').bootstrapToggle({
//       on: 'e',
//       off: 'd'
//     });
//   })
</script>


<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replyContent" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-common btn-theme" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-common btn-theme btn-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



<script>
$(".timeline").on("click", ".replyLi", function(event) {

	var reply = $(this);

	$("#replyContent").val(reply.find('.timeline-body').text());

});



</script>




<SCRIPT>
var count = 1; 
var num = 1; 

function addBox (x) {
  if (document.all) {  // 인터넷 익스플로러 4.0 이상이면,
    var Commentext = '<p><textarea NAME="Comment' + count++ + '" rows="5" cols="50" style="background-color:#F5F5F5">textarea '+num++ +'<\/textarea>';
    x.insertAdjacentHTML('beforeEnd', Commentext)
  }
  else if (document.getElementById) {  // 넷스케이프 6.0 이상이면,
    var newArea = document.createElement('textarea');
    newArea.name = 'Comment' + count++;
    newArea.rows = 5;
    newArea.cols = 50;
    x.appendChild(document.createElement('p'));
    x.appendChild(newArea);
  }
  else if (document.layers) {  // 넷스케이프 4.0 이상이면,
    var newLayer = new Layer (window.innerWidth);
    var Commentext = '';
    Commentext += '<html><body><form name="myForm">';
    Commentext += '<textarea name="Comment" rows="5" cols="50" style="background-color:#F5F5F5">textarea '+num++ +'<\/textarea>';
    Commentext += '<\/form><\/body><\/html>';
    newLayer.document.write(Commentext);
    newLayer.document.close();
    newLayer.top = document.height;
    document.height += newLayer.document.height;
    newLayer.visibility = 'show';
  }
 else {alert('네츠케이프와 익스플로러 4.0 이상에서만 사용할 수 있습니다')};
}

</SCRIPT>




<script>

var reviewNo = ${review.reviewNo};

var replyPage = 1;

$("#replyAddBtn").on("click", function() {

	//var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#replyContent");
	var reviewtextObj = $("#reviewNo");
//		var replyer = replyerObj.val();
	var postNo = reviewtextObj.val();
	var replyContent = replytextObj.val();

	$.ajax({
		type : 'post',
		url : '/BeautyMate/replies/register',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override": "POST" 
		},
		dataType : 'text',
		data : JSON.stringify({
			replyContent : replyContent,
			postNo : postNo
		}),
		success : function(result) {
			console.log("result: " + result);
			if (result == 'SUCCESS') {
				alert("등록 되었습니다.");
				replyPage = 1;
				getPage("/BeautyMate/review/detail.do?reviewNo="+reviewNo); // 바꿔야됨
//					replyerObj.val("");
				replytextObj.val("");
			}
		}
	});
});

// var modifyReply = function(replyNo) {
// 	$.ajax({
// 		url:"/BeautyMate/replies/modify/" +replyNo,
// 		type: 'get',
// 		headers : {
// 			"Content-Type" : "application/json",
// 			"X-HTTP-Method-Override": "GET" 
// 		},
// 		dataType : 'text',
// 		success : modify
// 	});
// };


$("#replyModBtn").on("click", function() {

	var rno = $(".modal-title").html();
	var replyContent = $("#replyContent").val();

	$.ajax({
		type : 'post',
		url : '/BeautyMate/replies/modify',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
			replyContent : replyContent
		}),
		dataType : 'text',
		success : function(result) {
			console.log("result: " + result);
			if (result == 'SUCCESS') {
				alert("수정 되었습니다.");
				getPage("/BeautyMate/review/detail.do?reviewNo="+reviewNo); // 바꿔야됨
			}
		}
	});
});





var removeReply = function(replyNo) {
	$.ajax({
		url:"/BeautyMate/replies/remove/"+replyNo
		,type:"get"
		,headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override": "GET" 
		},
		dataType : 'text',
		success : function(result) {
			
			if (result == 'SUCCESS') {
				alert("삭제 되었습니다.");
				getPage("/BeautyMate/review/detail.do?reviewNo="+reviewNo); // 바꿔야됨
			}
		}
	});
};






</script>




  <script>
  	//paste this code under head tag or in a seperate js file.
  	// Wait for window load
  	$(window).load(function() {
  		// Animate loader off screen
  		$(".se-pre-con").fadeOut("slow");
  		
  	});
  </script>
</body>

</html>
