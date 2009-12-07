// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// From Railscast 135 - jQuery
// Change request type to javascript for ajax calls
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.showLoadingStatus = function() {
  this.html('<img src="/images/ajax-loader.gif" title="loading">');
};

function showLoadedStatus(element, data) {
  $(element).html('<span class="loaded">' + data + '</span>');
};

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    var form = this;
    $.post(this.action, $(this).serialize(), function(data) {showLoadedStatus(form, data);});
    $(this).showLoadingStatus();
    return false;
  })
  return this;
};

$(document).ready(function() {
  var preloaded_spinner = new Image();
  preloaded_spinner.src = '/images/ajax-spinner.gif';
  $(".newWishlistSection, .newRegisteredSection").submitWithAjax();
})

function toggle_row(id) 
{
  var row = $("tr#" + id + "extra > td > div");
  var display = row.css("display");
  row.slideToggle();
  if (display == "none") {
    // expand
    return collapse_button();
  } else {
    // shrink
    // also shrink descendents
    setTimeout(function() { $("tr#" + id + "extra .expander a").html(expand_button()); }, 500);
    $("tr#" + id + "extra td > div").slideUp();
    return expand_button();
  }
}


// These are also defined in helpers/application.rb
function expand_button() {
  return '<img border="0" src="/images/add_greyscale.png">';
}

function collapse_button() {
  return '<img border="0" src="/images/delete_greyscale.png">';
}
