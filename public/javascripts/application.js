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
  $(".newWishlistSection, .newRegisteredSection").submitWithAjax();
  $(".main").makeRowExpander();
})

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

// Row Expander

jQuery.fn.makeRowExpander = function() {
  this.click(function() {
    var row = $(this);
    var slider = row.next().children().children(".slider");
    var button = row.children(".expander");
    var id = row.attr("id");

    var displayStatus = slider.css("display");
    slider.slideToggle();
    if (displayStatus == "none") {
      // expand
      button.html(collapseButton());
    } else {
      // shrink
      // also shrink descendents
      setTimeout(function() {
        $("#" + id + " + .extra .expander").html(expandButton());
        button.html(expandButton());
      }, 400);
      $("#" + id + " + .extra td > div").slideUp();
    }
  })
  this.children('.button').children("input").click(function() { return false; });
  
  return this;
};

// These are also defined in helpers/application.rb
function expandButton() {
  return '<img border="0" src="/images/add_greyscale.png">';
}

function collapseButton() {
  return '<img border="0" src="/images/delete_greyscale.png">';
}
