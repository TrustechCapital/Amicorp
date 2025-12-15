function addKeyEvent() {
  // Specific function for this particular browser
  var e = (document.addEventListener) ? 'keypress' : 'keydown';
  addEvent(document,e,keyEventHandler,false);
}

addKeyEvent();

//To disable the right mouse button
//document.oncontextmenu=new Function("return false");
