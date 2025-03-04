/*--------------------------------------------------
Template Name: FastBuy - Mega Shop eCommerce Bootstrap 4 Template
Version: 1.0
Note: main.js, All Default Scripting Languages For This Theme Included In This File.
-----------------------------------------------------
        CSS INDEX
        ================
        01. FB's Meanmenu
        02. FB's Header Dropdown
        03. Header Mini Cart
        04. FB's Sticky Menu Activation
        05. FB's Nice Select
        06. FB's Quantity
        07. FB's Category Menu
        08. Main Slider Activision
        09. FB's Product Activision
        10. FB's List Product Activision
        11. FB's List Product Activision
        12. FB's New Product With Two Slide Activision
        13. FB's Barnding Product Activision
        14. FB's Countdown
        15. FB's Quick View Activision
        16. Price Slider
        17. Cart Plus Minus Button
        18. FB's Scroll Up
        19. FAQ Accordion
        20. Category Sub Menu Activation
        21. FB's New Product Two Activision
        22. FB's Single Product Slide Activision
        23. FB's FB's Product 3 Activision
        24. FB's Product List 3 Activision
        25. FB's list-single-slide-active Activision
        26. FB's FB's Product 4 Activision
        27. Featured Product Active Four
        28. Latest Blog Active
        29. FB's Blog Gallery Slider
        30. Toggle Function Active
        31. Product Details Zoom
        32. Product Details Image Slider
        33. Star Rating Js
        34. Other Product Active
        35. Counter Js
        35. Ajax Contact Form

-----------------------------------------------------------------------------------*/
(function ($) {
    ('use strict');
    /*----------------------------------------*/
    /*  01. FB's Meanmenu
/*----------------------------------------*/
    jQuery('.fb-navigation').meanmenu({
        meanScreenWidth: '991',
    });
    /*----------------------------------------*/
    /*  02. FB's Header Dropdown
/*----------------------------------------*/
    $('.dropdown-toggle').on('click', function () {
        $(this)
            .toggleClass('is-active')
            .next('.dropdown-menu')
            .toggleClass('open');
        $(this)
            .parents()
            .siblings()
            .find('.dropdown-menu, .dropdown-toggle')
            .removeClass('open');
    });
    // Closing the dropdown by clicking in the menu button or anywhere in the screen
    $('body').on('click', function (e) {
        var target = e.target;
        if (
            !$(target).is('.dropdown-toggle') &&
            !$(target).parents().is('.dropdown-toggle')
        ) {
            $('.dropdown-menu').removeClass('open');
        }
    });
    // Prevent closing dropdown upon clicking inside the dropdown
    $('.dropdown-menu, .main-search-active').on('click', function (e) {
        e.stopPropagation();
    });
    /*----------------------------------------*/
    /*  03. Header Mini Cart
/*----------------------------------------*/
    $('.hm-minicart-trigger, .subcategories-trigger').on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('is-active');
        $(this).siblings('.minicart, .subcategories-list').slideToggle();
    });
    //$('.hm-minicart-trigger.is-active').siblings('.catmenu-body').slideDown();
    /*----------------------------------------*/
    /* 04. FB's Sticky Menu Activation
/*----------------------------------------*/
    $(window).on('scroll', function () {
        if ($(this).scrollTop() > 300) {
            $('.header-sticky').addClass('sticky');
        } else {
            $('.header-sticky').removeClass('sticky');
        }
    });
    /*----------------------------------------*/
    /* 05. FB's Nice Select
/*----------------------------------------*/
    $('.nice-select').niceSelect();
    /*----------------------------------------*/
    /* 06. FB's Quantity
/*----------------------------------------*/
    $('.pro-qty').prepend('<span class="dec qtybtn">-</span>');
    $('.pro-qty').append('<span class="inc qtybtn">+</span>');
    $('.qtybtn').on('click', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });
    /*----------------------------------------*/
    /* 07. FB's Category Menu
/*----------------------------------------*/
    $('.rx-parent').on('click', function () {
        $('.rx-child').slideToggle();
        $(this).toggleClass('rx-change');
    });
    //    category heading
    $('.category-heading').on('click', function () {
        $('.category-menu-list').slideToggle(900);
    });
    /*-- Category Menu Toggles --*/
    function categorySubMenuToggle() {
        var screenSize = $(window).width();
        if (screenSize <= 991) {
            $('#cate-toggle .right-menu > a').prepend(
                '<i class="expand menu-expand"></i>'
            );
            $('.category-menu .right-menu ul').slideUp();
        } else {
            $('.category-menu .right-menu > a i').remove();
            $('.category-menu .right-menu ul').slideDown();
        }
    }
    categorySubMenuToggle();
    $(window).resize(categorySubMenuToggle);
    /*-- Category Sub Menu --*/
    function categoryMenuHide() {
        var screenSize = $(window).width();
        if (screenSize <= 991) {
            $('.category-menu-list').hide();
        } else {
            $('.category-menu-list').show();
        }
    }
    categoryMenuHide();
    // $(window).resize(categoryMenuHide);
    $('.category-menu-hidden').find('.category-menu-list').hide();
    $('.category-menu-list').on(
        'click',
        'li a, li a .menu-expand',
        function (e) {
            var $a = $(this).hasClass('menu-expand')
                ? $(this).parent()
                : $(this);
            if ($a.parent().hasClass('right-menu')) {
                if (
                    $a.attr('href') === '#' ||
                    $(this).hasClass('menu-expand')
                ) {
                    if ($a.siblings('ul:visible').length > 0)
                        $a.siblings('ul').slideUp();
                    else {
                        $(this)
                            .parents('li')
                            .siblings('li')
                            .find('ul:visible')
                            .slideUp();
                        $a.siblings('ul').slideDown();
                    }
                }
            }
            if ($(this).hasClass('menu-expand') || $a.attr('href') === '#') {
                e.preventDefault();
                return false;
            }
        }
    );
    /*----------------------------------------*/
    /* 08. Main Slider Activision
/*----------------------------------------*/
    $('.slider-active').owlCarousel({
        loop: true,
        margin: 0,
        nav: true,
        autoplay: true,
        items: 1,
        autoplayTimeout: 5000,
        navText: [
            "<i class='fa fa-angle-left'></i>",
            "<i class='fa fa-angle-right'></i>",
        ],
        dots: true,
        autoHeight: false,
        lazyLoad: true,
    });
    /*----------------------------------------*/
    /* 09. FB's Product Activision
/*----------------------------------------*/
    $('.fb-product_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 4,
            },
        },
    });
    /*----------------------------------------*/
    /* 10. FB's List Product Activision
/*----------------------------------------*/
    $('.fb-list_product_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 1,
        responsive: {
            0: {
                items: 1,
            },
            480: {
                items: 2,
            },
            768: {
                items: 1,
            },
            992: {
                items: 2,
            },
            1200: {
                items: 2,
            },
        },
    });
    /*----------------------------------------*/
    /* 11. FB's List Product Activision
/*----------------------------------------*/
    $('.fb-list_product_active-2').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 1,
        responsive: {
            0: {
                items: 1,
            },
            480: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 2,
            },
            1200: {
                items: 2,
            },
        },
    });
    /*-------------------------------------------------*/
    /* 12. FB's New Product With Two Slide Activision
/*-------------------------------------------------*/
    $('.fb-new_product_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 1,
        responsive: {
            0: {
                items: 1,
            },
            480: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 2,
            },
            1200: {
                items: 2,
            },
        },
    });
    /*------------------------------------------------------*/
    /* 13. FB's Barnding Product Activision
/*------------------------------------------------------*/
    $('.fb-branding_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 1,
        responsive: {
            0: {
                items: 1,
            },
            480: {
                items: 2,
            },
            768: {
                items: 3,
            },
            992: {
                items: 4,
            },
            1200: {
                items: 5,
            },
        },
    });
    /*----------------------------------------*/
    /* 14. FB's Countdown
/*----------------------------------------*/
    $('.fb-countdown').countdown('2023/12/01', function (event) {
        $(this).html(
            event.strftime(
                '<div class="count"><span class="count-amount">%D</span><span class="count-period">Days</span></div><div class="count"><span class="count-amount">%H</span><span class="count-period">Hours</span></div><div class="count"><span class="count-amount">%M</span><span class="count-period">Minute</span></div><div class="count"><span class="count-amount">%S</span><span class="count-period">Seceond</span></div>'
            )
        );
    });
    $('.fb-countdown-2').countdown('2023/12/01', function (event) {
        $(this).html(
            event.strftime(
                '<div class="count"><span class="count-amount">%D</span><span class="count-period">Days</span></div><div class="count"><span class="count-amount">%H</span><span class="count-period">Hours</span></div><div class="count"><span class="count-amount">%M</span><span class="count-period">Minute</span></div><div class="count last-child"><span class="count-amount">%S</span><span class="count-period">Seceond</span></div>'
            )
        );
    });
    $('.fb-countdown-3').countdown('2023/12/01', function (event) {
        $(this).html(
            event.strftime(
                '<div class="count-amount_list"><span class="count-amount">%D</span><span class="count-amount">%H</span><span class="count-amount">%M</span><span class="count-amount">%S</span></div><div class="count-period-list"><span class="count-period">Days</span><span class="count-period">Hours</span><span class="count-period">Minute</span><span class="count-period">Seceond</span></div>'
            )
        );
    });
    /*----------------------------------------*/
    /* 15. FB's Quick View Activision
/*----------------------------------------*/
    $('.product-details-images').each(function () {
        var $this = $(this);
        var $thumb = $this.siblings('.product-details-thumbs');
        $this.slick({
            arrows: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            draggable: false,
            autoplay: false,
            autoplaySpeed: 5000,
            dots: false,
            infinite: false,
            centerMode: false,
            centerPadding: 0,
            asNavFor: $thumb,
        });
    });
    $('.product-details-thumbs').each(function () {
        var $this = $(this);
        var $details = $this.siblings('.product-details-images');
        $this.slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: false,
            autoplay: false,
            autoplaySpeed: 5000,
            dots: false,
            draggable: true,
            infinite: true,
            focusOnSelect: true,
            centerMode: true,
            centerPadding: 0,
            prevArrow:
                '<span class="slick-prev"><i class="fa fa-angle-left"></i></span>',
            nextArrow:
                '<span class="slick-next"><i class="fa fa-angle-right"></i></span>',
            asNavFor: $details,
            responsive: [
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 3,
                    },
                },
                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 3,
                    },
                },
                {
                    breakpoint: 767,
                    settings: {
                        slidesToShow: 2,
                    },
                },
            ],
        });
    });
    /*----------------------------------------*/
    /* 16. Price Slider
/*----------------------------------------*/
    var sliderrange = $('#slider-range');
    var amountprice = $('#amount');
    $(function () {
        sliderrange.slider({
            range: true,
            min: 0,
            max: 1200,
            values: [300, 800],
            slide: function (event, ui) {
                amountprice.val('$' + ui.values[0] + ' - $' + ui.values[1]);
            },
        });
        amountprice.val(
            '$' +
                sliderrange.slider('values', 0) +
                ' - $' +
                sliderrange.slider('values', 1)
        );
    });
    /*----------------------------------------*/
    /* 17. Cart Plus Minus Button
/*----------------------------------------*/
    $('.cart-plus-minus').append(
        '<div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>'
    );
    $('.qtybutton').on('click', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);
    });
    /*----------------------------------------*/
    /* 18. FB's Scroll Up
/*----------------------------------------*/
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-double-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
    });
    /*----------------------------------------*/
    /* 19. FAQ Accordion
/*----------------------------------------*/
    $('.card-header a').on('click', function () {
        $('.card').removeClass('actives');
        $(this).parents('.card').addClass('actives');
    });
    /*----------------------------------------*/
    /* 20. Category Sub Menu Activation
/*----------------------------------------*/
    $('.category-sub-menu li.has-sub > a').on('click', function () {
        $(this).removeAttr('href');
        var element = $(this).parent('li');
        if (element.hasClass('open')) {
            element.removeClass('open');
            element.find('li').removeClass('open');
            element.find('ul').slideUp();
        } else {
            element.addClass('open');
            element.children('ul').slideDown();
            element.siblings('li').children('ul').slideUp();
            element.siblings('li').removeClass('open');
            element.siblings('li').find('li').removeClass('open');
            element.siblings('li').find('ul').slideUp();
        }
    });
    /*----------------------------------------*/
    /* 21. FB's New Product Two Activision
/*----------------------------------------*/
    $('.new-product_active-2').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 4,
            },
        },
    });
    /*---------------------------------------------*/
    /* 22. FB's Single Product Slide Activision
/*---------------------------------------------*/
    $('.fb-single-product_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 1,
            },
            1200: {
                items: 1,
            },
        },
    });
    /*---------------------------------------------*/
    /* 23. FB's FB's Product 3 Activision
/*---------------------------------------------*/
    $('.fb-product_active-3').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 3,
            },
            992: {
                items: 4,
            },
            1200: {
                items: 5,
            },
        },
    });
    /*---------------------------------------------*/
    /* 24. FB's Product List 3 Activision
/*---------------------------------------------*/
    $('.fb-product-list_active-3').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 1,
            },
            768: {
                items: 2,
            },
            992: {
                items: 1,
            },
            1200: {
                items: 1,
            },
        },
    });
    /*---------------------------------------------*/
    /* 25. FB's list-single-slide-active Activision
/*---------------------------------------------*/
    $('.list-single-slide-active').owlCarousel({
        loop: true,
        nav: false,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 4,
            },
        },
    });
    /*---------------------------------------------*/
    /* 26. FB's FB's Product 4 Activision
/*---------------------------------------------*/
    $('.fb-product_active-4').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 3,
            },
            992: {
                items: 4,
            },
            1200: {
                items: 5,
            },
        },
    });
    /*---------------------------------------------*/
    /* 27. Featured Product Active Four
/*---------------------------------------------*/
    $('.featured-product-active-4').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 4,
            },
        },
    });
    /*---------------------------------------------*/
    /* 28. Latest Blog Active
/*---------------------------------------------*/
    $('.latest-blog_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        margin: 20,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 1,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 3,
            },
        },
    });
    /*----------------------------------------*/
    /* 29. FB's Blog Gallery Slider
/*----------------------------------------*/
    var gallery = $('.fb-blog-gallery-slider');
    gallery.slick({
        arrows: false,
        autoplay: true,
        autoplaySpeed: 5000,
        pauseOnFocus: false,
        pauseOnHover: false,
        fade: true,
        dots: true,
        infinite: true,
        slidesToShow: 1,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    arrows: false,
                },
            },
        ],
    });
    /*----------------------------------------*/
    /* 30. Toggle Function Active
/*----------------------------------------*/
    // showlogin toggle
    $('#showlogin').on('click', function () {
        $('#checkout-login').slideToggle(900);
    });
    // showlogin toggle
    $('#showcoupon').on('click', function () {
        $('#checkout_coupon').slideToggle(900);
    });
    // showlogin toggle
    $('#cbox').on('click', function () {
        $('#cbox-info').slideToggle(900);
    });

    // showlogin toggle
    $('#ship-box').on('click', function () {
        $('#ship-box-info').slideToggle(1000);
    });
    /*----------------------------------------*/
    /* 31. Product Details Zoom
/*----------------------------------------*/
    $('.pdetails-imagezoom').lightGallery({
        selector: '.pdetails-singleimage',
    });
    /*----------------------------------------*/
    /* 32. Product Details Image Slider
/*----------------------------------------*/
    /* Product Details Image Slider */
    $('.pdetails-largeimages').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        fade: true,
        asNavFor: '.pdetails-thumbs',
    });
    $('.pdetails-thumbs:not(.pdetails-thumbs-vertical)').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.pdetails-largeimages',
        arrows: false,
        dots: false,
        focusOnSelect: true,
        vertical: false,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 4,
                },
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                },
            },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 2,
                },
            },
        ],
    });
    $('.pdetails-thumbs-vertical').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.pdetails-largeimages',
        arrows: false,
        dots: false,
        focusOnSelect: true,
        centerMode: true,
        vertical: true,
        responsive: [
            {
                breakpoint: 576,
                settings: {
                    vertical: false,
                    slidesToShow: 2,
                },
            },
        ],
    });
    /*----------------------------------------*/
    /* 33. Star Rating Js
/*----------------------------------------*/
    $(function () {
        $('.star-rating').barrating({
            theme: 'fontawesome-stars',
        });
    });
    /*---------------------------------------------*/
    /* 34. Other Product Active
/*---------------------------------------------*/
    $('.fb-other-product_active').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        autoplay: false,
        autoplayTimeout: 5000,
        navText: [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>',
        ],
        item: 2,
        responsive: {
            0: {
                items: 1,
            },
            480: {
                items: 2,
            },
            576: {
                items: 2,
            },
            768: {
                items: 3,
            },
            992: {
                items: 4,
            },
            1200: {
                items: 5,
            },
        },
    });
    /* Product Details Slider Image */
    $('.pdetails-sliderimages').slick({
        slidesToShow: 3,
        autoplay: true,
        autoplaySpeed: 8000,
        speed: 1000,
        adaptiveHeight: true,
        fade: false,
        easing: 'ease-in-out',
        dots: false,
        arrows: false,
        prevArrow:
            '<span class="slider-navigation-arrow slider-navigation-prev"><i class="ion ion-ios-arrow-back"></i></span>',
        nextArrow:
            '<span class="slider-navigation-arrow slider-navigation-next"><i class="ion ion-ios-arrow-forward"></i></span>',
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                },
            },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                },
            },
        ],
    });
    /*----------------------------------------*/
    /* 35. Counter Js
/*----------------------------------------*/
    $('.counter').counterUp({
        delay: 10,
        time: 1000,
    });
    /* Progress Bar Effect */
    $(window).on('scroll', function () {
        function winScrollPosition() {
            var scrollPos = $(window).scrollTop(),
                winHeight = $(window).height();
            var scrollPosition = Math.round(scrollPos + winHeight / 1.2);
            return scrollPosition;
        }
        var trigger = $('.progress-bar');
        if (trigger.length) {
            var triggerPos = Math.round(trigger.offset().top);
            if (triggerPos < winScrollPosition()) {
                trigger.each(function () {
                    $(this).addClass('fill');
                });
            }
        }
    });
    /*--------------------------------
    35. Ajax Contact Form
-------------------------------- */
    $(function () {
        // Get the form.
        var form = $('#contact-form');
        // Get the messages div.
        var formMessages = $('.form-message');
        // Set up an event listener for the contact form.
        $(form).submit(function (e) {
            // Stop the browser from submitting the form.
            e.preventDefault();
            // Serialize the form data.
            var formData = $(form).serialize();
            // Submit the form using AJAX.
            $.ajax({
                type: 'POST',
                url: $(form).attr('action'),
                data: formData,
            })
                .done(function (response) {
                    // Make sure that the formMessages div has the 'success' class.
                    $(formMessages).removeClass('error');
                    $(formMessages).addClass('success');

                    // Set the message text.
                    $(formMessages).text(response);

                    // Clear the form.
                    $('#contact-form input,#contact-form textarea').val('');
                })
                .fail(function (data) {
                    // Make sure that the formMessages div has the 'error' class.
                    $(formMessages).removeClass('success');
                    $(formMessages).addClass('error');

                    // Set the message text.
                    if (data.responseText !== '') {
                        $(formMessages).text(data.responseText);
                    } else {
                        $(formMessages).text(
                            'Oops! An error occured and your message could not be sent.'
                        );
                    }
                });
        });
    });
})(jQuery);
