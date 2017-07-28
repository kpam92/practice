
document.addEventListener('DOMContentLoaded', addListener)

function addListener() {
  var button = document.getElementById("nav-button");
  button.addEventListener("click",dropDown)

}

function dropDown() {
  navBar = document.getElementById("mobile-nav");
  logo = document.getElementById("logo");
  var button = document.getElementById("nav-button");

  if (hasClass(navBar, 'navbar-white')) {
    navBar.classList.remove("navbar-white");
    navBar.classList.add("navbar-blue");

    logo.classList.remove("desktop-logo");
    logo.classList.add("mobile-logo");

    button.classList.remove("nav-button");
    button.classList.add("nav-button-exit");


  } else {
    navBar.classList.remove("navbar-blue");
    navBar.classList.add("navbar-white");

    logo.classList.remove("mobile-logo");
    logo.classList.add("desktop-logo");

    button.classList.remove("nav-button-exit");
    button.classList.add("nav-button");
  }

}

function hasClass(element, cls) {
    return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
}
