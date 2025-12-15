/*
 * HTML Form Validator
 *
 * This script allows the user to validate forms with several cool functions.
 * 
 * @Author:  Inscitech México inscitech@inscitechmexico.com
 * @Date:    March 19, 2006
 * @Version: 1.0
 *
 */

/*
 *	=======================  Form Validator Ussage ===========================
 *
 *	Declare a new FormValidator for each form you want to validate like:
 *
 *		1)	var fv = new FormValidator();
 *		2)	var fv = new FormValidator("fromName");
 *
 *	If you did not specified a formName in the constructor specify it using the setFormName method:
 *
 *		fv.setFormName("frmValida");
 *
 *	If you want to use a custom configuration instead of the default you can use the setup method. (See description bellow)
 *
 *	Then just use fv.checkForm(); to validate the form.
 */

/*
 *	Setup function usage
 *
 *  This function allows the user to setup the validator preferences.
 *
 *  The "params" is a single object that can have the following properties:
 *
 *    prop. name   						| description
 *  -------------------------------------------------------------------------------------------------
 *   formName      						| the name of the form to be validated
 *   showErrors    						| flag that....
 *   tipoAlert     						| 
 *   tipoMessg     						| 
 *   abortOnError  						| 
 *   strBufferCamposInvalidos	|
 *	 strBufferErrores					|
 *   ValidationResult  				| 
 *   colorInvalidFields   		| 
 *   fieldColor					      | 
 *	 selInvalidValue					|
 *   defaultMessage		        | 
 *   defaultSingleMsg         | 
 *   invalidFormatMsg				  | 
 *   labelColor								|
 *   colorLabel								|
 *   alertFunction						|
 *	 sendObjToAlert						|
 *	 forceAlert   						|
 *
 *  None of them is required, they all have default values.  However, if you
 *  pass none of "formName", you'll get a script error.
 *
 */

/*
 * Check Validation usage
 *
 *
 */

FV_MESSAGE_PER_FIELD = 1;		// Cuando se encuentre un campo invalido se toma una accion y se termina la validacion
FV_MESSAGE_PER_FORM = 2;		// Cuando se encuentre un campo invalido se agrega al buffer de campos invalidos y al final se toma la accion;
FV_MESSAGE_TYPE_ALERT = 3;	// Despliega un mensaje indicando los campos invalidos y los cambia de color
FV_MESSAGE_TYPE_COLOR = 4;	// Cambia de color los campos invalidos sin desplegar mensajes
FV_MESSAGE_TYPE_COLOR_SINGLE_ALERT = 5;	// Cambia de color los campos invalidos sin desplegar mensajes
FV_MESSAGE_TYPE_DISPLAY_OBJ = 6;	// Muestra el mensaje de campos invalidos en el innerHTML del objeto especificado
FV_MESSAGE_TYPE_DISPLAY_OBJ_SINGLE = 7;	// Muestra el mensaje de campos invalidos en el innerHTML del objeto especificado
FV_MESSAGE_TYPE_EXECUTE_FUNCTION = 8;	// Ejecuta una funcion cuando se encuentra un campo invalido.
FV_REQUIRED_FIELD_ALERT_COLOR = "#FFFF99";		// El color que se usara para identificar los campos invalidos
FV_SELECT_INVALID_VALUE = "-1";		// El valor con el que se identifica los elementos de un objeto select como no validos

FormValidator = function(vFormName) { this.setup(); this.vFormName = vFormName; };
FormValidator.prototype = {
  
  clearForm: function() {
    GI(this.vFormName).reset();
  },
  
  checkForm: function() {
		
    this.ValidationResult = true;
		var objForm, i;
		
		for(i = 0; i < document.forms.length; i++)
			if(document.forms[i].name == this.vFormName) objForm = document.forms[i];
    
		for(i = 0; i < objForm.elements.length; i++)
		{
			var el = objForm.elements[i];
      var oldValue = el.value;
      
      try { RemoveOWAlert(el); } catch(ex) {} // Para quitar los mensajes de la libreria overlibmws;
      
      if(haveConversions(el))
      {
        // conversions="toUpper"
        try {
          var arConv = GA(el, "conversions").split(",");
          
          for(var z = 0; z < arConv.length; z++)
          {            
            var conV = arConv[z] + "('" + el.value + "')";
            try { el.value = eval(conV); oldValue = el.value; } catch(e) { el.value = oldValue; }
          }
          
        } catch(Ex) { el.value = oldValue; }
      }
      
			var elValue = el.value;
							
			var isRequiredOpt = false;		
			
      if(haveOldColorLabel(el)) 
      {
        var targetLabel = GI(GA(el, "label"));
        targetLabel.style.color = GA(el, "origLabelColor");      
      }

      if(haveOldColorItem(el)) 
      {
        el.style.backgroundColor = GA(el, "origItemColor");      
      }
      
			try
			{
        
        if(haveReqLength(el)) 
        {
          var reqLengthVal = GA(el, "reqLength");
          var reqLength = 0;
          
          try
          {
            if(reqLengthVal.toUpperCase() == "FULL")
              reqLength = el.maxLength;
            else
              reqLength = parseInt(reqLengthVal);
          }
          catch(e)
          {
          }
                    
          if(reqLength > 0 && reqLength > elValue.length) 
          {
            var mustHaveReqLength = true;
            
            if(haveCondition(el))
            {
              mustHaveReqLength = eval(GA(el, "condition"));
            }		
          
            if(mustHaveReqLength)
            {
              this.ValidationResult = false;
              this.alertAndFocus(el, this.invalidFormatMsg);
            }
          }
        }
        
				if(haveCondition(el))
				{
					isRequiredOpt = eval(GA(el, "condition"));
				}		
			
				if(isRequired(el) || isRequiredOpt)
				{
					var elType = el.type;
		
					var strMessg = GA(el, "message");
					
					if(isNull(strMessg) || isUndefined(strMessg)) strMessg = this.defaultMessage;
					
          var useEvalMsg = true;
          try { eval(strMessg); } catch(e) { useEvalMsg = false; }
          
          strMessg = useEvalMsg ? eval(strMessg) : strMessg;
          
					if(el.type == "text" || el.type == "hidden" || el.type == "textarea")
					{
						var valResult = this.validaVacio(el, elValue, strMessg);
						var doNextStep = true;
						            
						if(!valResult && this.tipoAlert == FV_MESSAGE_PER_FIELD) 
							return false;
						else if(!valResult)
              doNextStep = false;
            
						var tipoEl = GA(el, "tipo");

						if(doNextStep && isDefinedAndNotNull(tipoEl))		// Si se especifico el tipo de dato
						{
							if(!doValidation(this, el, tipoEl, elValue))
							{
								el.focus();
                if(this.tipoMessg == FV_MESSAGE_TYPE_COLOR_SINGLE_ALERT) 
                  this.sendAlert(el, this.defaultSingleMsg);
                else 
                  this.alertAndFocus(el, this.invalidFormatMsg);
								return false;
							}
						}
            
						if(doNextStep && isDefinedAndNotNull(GA(el, "regex")))
						{
							var vRegEx = eval(GA(el, "regex"));
						
							if(!vRegEx.test(elValue))
							{
								this.alertAndFocus(el, this.invalidFormatMsg);
								return false;
							}
						}
					}
					else if(el.type == "select-one" || el.type == "select-multiple")
					{
						if(!this.validaVacio(el, elValue, strMessg) && this.tipoAlert == FV_MESSAGE_PER_FIELD) return false;
					}
					else if(el.type == "radio")
					{
						var theOthers = document.getElementsByName(el.name);
						var oneChecked = false;
						
						for(var j = 0; j < theOthers.length; j++)
							if(theOthers[j].checked) oneChecked = true;
							
						if(!oneChecked && this.tipoAlert == FV_MESSAGE_PER_FIELD)
						{
							this.alertAndFocus(el, strMessg);
							return false;							
						}
						else if(!oneChecked && this.tipoAlert == FV_MESSAGE_PER_FORM)
						{
							this.addInvalidField(el, strMessg);
							this.ValidationResult = false;
						}
					}					
					else if(el.type == "checkbox")
					{
						var chkData = el.id.split("_");
						
						// chkData[0] -> Nombre
						// chkData[1] -> Identificador
						// chkData[2] -> Total de checks
						// chkData[3] -> Cantidad minima de checks requerida
						
						if(chkData.length == 4)
						{
							var nCheked = 0;
							
							if(el.checked) nCheked++;
							
							for(var j = (parseInt(chkData[1]) + 1); j <= parseInt(chkData[2]); j++)
								if(GI(chkData[0] + "_" + j).checked) nCheked++;
							
							if(nCheked < parseInt(chkData[3]))
							{
								if(this.tipoAlert == FV_MESSAGE_PER_FIELD)
								{
									this.alertAndFocus(el, strMessg);
									return false;							
								}
								else if(this.tipoAlert == FV_MESSAGE_PER_FORM)
								{
									this.addInvalidField(el, strMessg);
									this.ValidationResult = false;
								}							
							}
						}
					}
				}
				//else if(!isRequired(el) && requiresValidation(el))
        if(requiresValidation(el))
				{
          var tipoEl = GA(el, "tipo");
					// El campo no es requerido, pero requiere que la informacion que contenga sea del formato indicado
					if(!doValidation(this, el, tipoEl, elValue)) 
					{
						el.focus();
            //if(this.tipoMessg == FV_MESSAGE_TYPE_COLOR_SINGLE_ALERT) this.sendAlert(el, this.defaultSingleMsg);
            this.alertAndFocus(el, this.invalidFormatMsg);
						return false;
					}			
				}
        
        //****************************************** modificado ***************************/
        if(requiresPrecision(el))
				{
          var tipoEl = GA(el, "tipo") + "Prec";
					// El campo no es requerido, pero requiere que la informacion que contenga sea del formato indicado
					if(!doValidation(this, el, tipoEl, elValue)) 
					{
						el.focus();
            var prec = GA(el,"prec").split("."); 
            //FV_INVALID_FORMAT_MESSAGE = "Formato no valido. Precisión: " + prec[0] + "digito(s), " + prec[1] + " decimal(es)";
            this.alertAndFocus(el, this.invalidFormatMsg + " Precisión: " + prec[0] + " enteros, " + prec[1] + " decimales");
						return false;
					}
				}
        //****************************************** modificado ***************************/
        //else if(!isRequired(el) && isDefinedAndNotNull(GA(el, "regex")))
				if(isDefinedAndNotNull(GA(el, "regex")))
				{
					// El campo no es requerido, pero requiere que la informacion que contenga sea del formato indicado por la expresion regular
					var vRegEx = eval(GA(el, "regex"));
				
					if(!vRegEx.test(elValue))
					{
						this.alertAndFocus(el, this.invalidFormatMsg);
						return false;
					}			
				}			
			}
			catch(ex)
			{
				if(this.showErrors) 
					A("Error: " + ex);
				else
					this.strBufferErrores += ex + "\n";
					
				if(this.abortOnError) return false;
			}
		}
    
    if(!this.ValidationResult && isDefinedAndNotNull(this.firstInvalidElement)) this.firstInvalidElement.focus();
    
		if(!this.ValidationResult && this.strBufferCamposInvalidos != "" && this.tipoMessg == FV_MESSAGE_TYPE_ALERT) 
			A(FV_MSG_INVALID_FORM + this.strBufferCamposInvalidos);
		else if(!this.ValidationResult && this.tipoMessg == FV_MESSAGE_TYPE_COLOR_SINGLE_ALERT)
			this.sendAlert(this.firstInvalidElement, this.defaultSingleMsg);
		return this.ValidationResult;			
			
	}
	
}

FormValidator.prototype.setup = function(params) {
	
	function getValue(pname, def) { return (typeof params == "undefined" || typeof params[pname] == "undefined") ? def : params[pname]; };
	
	this.vFormName = getValue("formName", "frmValida");
	
	// Cuando es verdadero, se muestran las excepciones generadas
	this.showErrors = getValue("showErrors", true);
	
	// Variable para indicar el tipo de validacion, puede ser: FV_MESSAGE_PER_FORM, FV_MESSAGE_PER_FIELD
	this.tipoAlert = getValue("tipoAlert", FV_MESSAGE_PER_FORM);  
	
	// Variable para indicar el tipo de alertamiento, puede ser: FV_MESSAGE_TYPE_COLOR, FV_MESSAGE_TYPE_ALERT
	this.tipoMessg = getValue("tipoMessg", FV_MESSAGE_TYPE_ALERT); 
	
	// Variable que contiene los mensajes para los campos no validos
	this.strBufferCamposInvalidos = getValue("strBufferCamposInvalidos", "");
	
	// Variable que contiene los mensajes de error que se generaron. Se usa cuando showErrors es false.
	this.strBufferErrores =  getValue("strBufferErrores", "");
	
	// Variable para indicar que aborte la validacion si ocurre un error.
	this.abortOnError = getValue("abortOnError", false);
	
	// Valiable que contriene el resultado de la validacion.
	this.ValidationResult = getValue("ValidationResult", true);
	
	// Varibale que indica si los campos invalidos se cambiaran de color.
	this.colorInvalidFields = getValue("colorInvalidFields", true);
	
	// Variable que indica el color que se usara para marcar los campos no validos.
	this.fieldColor = getValue("fieldColor", FV_REQUIRED_FIELD_ALERT_COLOR);
	
	// Variable para identificar el valod no valido de los objetos de tipo select.
	this.selInvalidValue = getValue("selInvalidValue", FV_SELECT_INVALID_VALUE);
	
	// Variable para indicar el texto del mensaje que se muestra cuando un campo o forma es requerido
	this.defaultMessage = getValue("defaultMessage", FV_DEFAULT_MESSAGE);
	
	// Variable para indicar el texto del mensaje que se muestra cuando se usa el alert de tipo FV_MESSAGE_TYPE_COLOR_SINGLE_ALERT
	this.defaultSingleMsg = getValue("defaultSingleMsg", FV_DEFAULT_SINGLE_MESSAGE);
	
	// Variable para indicar el texto del mensaje que se muestra cuando un campo o forma no es valido debido al formato
	this.invalidFormatMsg = getValue("invalidFormatMsg", FV_INVALID_FORMAT_MESSAGE);
	
	this.alertFunction = getValue("alertFunction", A);
	
	this.colorLabel = getValue("colorLabel", true);

	this.labelColor = getValue("labelColor", "red");
	
	this.sendObjToAlert = getValue("sendObjToAlert", false);
  
  this.forceAlert = getValue("forceAlert", false);
  
  this.firstInvalidElement = null;
}

FormValidator.prototype.setFormName = function(vFormName) {
	this.vFormName = vFormName;
}

FormValidator.prototype.validaVacio = function(el, strValue, strMessg)
{
	if(TR(strValue) == "" || isNull(strValue) || TR(strValue) == this.selInvalidValue)
	{
		if(this.tipoAlert == FV_MESSAGE_PER_FIELD)
		{
			if(this.tipoMessg == FV_MESSAGE_TYPE_ALERT)
			{
				this.alertAndFocus(el, strMessg);
				return false;
			}
		}
		else if(this.tipoAlert == FV_MESSAGE_PER_FORM)
		{
			this.addInvalidField(el, strMessg);
			this.ValidationResult = false;
		}
	}
	
	return true;
}

FormValidator.prototype.sendAlert = function(el, strMessg)
{
  if(this.colorLabel && haveLabel(el)) 
  {
    var targetLabel = GI(GA(el, "label"));
    var oldColor = targetLabel.style.color;
    if(oldColor == this.labelColor || oldColor == "") oldColor = "black";
    SA(el, "origLabelColor", oldColor);
    targetLabel.style.color = this.labelColor;
  }
  
  if(!isDefinedAndNotNull(this.firstInvalidElement)) this.firstInvalidElement = el;
  
	if(this.sendObjToAlert) 
		this.alertFunction(el, strMessg);
	else
		this.alertFunction(strMessg);	
    
}

FormValidator.prototype.alertAndFocus = function(el, strMessg)
{
	this.sendAlert(el, strMessg);
		
	if(this.colorInvalidFields) 
  {
    var oldColor = el.style.backgroundColor;
    el.style.backgroundColor = this.fieldColor;
    
    if(oldColor == this.fieldColor || oldColor == "") oldColor = "white";
    SA(el, "origItemColor", oldColor);
  }

	el.focus();
}

FormValidator.prototype.addInvalidField = function(el, strMessg)
{
  if(this.tipoMessg != FV_MESSAGE_TYPE_COLOR_SINGLE_ALERT)
    this.strBufferCamposInvalidos += strMessg + "\n";
	
  if(this.forceAlert) this.sendAlert(el, strMessg);
	if(this.colorInvalidFields) 
  {
    var oldColor = el.style.backgroundColor;
    el.style.backgroundColor = this.fieldColor;
    
    if(oldColor == this.fieldColor || oldColor == "") oldColor = "white";
    SA(el, "origItemColor", oldColor);
  }
}

function isRequired(el)
{
	return isDefinedAndNotNull(GA(el, "required"));
}

function requiresValidation(el)
{
	return isDefinedAndNotNull(GA(el, "reqValidValue"));
}
/******************************* modificado ************************************/
function requiresPrecision(el)
{
	return isDefinedAndNotNull(GA(el, "reqPrecValue"));
}
/******************************* modificado ************************************/
function haveCondition(el)
{
	return isDefinedAndNotNull(GA(el, "condition"));		
}

function haveLabel(el)
{
	return isDefinedAndNotNull(GA(el, "label"));		
}

function haveOldColorLabel(el)
{
	return isDefinedAndNotNull(GA(el, "origLabelColor"));
}

function haveOldColorItem(el)
{
	return isDefinedAndNotNull(GA(el, "origItemColor"));
}

function haveConversions(el)
{
	return isDefinedAndNotNull(GA(el, "conversions"));
}

function haveReqLength(el)
{
	return isDefinedAndNotNull(GA(el, "reqLength"));
}

function doValidation(validator, el, tipoEl, elValue)
{
	try
	{    
		if(tipoEl.toUpperCase().indexOf("EQUALS") != -1)
		{
			var valuesEq = tipoEl.split("|");
		  var field = valuesEq[1];
		  var msgEq = valuesEq[2];
			var result = (GI(field).value == elValue);
			if(!result) validator.sendAlert(el, msgEq);
			return result;
		}
		else
		{
      if(TR(elValue) == "" || isNull(elValue)) return true;
      
      if(tipoEl.indexOf("MoneyPrec") != -1)
      {
        var prec = GA(el,"prec").split(".");    //[n].[m]
        var strFunc = "is" + tipoEl + "(\"" + elValue + "\"," + (isDefinedAndNotNull(prec[0])?prec[0]:0) + "," + (isDefinedAndNotNull(prec[1])?prec[1]:0) + ")";
        if(!eval(strFunc))
          return false;
        else
          return true;
      }
      else
      {
        var strFunc = "is" + tipoEl + "(\"" + elValue + "\")";
        if(!eval(strFunc))
          return false;							
        else
          return true;
      }
		}
	}
	catch(e)
	{
		if(this.showErrors) A("La funcion is" + tipoEl + " no existe!");
	}
	
	return true;
}

// Funciones para Validacion
function isEmail(strValue)
{
	var filter=/^[A-Za-z0-9][A-Za-z0-9_\-.]*@[A-Za-z0-9_\-]+\.[A-Za-z0-9_.\-]+[A-za-z]$/;
	return filter.test(strValue);
}

function isNumero(pNum) 
{
	regNum=/^\d+$/;  //formato de solo numeros
	
	if(regNum.exec(pNum))
		return true;
	
	return false;
}

function isMoney(pNum)
{
  regNum = /^\d*\.?\d*$/;// /^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,2}){0,1}$/; //Formato numeros con punto decimal

  if(regNum.exec(pNum))
		return true;
	return false;
}
function isMoneyPrec(pNum,dig,dec)
{
  dig = dig == 0? 1: dig;
  dec = dec == 0? 1: dec;
	regNum = eval("/^\\d{1," + dig + "}(\\.\\d{1," + dec + "})?$/");
	if(regNum.exec(pNum))
		return true;
	return false;
}

function isLower(pChar)
{
	regChar = /^[a-z\s]*$/; //Formato de letras minusculas
	
	if(regChar.exec(pChar))
		return true;
	//else
		//A(FV_MSG_ONLY_LOWER);
	
	return false; 
}

function isLetrasMayusculas(pLetrasMayusculas)
{
	regAlphaNumeric = /^[A-Z\s]*$/; //Formato de solo letras mayusculas
	if(regAlphaNumeric.exec(pLetrasMayusculas))
		return true;
	//else
		//A(FV_MSG_ONLY_MAYUS);
	
	return false; 
}

function isLetras(pLetras)
{
	regAlphaNumeric = /^[a-zA-Z\s]*$/; //Formato de solo letras mayusculas
	if(regAlphaNumeric.exec(removeSpecial(pLetras)))
		return true;
	//else
		//A(FV_MSG_ONLY_LETTERS);
	
	return false; 
}

function isLetrasAcento(pLetras)
{
	regAlphaNumeric = /^[a-zA-Z\s]*$/; //Formato de solo letras mayusculas
	return regAlphaNumeric.exec(removeSpecial(pLetras));
}

function isAlphaNumeric(pAlphaNumeric)
{
	regAlphaNumeric = /^[a-zA-Z0-9\s#.]*$/; //Formato de alfanumerico
	if(regAlphaNumeric.exec(removeSpecial(pAlphaNumeric)))
		return true;
	//else
		//A(FV_MSG_ONLY_ALFANUM);
	
	return false;  
}

function isAlphaNumericMayusculas(pAlphaNumeric)
{
	regAlphaNumeric = /^[A-Z0-9\s#.]*$/; //Formato de alfanumerico solo mayusculas
	if(regAlphaNumeric.exec(removeSpecial(pAlphaNumeric)))
		return true;
	//else
		//A(FV_MSG_ONLY_ALFANUM_MAYUS);
	
	return false; 
}

function isFecha(pFecha)
{
	regAlphaNumeric = /^[/0-9]*$/; //Formato de fecha con numeros y /
	return regAlphaNumeric.exec(pFecha);  
}

function isSoloNumeros(pNumero)
{
	regAlphaNumeric = /^[0-9]*$/; //Formato de solo numeros
	return regAlphaNumeric.exec(pNumero);  
}
//