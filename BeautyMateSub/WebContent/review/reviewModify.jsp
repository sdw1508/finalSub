<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Beauty Mate</title>

<!-- GOOGLE FONT -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff"
	rel="stylesheet">

<!-- PLUGINS CSS STYLE -->
<link href="${ctx }/resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<link href="${ctx }/resources/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${ctx }/resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${ctx }/resources/plugins/selectbox/select_option1.css"
	rel="stylesheet">
<link href="${ctx }/resources/plugins/owl-carousel/owl.carousel.min.css"
	rel="stylesheet" media="screen">
<link href="${ctx }/resources/plugins/fancybox/jquery.fancybox.pack.css"
	rel="stylesheet">
<link href="${ctx }/resources/plugins/isotope/isotope.min.css"
	rel="stylesheet">
<link href="${ctx }/resources/plugins/datepicker/datepicker.min.css"
	rel="stylesheet">
<link
	href="${ctx }/resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css"
	rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="${ctx }/resources/css/style.css" rel="stylesheet">
<link href="${ctx }/resources/css/default.css" rel="stylesheet"
	id="option_color">


<!-- FAVICON -->
<link href="${ctx }/resources/img/favicon.png" rel="shortcut icon">


      <script src="${ctx}/resources/js/jQuery-2.1.4.min.js"></script>


<style>
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background:
		url(${ctx}/resources/plugins/simple-pre-loader/images/loader-64x/Preloader_2.gif)
		center no-repeat #fff;
	}
	
	
.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted blue;
}
		
	#uplist { 
	     list-style:none;
	     margin-left : 0px; 
	     padding:0; 
	     
 	} 

	#imgli { 
     margin: 0 0 0 0; 
     padding: 0 0 0 0;
     border : 0;
     float: left;
 	} 
		
}
</style>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
div.stars {
	width: 270px;
	display: inline-block;
}

.floating {
	position: fixed;
	right: 50%;
	top: 180px;
	margin-right: -720px;
	text-align: center;
	width: 120px;
}

input.star {
	display: none;
}

label.star {
	float: right;
	padding: 10px;
	font-size: 36px;
	color: #444;
	transition: all .2s;
}

input.star:checked ~ label.star:before {
	content: '\f005';
	color: #FD4;
	transition: all .25s;
}

input.star-5:checked ~ label.star:before {
	color: #FE7;
	text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before {
	color: #F62;
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3);
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome;
}
</style>

</head>

<body class="body-wrapper static">
	<div class="se-pre-con"></div>
	<div class="main-wrapper">
		<!-- HEADER -->
<%-- 		<%@ include file="../common/header.jspf"%> --%>
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
            <a class="navbar-brand" href="${ctx}/index.jsp"><img src="${ctx}/resources/img/logo.png" alt="logo" ></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="active">
                <a href="${ctx}/index.jsp">HOME</a>
              </li>
                <li class=" dropdown singleDrop">
                <a href="${ctx}/survey/survey.do">PICKMETEM</a>
               
              </li>
              <li class=" dropdown singleDrop">
                <a href="${ctx }/cosmetic/showAll.do" >RANKING</a>
               
              </li>
              <li class=" dropdown megaDropMenu">
                <a href="${ctx }/review/listpage.do" >REVIEW</a>
               
              </li>
              <li class=" dropdown singleDrop">
                <a href="${ctx }/beautyTip/list.do" >BeautyTip</a>
                
              </li>
              <li class=" dropdown singleDrop">
                 <a href="${ctx }/myPouch/list.do">MY Pouch</a>
             
            </ul>
          </div>
		

					<!-- USER SECTION -->
					<section class="clearfix userSection padding">
						<div class="container">
							<div class="row">
								<div class="col-xs-12">
									<ul class="list-inline squareBtn">
										<li class="li"><a href="user-dashboard.html"
											class="btn btn-common">Account Dashboard</a></li>
										<li class="li"><a href="user-profile.html"
											class="btn btn-common btn-theme">Profile</a></li>
										<li class="li"><a href="address.html"
											class="btn btn-common">Address</a></li>
										<li class="li"><a href="all-order.html"
											class="btn btn-common">All Orders</a></li>
										<li class="li"><a href="wishlist.html"
											class="btn btn-common">Wishlist</a></li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="innerWrapper">
										<div class="orderBox  patternbg">리뷰수정</div>
										<div class="profile">
										<form class="form-horizontal"
														action="${ctx }/review/modify.do" method="post" role="form">
											<div class="row">
												<div class="col-md-2 col-sm-3 col-xs-12">
													<div class="thumbnail">
														<img src="${review.cosmetic.img }" width="270px"
															height="270px" alt="profile-image" >
														
													</div>
												</div>
												<div class="col-md-10 col-sm-9 col-xs-12">

														
															<input type='hidden' name='page' value="${pager.page}"> 
															<input type='hidden' name='perPageNum' value="${pager.perPageNum}">
															<input type='hidden' name='searchType' value="${pager.searchType}">
															<input type='hidden' name='keyword' value="${pager.keyword}">
														
														<div class="form-group">
															<label for="" class="col-md-2 col-sm-3 control-label">Title</label>
															<div class="col-md-10 col-sm-9">
																<input type="text" class="form-control" id=""
																	name='reviewTitle' placeholder=""
																	value="${review.reviewTitle}">
															</div>
															<div class="panel panel-default cartInfo">
															<div class="input-group">
																<label for="" class="col-md-2 col-sm-3 control-label">Cosmetic</label>
																<div class="col-md-10 col-sm-9">
																	<input type="text" class="form-control"
																		name="cosmeticName" id="cosmeticName"
																		value="${review.cosmetic.cosmeticName }"
																		aria-describedby="basic-addon221" readonly="readonly"></input>
																	
																</div>
																<div class="stars">
														<input class="star star-5"
															id="star-5" type="radio"
															name="star" value="5" /> <label class="star star-5"
															for="star-5"></label> <input
															class="star star-4" id="star-4"
															type="radio" name="star" value="4" /> <label
															class="star star-4" for="star-4"></label>
														<input class="star star-3"
															id="star-3" type="radio"
															name="star" value="3" /> <label class="star star-3"
															for="star-3"></label> <input
															class="star star-2" id="star-2"
															type="radio" name="star" value="2" /> <label
															class="star star-2" for="star-2"></label>
														<input class="star star-1"
															id="star-1" type="radio"
															name="star" value="1" /> <label class="star star-1"
															for="star-1"></label>
													</div>
													<input type="hidden" id="grade" name="recommend.grade" value="" >
															</div>
														</div>
														</div>
														<div class="form-group">
															<label for="" class="col-md-2 col-sm-3 control-label">Content</label>
															<div class="col-md-10 col-sm-9">
																<textarea class="form-control" id=""
																	name='reviewContent' placeholder="">${review.reviewContent}</textarea>
															</div>
															<input type="hidden" name="reviewNo" value="${review.reviewNo }">
															<input type="hidden" value="${review.cosmetic.cosmeticNo }" name="cosmetic.cosmeticNo">
															<input type="hidden" value="${review.recommend.recommendNo }" name= "recommend.recommendNo">
															<input type="hidden" value="${review.recommend.cosmeticNo }" name= "recommend.cosmeticNo">
														</div>
														
														
														
														
													<div class="form-group">
														<label for="exampleInputEmail1">File Upload</label>
														<div class="fileDrop"></div>
													</div>



													<div>
														<hr>
													</div>

													<ul class="mailbox-attachments clearfix uploadedList">
													</ul>
														
														
														
														<div class="text-right">
															<button type="submit" id="modify" class="btn btn-common btn-theme">수정
															</button>
														<a class="btn btn-common btn-theme" href="${ctx }/review/listpage.do">취소</a>
<!-- 															<button type="submit" id="back" class="btn btn-common btn-theme">취소 -->
<!-- 															</button> -->
															

														</div>
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>







					<!-- JAVASCRIPTS -->
					<script type="text/javascript"
						src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
					<script src="${ctx }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
					<script
						src="${ctx }/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
					<script
						src="${ctx }/resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
					<script
						src="${ctx }/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
					<script src="${ctx }/resources/plugins/isotope/isotope.min.js"></script>
					<script
						src="${ctx }/resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
					<script
						src="${ctx }/resources/plugins/isotope/isotope-triger.min.js"></script>
					<script
						src="${ctx }/resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
					<script
						src="${ctx }/resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
					<script
						src="${ctx }/resources/plugins/syotimer/jquery.syotimer.min.js"></script>
					<script src="${ctx }/resources/js/custom.js"></script>
					
					
					
					
					<script type="text/javascript" src="${ctx }/resources/js/upload.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
				<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<%-- <a href="${ctx}{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a> --%>

<script id="template" type="text/x-handlebars-template">
<li id='imgli'>
  <span class="mailbox-attachment-icon has-img"><img src="${ctx}{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="${ctx}{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"></a>
	<a data-src="{{fullName}}" ><i class="fa fa-fw fa-remove"></i></a> 
	</span>
  </div>
</li>                
</script> 


<script>



var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	
	
	$.ajax({
		  url: '${ctx}/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
// 			  console.log(fileInfo);
// 			  console.log(html);
			  
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$(".uploadedList").on("click", "a", function(event){
	
	 var that = $(this);

 $.ajax({
	   url:"${ctx}/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("data-src")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
 });
});

var postNo = ${review.reviewNo};


$.getJSON("${ctx}/review/getAttach/"+postNo,function(list){
	$(list).each(function(){
		
		var fileInfo = getFileInfo(this);
		console.log(fileInfo);
		var html = template(fileInfo);
		console.log(html);
		
		 $(".uploadedList").append(html);
		
	});
});




</script>
					
					
					<script>
						$(document).ready( function() {
											
						
						$('input:radio[name="star"]:input[value=${review.recommend.grade}]').attr("checked",true); // grade 값 가져오기			

						var formObj = $("form[role='form']");

						console.log(formObj);

						formObj.submit(function(event) {
									// 등급값 전달
									document.getElementById("grade").value = $(":input:radio[name=star]:checked").val();
									
									event.preventDefault();
									
									var that = $(this);
									
									var str ="";
									$(".uploadedList .delbtn").each(function(index){
										 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
									});
									
									that.append(str);

									that.get(0).submit();
																			
								});
						
						$("#back").on("click",
								function() {
							
							self.location = "${ctx}/review/listpage.do?page=${pager.page}&perPageNum=${pager.perPageNum}"
								+ "&searchType=${pager.searchType}&keyword=${pager.keyword}";

								});
						
					});
					</script>


					<script>
						//paste this code under head tag or in a seperate js file.
						// Wait for window load
						$(window).load(function() {
							// Animate loader off screen
							$(".se-pre-con").fadeOut("slow");
							;
						});
					</script>
</body>

</html>