document.addEventListener('DOMContentLoaded', function() {
    // SLIDER
    var carouselslider = new Swiper('.carousel-slider', {
      spaceBetween: 0,
      slidesPerView: 1,
      centeredSlides: true,
      autoplay: {
        delay: 3500,
        disableOnInteraction: false,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      pagination: {
        el: '.swiper-pagination',
        type: 'progressbar',
      },
      loop: true,
      breakpoints: {
        // 1024: {
        //   slidesPerView: 2
        // },
        // 768: {
        //   slidesPerView: 1
        // },
        // 640: {
        //   slidesPerView: 1
        // },
        // 320: {
        //   slidesPerView: 1
        // }
      }
    });
  });
  