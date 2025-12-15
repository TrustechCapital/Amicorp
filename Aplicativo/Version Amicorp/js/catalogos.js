Catalogo = function(claseCatalogo) {
  this.init(claseCatalogo);
  this.loadCatalogBean();
}

Catalogo.prototype = {
  init: function(theCatalog) {
    this.claseCatalogo = theCatalog;
    this.catalogoObj = null;
    this.objetoCatalogo = null;  
  }
}  

Catalogo.prototype.loadCatalogBean = function() {
  getObject("mx.gob.nafin.fiduciario.common.beans.CatalogInfoBean", creaCatalogo, this);
}

Catalogo.prototype.loadClaseCatalogo = function() {
  getObject(this.claseCatalogo, asignaClaseCatalogo, this);
}

Catalogo.prototype.modificaCatalogo = function(getValuesFromHTML) {
  var bGetValuesFromHTML = isDefinedAndNotNull(getValuesFromHTML) ? getValuesFromHTML : true;
  if(bGetValuesFromHTML) setValuesToObject(this.objetoCatalogo);
  this.catalogoObj.catalogo = JSON.stringify(this.objetoCatalogo);
  var objectInstance = this;
  var searchURL = ctxRoot + "/modificaCatalogo.do";
  $.post(searchURL, { json: JSON.stringify(this.catalogoObj) }, function(data) {
    avisoOperacionCatalogo(objectInstance, data);
  });    
}

Catalogo.prototype.altaCatalogo = function(getValuesFromHTML) {
  var bGetValuesFromHTML = isDefinedAndNotNull(getValuesFromHTML) ? getValuesFromHTML : true;
  if(bGetValuesFromHTML) setValuesToObject(this.objetoCatalogo);
  this.catalogoObj.catalogo = JSON.stringify(this.objetoCatalogo);
  var objectInstance = this;
  var searchURL = ctxRoot + "/altaCatalogo.do";
  $.post(searchURL, { json: JSON.stringify(this.catalogoObj) }, function(data) {
    avisoOperacionCatalogo(objectInstance, data);
  });    
}

Catalogo.prototype.bajaCatalogo = function(getValuesFromHTML) {
  var bGetValuesFromHTML = isDefinedAndNotNull(getValuesFromHTML) ? getValuesFromHTML : true;
  if(bGetValuesFromHTML) setValuesToObject(this.objetoCatalogo);
  this.catalogoObj.catalogo = JSON.stringify(this.objetoCatalogo);
  var objectInstance = this;
  var searchURL = ctxRoot + "/bajaCatalogo.do";
  $.post(searchURL, { json: JSON.stringify(this.catalogoObj) }, function(data) {
    avisoOperacionCatalogo(objectInstance, data);
  });    
}

Catalogo.prototype.buscaCatalogoPK = function(getValuesFromHTML) {
  var bGetValuesFromHTML = isDefinedAndNotNull(getValuesFromHTML) ? getValuesFromHTML : true;
  if(bGetValuesFromHTML) setValuesToObject(this.objetoCatalogo);
  this.catalogoObj.catalogo = JSON.stringify(this.objetoCatalogo);
  var objectInstance = this;
  var searchURL = ctxRoot + "/obtenerCatalogo.do";
  if(useFiduciaDebug) console.log("Catalog Data: " + JSON.stringify(this.catalogoObj));
  $.post(searchURL, { json: JSON.stringify(this.catalogoObj) }, function(data) {
    cargaCatalogo(objectInstance, data);
  });    
}

Catalogo.prototype.getClaseCatalogo = function() {
  return this.claseCatalogo;
}

Catalogo.prototype.getCatalogo = function() {
  return this.objetoCatalogo;
}

Catalogo.prototype.setCatalogo = function(objetoCatalogo) {
  this.objetoCatalogo = objetoCatalogo;
}

Catalogo.prototype.getCatalogoContainer = function() {
  return this.catalogoObj;
}

Catalogo.prototype.setOnUpdate = function(updateFunction) {
  this.updateFunction = updateFunction;
}

Catalogo.prototype.getOnUpdate = function() {
  return this.updateFunction;
}

function creaCatalogo (obj, jsonCatalog) {
  obj.catalogoObj = JSON.parse(jsonCatalog);
  obj.catalogoObj.claseCatalogo = obj.claseCatalogo;
  if(typeof obj.claseCatalogo == "undefined" || obj.claseCatalogo == null) obj.claseCatalogo = "mx.gob.nafin.fiduciario.common.beans.CatalogInfoBean";
  obj.loadClaseCatalogo();
}

function asignaClaseCatalogo(obj, jsonObjetoCatalogo) {
  obj.objetoCatalogo = JSON.parse(jsonObjetoCatalogo);
}

function cargaCatalogo(obj, jsonCatalogo) {
  if(jsonCatalogo == "null") obj.loadClaseCatalogo(obj.claseCatalogo);
  // TODO: Validar que no este enviando un objeto de error, en este caso se debe de mostrar el mensaje de error
  obj.objetoCatalogo = JSON.parse(jsonCatalogo);
  
  if(obj.objetoCatalogo != null) {
    setValuesFormObject(obj.objetoCatalogo);
  }
  
  try { obj.updateFunction(); } catch(ex) { try { console.log("Error: " + ex.message); } catch(e) {} }
}

function avisoOperacionCatalogo(obj, result) {
  if(!isDefinedAndNotNull(obj.updateFunction))
    alert("Operacion realizada exitosamente!");
  else
    obj.updateFunction(result);    
}