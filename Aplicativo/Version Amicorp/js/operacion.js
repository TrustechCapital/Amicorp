
/*
dvOperacion
.--- Operación
*/

function dvOperacion(idObj)
{
  setTimeout('getOperativeFields('+idObj+',"'+idObj+'")',1000);// escribe dvOperacion
}

function getOperativeFields(objForm,idForm) {
   var dvCadena = "<br><table align='center' width='500px' cellpadding=0 cellspacing=0 class='dvOperacionTable'>";
   dvCadena += "  <tr>";
   dvCadena += "     <td class='dvOperacionHeader' align='center'>Descripción de Operación</td>";
   dvCadena += "  </tr>";
   
   if(typeof(objForm) != "undefined" && typeof(objForm.elements) != "undefined") 
    {
         for(var i = 0; i < objForm.elements.length; i++)
         {
               var elemento = objForm.elements[i];
               if(GA(elemento, "operacion") != null)
               {
                            if(elemento.type=="checkbox") 
                            {
                                 if(elemento.checked)
                                     dvCadena += operativeRow(GA(elemento, "operacion"));
                           
                            }
                            else if(elemento.value != "" && elemento.value != "-1"&& elemento.value != "0")
                            {
                                 if(GA(elemento, "keyValue") != null&&GA(elemento, "theValue") != null)
                                     dvCadena +=operativeRow(GA(elemento, "operacion").replace('####',elemento.options[elemento.selectedIndex].text));
                                 else
                                     dvCadena +=operativeRow(GA(elemento, "operacion").replace('####',elemento.value));
                            }
                            
                            
                                 elemento.onblur= function(){dvOperacion(idForm);}; 
                                 elemento.onclick= function(){dvOperacion(idForm);}; 
                                 elemento.onchange= function(){dvOperacion(idForm);}; 
               }
         }
    }
    
    dvCadena += "  <tr><td class='dvOperacionTd'>&nbsp;</td></tr>";
   dvCadena += "</table>";
   
   GI('dvOperacion').innerHTML= dvCadena;
}

function operativeRow(valor)
{
   var srow = "<tr><td class='dvOperacionTd'>&nbsp;&nbsp;+&nbsp;"+valor+"</td></tr>";
   return srow;
}

/*
dvOperacion
.--- Operación
*/