function toggle(id) 
{
  var shown = $("tr#" + id + "extra").toggle().css("display");
  if(shown == "none")
    return "+";
  else
    return "--";
}
