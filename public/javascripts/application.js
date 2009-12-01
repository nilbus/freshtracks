// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function toggle_row(id) 
{
  var row = $("tr#" + id + "extra td div");
  var display = row.css("display");
  row.slideToggle();
  if (display == "none")
    return "--";
  else
    return "+";
}
