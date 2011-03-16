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
  $("input:submit").button();
  $("input:text").textbox();
  $("input:password").textbox();
})

jQuery.fn.textbox = function() {
  this.addClass('ui-widget ui-state-default');
  this.focus(function(e){$(this).addClass('ui-state-active')});
  this.blur(function(e){$(this).removeClass('ui-state-active')});
};

jQuery.fn.makeIntoSpiner = function() {
  this.html('<img src="/images/ajax-loader.gif" title="loading">');
};

function showLoadedStatus(element, data) {
  $(element).html('<span class="loaded">' + data + '</span>');
};

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    var form = this;
    $.post(this.action, $(this).serialize(), function(data) {showLoadedStatus(form, data);});
    $(this).makeIntoSpiner();
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
    
    //The button on this row, to be changed
    var button = row.children(".expander");
    
    var id = row.attr("id");

    var previouslyExpanded = button.children().hasClass('expanded');
    var nowExpanded;
    slider.stop(true, true);
    if (expand) {
      slider.slideDown();
      nowExpanded = true;
    } else if (expand == false) {
      slider.slideUp();
      nowExpanded = false;
    } else {
      slider.slideToggle();
      nowExpanded = !previouslyExpanded;
    }
    if (nowExpanded) {
      // update button
      button.html(collapseButton());
    } else {
      // update button
      button.html(expandButton());

      // also shrink descendents
      $("#" + id + " + .extra td > div").slideUp();
    }
  };

  this.click(function() { expandRow(this); });
  this.find("input:visible").click(function(event) { event.stopPropagation(); });
  this.dblclick(function() {
    var courseList = $(this).closest('.course-list');
    var hasCollapsedRows = courseList.children().children('.main').children('.expander').children('img').hasClass('collapsed');
    courseList.children().children('.main').each(function(index, element) {
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
