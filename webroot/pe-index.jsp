<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>BuggyApp Simulate performance problems</title>
    <meta name="description" content="BuggyApp can simulate various performance problems like Memory Leak, OutOfMemoryError, CPU spike, thread leak StackOverflowError, deadlock, unresponsiveness and so on "> 
    <meta name="keywords" content="java heap space, Memory leak detection, outofmemoryerror in java, high cpu usage, Detect pool thread leak, java heap size, deadlock thread, Cpu spikes, Stackoverflowerror, java heap memory, cpu consumption, blocked threads in java, memory leaks in java, buggyapp opensource "> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="canonical" href="https://buggyapp.ycrash.io/">
	<meta property="og:title" content="buggyapp ycrash" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="https://buggyapp.ycrash.io/" />
	<meta property="og:image" content=" https://buggyapp.ycrash.io/assets/buggyapp-index/images/BuggyAppLogo.png ">
	<meta name="author" content="Tier1app">
	<meta name="copyright" content="tier1app">
	<meta name="reply-to" content="team@tier1app.com">
    
    <!-- Favicon -->
    <link rel="icon" href="assets/buggyapp-index/images/BuggyAppFavicon.png">

    <!-- CSS
        ============================================ -->

    <!-- Bootstrap CSS -->
    <!--<link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">

    <!-- Font Family CSS -->
    <!--<link rel="stylesheet" href="assets/css/vendor/cerebrisans.css">

    <!-- FontAwesome CSS -->
    <!--<link rel="stylesheet" href="assets/css/vendor/fontawesome-all.min.css">

    <!-- Swiper slider CSS -->
    <!--<link rel="stylesheet" href="assets/css/plugins/swiper.min.css">

    <!-- animate-text CSS -->
    <!--<link rel="stylesheet" href="assets/css/plugins/animate-text.css">

    <!-- Animate CSS -->
    <!--<link rel="stylesheet" href="assets/css/plugins/animate.min.css">

    <!-- Light gallery CSS -->
    <!--<link rel="stylesheet" href="assets/css/plugins/lightgallery.min.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->

    <link rel="stylesheet" href="assets/buggyapp-index/css/vendor/vendor.min.css">
    <link rel="stylesheet" href="assets/buggyapp-index/css/plugins/plugins.min.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/buggyapp-index/css/style.min.css">

<style>
	.ht-btn {
    color: #000000 !important;
    background: #ffffff !important;
	}
	.ht1-btn {
    color: #ffffff !important;
    background: #BD142D !important;
	}
	@media only screen and (max-width: 991px) {
  	.MobileBanner {
    background-image: url(assets/images/MobileTier1appBanner.png);
  	background-size: cover;
  	background-repeat: no-repeat;
  	background-position: center;
  	}
  	.white-bg {
  	background: #eeeeee !important;
  	}
  	.pink-bg{
  	background: #ffe1e1 !important;
  	}
	/*.lazy {
	   background-image: none;
	   /* background-color: #F1F1FA; */
	   /*background-color: #d8d8d8; */
	/*}*/
</style>

</head>
<body>
<script></script>
    <!-- <div class="preloader-activate preloader-active open_tm_preloader">
        <div class="preloader-area-wrap">
            <div class="spinner d-flex justify-content-center align-items-center h-100">
                <div class="bounce1"></div>
                <div class="bounce2"></div>
                <div class="bounce3"></div>
            </div>
        </div>
    </div> -->


    <!--     ====================  header area ==================== -->
    <div class="header-area">
        <div class="header-bottom-wrap bg-white header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="header position-relative">
                            <!-- brand logo -->
                            <div class="header__logo">
                                <a href="index.jsp">
                                    <img src="assets/buggyapp-index/images/BuggyAppLogo.png" class="img-fluid" alt="">
                                </a>
                            </div>

                            <div class="header-right">

                                <!-- navigation menu -->
                                <div class="header__navigation d-none d-xl-block">
                                    <nav class="navigation-menu primary--menu">
                                    <ul>
                                        <li>
                                            <a href="index.jsp"><span>Home</span></a>
                                        </li>
                                        <li class="has-children has-children--multilevel-submenu">
                                            <a href="#"><span>Cool Tools</span></a>
                                            <ul class="submenu">
                                            <li><a href="https://gceasy.io/" target="_blank"><span>GCeasy</span></a></li>
                                            <li><a href="https://fastthread.io/" target="_blank"><span>fastThread</span></a></li>
                                            <li><a href="https://heaphero.io/" target="_blank"><span>HeapHero</span></a></li>
                                            <li><a href="https://ycrash.io/yc-top-analyzer.jsp" target="_blank"><span>top command</span></a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="mailto:team@tier1app.com"><span>Contact us</span></a>
                                        </li>
                                        <li>
                                            <a href="https://blog.ycrash.io/category/chaos-engineering/" target="_blank"><span>Blog</span></a>
                                        </li>
                                    </ul>
                                    </nav>
                                </div>

                                <!-- mobile menu -->
                                <div class="mobile-navigation-icon d-block d-xl-none" id="mobile-menu-trigger">
                                    <i></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--====================  End of header area  ====================-->

    <!--====================  Banner Start  ====================-->
    <div class="our-company-history bg-pink section-space--ptb_50" id="home">
	    <div class="container-fluid">
	        <div class="grid-wrapper"></div>
	        <div class="row align-items-center">
	            <div class="col-lg-6">
	                <div class="faq-custom-col">
	                    <div class="section-title-wrap">
	                    	<h1 class="heading font-weight--bold"><span style="color:#BD142D">BuggyApp</span></h1>
	                        <h2 class="heading font-weight--bold">Simulate performance <br> problems </h2>
	                            <p class="text mt-20"><span style="color:#889CA6">BuggyApp can simulate various performance problems like Memory Leak, OutOfMemoryError, CPU spike, thread leak
													  StackOverflowError, deadlock, unresponsiveness and so on</span>
													  </p>
								  <p class="text mt-20 text-black">Download the <span class="font-weight--bold" style="color:#BD142D">Open source</span> BuggyApp now!</p>
	                            <div class="inner-button-box section-space--mt_30">
	                                <a href="https://tier1app.com/dist/buggyapp/buggyapp-latest.zip" class="ht-btn ht1-btn ht-btn-md">Get started</a>
	                            </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6">
                        <div class="rv-video-section">
                            <div class="ht-banner-01 ">
                                <img class="img-fluid border-radus-5 one wow fadeInDown" src="assets/buggyapp-index/images/pic2.png" alt="">
                            </div>
                            <div class="ht-banner-02">
                                <img class="img-fluid border-radus-5 two wow fadeInDown" src="assets/buggyapp-index/images/bug.png" alt="">
                            </div>
                            <div class="main-video-box video-popup">
                                <a href="https://youtu.be/exsv-RUrUFY"  class="video-link  mt-30"> 
                                    <div class="single-popup-wrap">
                                        <img class="img-fluid border-radus-5" src="assets/buggyapp-index/images/pic1.png" alt="">
                                        <div class="ht-popup-video video-button" >
                                            <div class="video-mark">
                                                <div class="wave-pulse wave-pulse-1"></div>
                                                <div class="wave-pulse wave-pulse-2"></div>
                                            </div>
                                             <div class="video-button__two">
                                                <div class="video-play">
                                                    <span class="video-play-icon"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="ht-banner-03">
                                <img class="img-fluid border-radus-5 three wow fadeInDown" src="assets/buggyapp-index/images/pic4.png" alt="">
                            </div>

                            <div class="ht-banner-04">
                                <img class="img-fluid border-radus-5 four wow fadeInDown" src="assets/buggyapp-index/images/pic3.png" alt="">
                            </div>
                        </div>
                    </div>
	        </div>
	    </div>
	</div>
    
    <!--====================  Banner End  ====================-->
<div class="feature-large-images-wrapper bg-white section-space--ptb_50">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12">
                        <!-- section-title-wrap Start -->
                        <div class="section-title-wrap text-center section-space--mb_30">
                            <h3 class="heading">How it works?</h3>
                        </div>
                        <!-- section-title-wrap Start -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="row row--35">
                            <div class="col-lg-4 col-md-6 mt-30">
                                <!-- Box large image warap Start -->
                                <div class="box-large-image__wrap wow move-up">
                                    <div class="box-large-image__box">
                                        <div class="box-large-image__midea">
                                            <div class="images-midea">
                                                <img src="assets/buggyapp-index/images/working1.png" class="img-fluid" alt="">

                                                <!-- <div class="button-wrapper">
                                                    <div class="btn tm-button">
                                                        <a href="#howToRun"><span class="button-text">Install quickly</span></a>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>

                                        <div class="box-large-image__content mt-30 text-center">
                                            <p>Install BuggyApp on any machine in seconds. No major prerequisite is required.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Box large image warap End -->
                            </div>

                            <div class="col-lg-4 col-md-6  mt-30">
                                <!-- Box large image warap Start -->
                                <div href="#" class="box-large-image__wrap wow move-up">
                                    <div class="box-large-image__box">
                                        <div class="box-large-image__midea">
                                            <div class="images-midea">
                                                <img src="assets/buggyapp-index/images/working2.png" class="img-fluid" alt="">

                                                <!-- <div class="button-wrapper">
                                                    <div class="btn tm-button">
                                                        <a href="#howToRun"><span class="button-text">Click and Run</span></a>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>

                                        <div class="box-large-image__content mt-30 text-center">
                                            <p>With just a click, You can run BuggyApp as a web application or as a command line application.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Box large image warap End -->
                            </div>

                            <div class="col-lg-4 col-md-6  mt-30">
                                <!-- Box large image warap Start -->
                                <div href="#" class="box-large-image__wrap wow move-up">
                                    <div class="box-large-image__box">
                                        <div class="box-large-image__midea">
                                            <div class="images-midea">
                                                <img src="assets/buggyapp-index/images/working3.png" class="img-fluid" alt="">

                                                <!-- <div class="button-wrapper">
                                                    <div class="btn tm-button">
                                                        <a href="https://blog.ycrash.io/category/chaos-engineering/" target="_blank"><span class="button-text">Chaos Eng.</span></a>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>

                                        <div class="box-large-image__content mt-30 text-center">
                                            <p>Simulate various performance problems such as: Memory Leak, CPU spike, Thread Leak,etc</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Box large image warap End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--===========  feature-images-wrapper  Start =============-->

<div class="feature-images-wrapper bg-white section-space--ptb_50" id="features">
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                  <!-- section-title-wrap Start -->
                  <div class="section-title-wrap text-center section-space--mb_30">
                      <h4 class="heading">Features</h4>
                  </div>
                  <!-- section-title-wrap Start -->
              </div>
          </div>

          <div class="row">
              <div class="col-12">
                  <div class="feature-images__four">
                      <div class=" row">
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-04">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/01.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Web application</h5>
                                          <div class="text">BuggyApp comes with an embedded server. In a single click you can launch it as a web application and access it from the browser.</div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-041">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/02.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Command line</h5>
                                          <div class="text">You can also invoke BuggyApp from the command line. <a href="https://blog.ycrash.io/2020/10/26/buggy-app-simulate-performance-problems" target="_blank" style="text-decoration:underline;color:#BD142D">Here are the arguments</a> to simulate performance problems from command line.</div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-04">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/03.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Open Source</h5>
                                          <div class="text">BuggyApp is an open source application that is distributed under <a href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank" style="text-decoration:underline;color:#BD142D">Apache license 2.0</a><br><br><br></div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-041">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/04.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">ON/OFF</h5>
                                          <div class="text">You have full control in starting the performance problem simulation with one click and stopping with another click.<br><br></div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-041">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/05.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Platform agnostics</h5>
                                          <div class="text">BuggyApp is platform agnostic. It can run on all platforms - Bare Metal, Dockers/Kubernetes, AWS cloud, Azure cloud, GCP, ...</div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-04">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/06.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Any Operating System</h5>
                                          <div class="text">BuggyApp is built on Java, thus it can run on any Operating system versions: Windows, all flavours of Linux, Unix, Mac</div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-041">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/07.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Monitoring Integration</h5>
                                          <div class="text">It's very trivial to integrate BuggyApp with any monitoring tools like <a href = "https://ycrash.io/" target="_blank" style="text-decoration:underline;color:#BD142D">yCrash</a>, 
                                          <a href = "https://www.appdynamics.com/" target="_blank" style="text-decoration:underline;color:#BD142D">AppDynamics</a>, 
                                          <a href = "https://newrelic.com/" target="_blank" style="text-decoration:underline;color:#BD142D">NewRelic</a>, 
                                          <a href = "https://www.nagios.org/" target="_blank" style="text-decoration:underline;color:#BD142D">Nagios</a>, 
                                          <a href = "https://www.dynatrace.com/" target="_blank" style="text-decoration:underline;color:#BD142D">Dynatrace</a>, 
                                          <a href = "https://www.datadoghq.com/" target="_blank" style="text-decoration:underline;color:#BD142D">DataDog</a>...</div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                          <div class="single-item col-lg-3 col-md-6 mt-30 wow move-up">
                              <!-- ht-box-icon Start -->
                              <div class="ht-box-images style-04">
                                  <div class="image-box-wrap">
                                      <div class="box-image">
                                          <img class="img-fulid" src="assets/buggyapp-index/images/08.png" alt="">
                                      </div>
                                      <div class="content">
                                          <h5 class="heading">Throttle</h5>
                                          <div class="text">You can control the simulations at the rate you want. You can accelerate (or de-accelerate) the memory consumption and simulate OutOfMemoryError much quickly.</div>
                                      </div>
                                  </div>
                              </div>
                              <!-- ht-box-icon End -->
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  
  <div class="tabs-wrapper bg-white section-space--ptb_50">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="section-title-wrapper text-center section-space--mb_60 wow move-up">                                      
                                            <h3 class="section-title">How to run <span class="text-color-primary">Buggy App?</span> </h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 ht-tab-wrap">
                                        <div class="text-center  ">
                                            <ul class="nav justify-content-center ht-tab-menu ht-tab-menu_two" role="tablist">
                                                <li class="tab__item nav-item active">
                                                    <a class="nav-link active" id="nav-tab1" data-toggle="tab" href="#tab_list_06" role="tab" aria-selected="true">Web Application</a>
                                                </li>
                                                <li class="tab__item nav-item">
                                                    <a class="nav-link" id="nav-tab2" data-toggle="tab" href="#tab_list_07" role="tab" aria-selected="false">Command line</a>
                                                </li>                                                
                                            </ul>
                                        </div>

                                        <div class="tab-content ht-tab__content">

                                            <div class="tab-pane fade show active" id="tab_list_06" role="tabpanel">
                                                <div class="tab-history-wrap section-space--mt_40">
                                                    <div class="row">
                                                        <div class="col-lg-12">
															<div class="ht-list style-auto-numbered-02">
																<div class="list-item">
																	<div class="">
																		<div class="list-header">
																			<div class="marker">
																				01
																			</div>
																			<div class="title-wrap">
																				<h6 class="title">Install</h6>
																				<p class="text mt-10">Make sure <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html" target="_blank" style="text-decoration:underline;color:#BD142D">Java 8</a> or above version is installed on the machine.</p>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="list-item">
																	<div class="" >
																		<div class="list-header">
																			<div class="marker">
																				02
																			</div>
																			<div class="title-wrap">
																				<h6 class="title">Download and Unzip</h6>
																				<p class="text mt-10">Download <a href = "https://tier1app.com/dist/buggyapp/buggyapp-latest.zip" style="text-decoration:underline;color:#BD142D">buggyapp-latest.zip</a> file and Unzip the same to a folder say (i.e. /opt/buggyapp).
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="list-item">
																	<div class="">
																		<div class="list-header">
																			<div class="marker"> 03</div>
																			<div class="title-wrap">
																				<h6 class="title">Invoke Launch script</h6>
																				 <p class="text mt-10"> In the current folder you will find the script to launch Buggyapp. Based on your Operating System, invoke an appropriate launch script.<br>
																					<b>Windows:</b> c:\workspace\buggyapp\launch.bat<br>
																					<b>Unix/Linux:</b> /opt/workspace/buggyapp/launch.sh
																			</div>
																		</div>
																	</div>
																</div>
																<div class="list-item">
																	<div class="">
																		<div class="list-header">
																			<div class="marker"> 04</div>
																			<div class="title-wrap">
																				<h6 class="title">Ready to Access</h6>
																				 <p class="text mt-10"> Now BuggyApp can be accessed in this URL(http://localhost:9010/) from your browser.</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
                                                    </div>
                                                </div>
											</div>

											<div class="tab-pane fade" id="tab_list_07" role="tabpanel">
												<div class="tab-history-wrap section-space--mt_40">
													<div class="row">
														<div class="col-lg-12">
														<div class="ht-list style-auto-numbered-02">
															<div class="list-item">
																<div class="">
																	<div class="list-header">
																		<div class="marker">
																			01
																		</div>
																		<div class="title-wrap">
																			<h6 class="title">Install</h6>
																			<p class="text mt-10"> Make sure <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html" target="_blank" style="text-decoration:underline;color:#BD142D">Java 8</a> or above version is installed on your machine</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="list-item">
																<div class="" >
																	<div class="list-header">
																		<div class="marker">
																			02
																		</div>
																		<div class="title-wrap">
																			<h6 class="title">Download</h6>
																			<p class="text mt-10">Download <a href = "https://tier1app.com/dist/buggyapp/buggyapp-latest.zip" style="text-decoration:underline;color:#BD142D">buggyapp-latest.zip</a> file
																			</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="list-item">
																<div class="">
																	<div class="list-header">
																		<div class="marker"> 03</div>
																		<div class="title-wrap">
																			<h6 class="title">Unzip</h6>
																			 <p class="text mt-10">Unzip 'buggyapp-latest.zip' to a folder say '/opt/buggyapp'. In this folder you will find buggyApp.jar file.<br>											
																		</div>
																	</div>
																</div>
															</div>
															<div class="list-item">
																<div class="">
																	<div class="list-header">
																		<div class="marker"> 04</div>
																		<div class="title-wrap">
																			<h6 class="title">Invoke</h6>
																			 <p class="text mt-10"> To simulate CPU spike, invoke buggyappApp.jar with following arguments:
																			 <pre class="text mt-10">java -jar buggyApp.jar PROBLEM_CPU</pre>
																			 </p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														</div>
													</div>
												</div>
											</div>
										
										</div>
                                        
									</div>
								</div>
							</div>
						</div>
        
        <!--===========  feature-images-wrapper  Start =============-->
        <div class="feature-images-wrapper section-space--ptb_50">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12">
                        <!-- section-title-wrap Start -->
                        <div class="section-title-wrap text-center section-space--mb_20">
                            <h3 class="heading">Performance problems</h3>
                        </div>
                        <!-- section-title-wrap Start -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="feature-images__five">
                            <div class="row">

                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon1.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon1.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Java heap space</h5>
                                                <div class="text">Generate ‘java.lang.OutOfMemoryError: Java heap space’!
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/02/22/chaos-engineering-simulating-outofmemoryerror/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>

                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon2.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon2.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Memory Leak</h5>
                                                <div class="text">Simulate a memory leak without experiencing OutOfMemoryError
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/02/22/chaos-engineering-simulating-outofmemoryerror/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>

                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon3.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon3.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">CPU spike</h5>
                                                <div class="text">Make the CPU consumption to go up to 80 – 90%<br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/02/10/chaos-engineering-simulating-cpu-spike/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
                                
                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon4.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon4.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Thread Leak</h5>
                                                <div class="text">Make the application to keep slowly spawning new threads<br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/04/09/chaos-engineering-thread-leak/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
                                
                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon5.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon5.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Deadlock</h5>
                                                <div class="text">Make the application to experience Deadlock<br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/03/13/chaos-engineering-deadlock/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
                                
                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon6.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon6.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Stackoverflow Error</h5>
                                                <div class="text">Make the application to experience ‘java.lang.StackOverflowError’
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/04/09/chaos-engineering-stackoverflow-error/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
                                
                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon7.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon7.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Blocked Threads</h5>
                                                <div class="text">Put multiple threads in BLOCKED state<br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/04/09/chaos-engineering-blocked-threads/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
                                
                                <div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon8.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon8.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Heavy I/O</h5>
                                                <div class="text">Simulate heavy I/O activity<br><br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2021/04/09/chaos-engineering-heavy-i-o/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
								
								<div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon9.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon9.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">DB Connection Leak</h5>
                                                <div class="text">Simulate Database Connection leaks<br><br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2023/11/09/chaos-engineering-db-connection-leak/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
								
								<div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon10.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon10.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">File Connection Leak</h5>
                                                <div class="text">Simulate File Connection leaks<br><br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/2023/11/09/chaos-engineering-file-connection-leak/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
								
								<div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon11.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon11.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Network Lag</h5>
                                                <div class="text">Simulate Network Lag Or Delay<br><br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/chaos-engineering-network-lag/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
								
								<div class="col-lg-3 col-md-6 wow move-up">
                                    <!-- ht-box-icon Start -->
                                    <div class="ht-box-images style-05">
                                        <div class="image-box-wrap">
                                            <div class="box-image">
                                                <div class="default-image">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon12.png" alt="">
                                                </div>
                                                <div class="hover-images">
                                                    <img class="img-fulid" src="assets/buggyapp-index/images/buggyicon12.1.png" alt="">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5 class="heading">Storage Saturation</h5>
                                                <div class="text">Simulate various performance problems<br><br><br><br>
                                                </div>
                                                <div class="box-images-arrow">
                                                    <a href="https://blog.ycrash.io/diagnosing-storage-saturation/" target="_blank">
                                                        <span class="button-text">Read more</span>
                                                        <i class="far fa-long-arrow-right"></i>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ht-box-icon End -->
                                </div>
								
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!--===========  feature-images-wrapper  End =============-->
        
        <!--====================  testimonial section ====================-->
        <!-- <div class="testimonial-slider-area bg-white section-space--pt_70" id="testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title-wrap text-center section-space--mb_40">
                            <h6 class="section-sub-title mb-20">OUR TESTIMONIALS</h6>
                            <h3 class="heading">What do engineers say about our products?</h3>
                        </div>
                        <div class="testimonial-slider">
                            <div class="swiper-container testimonial-slider__container">
                                <div class="swiper-wrapper testimonial-slider__wrapper">
                                    <div class="swiper-slide">
                                        <div class="testimonial-slider__one wow move-up">
												<div class="testimonial-slider__author">
													<div class="testimonial-rating">
													<span class="fa fa-star"></span>
                                                    <span class="fa fa-star"></span>
                                                    <span class="fa fa-star"></span>
                                                    <span class="fa fa-star"></span>
                                                     </div>
                                                 </div>
                                          		<div class="testimonial-slider__text">Thank you very much! Your report was very usefull and helpful. It contains many illustrations and graphs. This report had attracted my attention to a problem I missed during manual parsing the thread dump. Thanks again!<br><br></div>
                                           		<div class="testimonial-slider--info">
                                               		<div class="testimonial-slider__media">
                                                   		<img src="assets/buggyapp-index/images/testimonial.png" class="img-fluid" alt="">
                                               		</div>
                                               		<div class="testimonial-slider__author">
                                                   		<div class="author-info">
                                                       		<h6 class="name mt-10">J.VASILTSOV,<br>CFT</h6>
                                                   		</div>
                                               		</div>
                                    			</div>
                                     		</div>
                                    	</div>
                                    	<div class="swiper-slide">
                                        <div class="testimonial-slider__one wow move-up">
												<div class="testimonial-slider__author">
													<div class="testimonial-rating">
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                    </div>
                                                 </div>
                                          		<div class="testimonial-slider__text">This is a great example of elegant programming, please keep it good! I'm happy to continue loading reports to get a fast "looks good or needs attention" answer. And in doing so, whenever I visit gceasy.io, I always relay the link to users with GC issues to look for themselves.<br></div>
                                           		<div class="testimonial-slider--info">
                                               		<div class="testimonial-slider__media">
                                                   		<img src="assets/buggyapp-index/images/testimonial.png" class="img-fluid" alt="">
                                               		</div>
                                               		<div class="testimonial-slider__author">
                                                   		<div class="author-info">
                                                       		<h6 class="name mt-10">ASHLEY.HALE,<br>Forgerock</h6>
                                                   		</div>
                                               		</div>
                                    			</div>
                                     		</div>
                                    	</div>
                                    <div class="swiper-slide">
                                        <div class="testimonial-slider__one wow move-up">
												<div class="testimonial-slider__author">
													<div class="testimonial-rating">
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                    </div>
                                                 </div>
                                          		<div class="testimonial-slider__text">Clean, clear and precise. Memory leak debugging has never been more fun.<br><br><br><br></div>
                                           		<div class="testimonial-slider--info">
                                               		<div class="testimonial-slider__media">
                                                   		<img src="assets/buggyapp-index/images/testimonial.png" class="img-fluid" alt="">
                                               		</div>
                                               		<div class="testimonial-slider__author">
                                                   		<div class="author-info">
                                                       		<h6 class="name mt-10">HUNG.DAU, <br> MServices</h6>
                                                   		</div>
                                               		</div>
                                    			</div>
                                     		</div>
                                    	</div>
                                </div>
                                <div class="swiper-pagination swiper-pagination-t01 mb-30 section-space--mt_30"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!--====================  End of testimonial section  ====================-->
        
                <div class="accordion-wrapper section-space--ptb_50">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12">
                        <!-- section-title-wrap Start -->
                        <div class="section-title-wrap text-center section-space--mb_20">
                            <h3 class="heading">Frequently asked questions</h3>
                        </div>
                        <!-- section-title-wrap Start -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="faq-wrapper  section-space--mt_40">
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header" id="headingTwo">
                                        <h5 class="mb-0">
                                            <button class="btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                What is the prerequisite to install BuggyApp?<span> <i class="fas fa-chevron-down"></i>
                                            <i class="fas fa-chevron-up"></i> </span>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>You just need Java 8 and above version</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                 Can BuggyApp be launched in multiple machines?<span> <i class="fas fa-chevron-down"></i>
                                            <i class="fas fa-chevron-up"></i> </span>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Yes, you can run BuggyApp in multiple machines. But you can't do coordinated attack.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="faq-wrapper  section-space--mt_40">
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header" id="headingFour">
                                        <h5 class="mb-0">
                                            <button class="btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                               Can I run BuggyApp within my application?<span> <i class="fas fa-chevron-down"></i>
                                            <i class="fas fa-chevron-up"></i> </span>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Yes, BuggyApp is an open source code. You are welcome to integrate it within your application. But we aren't providing APIs for integration, you have to do it by yourself.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingFive">
                                        <h5 class="mb-0">
                                            <button class="btn-link collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                                 What are some of the common use cases for BuggyApp?<span> <i class="fas fa-chevron-down"></i>
                                            <i class="fas fa-chevron-up"></i> </span>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Here are a few use cases where BuggyApp can be used:<br><br>

a. You can configure and launch BuggyApp to consume high memory on the same server where your application is running. You can study under this circumstance whether your application’s SLA (Service Level Agreement) is impacted.<br><br>

b. You can configure and launch BuggyApp in a docker container to consume high CPU and see whether other containers on the same host are impacted or not.<br><br>

c. If you are building performance tools or monitoring tools, you can simulate various performance degradations using Buggy App and see whether your tools address those performance problems. (In Fact we developed this BuggyApp to validate our root cause analysis tool yCrash) 
</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="cta-image-area_one section-space--ptb_60 bg-pink">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-7">
                        <div class="cta-content md-text-center">
                            <h4 class="heading text-black">Want to try the <span class="font-weight--bold" style="color:#BD142D">Opensource</span> BuggyApp?</h4>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-5">
                        <div class="cta-button-group--one text-center">
                      	<a href="https://tier1app.com/dist/buggyapp/buggyapp-latest.zip" class="btn btn--primary  btn-two ht2-btn"><span class="btn-icon"></span>Get started</a>
                    </div>
                    </div>
                </div>
            </div>
        </div>

 <!--====================  footer area ====================-->
    <div class="footer-area-wrapper bg-white">
        <div class="footer-area section-space--ptb_30">
            <div class="container">
                <div class="row footer-widget-wrapper">
                    <div class="col-lg-4 col-md-6 col-sm-6 footer-widget">
                        <div class="footer-widget__logo">
                            <a href="index.jsp" ><img src="assets/buggyapp-index/images/BuggyAppLogo.png" class="img-fluid" alt=""></a>
                        </div>
                        <ul class="footer-widget__list">
                        	<li>BuggyApp can simulate various performance problems like Memory Leak, OutOfMemoryError, CPU spike, thread leak StackOverflowError, deadlock, unresponsiveness and so on</li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 footer-widget">
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 footer-widget">
                        <h5 class="footer-widget__title mb-20">Reach us</h5>
                        <ul class="footer-widget__list">
                        <li>4225 Sunset View Dr, Dublin, CA 94568, United States</li>
                            <li><a href="mailto:team@tier1app.com" class="hover-style-link">team@tier1app.com</a></li>
                            <li><a href="tel:1-415-948-5431" class="hover-style-link">1-415-948-5431</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 footer-widget">
                        <h5 class="footer-widget__title mb-20">Our Products</h5>
                        <ul class="footer-widget__list">
                            <li><a href="https://fastThread.io/" target="_blank" class="hover-style-link">fastThread</a></li>
                            <li><a href="https://gceasy.io/" target="_blank" class="hover-style-link">GCeasy</a></li>
                            <li><a href="https://heaphero.io/" target="_blank" class="hover-style-link">HeapHero</a></li>
                            <li><a href="https://ycrash.io/" target="_blank" class="hover-style-link">yCrash</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 footer-widget">
                        <h5 class="footer-widget__title mb-20"> &nbsp;Follow us</h5>
                        <div class="single-social-group section-space--mb_60 wow move-up">
                                <ul class="list ht-social-networks solid-rounded-icon">
                                    <li class="item">
                                        <a href="https://www.facebook.com/tier1app" target="_blank" class="social-link"> <i class="fab fa-facebook social-link-icon"></i> </a>
                                    </li>
                                    <li class="item">
                                        <a href="https://twitter.com/tier1app" target="_blank" class="social-link"> <i class="fab fa-twitter social-link-icon"></i> </a>
                                    </li>
                                    <li class="item">
                                        <a href="https://www.youtube.com/channel/UCM-yObJ7pBjEy1wJMq5bDdw" target="_blank" class="social-link"> <i class="fab fa-youtube social-link-icon"></i> </a>
                                    </li>
                                    <li class="item">
                                        <a href="https://www.linkedin.com/company/gceasy" target="_blank" class="social-link"> <i class="fab fa-linkedin social-link-icon"></i> </a>
                                    </li>
                                    <!-- <li class="item">
                                        <a href="https://www.instagram.com/tier1app" target="_blank" class="social-link"> <i class="fab fa-instagram social-link-icon"></i> </a>
                                    </li>
                                    <li class="item">
                                        <a href="https://in.pinterest.com/Tier1app/" target="_blank" class="social-link"> <i class="fab fa-pinterest social-link-icon"></i> </a>
                                    </li> -->
                                </ul>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright-area section-space--pb_20">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-left">
                        <span class="copyright-text">&copy; 2016-2021 Tier1App. All Right Reserved</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====================  End of footer area  ====================-->

    <!--====================  scroll top ====================-->
    <a href="#home" class="scroll-top" id="scroll-top">
        <i class="arrow-top fal fa-long-arrow-up"></i>
        <i class="arrow-bottom fal fa-long-arrow-up"></i>
    </a>
<!--====================  End of scroll top  ====================-->

 <!--====================  mobile menu overlay ====================-->
    <div class="mobile-menu-overlay" id="mobile-menu-overlay">
        <div class="mobile-menu-overlay__inner">
            <div class="mobile-menu-overlay__header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-6 col-8">
                            <!-- logo -->
                            <div class="logo">
                                <a href="index.jsp">
                                    <img src="assets/buggyapp-index/images/BuggyAppLogo.png" class="img-fluid" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 col-4">
                            <!-- mobile menu content -->
                            <div class="mobile-menu-content text-right">
                                <span class="mobile-navigation-close-icon" id="mobile-menu-close-trigger"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mobile-menu-overlay__body">
                <nav class="offcanvas-navigation">
                    <ul>
                       <li>
                           <a href="#home"><span>Home</span></a>
                       </li>
                       <li>
                           <a href="#products"><span>Application</span></a>
                       </li>
                       <li>
                           <a href="mailto:team@tier1app.com"><span>Contact us</span></a>
                       </li>
                       <li>
                           <a href="https://blog.ycrash.io/category/chaos-engineering/" target="_blank"><span>Blog</span></a>
                       </li>
                   </ul>
                </nav>
            </div>
        </div>
    </div>
    <!--====================  End of mobile menu overlay  ====================-->
     <!-- JS
    ============================================ -->
    <!-- Modernizer JS -->
    <script defer src="assets/buggyapp-index/js/vendor/modernizr-2.8.3.min.js"></script>

    <!-- jQuery JS -->
    <script defer src="assets/buggyapp-index/js/vendor/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script defer src="assets/buggyapp-index/js/vendor/bootstrap.min.js"></script>

    <!-- Swiper Slider JS -->
    <script defer src="assets/buggyapp-index/js/plugins/swiper.min.js"></script>

    <!-- Light gallery JS -->
    <script defer src="assets/buggyapp-index/js/plugins/lightgallery.min.js"></script>

    <!-- Waypoints JS -->
    <script defer src="assets/buggyapp-index/js/plugins/waypoints.min.js"></script>

    <!-- Counter down JS -->
    <script defer src="assets/buggyapp-index/js/plugins/countdown.min.js"></script>

    <!-- Isotope JS -->
    <script defer src="assets/buggyapp-index/js/plugins/isotope.min.js"></script>

    <!-- Masonry JS -->
    <script defer src="assets/buggyapp-index/js/plugins/masonry.min.js"></script>

    <!-- ImagesLoaded JS -->
    <script defer src="assets/buggyapp-index/js/plugins/images-loaded.min.js"></script>

    <!-- Wavify JS -->
    <script defer src="assets/buggyapp-index/js/plugins/wavify.js"></script>

    <!-- jQuery Wavify JS -->
    <script defer src="assets/buggyapp-index/js/plugins/jquery.wavify.js"></script>

    <!-- circle progress JS -->
    <script defer src="assets/buggyapp-index/js/plugins/circle-progress.min.js"></script>

    <!-- counterup JS -->
    <script defer src="assets/buggyapp-index/js/plugins/counterup.min.js"></script>

    <!-- wow JS -->
    <script defer src="assets/buggyapp-index/js/plugins/wow.min.js"></script>

    <!-- animation text JS -->
    <script defer src="assets/buggyapp-index/js/plugins/animation-text.min.js"></script>

    <!-- Vivus JS -->
    <script defer src="assets/buggyapp-index/js/plugins/vivus.min.js"></script>

    <!-- Some plugins JS -->
    <script defer src="assets/buggyapp-index/js/plugins/some-plugins.min.js"></script>


    <!-- Plugins JS (Please remove the comment from below plugins.min.js for better website load performance and remove plugin js files from avobe) -->

    <script defer src="assets/buggyapp-index/js/plugins/plugins.min.js"></script>

    <!-- Main JS -->
    <script defer src="assets/buggyapp-index/js/main.js"></script>

    <!--<script>
	    document.addEventListener("DOMContentLoaded", function() {
	    	  var lazyloadImages;

	    	  if ("IntersectionObserver" in window) {
	    	    lazyloadImages = document.querySelectorAll(".lazy");
	    	    var imageObserver = new IntersectionObserver(function(entries, observer) {
	    	      entries.forEach(function(entry) {
	    	        if (entry.isIntersecting) {
	    	          var image = entry.target;
	    	          image.classList.remove("lazy");
	    	          imageObserver.unobserve(image);
	    	        }
	    	      });
	    	    });

	    	    lazyloadImages.forEach(function(image) {
	    	      imageObserver.observe(image);
	    	    });
	    	  } else {
	    	    var lazyloadThrottleTimeout;
	    	    lazyloadImages = document.querySelectorAll(".lazy");

	    	    function lazyload () {
	    	      if(lazyloadThrottleTimeout) {
	    	        clearTimeout(lazyloadThrottleTimeout);
	    	      }

	    	      lazyloadThrottleTimeout = setTimeout(function() {
	    	        var scrollTop = window.pageYOffset;
	    	        lazyloadImages.forEach(function(img) {
	    	            if(img.offsetTop < (window.innerHeight + scrollTop)) {
	    	              img.src = img.dataset.src;
	    	              img.classList.remove('lazy');
	    	            }
	    	        });
	    	        if(lazyloadImages.length == 0) {
	    	          document.removeEventListener("scroll", lazyload);
	    	          window.removeEventListener("resize", lazyload);
	    	          window.removeEventListener("orientationChange", lazyload);
	    	        }
	    	      }, 20);
	    	    }

	    	    document.addEventListener("scroll", lazyload);
	    	    window.addEventListener("resize", lazyload);
	    	    window.addEventListener("orientationChange", lazyload);
	    	  }
	    	})
		</script>-->
		
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-GZ6FVB39C8"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-GZ6FVB39C8');
</script>
		
</body>
</html>
