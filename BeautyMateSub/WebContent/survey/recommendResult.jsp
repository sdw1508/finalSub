
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="ctx">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- SITE TITTLE -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>추천된 화장품</title>

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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  

<style>
/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript,
  if it's not present, don't show loader */
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
		url(${ctx }/resources/plugins/simple-pre-loader/images/loader-64x/Preloader_2.gif)
		center no-repeat #fff;
}
</style>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.skillbar {
  font-family: 'Open Sans', 'sans-serif';
	position:relative;
	display:block;
	margin-bottom:15px;
	width:100%;
	background:#eee;
	height:35px;
	border-radius:3px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	-webkit-transition:0.4s linear;
	-moz-transition:0.4s linear;
	-ms-transition:0.4s linear;
	-o-transition:0.4s linear;
	transition:0.4s linear;
	-webkit-transition-property:width, background-color;
	-moz-transition-property:width, background-color;
	-ms-transition-property:width, background-color;
	-o-transition-property:width, background-color;
	transition-property:width, background-color;
}

.skillbar-title {
	position:absolute;
	top:0;
	left:0;
	font-weight:bold;
	font-size:13px;
	color:#fff;
	background:#6adcfa;
	-webkit-border-top-left-radius:3px;
	-webkit-border-bottom-left-radius:4px;
	-moz-border-radius-topleft:3px;
	-moz-border-radius-bottomleft:3px;
	border-top-left-radius:3px;
	border-bottom-left-radius:3px;
}

.skillbar-title span {
	display:block;
	background:rgba(0, 0, 0, 0.1);
	padding:0 20px;
	height:35px;
	line-height:35px;
	-webkit-border-top-left-radius:3px;
	-webkit-border-bottom-left-radius:3px;
	-moz-border-radius-topleft:3px;
	-moz-border-radius-bottomleft:3px;
	border-top-left-radius:3px;
	border-bottom-left-radius:3px;
}

.skillbar-bar {
	height:35px;
	width:0px;
	background:#6adcfa;
	border-radius:3px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
}

.skill-bar-percent {
	position:absolute;
	right:10px;
	top:0;
	font-size:11px;
	height:35px;
	line-height:35px;
	color:#444;
	color:rgba(0, 0, 0, 0.4);
}
</style>

</head>

<body class="body-wrapper static">
	<div class="se-pre-con"></div>
	<div class="main-wrapper">
		<%@ include file="../common/header.jspf"%>


		<!-- PRODUCT SECTION -->
		<section class="container-fluid clearfix productArea">
			<div class="container">

				<div class="panel panel-default cartInfo">
					<div>
						<div class="input-group">
							<h1>화장품 추천 결과</h1>

						</div>
					</div>
					<h3>추천하는 화장품 목록입니다.</h3>
				</div>
				<br>
				<div class="row" id="cosmeticList">
					<c:forEach items="${cosmetics}" var="cosmetics" varStatus="sts" >
					
						<form action="">
							<div class="col-md-4 col-sm-6 col-xs-12">
								<div class="produtSingle">
									<div class="produtImage">
										<img src="${cosmetics.img }" alt="Image Product"
											class="img-responsive">
									</div>
									<div class="productCaption">
										<h4>${cosmetics.cosmeticName }</h4>

									</div>
									<div>
										<div class="skillbar clearfix " data-percent="${values[sts.index]  }%">
											<div class="skillbar-title" style="background: #88cd2a;">
												<span>추천율</span>
											</div>
											<div class="skillbar-bar" style="background: #88cd2a;"></div>
											<div class="skill-bar-percent">${values[sts.index]  }%</div>
										</div>
									</div>
									
									
                        <div class="row">
                            
                                    <div class="collapse navbar-collapse navbar-ex1-collapse content-collapse">
                                        <ul class="nav navbar-nav collapse-nav">
                                            
                                            <li class=""><a class="collapsed" href="javascript:;" data-toggle="collapse" data-target="#collapse_${cosmetics.cosmeticNo}" aria-expanded="false">고객님의 피부타입과 <br><span style="color:black;font:bold 1.2em/1em Georgia, serif;font-size:3;">"${cosmetics.cosmeticName }"</span>의 <br>성분비교 결과<i
										class="fa fa-plus"></i></a>
                                                <div id="collapse_${cosmetics.cosmeticNo}" class="collapseItem collapse" aria-expanded="false" style="height: 0px;">
                                                    <div class="collapse-inner">
                                                        <span style="color:black;font:bold 1.2em/1em Georgia, serif;font-size:3;">추천 성분 결과 :</span>
                                                        <c:set var="getReco" value="recoList_${cosmetics.cosmeticNo }"/>
                                                        <c:set var="reco" value="${requestScope[getReco]}" />
<c:choose>
    <c:when test="${empty reco}">
        고객님의 스킨타입에따른 <span style="color:green;font:bold 1.2em/1em Georgia, serif;font-size:3;">추천성분</span>과 본 화장품의 성분과 일치하는 성분이 없습니다.
    </c:when>
    <c:otherwise>
       <span style="color:green;font:italic bold 1.5em/1em Georgia, serif;font-size:5;">${reco }</span> 이런 성분이 <span style="color:green;font:bold 1.2em/1em Georgia, serif;font-size:3;">추천 성분</span>과 일치합니다.
    </c:otherwise>
</c:choose>                     
<br>
                                                        <span style="color:black;font:bold 1.2em/1em Georgia, serif;font-size:3;">비추천 성분 결과 :</span>
                                                        <c:set var="getBan" value="banList_${cosmetics.cosmeticNo }"/>
                                                        <c:set var="ban" value="${requestScope[getBan]}" />
<c:choose>
    <c:when test="${empty ban}">
        고객님의 스킨타입에따른 <span style="color:red;font:bold 1.2em/1em Georgia, serif;font-size:3;">비추천성분</span>과 본 화장품의 성분과 일치하는 성분이없습니다.
    </c:when>
    <c:otherwise>
    선택에 신중해주세요  <span style="color:red;font:italic bold 1.5em/1em Georgia, serif;font-size:5;">${ban }</span> 이런 성분이 <span style="color:red;font:bold 1.2em/1em Georgia, serif;font-size:3;">비추천 성분</span>과 일치합니다.
    </c:otherwise>
</c:choose>  
                                                         </div>
                                                </div>
                                            </li>
                                            
                                            
                                        </ul>
                                    </div>
                                
                        </div>
                        <br>
                        </div>
                </div>
									
								
						</form>
					</c:forEach>
				</div>
			</div>
		</section>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		</div>
		<%@ include file="../common/footer.jspf"%>
		<!-- JAVASCRIPTS -->
		<script type="text/javascript"
			src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="${ctx }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
		<script src="${ctx }/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script
			src="${ctx }/resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script
			src="${ctx }/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script src="${ctx }/resources/plugins/isotope/isotope.min.js"></script>
		<script
			src="${ctx }/resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
		<script src="${ctx }/resources/plugins/isotope/isotope-triger.min.js"></script>
		<script
			src="${ctx }/resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
		<script
			src="${ctx }/resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
		<script
			src="${ctx }/resources/plugins/syotimer/jquery.syotimer.min.js"></script>
		<script src="${ctx }/resources/js/custom.js"></script>

		<script>
			//paste this code under head tag or in a seperate js file.
			// Wait for window load
			$(window).load(function() {
				// Animate loader off screen
				$(".se-pre-con").fadeOut("slow");
				;
			});
			
			$(document).ready(function(){
				jQuery('.skillbar').each(function(){
					jQuery(this).find('.skillbar-bar').animate({
						width:jQuery(this).attr('data-percent')
					},2000);
				});
			});
		
		</script>
		
		
</body>

</html>



