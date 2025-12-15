<FORM name="frmCheckList" id="frmCheckList" method="post" onsubmit=""> 
    
  
          <table  style="position:absolute;visibility:hidden" align="center" width="300" class="texto" border="0">
            <tr>
              <td align="left" nowrap>Fideicomiso:</td>
              <td align="left">
                <input type="text" id="paramProyecto" name="paramProyecto" tipo="Num" value="" disabled required/>    
              </td>
              <td>Tipo Persona:
              </td>
              <td>
              <input type="text" id="paramTPersona" name="paramTPersona"  value="" disabled required/></td>
            </tr>
            <tr valign="middle" align="left">
              <td align="left">Numero:</td>
              <td align="left">
               <input type="text" id="paramNumPersona" name="paramNumPersona"  value="" tipo="Num" disabled required/>    
              </td>
              <td align="left">Nombre:
              </td>
              <td align="left">
               <input type="text" id="paramNomPersona" name="paramNomPersona"  value="" disabled required /> 
               <input type="text" id="paramTipo" name="paramTipo" tipo="Num"  value="" disabled style="visibility:hidden;" /> 
              </td>
            </tr>
            <tr>
              <td>
                <input type="BUTTON" value="Cargar" id="cmdCargar" name="cmdCargar" class="boton" ref="consultaCheckList" fun="loadTableElementPestanias" tabla="tablaCheckList" onclick="consultar(this, GI('frmCheckList'), false);" style="visibility:hidden;">
              </td>
            </tr>
        </table>
    
        <table align="center" class="texto" cellspacing="0" cellpadding="0">       
    
            <tr valign="middle">
              <td align="center">              
                <div style="vertical-align:top; width:168px;">
                  <table id="tablaCheckList" align="center" cellspacing="0" cellpadding="0" dataInfo="tablaCheckList" keys="conpIdConcepto,conpNombre" fun="clickTabla"  radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
              </tr>
                <tr>
                  <td colspan="4" align = "center" valign="middle" height="50">
                  
                    <input type="BUTTON" value=" Ver Concepto " name="cmdVer" id="cmdVer" class="boton" onclick="cargaMantenimientoCheckList(3)" style="visibility:hidden"/>&nbsp;&nbsp;&nbsp;
                   
                    <input type="BUTTON" value=" Regresar " name="cmdRegresar" id="cmdRegresar" class="boton" onclick="regresar()" style="visibility:hidden;position:absolute"/>
                    <input type="HIDDEN" id = "idRegresar" value = "" style="visibility:hidden;position:absolute">
                  </td>
                </tr>
    
  </table>
  <input type="hidden" id="siCompleto" name="siCompleto" value="0"/>
</form>