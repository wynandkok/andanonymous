$(document).ready(function() {
  var loadNavigateProject, $outerW, $innerW, $projectContainer, $projectsList;
  $('#slides').liquidSlider({
            autoSlide:false,
            autoHeight:true,
            autoHeightEaseDuration: 800,
            hashLinking: true,
            hashCrossLinks: true,
            responsive: true,
            preloader: true,
            dynamicTabs: true,
            slideEaseDuration: 920,
            fadeInDuration: 600,
            fadeOutDuration: 600
  });
  $projectContainer = $('#projectContainer');
  $projectsList = $('#projects-list02');
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
      };
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
  };
  $("#photography-list").carouFredSel({
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
  loadNavigateProject();
  createCarousel();
  $("#slides-wrapper").delay(1000).fadeIn("slow");

  $('.description-container').perfectScrollbar();
  $('.collaborator-list .scroll-list').perfectScrollbar();
});