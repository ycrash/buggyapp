(function ($) {
    "use strict";

    /*===============================
    =         Wow Active            =
    ================================*/

    new WOW().init();
    
    /*=============================================
    =       Menu sticky & Scroll to top          =
    =============================================*/
	var windows = $(window);
	var screenSize = windows.width();
	var sticky = $('.header-sticky');
	var $html = $('html');
	var $body = $('body');

	windows.on('scroll', function () {
		var scroll = windows.scrollTop();
		var headerHeight = sticky.height();

		if (screenSize >= 320) {
			if (scroll < headerHeight) {
				sticky.removeClass('is-sticky');
			} else {
				sticky.addClass('is-sticky');
            }
		}

    });
    /*----------  Scroll to top  ----------*/
    function scrollToTop() {
        var $scrollUp = $('#scroll-top'),
            $lastScrollTop = 0,
            $window = $(window);

        $window.on('scroll', function () {
            var st = $(this).scrollTop();
            if (st > $lastScrollTop) {
                $scrollUp.removeClass('show');
            } else {
                if ($window.scrollTop() > 200) {
                    $scrollUp.addClass('show');
                } else {
                    $scrollUp.removeClass('show');
                }
            }
            $lastScrollTop = st;
        });

        $scrollUp.on('click', function (evt) {
            $('html, body').animate({scrollTop: 0}, 600);
            evt.preventDefault();
        });
    }
    scrollToTop();
    
    /*=========================================
    =            Preloader active            =
    ===========================================*/

    windows.on('load', function(){
        $(".preloader-activate").removeClass('preloader-active');
    });
    
    
    jQuery(window).on('load', function(){
		setTimeout(function(){
        jQuery('.open_tm_preloader').addClass('loaded');
        }, 1000);
	});
    

    /*=========================================
    =            One page nav active          =
    ===========================================*/
    
    var top_offset = $('.navigation-menu--onepage').height() - 60;
    $('.navigation-menu--onepage ul').onePageNav({
        currentClass: 'active',
        scrollOffset: top_offset,
    });
    
    var top_offset_mobile = $('.header-area').height();
    $('.offcanvas-navigation--onepage ul').onePageNav({
        currentClass: 'active',
        scrollOffset: top_offset_mobile,
    });
    
    
    /*===========================================
    =            Submenu viewport position      =
    =============================================*/
    
    if ($(".has-children--multilevel-submenu").find('.submenu').length) {
        var elm = $(".has-children--multilevel-submenu").find('.submenu');
        
        elm.each(function(){
            var off = $(this).offset();
            var l = off.left;
            var w = $(this).width();
            var docH = windows.height();
            var docW = windows.width() - 10;
            var isEntirelyVisible = (l + w <= docW);

            if (!isEntirelyVisible) {
                $(this).addClass('left');
            }
        });
    }
    /*==========================================
    =            mobile menu active            =
    ============================================*/
    
    $("#mobile-menu-trigger").on('click', function(){
        $("#mobile-menu-overlay").addClass("active");
        $body.addClass('no-overflow');
    });
    
    $("#mobile-menu-close-trigger").on('click', function(){
        $("#mobile-menu-overlay").removeClass("active");
        $body.removeClass('no-overflow');
    });
    
    $(".offcanvas-navigation--onepage ul li a").on('click', function(){
        $("#mobile-menu-overlay").removeClass("active");
        $body.removeClass('no-overflow');
    });
    
    /*Close When Click Outside*/
    $body.on('click', function(e){
        var $target = e.target;
        if (!$($target).is('.mobile-menu-overlay__inner') && !$($target).parents().is('.mobile-menu-overlay__inner') && !$($target).is('#mobile-menu-trigger') && !$($target).is('#mobile-menu-trigger i')){
            $("#mobile-menu-overlay").removeClass("active");
            $body.removeClass('no-overflow');
        }
        if (!$($target).is('.search-overlay__inner') && !$($target).parents().is('.search-overlay__inner') && !$($target).is('#search-overlay-trigger') && !$($target).is('#search-overlay-trigger i')){
            $("#search-overlay").removeClass("active");
            $body.removeClass('no-overflow');
        }
    });
    
    
    /*===================================
    =           Menu Activeion          =
    ===================================*/
    var cururl = window.location.pathname;
    var curpage = cururl.substr(cururl.lastIndexOf('/') + 1);
    var hash = window.location.hash.substr(1);
    if((curpage == "" || curpage == "/" || curpage == "admin") && hash=="")
        {
        //$("nav .navbar-nav > li:first-child").addClass("active");
        } else {
            $(".navigation-menu li").each(function()
        {
            $(this).removeClass("active");
        });
        if(hash != "")
            $(".navigation-menu li a[href*='"+hash+"']").parents("li").addClass("active");
        else
        $(".navigation-menu li a[href*='"+curpage+"']").parents("li").addClass("active");
    }
    
    
    /*=========================================
    =             open menu Active            =
    ===========================================*/
     $('.openmenu-trigger').on('click', function (e) {
        e.preventDefault();
        $('.open-menuberger-wrapper').addClass('is-visiable');
    });

    $('.page-close').on('click', function (e) {
        e.preventDefault();
        $('.open-menuberger-wrapper').removeClass('is-visiable');
    });
    
      
    /*=========================================
    =             open menu Active            =
    ===========================================*/
    $("#open-off-sidebar-trigger").on('click', function(){
        $("#page-oppen-off-sidebar-overlay").addClass("active");
        $body.addClass('no-overflow');
    });
    
    $("#menu-close-trigger").on('click', function(){
        $("#page-oppen-off-sidebar-overlay").removeClass("active");
        $body.removeClass('no-overflow');
    });
    
    /*=============================================
    =            search overlay active            =
    =============================================*/
    
    $("#search-overlay-trigger").on('click', function(){
        $("#search-overlay").addClass("active");
        $body.addClass('no-overflow');
    });
    
    $("#search-close-trigger").on('click', function(){
        $("#search-overlay").removeClass("active");
        $body.removeClass('no-overflow');
    });
    
    /*=============================================
    =            hidden icon active            =
    =============================================*/
    
    $("#hidden-icon-trigger").on('click', function(){
        $("#hidden-icon-wrapper").toggleClass("active");
    });
    

    /*=============================================
    =            newsletter popup active            =
    =============================================*/
    
    $("#newsletter-popup-close-trigger").on('click', function(){
        $("#newsletter-popup").removeClass("active");
    });
    
    
    /*=========================================
    =             open menu Active            =
    ===========================================*/
     $('.share-icon').on('click', function (e) {
        e.preventDefault();
        $('.entry-post-share').toggleClass('opened');
    });

    $body.on("click", function () {
        $(".entry-post-share").removeClass('opened');
    });
    // Prevent closing dropdown upon clicking inside the dropdown
    $(".entry-post-share").on("click", function(e) {
        e.stopPropagation();
    });
    
    /*=============================================
    =            offcanvas mobile menu            =
    =============================================*/
    var $offCanvasNav = $('.offcanvas-navigation'),
        $offCanvasNavSubMenu = $offCanvasNav.find('.sub-menu');
    
    /*Add Toggle Button With Off Canvas Sub Menu*/
    $offCanvasNavSubMenu.parent().prepend('<span class="menu-expand"><i></i></span>');
    
    /*Close Off Canvas Sub Menu*/
    $offCanvasNavSubMenu.slideUp();
    
    /*Category Sub Menu Toggle*/
    $offCanvasNav.on('click', 'li a, li .menu-expand', function(e) {
        var $this = $(this);
        if ( ($this.parent().attr('class').match(/\b(menu-item-has-children|has-children|has-sub-menu)\b/)) && ($this.attr('href') === '#' || $this.hasClass('menu-expand')) ) {
            e.preventDefault();
            if ($this.siblings('ul:visible').length){
                $this.parent('li').removeClass('active');
                $this.siblings('ul').slideUp();
            } else {
                $this.parent('li').addClass('active');
                $this.closest('li').siblings('li').removeClass('active').find('li').removeClass('active');
                $this.closest('li').siblings('li').find('ul:visible').slideUp();
                $this.siblings('ul').slideDown();
            }
        }
    });
    
    /*=======================================
    =    	Portfolio Masonry Activation    =
    =========================================*/

        $('.projects-masonary-wrapper').imagesLoaded(function () {

            // filter items on button click
            $('.messonry-button').on('click', 'button', function () {
                var filterValue = $(this).attr('data-filter');
                $(this).siblings('.is-checked').removeClass('is-checked');
                $(this).addClass('is-checked');
                $grid.isotope({
                    filter: filterValue
                });
            });

            // init Isotope
            var $grid = $('.mesonry-list').isotope({
                percentPosition: true,
                transitionDuration: '0.7s',
                layoutMode: 'masonry',/*
                masonry: {
                    columnWidth: '.resizer',
                }*/
            });
        });
    
  
    /*==================================
    =	      Mesonry Activation       =
    ===================================*/

    $('.masonry-activation').imagesLoaded(function () {
        // init Isotope
        var $grid = $('.masonry-wrap').isotope({
            itemSelector: '.masonary-item',
            percentPosition: true,
            transitionDuration: '0.7s',
            masonry: {
                // use outer width of grid-sizer for columnWidth
                columnWidth: 2,
                percentPosition: true
            }
        });

    });
    
    
    /*=============================================
    =            background image            =
    =============================================*/

    var bgSelector = $(".bg-img");
    bgSelector.each(function (index, elem) {
        var element = $(elem),
            bgSource = element.data('bg');
        element.css('background-image', 'url(' + bgSource + ')');
    });

    /*=============================================
    =            wavify activation            =
    =============================================*/

    

    if($('#feel-the-wave , .feel-the-wave').length) {
        $('#feel-the-wave , .feel-the-wave').wavify({
            height: 80,
            bones: 5,
            amplitude: 100,
            color: 'rgba(224,238,255,0.5)',
            //color: 'url(#gradient1)',
            speed: .15
        });
    }

    if($('#feel-the-wave-two , .feel-the-wave-two').length) {
        $('#feel-the-wave-two , .feel-the-wave-two').wavify({
            height: 120,
            bones: 4,
            amplitude: 60,
            color: 'rgba(224,238,255,0.4)',
            //color: 'url(#gradient2)',
            speed: .25
        });
    }

    /*=====  End of wavify activation  ======*/

    $(document).ready(function(){
        
    /*=============================================
    =            swiper slider activation            =
    =============================================*/
 
    var brandLogoSlider = new Swiper('.brand-logo-slider__container', {
        slidesPerView : 6,
        loop: true,
        speed: 1000,
        spaceBetween : 30,
        autoplay: {
            delay: 3000,
        },

        breakpoints: {
            1499:{
                slidesPerView : 6
            },

            991:{
                slidesPerView : 4
            },

            767:{
                slidesPerView : 3

            },

            575:{
                slidesPerView : 2
            }
        }
    });
    
    var carouselSlider = new Swiper('.top-info-slider__container', {
        slidesPerView : 3,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        autoplay: true,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-1',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },
            1200:{
                slidesPerView : 2
            },

            991:{
                slidesPerView : 1
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });
        
    var carouselSlider = new Swiper('.single-flexible__container', {
        slidesPerView : 1,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-1',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },
            1200:{
                slidesPerView : 2
            },

            991:{
                slidesPerView : 1
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });

        
    var carouselSlider = new Swiper('.service-slider__container', {
        slidesPerView : 4,
        slidesPerGroup: 4,
        loop: true,
        speed: 1000,
        autoplay: true,
        spaceBetween : 0,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-service',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3,
                slidesPerGroup: 3
            },
            1200:{
                slidesPerView : 3,
                slidesPerGroup: 3
            },

            991:{
                slidesPerView : 2,
                slidesPerGroup: 2
            },

            767:{
                slidesPerView : 1,
                slidesPerGroup: 1

            },

            575:{
                slidesPerView : 1,
                slidesPerGroup: 1
            }
        }
    });
  
    var carouselSlider = new Swiper('.service-slider__project-active', {
        slidesPerView : 1,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        autoplay: false,
        spaceBetween : 0,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-service',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 1
            },
            1200:{
                slidesPerView : 1
            },

            991:{
                slidesPerView : 1
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });

    
    var carouselSlider = new Swiper('.three-flexible__container', {
        slidesPerView : 3,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        autoplay: true,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-3',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },

            991:{
                slidesPerView : 2
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });


    var carouselSlider = new Swiper('.auto--center-flexible__container', {
        slidesPerView: 'auto',
        centeredSlides: true,
        freeMode: false,    
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-auto',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },

            991:{
                slidesPerView : 2
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });

    var carouselSlider = new Swiper('.auto--per-flexible__container', {
        slidesPerView: 'auto',
        centeredSlides: false,
        freeMode: true,    
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-5',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },

            991:{
                slidesPerView : 2
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });

    var mySwiper = new Swiper('.auto--pree-mode-flexible__container', {
        spaceBetween : 30,
        loop: true,
        freeMode: true,
        slidesPerView: 'auto',
        pagination: {
            el: '.swiper-pagination-6',
            type: 'bullets',
            clickable: true
        },
        autoplay: {
            delay: 0,
            disableOnInteraction: false,
        },
        speed: 7000
    });
        
    var carouselSlider = new Swiper('.carousel-slider__container', {
        slidesPerView : 3,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-9',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },

            991:{
                slidesPerView : 2
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });
        
    var carouselSlider = new Swiper('.projects-slider__container', {
        slidesPerView : 3,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        spaceBetween : 0,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-project',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 3
            },

            1200:{
                slidesPerView : 2
            },
            
            991:{
                slidesPerView : 2
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });    
        
        
    var carouselSlider = new Swiper('.testimonial-slider__container', {
        slidesPerView : 2,
        slidesPerGroup: 1,
        loop: true,
        speed: 1000,
        spaceBetween : 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-t01',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 2
            },

            991:{
                slidesPerView : 1
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });
        
    var carouselSlider = new Swiper('.testimonial-slider__container-two', {
        slidesPerView : 3,
        slidesPerGroup: 1,
        centeredSlides: true,
        loop: true,
        speed: 1000,
        spaceBetween : 50,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination-t0',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            1499:{
                slidesPerView : 2
            },

            991:{
                slidesPerView : 1
            },

            767:{
                slidesPerView : 1

            },

            575:{
                slidesPerView : 1
            }
        }
    });

    /*=====  End of swiper slider activation  ======*/
    });
    
    /* =====================================
        Fullpage Scroll Animation   
    ======================================*/
    if ($('#fullpage').length) {
        $('#fullpage').fullpage({
            scrollBar: false,
            navigation: true,
            loopBottom: false,
            sectionSelector: 'section',
            scrollingSpeed: 1000,
            autoScrolling: true,
            fitToSection: true,
            fitToSectionDelay: 1000,
            afterLoad: function () {
                var activeSetion = $('.fp-viewing-' + 3);
                activeSetion.addClass('tm-one-page-footer-expanded');
            },
        });
    }

    
    /*=============================================
    =            circle progress active            =
    =============================================*/
    
    $('.chart-progress , .chart-progress__box').appear(function () {
		$('.chart-progress, .chart-progress__box').circleProgress({
			startAngle: -Math.PI / 4 * 2,
		});

	});
    
    /*======================================
    =       Countdown Activation          =     
    ======================================*/
	$('[data-countdown]').each(function () {
		var $this = $(this),
			finalDate = $(this).data('countdown');
		$this.countdown(finalDate, function (event) {
			$this.html(event.strftime('<div class="single-countdown"><span class="single-countdown__time">%D</span><span class="single-countdown__text">Days</span></div><div class="single-countdown"><span class="single-countdown__time">%H</span><span class="single-countdown__text">Hours</span></div><div class="single-countdown"><span class="single-countdown__time">%M</span><span class="single-countdown__text">Minutes</span></div><div class="single-countdown"><span class="single-countdown__time">%S</span><span class="single-countdown__text">Seconds</span></div>'));
		});
	});
    
    /*======================================
    =       instagram image slider        =     
    ======================================*/

	// User Changeable Access
	var activeId2 = $("#instafeed"),
	myTemplate2 = '<div class="grid-item"><div class="instagram-item"><a href="{{link}}" target="_blank" id="{{id}}"><img src="{{image}}" /> <div class="instagram-hvr-content"><span class="tottallikes"><i class="fa fa-heart"></i>{{likes}}</span><span class="totalcomments"><i class="fa fa-comments"></i>{{comments}}</span></div> </a></div></div>';

	if (activeId2.length) {
		var userID_one = activeId2.attr('data-userid_one'),
			accessTokenID2 = activeId2.attr('data-accesstoken2'),

			userFeed2 = new Instafeed({
				get: 'user',
				userId: userID_one,
				target: 'instafeed',
				accessToken: accessTokenID2,
				resolution: 'standard_resolution',
				template: myTemplate2,
				sortBy: 'least-recent',
				limit: 6,
				links: false
			});
		userFeed2.run();
	}

    
    /* ==================================
    =          Option Demo              =
    =====================================*/
    var $demoOption = $('.demo-option-container')


    $('.quick-option').on('click', function (e) {
        e.preventDefault(),
        function () {
            $demoOption.toggleClass('open')
        }()
    });


    /*=============================================
    =            counter up active            =
    =============================================*/
    
    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });
   
    /*===================================
        Svg Icon Draw
    ====================================*/ 
    var $svgIconBox = $('.single-svg-icon-box');
    $svgIconBox.each(function() {
        var $this = $(this),
            $svgIcon = $this.find('.svg-icon'),
            $id = $svgIcon.attr('id'),
            $icon = $svgIcon.data('svg-icon');
        var $vivus = new Vivus($id, { duration: 100, file: $icon });
        $this.on('mouseenter', function () {
            $vivus.reset().play();
        });
    });
    
    /*=====================================
    =          Countdown Time Circles     =
    =======================================*/

    $('#DateCountdown').TimeCircles({
        "animation": "smooth",
        "bg_width": 0.60,
        "fg_width": 0.025,
        "circle_bg_color": "#eeeeee",
        "time": {
            "Days": {
                "text": "Days",
                "color": "#086AD8",
                "show": true
            },
            "Hours": {
                "text": "Hours",
                "color": "#086AD8",
                "show": true
            },
            "Minutes": {
                "text": "Minutes",
                "color": "#086AD8",
                "show": true
            },
            "Seconds": {
                "text": "Seconds",
                "color": "#086AD8",
                "show": true
            }
        }
    });
    
    /*=================================- 
    =        Scroll Up Color Change    =
    ==================================-*/

    $('.slide-scroll-bg').height('.slide-scroll-bg').scrollie({
        scrollOffset: 0,
        scrollingInView: function (elem) {
            console.log(elem);
            var bgColor = elem.data('background');
            $('.bg-body-color').css('background-color', bgColor);

        }
    });

    /*=============================================
    =            light gallery active            =
    =============================================*/
    
    $('.popup-images').lightGallery(); 

    $('.video-popup').lightGallery(); 
    
    /*=============================================
        showcoupon toggle function
   =============================================*/
    $( '#showcoupon' ).on('click', function() {
        $('#checkout-coupon' ).slideToggle(500);
    });
    $("#chekout-box-2").on("change",function(){
        $(".ship-box-info").slideToggle("100");
    }); 
    
    /*=============================================
    =            reveal footer active            =
    =============================================*/
    
    var revealId = $(".reveal-footer"),
        heightFooter = revealId.outerHeight(),
        windowWidth = $(window).width()
    if (windowWidth > 991) {
        $(".site-wrapper-reveal").css({
            'margin-bottom': heightFooter + 'px'
        });
    }
    $(".loading-item").slice(0, 9).show();
    $(".loadMore").on("click", function(e){
        e.preventDefault();
        $(".loading-item:hidden").slice(0, 3).slideDown();
        if($(".loading-item:hidden").length == 0) {
          $(".loadMore").text("All items displayed").addClass("noContent");
        }
    });
    
    $(".loading-item-4").slice(0, 8).show();
    $(".loadMoreBtn").on("click", function(e){
        e.preventDefault();
        $(".loading-item-4:hidden").slice(0, 4).slideDown();
        if($(".loading-item-4:hidden").length == 0) {
          $(".loadMoreBtn").text("All items displayed").addClass("noContent");
        }
    });
    
    
    /* ====================================
    =       All Animation For Fade Up      =
    =======================================*/

  /*  $(window).on('load', function () {
        function allAnimation() {
            $('.move-up').css('opacity', 0);
            $('.move-up').waypoint(function () {
                $('.move-up').addClass('animate');
            }, {
                offset: '90%'
            });
        }
        allAnimation();

        function allAnimationx() {
            $('.move-up-x').css('opacity', 0);
            $('.move-up-x').waypoint(function () {
                $('.move-up-x').addClass('animate');
            }, {
                offset: '90%'
            });
        }
        allAnimationx();
    })*/
    

})(jQuery);
