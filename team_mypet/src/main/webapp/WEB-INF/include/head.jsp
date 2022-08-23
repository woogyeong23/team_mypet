<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>MyPet Project</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="resources/assets/images/logo/mypetLogo.png" />


    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="resources/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="resources/assets/css/main.css" />
    
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    
    <style>
          *{ 
  font-family: 'Nanum Gothic', sans-serif;

    } 
    
      #naver.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color:#FFFFF0
    }
     </style>
     
     
     
     
     <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	  //nav
	  var lnb = $("#naver").offset().top;
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#naver").addClass("fixed");
	    }else{
	      $("#naver").removeClass("fixed");
	    }
	  });
	  //nav
});


	 </script>
    
