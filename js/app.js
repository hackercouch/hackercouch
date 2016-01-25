$(document).ready(function() {

  // Lazy load images
  // @link https://github.com/tuupola/jquery_lazyload
  $("img.lazy").lazyload({
    threshold: 400
  });

  // Collapsing mobile navigation
  // @link http://materializecss.com/navbar.html
  $(".button-collapse").sideNav();

  /**
   * Search page country filter
   */
  if($("body").attr("id") === "search") {

    var $couches = $("#couches"),
        $countryFilterName = $("#country-filter-name"),
        $countryFilterClose = $("#country-filter-close"),
        $countrySelector = $("#selector-country");

    // Country filter
    // @link http://materializecss.com/forms.html#select
    $countrySelector.material_select();

    // Select country from the filter
    $countrySelector.change(function() {
      setCountryFilter( $(this).val() );
    });

    // Select country from a link
    $("a.country").click(function(e) {
      e.preventDefault();
      setCountryFilter( $(this).data("country") );
    });

    // Clear country filter
    $countryFilterClose.click(function() {
      clearCountryFilter();
    });

    // Set country filter
    function setCountryFilter(countryCode) {

      // Update controls
      $countrySelector.val(countryCode).material_select();
      $countryFilterClose.show();

      // Mark found couches active
      $couches
        .addClass("filter-countries")
        .find(".country-active").removeClass("country-active")
        .end()
        .find(".couch[data-country='" + countryCode + "']").addClass("country-active");
    }

    function clearCountryFilter() {
      $couches
        .removeClass("filter-countries")
        .find(".country-active").removeClass("country-active");

      $countrySelector.val("").material_select();
      $countryFilterClose.hide();
    }

  }

});
