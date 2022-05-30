$(function() {
  $('.slider').slick({
      dots: true,
  });
  $('.slick-dots li').on('mouseover', function() {
    $('.a').slick('goTo', $(this).index());
  });
});
