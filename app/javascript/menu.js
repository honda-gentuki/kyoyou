window.addEventListener('load', function(){
  const menu = document.getElementById("menu1");
  const pullDownMenu = document.getElementById("menu1-pull-down");

  menu.addEventListener('click', function() {
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:block;");
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
    }
  });
});