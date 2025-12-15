//==============================================================================
//====================      FUNCIONES Y VARIABLES GENERICAS       ========================
//==============================================================================

//==============================================================================
// Esta es solo una funcion generica de ejemplo. Es importante que cualquier funcion
// de script contenga este mismo encabezado, para documentar su funcionamiento.
//==============================================================================

// Variables globales. declarar aqui las variables globales de la aplicacion

// Variables para identificar el navegador del cliente
var showParameters = false;
var abortAjax = false;
var showRequestedURL = false;
var useFiduciaDebug = false;

var letras  = "abcdefghijklmnoopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ ";
		
var agt       = navigator.userAgent.toLowerCase();
var appVer    = navigator.appVersion.toLowerCase();
var is_minor  = parseFloat(appVer);
var is_major  = parseInt(is_minor);

var is_opera  = (agt.indexOf("opera") != -1);
var is_safari = ((agt.indexOf('safari')!=-1) && (agt.indexOf('mac')!=-1));
var is_konq   = (agt.indexOf('konqueror')!=-1);
var is_khtml  = (is_safari || is_konq);

var iePos  = appVer.indexOf('msie');
if (iePos !=-1) {
    is_minor = parseFloat(appVer.substring(iePos+5,appVer.indexOf(';',iePos)));
    is_major = parseInt(is_minor);
}
var is_ie      = ((iePos!=-1) && (!is_opera) && (!is_khtml));
var is_ie5     = (is_ie && is_major == 5);
var is_ie5up   = (is_ie && is_minor >= 5);
var is_ie5_5   = (is_ie && (agt.indexOf("msie 5.5") !=-1));
var is_ie5_5up = (is_ie && is_minor >= 5.5);
var is_ie6     = (is_ie && is_major == 6);
var is_ie6up   = (is_ie && is_minor >= 6);
var is_ie7up   = (is_ie && is_minor >= 7);

var objImg = createElement("img");
objImg.src = ctxRoot + "/imagenes/wait.png";
objImg.style.position = "absolute";

var isWaiting = false;


function validarEntero(entero){
  //Agregar aqui el codigo de la funcion.
}

//Agregar aqui las funciones genericas..................

function ltrim(s) {
   return s.replace(/^\s+/, "");
}

function rtrim(s) {
   return s.replace(/\s+$/, "");
}

function trim(s) {
   return rtrim(ltrim(s));
}

// Funcion para obtener una instancia del Objeto XMLHttpRequest del Navegador. 
// Esta funcion es llamada por funciones con funcionalidad AJAX
function getAjaxObj() {
  if(!window.XMLHttpRequest && window.ActiveXObject ) {
      window.XMLHttpRequest = function() {
      var a = [ 'Msxml2.XMLHTTP.5.0', 'Msxml2.XMLHTTP.4.0', 'Msxml2.XMLHTTP.3.0', 'Msxml2.XMLHTTP', 'Microsoft.XMLHTTP' ], i = a.length;
      
      while(i--) {
        try {
          var objAx = new ActiveXObject( a[i] )
          if((typeof objAx) == "object") return objAx;
        } catch (e) { }
      }
      
      return null;
    };
  }
  
  var xmlhttp;
  
  if(window.XMLHttpRequest ) xmlhttp = new XMLHttpRequest();
  if( !xmlhttp ) alert("Sorry, creating the XMLHttpRequest object failed.");
  
  return xmlhttp;
}

// Funcion para hacer un request con AJAX.
function makeAjaxRequest(theURL, tipo, funcion, el) {
  if(showRequestedURL) console.log('theURL: ' + theURL);
  var strParameters = "";
  var auxParam = "";
  var parameters = {};

  if(theURL.indexOf("?") > -1) {
    strParameters = theURL.split("?");
    theURL = strParameters[0];
    
    if(strParameters[1].indexOf('&') > -1) {
      strParameters = strParameters[1].split('&');   
      for(i = 0; i < strParameters.length; i++) {
        auxParam = strParameters[i].split('=');
        eval('parameters.' + auxParam[0] + '=auxParam[1];');
      }
    
    } else { //Solo trae un parametro
      auxParam = strParameters[1].split('=');
      eval('parameters.' + auxParam[0] + '=auxParam[1];');
    }
    
    if(showParameters) {
      for(x in parameters) {
        console.log('key: ' + x + ' value: ' + parameters[x]);
      }
    }
  }
    
  if(abortAjax) return;
  if(showRequestedURL) console.log('parameters: ' + JSON.stringify(parameters));
  
  if(isDefinedAndNotNull(funcion)) {
    $.post(theURL, parameters, function(data){ funcion(el, data); });
  } else {
    $.post(theURL, parameters, function(data){ return data; });
  }
}

// Funcion para cambiar el innerHTML de un elemento con AJAX

function updateHtmlFromURL(el, theURL) {
  makeAjaxRequest(theURL, "HTML", updateHTML, el);
}			

function updateHTML(elemento, resultado) {
  elemento.innerHTML = resultado;
}

// Funciones para validar los tipos de objeto
function isArray(a) { return isObject(a) && a.constructor == Array }                              // Valida si el objeto es una instancia de Array
function isBoolean(a) { return typeof a == 'boolean' }                                            // Valida si el objeto es de tipo boolean
function isNull(a) { return typeof a == 'object' && !a }                                          // Valida si el objeto es nulo
function isFunction(a) { return typeof a == 'function' }                                          // Valida si el objeto es una funcion
function isNumber(a) { return (typeof a == 'number') || (a === 0) }                               // Valida si el objeto es de tipo number
function isObject(a) { return (typeof a == 'object' && !!a) || isFunction(a) }                    // Valida si el parametro es un objeto
function isString(a) { return a && (typeof a == 'string' || a.constructor == String) }            // Valida si el objeto es de tipo string
function isUndefined(a) { return (typeof a == 'undefined') }                                      // Valida si el objeto es no valido
function isDefined(a) { return (typeof a != 'undefined') }                                        // Valida si el objeto es no valido

function isDefinedAndNotNull(obj) {
	return (isDefined(obj) && !isNull(obj));	
}

// Funcion para obtener un objeto pasando el id
function GI(_id) {
  var obj = null;
  if(trim(_id) != '') obj = document.getElementById(_id);
	return obj;
}

// Funcion para obtener atributos
function GA(el, atrrName) {
	try { return el.getAttribute(atrrName); } catch(e) { return null; }
}

/** Funcion para agregar o cambiar atributos a un objeto */
function SA(el, atrrName, attrValue) {
	try { el.setAttribute(atrrName, attrValue); return true; } catch(e) { return false; }
}

/** Funcion para remover atributos a un objeto */
function RA(el, atrrName) {
  try { el.removeAttribute(atrrName); return true; } catch(e) { return false; }
}

// Function para validar si un objeto esta vacio
function isEmpty(o) {
	var rv = true;
	if (isObject(o)) { for (var x in o) { rv = false; break; } }
	return rv;
}

// Funcion para obtener el ancho de la pagina
function getInnerWidth() {
    if (is_ie5up) {
        return document.body.clientWidth;
    } else {
        return document.documentElement.offsetWidth - 20;
    }
}

// Funcion para obtener el largo de la pagina
function getInnerHeight() {
    if (is_ie5up) {
        return document.body.clientHeight;
    } else {
        return document.documentElement.offsetHeight - 20;
    }
}

// Funcion para esconder un elemento
function hide(field) {
	var obj = GI(field);
	if (obj)
		obj.style.display = "none";
}

// Funcion para mostrar un elemento
function show(field) {
	var obj = document.getElementById(field);
	if (obj)
		obj.style.display = "block";
}

function hideErr(errObj) {
		errObj.style.display = "none";
    if(is_ie) 
      errObj.setAttribute("className", "");
    else
      errObj.setAttribute("class", "");    
}

// Funcion para mostrar un elemento
function showErr(errObj) {
		errObj.style.display = "block";
    if(is_ie) 
      errObj.setAttribute("className", "errorMsg");
    else
      errObj.setAttribute("class", "errorMsg");
}

// Funcion para genrar un mensaje de alert
function A(message)
{
  var useEval = true;
  try { eval(message); } catch(e) { useEval = false; }

  if(useEval)
    alert(eval(message));
  else
    alert(message);
}

// Funcion para quitar los espacios en balnco de una cadena
function TR(_cadena)
{
  var strCadena = String(_cadena);
  return strCadena.replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1");
}

function loadImg(fieldName, src) {
	var img = document.getElementById(fieldName);
	if (img)
		img.src = src;
}

function createElement(type, parent) {
	var el = null;
	if (document.createElementNS) {
		// use the XHTML namespace; IE won't normally get here unless
		// _they_ "fix" the DOM2 implementation.
		el = document.createElementNS("http://www.w3.org/1999/xhtml", type);
	} else {
		el = document.createElement(type);
	}
	if (typeof parent != "undefined") {
		parent.appendChild(el);
	}
	return el;
}

function createHiddenElement(type, parent, elementId, elementName, elementValue) {
  
  if(is_ie) type = "<input type=hidden id=" + elementId + " name=" + elementName + ">";
  
	var el = createElement(type, parent);
  
  try { 
    el.type = "hidden"; 
    el.id = elementId;
    el.name = elementName;
  } catch(Exception) {}
  
  el.value = elementValue;
    
	return el;
};

function sendMessageAndFocus(message, obj)
{
  A(message);
  obj.focus();
}

function printMessageAndFocus(labelObj, message, obj)
{
  if(is_ie)
    labelObj.innerText = message;
  else
    labelObj.innerHTML = message;
    
  show(labelObj);
  
  obj.focus();
}

function getExpDate(days, hours, minutes) {
  var expDate = new Date();
  if (typeof days == "number" && typeof hours == "number" && typeof hours == "number") {
    expDate.setDate(expDate.getDate() + parseInt(days));
    expDate.setHours(expDate.getHours() + parseInt(hours));
    expDate.setMinutes(expDate.getMinutes() + parseInt(minutes));
    return expDate.toGMTString();
  }
}

// utility function called by getCookie()
function getCookieVal(offset) {
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1) {
    endstr = document.cookie.length;
  }
  return document.cookie.substring(offset, endstr);
}

// primary function to retrieve cookie by name
function getCookie(name) {
  var arg = name + "=";
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;
  while (i < clen) {
    var j = i + alen;
    if (document.cookie.substring(i, j) == arg) {
      return getCookieVal(j);
    }
    i = document.cookie.indexOf(" ", i) + 1;
    if (i == 0) break;
  }
  return null;
}

// store cookie value with optional details as needed
function setCookie(name, value, expires, path, domain, secure) {
  document.cookie = name + "=" + value +
    ((expires) ? "; expires=" + expires : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
}

// remove the cookie by setting ancient expiration date
function deleteCookie(name,path,domain) {
  if (getCookie(name)) {
    document.cookie = name + "=" +
      ((path) ? "; path=" + path : "") +
      ((domain) ? "; domain=" + domain : "") +
      "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
}

// This function is used to display a baloon when the onmouseover event is raised. Requires the overlibmws library.
BaloonAlert = function(el, msg)
{
  var useEval = true;
  try { eval(msg); } catch(e) { useEval = false; }
  
  if(useEval)
    msgR = (eval(msg));
  else
    msgR = msg;
  
  el.onmouseover=function() { return overlib(msgR, BUBBLE, BUBBLETYPE, 'quotation', STATUS, 'quotation popup', TEXTSIZE,'x-small'); } 
  try { el.onmouseout=nd; } catch(Exception) {}
}	

PinAlert = function(el, msg)
{
  var useEval = true;
  try { eval(msg); } catch(e) { useEval = false; }
  
  if(useEval)
    msgR = (eval(msg));
  else
    msgR = msg;
    
  el.onmouseover=function() { return overlib(msgR, BUBBLE, BUBBLETYPE, 'pushpin', STATUS, 'pushpin popup', TEXTSIZE,'0.83em', RELX,-550, RELY,30, FILTER, FILTERSHADOW,2, FILTERSHADOWCOLOR,'purple'); }
  try { el.onmouseout=nd; } catch(Exception) {}
}

RemoveOWAlert = function(el)
{
  try { el.onmouseover=nd; } catch(Exception) {}
}

var badKeys = new Object();

badKeys.single = new Object();
badKeys.single['8'] = 'Backspace outside text fields';
badKeys.single['13'] = 'Enter outside text fields';
badKeys.single['116'] = 'F5 (Refresh)';
badKeys.single['122'] = 'F11 (Full Screen)';

badKeys.alt = new Object();
badKeys.alt['37'] = 'Alt+Left Cursor';
badKeys.alt['39'] = 'Alt+Right Cursor';

badKeys.ctrl = new Object();
badKeys.ctrl['78'] = 'Ctrl+N';
badKeys.ctrl['79'] = 'Ctrl+O';

function checkKeyCode(type, code) 
{
  if (badKeys[type][code]) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}

function getKeyText(type, code) 
{
  return badKeys[type][code];
}

var ie = document.all;
var w3c = document.getElementById&&!document.all;

function keyEventHandler(evt) 
{
  this.target = evt.target || evt.srcElement;
  this.keyCode = evt.keyCode || evt.which;
  var targtype = this.target.type;
  
  if (w3c) 
  {
    if (document.layers) 
    {
      this.altKey = ((evt.modifiers & Event.ALT_MASK) > 0);
      this.ctrlKey = ((evt.modifiers & Event.CONTROL_MASK) > 0);
      this.shiftKey = ((evt.modifiers & Event.SHIFT_MASK) > 0);
    }
    else 
    {
      this.altKey = evt.altKey;
      this.ctrlKey = evt.ctrlKey;
    }
  // Internet Explorer
  } 
  else 
  {
    this.altKey = evt.altKey;
    this.ctrlKey = evt.ctrlKey;
  }
    
  // Find out if we need to disable this key combination
  var badKeyType = "single";
  
  if (this.ctrlKey) 
  {
    badKeyType = "ctrl";
  } 
  else if (this.altKey) 
  {
    badKeyType = "alt";
  }
    
  /*if (checkKeyCode(badKeyType, this.keyCode)) 
  {
    return cancelKey(evt, this.keyCode, this.target, getKeyText(badKeyType, this.keyCode)); 
  }*/
  
  //alert("this.keyCode: " + this.keyCode + " equals to: " + String.fromCharCode(this.keyCode));
  
	//if (is_ie && evt.ctrlKey) {
		switch (this.keyCode) {
      case 35: // Inicio
        return true;
        break;    
      case 36: // Fin
        return true;
        break;    
      case 37: // KEY left
        return true;
        break;
      case 38: // KEY up
        return true;
        break;
      case 39: // KEY right
        return true;
        break;
      case 40: // KEY down
        return true;
        break;
      case 46: // KEY down
        return true;
        break;
      case 186: // KEY Acento
        return true;
        break;                
      default:
        var pasa = "OK";
		}
	//}*/  
  
  // Soporte para el teclado numerico
  if(is_ie) // ver si tambien aplica el ctrlKey
    if(this.keyCode >= 96 && this.keyCode < 106) this.keyCode = this.keyCode - 48;
  
  var newValue = String.fromCharCode(this.keyCode);
  
  var tipoVal = GA(this.target, "tipo");
  
  if(isDefinedAndNotNull(tipoVal))
  {
    try {
      if(!eval("val" + tipoVal + "(\"" + newValue + "\")"))
        return cancelKey(evt, this.keyCode, this.target, getKeyText(badKeyType, this.keyCode)); 
    } catch(e) {}
  }

  var readOnly = GA(this.target, "LKD");
  if(isDefinedAndNotNull(readOnly)) return cancelKey(evt, this.keyCode, this.target, getKeyText(badKeyType, this.keyCode), true);
}

function cancelKey(evt, keyCode, target, keyText, disableBack) {
  if (keyCode == 9) return true;
  
  if (keyCode==8 || keyCode==13) {
    if(keyCode == 8 && disableBack) {
      evt.keyCode = 0;
      evt.returnValue = false;
    }
    
    // Don't want to disable Backspace or Enter in text fields
    if (target.type == "text" || target.type == "textarea" || target.type == "password") {
      return true;
      //return false;
    }
  }
  
  if (evt.preventDefault) {
    evt.preventDefault();
    evt.stopPropagation();
  } else {
    evt.keyCode = 0;
    evt.returnValue = false;
  }
  
  return false;
}	

function addEvent(obj, evType, fn, useCapture) 
{
  // General function for adding an event listener
  if (obj.addEventListener) 
  {
    obj.addEventListener(evType, fn, useCapture);
    return true;
  } 
  else if (obj.attachEvent) 
  {
    var r = obj.attachEvent("on" + evType, fn);
    return r;
  } 
  else 
  {
    alert(evType+" handler could not be attached");
  }
}

// Funciones para Validacion
function valEmail(strValue)
{
	return true;
}

function valNum(pNum) 
{  
	regNum=/^\d+$/;  //formato de solo numeros
	return regNum.exec(pNum);
}

function valNumero(pNum) 
{  
	regNum=/^\d+$/;  //formato de solo numeros
	return regNum.exec(pNum);
}

function valLower(pChar)
{
  try { if(this.keyCode == 192) return true; } catch(e) {}
	regChar = /^[a-z\s]*$/; //Formato de letras minusculas
	return regChar.exec(pChar); 
}

function valLetrasMayusculas(pLetrasMayusculas)
{
  try { if(this.keyCode == 192) return true; } catch(e) {}
	regAlphaNumeric = /^[A-Z\s]*$/; //Formato de solo letras mayusculas
	return regAlphaNumeric.exec(pLetrasMayusculas);
}

function valLetras(pLetras)
{
  try { if(this.keyCode == 192) return true; } catch(e) {}
	regAlphaNumeric = /^[a-zA-Z\s]*$/; //Formato de solo letras mayusculas
	return regAlphaNumeric.exec(removeSpecial(pLetras));
}

function valAlphaNumeric(pAlphaNumeric)
{
  try { if(this.keyCode == 192) return true; } catch(e) {}
	regAlphaNumeric = /^[a-zA-Z0-9\s]*$/; //Formato de alfanumerico
	return regAlphaNumeric.exec(pAlphaNumeric);  
}

function valAlphaNumericMayusculas(pAlphaNumeric)
{
  try { if(this.keyCode == 192) return true; } catch(e) {}
	regAlphaNumeric = /^[A-Z0-9\s]*$/; //Formato de alfanumerico solo mayusculas
	return regAlphaNumeric.exec(pAlphaNumeric); 
}

function sendWarn(msg)
{
  var ov = overlib(msg, BUBBLE, BUBBLETYPE, 'pushpin', STATUS, 'pushpin popup', TEXTSIZE,'0.83em', RELX,-550, RELY,30, FILTER, FILTERSHADOW,2, FILTERSHADOWCOLOR,'purple');
}

function getMessage(msg)
{
  var useEval = true;
  try { eval(msg); } catch(e) { useEval = false; }
  return (useEval ? eval(msg) : msg);
}

getAbsolutePos = function(el) {
	var SL = 0, ST = 0;
	var is_div = /^div$/i.test(el.tagName);
	if (is_div && el.scrollLeft)
		SL = el.scrollLeft;
	if (is_div && el.scrollTop)
		ST = el.scrollTop;
	var r = { x: el.offsetLeft - SL, y: el.offsetTop - ST };
	if (el.offsetParent) {
		var tmp = this.getAbsolutePos(el.offsetParent);
		r.x += tmp.x;
		r.y += tmp.y;
	}
	return r;
}

function toUpper(strValue)
{
  return strValue.toUpperCase();
}

function clonePos(source, target, doWidth, doHeight)
{
  target.style.position = "absolute";
  
  var offsets = cumulativeOffset(source);
  
  target.style.top    = offsets[1] + "px";
  target.style.left   = offsets[0] + "px";
  if(doWidth) target.style.width  = source.offsetWidth + "px";
  if(doHeight) target.style.height = source.offsetHeight + "px";        
}

function cumulativeOffset(element)
{
  var valueT = 0, valueL = 0;
  do {
    valueT += element.offsetTop  || 0;
    valueL += element.offsetLeft || 0;
    element = element.offsetParent;
  } while (element);
  return [valueL, valueT];
}

function removeSpecial(text)
{ 
  var specialString = text.toLowerCase();
  specialString = specialString.replace('á','a');
  specialString = specialString.replace('é','e');
  specialString = specialString.replace('í','i');
  specialString = specialString.replace('ó','o');	
  specialString = specialString.replace('ú','u');
  specialString = specialString.replace('ñ','n');
  specialString = specialString.replace("ã¡","a");
  specialString = specialString.replace("ã©","e");  
  specialString = specialString.replace("ã­","i");
  specialString = specialString.replace("ã³","o");
  specialString = specialString.replace("ãº","u");    
  specialString = specialString.replace('‡','a');
  specialString = specialString.replace('Ž','e');
  specialString = specialString.replace('’','i');
  specialString = specialString.replace('—','o');
  specialString = specialString.replace('œ','u');
  return specialString.toUpperCase();	    
}

function setLength(el, length)
{
  el.maxLength = parseInt(length);
}

function convertToMoneyById(objId) 
{
  convertToMoney(GI(objId));
  return true;
}

function convertToMoney(obj) 
{
  var amountPre = obj.value;
  var amount = ""+parseFloat(amountPre.replace(/,/g, ""));
  var numero="";
  //var data = new String(Math.round(amount));
  
  var data = new String(amount);
  if(data.indexOf(".")==-1) {
    while(data.length>3) {
      var temp = "," + data.substring(data.length-3, data.length);
      numero = temp + numero;
      data = data.substring(0, data.length-3);
    }
    if(data=='-') numero = "-" + numero.substring(1, numero.length) + ".00";
    else numero = data + numero + ".00";
  }
  else {
    var dec = data.substring(data.indexOf("."), data.indexOf(".") + 3);
    data = data.substring(0, data.indexOf("."));
    while(data.length>3) {
      var temp = "," + data.substring(data.length-3, data.length);
      numero = numero + temp;
      data = data.substring(0, data.length-3);
    }
    if(data=="-") numero = "-" + numero.substring(1, numero.length) + ".00";
    else numero = data + numero + dec;
  }
  obj.value = numero;
}

// In:  A string representing an amount of money.
// Out: A float value representing the string but without the comma character.
// Example of usage: var amount =  convertMoneyTo("1,234,987.00");
function convertMoneyTo(amount) {
  var buffer="";
  var data = new String(amount);
  temp = data.split(",");
  for(var i=0; i<temp.length; i++) {
     buffer+=temp[i];
  }

  return new Number(buffer);
}

// In: an arithmetic expresion.
// Out: an arithmetic expresion rounded to the smallest ineteger above.
function roundExpresion(data) {
  if (data == '') return '';
  var no = new Number(data);
  if(isNaN(no)) return data;
  else return Math.round(no);
}

/**
*  Funcion para insertar contenido en un objeto especificado de forma dinamica.
*  Esta funcion es equivalente a la funcion depreciada "innerHTML".
*  No compatible con Microsoft Internet Explorer (Usar innerHTML).
*  In: 
*    el - el objeto al que se le agragara el contenido dinamico.
*    content - el html a agregar.
*  Out: vacio (void)
**/
function doInnerHTML(el, content)
{
  var rng = document.createRange();
  
  rng.setStartBefore(el);
  
  var htmlFrag = rng.createContextualFragment(content);
  
  while(el.hasChildNodes())
    el.removeChild(el.lastChild);
    
  el.appendChild(htmlFrag);
}

function valFecha(pFecha)
{
  try { if(this.keyCode == 192) return true; } catch(e) {}
	regAlphaNumeric = /^[/0-9]*$/; //Formato de fecha con numeros y /
	return regAlphaNumeric.exec(pFecha);  
}
function valMoney(pMoney)
{
  
  try { if(this.keyCode == 190||this.keyCode == 110||this.keyCode == 188) return true; } catch(e) {}// un punto
	regAlphaNumeric = /^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\x2E\d{1,2}){0,1}$/; //Formato numeros con punto decimal
	return regAlphaNumeric.exec(pMoney);  
}

function valMoneyComas(pMoney)
{
  
  try { if(this.keyCode == 190||this.keyCode == 110||this.keyCode == 188||this.keyCode == 44) return true; } catch(e) {}// un punto
	regAlphaNumeric = /^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\x2E\d{1,2}){0,1}$/; //Formato numeros con punto decimal
	return regAlphaNumeric.exec(pMoney);  
}
function valSoloNumeros(pNumero)
{
  //try { if(this.keyCode == 192) return true; } catch(e) {}
	var regAlphaNumeric = /^[0-9]*$/; //Formato de solo numeros
	return regAlphaNumeric.exec(pNumero);
}

function loadDynamicJS(jsFile)
{
  var script   = document.createElement('script');
  script.defer = true;
  //fileref.src   = currentFileSystemDir + "/" + jsFile;
  script.src   = jsFile;
  //document.getElementsByTagName("head")[0].insertAdjacentElement("afterBegin",fileref); // no funciona con mozilla
  document.getElementsByTagName('head')[0].appendChild(script); 
}

function getObject(clase, funcion, elemento) {
  //var url = "getObject.do?class=" + clase;
  //makeAjaxRequest(url, "HTML", funcion, elemento);
  $.post('getObject.do', { objectClass: clase }, function(data) {
    funcion(elemento, data);
  });  
}

function showWaitLayer()
{
  try {
  
    isWaiting = true;
    
    var objDvPadre = GI("dvMensajes");
    
    var strFrameHTML ='<iframe id="waitFrame" style="position:absolute;z-index:2;filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);width:0;height:0;" src="javascript:false;" frameborder="0" scrolling="no"  allowTransparency ></iframe>';
    
    var objDiv = createElement("div", objDvPadre);
    objDiv.id = "dvWaitMsg";
    
    //objDvPadre.style.border = "0.2cm groove pink";
    objDvPadre.style.height = "" + (screen.height + 80) + "px";
    objDvPadre.style.width = "" + (screen.width - 30) + "px";
    
    //objDvPadre.style.height = "" + GI("tablaPrincipal").height + "px";
    //objDvPadre.style.width = "" + GI("tablaPrincipal").width + "px";  
    
    objDiv.style.height = "" + (screen.height + 80) + "px";
    objDiv.style.width = "" + (screen.width - 30) + "px";
    
    objDiv.top = 0;
    objDiv.left = 0;
  
    objImg.style.top = (screen.height / 2) - 130;
    objImg.style.left = (screen.width / 2) - 95;
    
    objImg.style.display = "block";  
    
    objDiv.appendChild(objImg);
      
    objDiv.style.display = "block";
    
    objDvPadre.insertAdjacentHTML("beforeBegin", strFrameHTML);
    
    var objFrameHTML = GI("waitFrame");
    clonePos(objDvPadre, objFrameHTML, true, true);
    
    objDiv.style.zIndex = 1;
    objFrameHTML.style.zIndex = 2;
    objDvPadre.style.zIndex = 3;
    
    objFrameHTML.style.display = "block";
    
    //objDiv.style.backgroundColor = "yellow";
  } catch(ex) {
    //alert("Error: " + ex.message);  
  }
}

function hideWaitLayer() {
  try {
    var objDvPadre = GI("dvMensajes");
    var objDiv = GI("dvWaitMsg");
    var objFrameHTML = GI("waitFrame");
    
    objDvPadre.removeChild(objDiv);
    
    //if(is_ie && isDefinedAndNotNull(objFrameHTML)) {
    if(isDefinedAndNotNull(objFrameHTML)) {
      objFrameHTML.style.display = "none";
      //objDvPadre.removeChild(objFrameHTML);
    }
    
    objDvPadre.style.height = "0px";
    objDvPadre.style.width = "0px";
    
    isWaiting = false;
  } catch(ex) {
    //alert("Error: " + ex.message);
  }
}

function setValuesFormObject(object) {
  // TODO: Asignar valor cuando es radio.
  for(var i in object){
    try {   
      var objLabel = GI("lbl"+String(i));
      var objChk = GI(String(i)+"Chk");
      var obj = GI(String(i));
      try { if(isDefinedAndNotNull(obj)) { obj.value = object[i]; } } catch(ex) {}
      try { if(isDefinedAndNotNull(objLabel)) { objLabel.innerHTML = object[i]; } } catch(ex) {}
      try { if(isDefined(obj.selectedIndex) != "undefined" && obj.selectedIndex < 0) { obj.options[0].selected = true; } } catch(ex) {}
      try {
        if(isDefinedAndNotNull(objChk)) {
          var trueValue = GA(objChk, "tv");
          if(""+object[i] == trueValue) objChk.checked = true;
        } 
      } catch(ex) {}
    } catch(e) {}
  }  
}

function setValuesToObject(object) {
  for(var i in object){
    try {    
      var obj = GI(String(i));
      var objChk = GI(String(i)+"Chk");
      
      if(!isDefinedAndNotNull(obj) && !isDefinedAndNotNull(objChk)) continue;
      
      var objValue = null;
      
      if(isDefinedAndNotNull(obj))
        objValue = obj.value;
      else if(isDefinedAndNotNull(objChk)) {
        objValue = objChk.checked ? GA(objChk, "tv") : GA(objChk, "fv");
      }
      
      if(typeof objValue == "undefined" || objValue == "" || objValue == "-1") objValue = null;
       
      switch(typeof object[i]) {
        case 'number':
          object[i] = +objValue;
          break;
        case 'string':
          object[i] = objValue;
          break;      
        case 'boolean':
          object[i] = objValue;
          break;      
        default:
          object[i] = "null";
      }
    } catch(e) {}
  }  
}

function loadCombo(combo, arreglo, llave, valor) {
  var defaultValue = GA(combo, "defaultValue");
  if(!isDefinedAndNotNull(defaultValue)) defaultValue = "-1";
  //alert(combo+"-----"+arreglo+"-----"+llave+"-----"+valor);
  combo.options.length = arreglo.length+1;
  combo.options[0].value = defaultValue;
  combo.options[0].text = "-- Seleccione --";
  try {
    for(var i = 0; i < arreglo.length; i++) {
      var itemArreglo = arreglo[i];
      combo.options[i+1].value = eval("itemArreglo." + llave);
      combo.options[i+1].text = eval("itemArreglo." + valor);
      
      if(isDefinedAndNotNull(GA(combo, "extraValue"))) {
            
       SA(combo.options[i+1],"extraValue",eval("itemArreglo." + GA(combo, "extraValue")));       
     }
      
    }
  } catch(ex) { 
    alert("loadCombo(): " + ex.message); 
  }
}

function getParameters(obj) {
  var objParametros = JSON.parse("{}");
  if(typeof(obj) != "undefined" && typeof(obj.elements) != "undefined") {
    for(var i = 0; i < obj.elements.length; i++) {
      var elemento = obj.elements[i];
      if(elemento.id.indexOf("param") != -1 && elemento.value != "" && elemento.value != "-1") {
        if(elemento.type=="checkbox" && elemento.checked == false) continue;
        if(GA(elemento, "tipo") == "undefined" && typeof elemento.value == "string")
          eval("objParametros." + elemento.id.substring(5) + "='" + elemento.value + "'");
        else if(GA(elemento, "tipo") != "undefined" && GA(elemento, "tipo") == "Numero")
          eval("objParametros." + elemento.id.substring(5) + "=" + elemento.value);
        else
          eval("objParametros." + elemento.id.substring(5) + "='" + elemento.value + "'");
      }
    }
  }
  return objParametros; 
}

function loadTable(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio) {

  var tbody = table.lastChild;
  var tipoRenglon = 1;
  
  while(tbody.hasChildNodes())
    tbody.removeChild(tbody.lastChild);
  
  if(dataArray.length <= 0) {
    var mensajeNoRecords = GA(table, "NoRecordsMsg");
    var funNoRecords = GA(table, "NoRecordsFun");
    
    if(isDefinedAndNotNull(funNoRecords))
      try { eval(funNoRecords + "();"); } catch(ex) {}

    if(isDefinedAndNotNull(mensajeNoRecords))
      alert(mensajeNoRecords);
  }
  
  for(var i = 0; i < dataArray.length; i++) {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    var valorItem = "";
    
    if(createRadio ) {
      var tdRadioWidth = GA(table, "radioWidth");
      var colRadio = createElement("td", fila);
      var radio = createElement("<input type='radio' name='" + table.id + "Rdo" + "'/>", colRadio);
      radio.className = "radio";
      if(isDefinedAndNotNull(tdRadioWidth)) colRadio.width = tdRadioWidth;
    }
    
    for(var j = 0; j < fieldsArray.length; j++) {
      var fieldInfo = fieldsArray[j].split(",");
      var fieldWidth = "";
      //if(fieldInfo.length == 2)
        fieldWidth = ""+fieldInfo[1];
      
      for(k in item) {
        if(fieldInfo[0] == String(k)) {
          var col = createElement("td", fila);
          
          if(fieldInfo.length == 3)
            SA(col,"align",fieldInfo[2]);
          
          col.innerHTML = ""+item[k];
          if(col.innerHTML == "null") col.innerHTML="";    
          if(fieldWidth != "") col.width = fieldWidth;        
        }
      }
    }
    
    for(k in item) {
      var kName = String(k);
      if(keyValue.indexOf(kName) != -1) {
        if(typeof(item[k]) == "number")
          valorItem += "\"" + kName + "\":" + item[k] + ",";
        else
          valorItem += "\"" + kName + "\":\"" + item[k] + "\",";
      }
    }
    
    valorItem = valorItem.substring(0, valorItem.length - 1);
    SA(fila, "valorItem", valorItem);
    fila.className = "renglon" + tipoRenglon;
    fila.onmouseover = function() { cambiaColorFila(this); }
    fila.onmouseout = function() { cambiaColorFila(this); }
    fila.onclick = function() { 
      try { this.firstChild.firstChild.checked = true; } catch(ex) {}
      var fun = eval(nombreFuncion);
      if(isDefinedAndNotNull(fun))
        fun(JSON.parse("{"+GA(this, "valorItem")+"}"));
    }
    
    fila.ondblclick = function() {
      this.click();
      var funDblClick = GA(table, "DblClickFun");
      if(isDefinedAndNotNull(funDblClick))
        try { eval(funDblClick+"();"); } catch(ex) {}
      else {
        var inputs = document.getElementsByTagName("input");
        for(var j = 0; j < inputs.length; j++) {
          if(inputs[j].type.toUpperCase() != "BUTTON") continue;
          if(trim(inputs[j].value.toUpperCase()) == "CONSULTAR") {
            inputs[j].click();
            break;
          }
        }
      }
    }
    
    SA(fila, "colorOriginal", fila.className);
    
    if(tipoRenglon == 1)
      tipoRenglon = 2;
    else
      tipoRenglon = 1;    
  }
}

function cambiaColorFila(fila) {
  var colorOriginal = GA(fila, "colorOriginal");
  if(fila.className != colorOriginal) {
    fila.className = colorOriginal;
  } else {
    fila.className = "renglonSeleccionado";
  }
}

function RF(form) {
  form.reset();
}

function cambiaTab(tdTab, funcion) {
  if(tdTab.className != "tab_relleno_azul") {
    var objTr = tdTab.parentElement;
    var indx = tdTab.cellIndex;

    for(var i = 0; i < objTr.childNodes.length; i++) {
      if(objTr.childNodes[i].className == "tab_relleno_azul") {

        objTr.childNodes[i-1].className = "tab_claro_claro_izq";
        objTr.childNodes[i].className = "tab_relleno_claro";
        objTr.childNodes[i+1].className = "tab_claro_claro_der";
      
        if(i == 1) {
          objTr.childNodes[0].className = "tab_blanco_claro";
        } else if(i == objTr.childNodes.length - 2) {
          objTr.childNodes[objTr.childNodes.length - 1].className = "tab_claro_blanco";
        }
        break;
      }
    }

    objTr.childNodes[indx-1].className = "tab_claro_azul";
    tdTab.className = "tab_relleno_azul";
    objTr.childNodes[indx+1].className = "tab_azul_claro";
        
    if(indx == 1) {
      objTr.childNodes[0].className = "tab_blanco_azul";
    } else if(indx == objTr.childNodes.length - 2) {
      objTr.childNodes[objTr.childNodes.length - 1].className = "tab_azul_blanco";
    }
    
    try { 
      eval(funcion); 
    } catch(ex) { 
      //alert("Error: " + ex.message); 
    }
  }
}

// TODO: Quitar la funcion loadDynamicJS
function LDJS(js) {
  var s = document.createElement('script');
  s.defer = true;
  s.src = js;
  document.getElementsByTagName('head')[0].appendChild(s);
}

var funLDSCR = null;

function SETSCR(obj, result) {
  obj.innerHTML = result;
  //doInnerHTML(obj, result);
  try { funLDSCR(); } catch(ex) {}
}

function LDSCR(url, obj, fun) {
  funLDSCR = fun;
  makeAjaxRequest(url, "HTML", SETSCR, obj);
}

function cloneObject(objSrc, objDest) {
  if(useFiduciaDebug) { console.log('cloneObject::(objSrc = "' + objSrc + '") (objDest = "' + objDest + '")'); }
  if(!isDefinedAndNotNull(objSrc) || !isDefinedAndNotNull(objDest)) return;
  for(x in objSrc) {
    if(useFiduciaDebug) { console.log('cloneObject::(objSrc[x] = "' + objSrc[x] + '") (objDest[x] = "' + objDest[x] + '")'); }
    if(x in objDest) objDest[x] = objSrc[x];
  }
}

function displayFrame(containerId, frameId, frameSrc, height, width, parentHeight, parentWidth, top, left) {
  try {
    var objDvPadre = GI(containerId);
    var strFrameHTML = "<iframe id=\"" + frameId + "\" style=\"position:absolute;z-index:1;\" src=\"" + frameSrc + "\" frameborder=\"0\" scrolling=\"no\"></iframe>";
 
    objDvPadre.style.top = (screen.height / 2) - (height / 2) + top;
    objDvPadre.style.left = (screen.width / 2) - (width / 2) + left;
   
    objDvPadre.style.height = parentHeight+"px";
    objDvPadre.style.width = parentWidth+"px";
    
    objDvPadre.insertAdjacentHTML("beforeBegin", strFrameHTML);
     
    var objFrameHTML = GI(frameId);
    clonePos(objDvPadre, objFrameHTML, true, true);
    
    objFrameHTML.style.zIndex = 1;
    objDvPadre.style.zIndex = 2;
    
    objFrameHTML.style.display = "block";
  } catch(ex) {
    alert("Error: " + ex.message);  
  }
}

function removeFrame(frameId) {
  var objFrameHTML = GI(frameId);
  
  if(isDefinedAndNotNull(objFrameHTML)) {
    var parentFrame = objFrameHTML.parent;
    if(isDefinedAndNotNull(parentFrame)) parentFrame.removeChild(objFrameHTML);
    //objFrameHTML.style.display = "none";
  }
}

//CONVERTIR A MAYUSCULAS

function convertirMayusculas( objeto ) {
   var strMayusculas = objeto.value;
   objeto.value = strMayusculas.toUpperCase();
   }
   
//-------------------------------------------------------Cosas para usar pestañas



function loadTableElementPestanias(objTabla, result) {
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadPestanias(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), GA(objTabla, "fun"), false);
  hideWaitLayer();
}




function loadPestanias(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio) {

  var tbody = table.lastChild;
  var tipoRenglon = 1;
  
  while(tbody.hasChildNodes())
    tbody.removeChild(tbody.lastChild);
  
  if(dataArray.length <= 0) {
    var mensajeNoRecords = GA(table, "NoRecordsMsg");
    var funNoRecords = GA(table, "NoRecordsFun");
    
    if(isDefinedAndNotNull(funNoRecords))
      try { eval(funNoRecords + "();"); } catch(ex) {}

    if(isDefinedAndNotNull(mensajeNoRecords))
      alert(mensajeNoRecords);
  }
  
  for(var i = 0; i < dataArray.length; i++) {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    
    var valorItem = "";
        
    for(var j = 0; j < fieldsArray.length; j++) {
      var fieldInfo = fieldsArray[j].split(",");
      var fieldWidth = "";
      //if(fieldInfo.length == 2)
        fieldWidth = ""+fieldInfo[1];
        
      
      for(k in item) {
      
        if(fieldInfo[0] == String(k)) {
          
          var col = createElement("td", fila);          
          SA(col,"align","center");
          col.innerHTML = ""+item[k];
          if(col.innerHTML == "null") col.innerHTML="";    
          if(fieldWidth != "") col.width = fieldWidth;        
        }
      }
    }
    
    for(k in item) {
      var kName = String(k);
      if(keyValue.indexOf(kName) != -1) {
        if(typeof(item[k]) == "number")
          valorItem += "\"" + kName + "\":" + item[k] + ",";
        else
          valorItem += "\"" + kName + "\":\"" + item[k] + "\",";
      }
    }
    
    valorItem = valorItem.substring(0, valorItem.length - 1);
    SA(fila, "valorItem", valorItem);
    
   
    if(item.concCompleto=="Si" || item.concCompleto=="1"){
     fila.className = "pestaniaKYC";
     }else{
      fila.className = "pestaniaKYCIncompleto";
     }
    
    fila.id="Concepto"+(i+1)
    fila.onmouseover = function() { cambiaClassFila(this); }
    fila.onmouseout = function() { cambiaClassFila(this); }
    fila.onclick = function() { 
      try { this.firstChild.firstChild.checked = true; } catch(ex) {}
      var cont=1;
      this.siSeleccionada="SI";
      
      while(isDefinedAndNotNull(GI("Concepto"+cont))){
        if("Concepto"+cont!=this.id){                        
            var claseOriginal = GA(GI("Concepto"+cont), "claseOriginal")
            GI("Concepto"+cont).className = claseOriginal;
            GI("Concepto"+cont).siSeleccionada="NO";
          }
          cont++;
      }
      var fun = eval(nombreFuncion);
      if(isDefinedAndNotNull(fun))
        fun(JSON.parse("{"+GA(this, "valorItem")+"}"));
		
    }   
  
    SA(fila, "claseOriginal", fila.className);
    
    SA(fila, "siSeleccionada","NO");
    
  }
}

function cambiaClassFila(fila) {
  var claseOriginal = GA(fila, "claseOriginal");
  if(fila.className != claseOriginal) {
    if(fila.siSeleccionada=="NO"){
      fila.className = claseOriginal;
    }
  } else {
    fila.className = fila.className+"Sobre";
  }
}


//funciones pantalla pestañas-----------------------

var cadena = '';

function pestania(url,titulo)
{
  this.url = url;
  this.titulo =  titulo;
  this.activo = true;
  
  return this;
}

function iniciaPantalla(objPes,result)
{
  if(result!=null)
  {
    var res = JSON.parse(result)[0].cuenta;
    objPes.arPestanias[objPes.indice].activo = res;
    objPes.indice++;
        
    if(objPes.indice == objPes.arPestanias.length)
    {
        escribePantalla(objPes.arPestanias);
        return;
    }
  }
  else
  {
    showWaitLayer();
  }
  
  var url = ctxRoot+"/getRef.do?json={\"id\":\"consultaPerfilPes\",\"numUsuario\":"+GI("usuario").value+",\"nomFuncion\":\""+objPes.arPestanias[objPes.indice].url+"\"}";
  makeAjaxRequest(url,"HTML",iniciaPantalla,objPes);
 
} 


function escribePantalla(arPestanias)
{

  cadena += '<table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" >';
  cadena += '      <tr align="center">';
  cadena += '               <td valign=top>';
  cadena += '                  <table border =0 cellpadding=0 cellspacing=0 width="168" align="right">';
  
  for(i=0;i<arPestanias.length;i++)
  {
    cadena += '                    <tr id="pes_'+i+'" class="pestaniaKYC'+(arPestanias[i].activo?'':'Incompleto')+'" claseOriginal="pestaniaKYC'+(arPestanias[i].activo?'':'Incompleto')+'" siSeleccionada="NO" pantalla="/modules/'+arPestanias[i].url+'" titulo="'+arPestanias[i].titulo+'" '+(arPestanias[i].activo?' onmouseover="cambiaClassFila(this)" onmouseout="cambiaClassFila(this)" onclick=clickPestania(this,"'+otrasPes(arPestanias,i,'pes')+'") ':'')+'>';
    cadena += '                      <td align=center style="font-size: 12px; font-family: Calibri,Arial, Helvetica, sans-serif;color: #FFFFFF;cursor:'+(arPestanias[i].activo?'pointer':'default')+';">'+arPestanias[i].titulo+'</td>';
    cadena += '                    </tr>';
  }
  cadena += '                  </table>';
  cadena += '              </td>';
  cadena += '              <td class="divPantalla">';
  cadena += '                <div id="dvPantalla" style="height:600;width:932;">';
  cadena += '                </div>';
  cadena += '                <div id="titulo" style="position:absolute;bottom:10;right:10;font-size:30;color:#888888;"></div>';
  cadena += '            </tr>';
  cadena += '    </table>';
  
  GI("contenedor").innerHTML = cadena;
  cadena = '';
  hideWaitLayer();
} 

function clickPestania(pes,otrasP)//funcion click en pestaña
{
  if(GI(pes.id).siSeleccionada == "NO")
  {
      iniciaPestanias(otrasP);
      GI(pes.id).siSeleccionada = "SI";
  
      GI("titulo").innerHTML = pes.titulo;
      var url = ctxRoot+ pes.pantalla+'.do';
      showWaitLayer();
      makeAjaxRequest(url,"HTML",cargaPantallaPes,pes);
  }
  
}

function cargaPantallaPes(pes,result)//se carga la pantalla
{
   GI("dvPantalla").innerHTML = result;
   hideWaitLayer();
   loadDynamicJS(ctxRoot+pes.pantalla+".js");  
}

function otrasPes(arPestanias,ind,prefijo)// se definen las demas pestanias
{
  var cadena = "";
  for(s=0;s<arPestanias.length;s++)
  {
    if(ind!=s)
    cadena += prefijo+'_'+s+',';
  }
  return cadena;
}

function iniciaPestanias(otrasP)// se inicializa el estilo de las pestanias
{
  inicialesP = otrasP.split(",");
  
  for(i=0;i<inicialesP.length-1;i++)
  {
    GI(inicialesP[i]).siSeleccionada = "NO";
    GI(inicialesP[i]).className = GA(GI(inicialesP[i]), "claseOriginal");
  }
}

function onButtonClickPestania(itemId) {
  var baseURL = ctxRoot + "/modules/";
  var url = baseURL + itemId.replace(".", "/");  
  while(url.indexOf(".") != -1)
    url = url.replace(".", "/");
  LDSCR(url + ".do", GI("dvPantalla"), function() { LDJS(url + ".js"); } );
  hideWaitLayer();
}

//funciones pantalla pestañas-----------------------

//funciones pantalla superpestañas-----------------------

function superPestania(arPestanias,titulo)
{
  this.arPestanias = arPestanias;
  this.titulo =  titulo;
  
  return this;
}

function escribeSuperPantalla(arSuperPestanias)
{
  cadena += '                  <table border =0 cellpadding=0 cellspacing=0 align="left">';
  cadena += '                    <tr>'; 
  for(i=0;i<arSuperPestanias.length;i++)
    {
      cadena += '                   <td>';
      cadena += '                       <div style="position:relative;">';
      cadena += '                           <div align=center id="superPes_'+i+'" class="subtituloPestania'+(i==0?'Sobre':'')+'" claseOriginal="subtituloPestania" indice='+i+' siSeleccionada="'+(i==0?'SI':'NO')+'" onmouseover="cambiaClassFila(this)"  onmouseout="cambiaClassFila(this)" titulo="'+arSuperPestanias[i].titulo+'" onclick=clickSuperPestania(this,"'+otrasPes(arSuperPestanias,i,'superPes')+'")>'+arSuperPestanias[i].titulo;
      cadena += '                           <div class="sombraPestania">'+arSuperPestanias[i].titulo+'</DIV>&nbsp;&nbsp;&nbsp;';
      cadena += '                       </div>';
      cadena += '                   </td>';
      
    }
    
  cadena += '                    </tr>';
  cadena += '                  </table>';
  
  clickSuperPestania(null,null);
  GI('secciones').innerHTML = cadena;
  cadena = '';
}

function clickSuperPestania(superPes,otrasP)//funcion click en pestaña
{
  if (superPes==null&&otrasP==null)
  {
      iniciaSuperPantalla(0,superPestanias);
  }
  else if(GI(superPes.id).siSeleccionada == "NO")
  {
      iniciaPestanias(otrasP);
      GI(superPes.id).siSeleccionada = "SI";
      
      iniciaSuperPantalla(GI(superPes.id).indice,superPestanias);
  }
}

function iniciaSuperPantalla(id,arSuperPestanias)
{
  var objPes = new Object();
  objPes.arPestanias=arSuperPestanias[id].arPestanias;
  objPes.indice = 0;

  iniciaPantalla(objPes,null); 
}

function replaceAll(cadena,reemplaza,reemplazo)
{
  var rCadena = cadena;
  while(rCadena.indexOf(reemplaza)!=-1)
  {
    rCadena = rCadena.replace(reemplaza,reemplazo);
  }
  
  return rCadena;
}

//funciones pantalla superpestañas-----------------------


// ---- Persistencia de Parametros ----- 

var catalogsCriteria=new Object();

function getCatalogCriteria(frmId){
  var criterios=catalogsCriteria[frmId];
  
  if(isDefinedAndNotNull(criterios)){
    setParameters(criterios);
  }  
  
}

function setCatalogCriteria(frmId,parameters){

  if(GA(GI(frmId),"remember")!="no"){
    catalogsCriteria[frmId]=parameters;
  }
}



function formato_numero(numero, decimales, separador_decimal, separador_miles){ // v2007-08-06
     numero=parseFloat(numero);
     if(isNaN(numero)){
         return "";
     }
 
    if(decimales!==undefined){
         // Redondeamos
         numero=numero.toFixed(decimales);
     }
 
    // Convertimos el punto en separador_decimal
     numero=numero.toString().replace(".", separador_decimal!==undefined ? separador_decimal : ",");
 
    if(separador_miles){
         // Añadimos los separadores de miles
         var miles=new RegExp("(-?[0-9]+)([0-9]{3})");
         while(miles.test(numero)) {
             numero=numero.replace(miles, "$1" + separador_miles + "$2");
         }
     }
 
    return numero;
 }
