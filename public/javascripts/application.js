// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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


function expand_button() {
  return '<img src="/images/add_greyscale.png">';
}

function collapse_button() {
  return '<img src="/images/delete_greyscale.png">';
}
