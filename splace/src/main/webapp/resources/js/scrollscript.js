$(document).ready(function() {
  $("#myCarousel").on("slide.bs.carousel2", function(e) {
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 2;
    var totalItems = $(".carousel-item2").length;

    if (idx >= totalItems - (itemsPerSlide - 1)) {
      var it = itemsPerSlide - (totalItems - idx);
      for (var i = 0; i < it; i++) {
        // append slides to end
        if (e.direction == "left") {
          $(".carousel-item2")
            .eq(i)
            .appendTo(".carousel-inner2");
        } else {
          $(".carousel-item2")
            .eq(0)
            .appendTo($(this).find(".carousel-inner2"));
        }
      }
    }
  });
});