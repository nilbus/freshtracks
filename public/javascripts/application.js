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
  $(".newWishlistSection, .newRegisteredSection, .edit_wishlist_section, .edit_registered_section").submitWithAjax();
  $(".rowRemover").makeRowRemover();
  $(".main").makeRowExpander();
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

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    var form = $(this);
    disableButton(form.children("[type=submit]"), "Loading...");
    $.post(this.action, form.serialize(), function(data) {appendReturnValue(form, data);}, "html");
    return false;
  })
  return this;
};

// Row Remover

jQuery.fn.makeRowRemover = function() {
  this.click(function() {
  row = $(this).closest("tr");
    $("[uid=" + $(row).attr("uid") + "]").fadeOut( function(){
      var containingTable = $(this).closest("table");
      if( containingTable.find("tr:visible").length == 0)
      {
        containingTable.hide();
        $("[type=" + containingTable.attr("type") + "].empty").show();
      }
      
    });
    
  })
  return this;
};

// Row Expander

jQuery.fn.makeRowExpander = function() {
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

  this.click(function() { expandRow(this); });
  this.find("input:visible").click(function(event) { event.stopPropagation(); });
  this.dblclick(function() {
    var courseList = $(this).closest('.course-list');
    var childRows = courseList.children().children('.main');
    var hasCollapsedRows = childRows.map(function(i,el){return $(el).attr('state')}).filter(function(i,state){return state != 'expanded'}).length > 0

    // Expand the rows
    childRows.each(function(i, element) {
      expandRow(element, hasCollapsedRows);
    });

  });
  
  return this;
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
