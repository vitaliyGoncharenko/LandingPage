/* Slider for gallery item 
  ------------------------------------------------------*/
    $('#image-gallery').lightSlider({
        gallery:true,
        item:1,
        thumbItem:5,
        slideMargin: 0,
        speed:1000,
        auto:false,
        loop:true,
        responsive : [
            {
                breakpoint:800,
                settings: {
                    thumbItem:4,
                  }
            },
            {
                breakpoint:480,
                settings: {
                    thumbItem:3,
                  }
            }
        ],
        onSliderLoad: function() {
            $('#image-gallery').removeClass('cS-hidden');
        }  
    });

 /* template navigation
  -----------------------------------------------*/
 $('.main-navigation').onePageNav({
        scrollThreshold: 0.2, // Adjust if Navigation highlights too early or too late
        scrollOffset: 75, //Height of Navigation Bar
        filter: ':not(.external)',
        changeHash: true
    }); 

    /* Navigation visible on Scroll */
    mainNav();
    $(window).scroll(function () {
        mainNav();
    });

    function mainNav() {
        var top = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
        if (top > 40) $('.sticky-navigation').stop().animate({
            "opacity": '1',
            "top": '0'
        });
        else $('.sticky-navigation').stop().animate({
            "opacity": '0',
            "top": '-75'
        });
    }

$(document).ready(function() {

  /* Hide mobile menu after clicking on a link
    -----------------------------------------------*/
    $('.navbar-collapse a').click(function(){
        $(".navbar-collapse").collapse('hide');
    });


  /* jQuery to collapse the navbar on scroll
    -----------------------------------------------*/
  $(window).scroll(function() {
      if ($(".navbar").offset().top > 50) {
          $(".navbar-fixed-top").addClass("top-nav-collapse");
      } else {
          $(".navbar-fixed-top").removeClass("top-nav-collapse");
      }
  });


   /*  smoothscroll
    -----------------------------------------------*/
   $(function() {
        $('.navbar-default a').bind('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top - 49
            }, 1000);
            event.preventDefault();
        });
    });



  /* Parallax section
    -----------------------------------------------*/
  function initParallax() {
    $('#gallery').parallax("100%", 0.1);
    $('#news').parallax("100%", 0.1);

  }
  initParallax();

  });

