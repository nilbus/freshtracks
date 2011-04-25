// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// From Railscast 135 - jQuery
// Change request type to javascript for ajax calls
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {
  var preloaded_spinner = new Image();
  preloaded_spinner.src = '/images/ajax-loader.gif';
  submitWithAjax(".newWishlistSection, .newRegisteredSection, .edit_wishlist_section, .edit_registered_section");
  makeRowRemover(".rowRemover");
  makeRowExpander(".main");
  $(".course-list").not(".course-list .course-list").before('<div class="row course-list-header">Double-click a row to expand all rows</div>');
})

jQuery.fn.textbox = function() {
  this.addClass('ui-widget ui-state-default');
  this.focus(function(e){$(this).addClass('ui-state-active')});
  this.blur(function(e){$(this).removeClass('ui-state-active')});
};

function appendReturnValue(element, data) {
  $(element).append(data);
}

function submitWithAjax(selector) {
  $(selector).live('submit', function() {
    var form = $(this);
    disableButton(form.children("[type=submit]"), "Loading...");
    $.post(this.action, form.serialize(), function(data) {appendReturnValue(form, data);}, "html");
    return false;
  });
};

// Row Remover
function makeRowRemover(selector) {
  $(selector).live('click', function() {
    row = $(this).closest(".main");
    $("[uid=" + $(row).attr("uid") + "]").fadeOut( function(){
      // Hide the course list if it's empty
      /* This isn't necessary in the new layout, but we could later replace its contents with something like "Empty Schedule"
      var container = $(this).closest(".course-list");
      if( container.find(".main:visible").length == 0) {
        container.hide();
        $("[type=" + container.attr("type") + "].empty").show();
      }
      */
    });
  });
};

// Row Expander

function makeRowExpander(selector) {
  // expand can be undefined(toggle), true(expand), false(collapse)
  var expandRow = function(row, expand) {
    row = $(row);
    
    //The row to be slid
    var slider = $("[uid=" + row.attr("uid") + "].slider").eq(0);
    var id = row.attr("id");
    var previouslyExpanded = row.attr('state') == 'expanded'; // assumption: default state (unset) is collapsed
    var nowExpanded;

    slider.stop(true, true);
    if (expand) {
      slider.slideDown();
      nowExpanded = true;
    } else if (expand == false) {
      slider.slideUp();
      nowExpanded = false;
    } else { // undefined
      slider.slideToggle();
      nowExpanded = !previouslyExpanded;
    }

    if (nowExpanded) {
      row.attr('state', 'expanded');

    } else {
      row.attr('state', 'collapsed');

      // shrink descendents
      $("#" + id + " + .extra .slider").slideUp();
    }
  };

  rows = $(selector);
  rows.live('click', function() { expandRow(this); });
  rows.find("input:visible").live('click', function(event) { event.stopPropagation(); }); // Keep button/input clicks from counting as a click to expand/contract
  rows.live('dblclick', function() {
    var courseList = $(this).closest('.course-list');
    var childRows = courseList.children().children('.main');
    var hasCollapsedRows = childRows.map(function(i,el){return $(el).attr('state')}).filter(function(i,state){return state != 'expanded'}).length > 0

    // Expand the rows
    childRows.each(function(i, element) {
      expandRow(element, hasCollapsedRows);
    });

  });
};

// These are also defined in helpers/application.rb
function expandButton() {
  return '<img border="0" src="/images/add_greyscale.png" class="collapsed">';
}

function collapseButton() {
  return '<img border="0" src="/images/delete_greyscale.png" class="expanded">';
}

function disableButton(button, newText) {
  button = $(button)
  if(( button.attr("old-value") == undefined ) || (button.attr("old-value") == "")){
    button.attr("old-value", button.attr("value"));
  }
  button.attr("value", newText);
  button.attr("disabled", "disabled");
}

function enableButton(button) {
  button = $(button);
  var oldVal = button.attr("value");
  button.attr("value", button.attr("old-value"));
  button.removeAttr("disabled");
  button.removeAttr("old-value");
  return oldVal;
}

function disableScheduleButton(sectionID){
  disableButton( $(":input[type=submit].add-to-schedule[section=" + sectionID + "]"), "Currently Enrolled");
}

function enableScheduleButton(sectionID){
  enableButton( $(":input[type=submit].add-to-schedule[section=" + sectionID + "]"));
}

function disableWishlistButton(sectionID){
  disableButton( $(":input[type=submit].add-to-wishlist[section=" + sectionID + "]"), "On your wishlist");
}

function enableWishlistButton(sectionID){
  enableButton( $(":input[type=submit].add-to-wishlist[section=" + sectionID + "]"));
}

function appendError(container, error_message) {
  $('#error').attr('id', 'old-error').slideUp('fast', function(){$(this).remove()});
  $(container).append($("<div id='error'>" + error_message + "</div>").hide());
  $('#error').slideDown('fast');
}

Array.prototype.max = function() { return Math.max.apply(null, this) }
var alignRowHeights = function() {
  $('.row').each(function(i, el) {
    var boxes = $(el).find('.roundbox')
    boxes.height('');
    if ($(window).width() < 767) return;
    var maxHeight = $.makeArray(boxes.map(function(i, el) {
      return $(el).height()
    })).max()
    boxes.height(maxHeight);
  });
};
$(window).resize(alignRowHeights);
$(document).ready(alignRowHeights);
$(window).load(alignRowHeights);
