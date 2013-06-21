$(document).ready(function() {
  $(document).on('init.slides', function() {
    additional_slides = $('#additional-slides').html();
    $(additional_slides).appendTo('#slides .slides-container');
    $('#slides').superslides('update');

    $('.social-media').share({
      networks: []
    });
    $('.description-container').perfectScrollbar();
    $('.collaborator-list .scroll-list').perfectScrollbar();
    //$(".multicontent").fitVids();

    var $outerW = $(".current").outerWidth();
    var $innerW = $(".current").find(".container").innerWidth();
    $("#sticky_header").css({right: $outerW - $innerW});
    (function() {
      setTimeout(function() { $(".logo-nav").fadeIn("slow") }, 900);
    }());
  });

  $('#slides').superslides({
    slide_easing: 'easeInOutCubic',
    slide_speed: 1200,
    pagination: false,
    hashchange: true,
    scrollable: true
  }, function() {
    setTimeout(function() { loadNavigateProject(); }, 2000);
  }());

  var $projectContainer = $('#projectContainer');
      var $projectsList = $('#projects-list02');
      loadNavigateProject = function() {
        var pathArray = window.location.hash;
        var urlExtVal = pathArray.substring(pathArray.lastIndexOf('/') + 1);
        var $latestProject = $projectsList.find('li').attr('id');
        var elements = [];
        $projectsList.find('li').each(function(){
           elements.push(this.id); 
        });
        (function() {
          if ($.inArray(urlExtVal, elements) > -1)
            navigateProject(urlExtVal);
          else
          {
            navigateProject($latestProject);
          }
        }());
      }
      var navigateProject = function(projectResource) {
        $projectContainer.load("../projects/" + projectResource, function(response, status, xhr) {
        if (status == "error") {
        console.log("error");
        }
          $("#work").find('.description-container').perfectScrollbar();
                  $("#work").find('.collaborator-list .scroll-list').perfectScrollbar();
          $('.social-media').share({
            networks: [ ] //'facebook', 'twitter' ,'stumbleupon', 'pinterest', 'email','googleplus','linkedin','tumblr','in1','digg'
          });
        });
      }
      var createCarousel = function()
      {
        var $stillsLibrary = $('#stills-library');
        var $stillsLibraryCount = $stillsLibrary.children().length;
        if($stillsLibraryCount > 5)
        {
          $stillsLibrary.carouFredSel({
            items: 5,
            scroll  : {
                  items           : 1,
                  duration        : 600,
                  timeoutDuration : 2000
              },
              circular: true,
              infinite: false,
              auto    : false,
              prev    : {
                  button  : "#stills_prev",
                  key     : "left"
              },
              next    : {
                  button  : "#stills_next",
                  key     : "right"
              },
          });
          $('.library-nav').css({display : 'block'});
        }
  }
});