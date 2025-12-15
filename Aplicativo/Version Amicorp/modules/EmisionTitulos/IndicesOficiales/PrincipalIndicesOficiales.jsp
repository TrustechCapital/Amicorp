<FORM name="frmPrincipalCatalogoIndicesOficialesControlGestion" id="frmPrincipalCatalogoIndicesOficialesControlGestion" onsubmit="">
<table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Catalogos Indices Oficiales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
              
          <tr>
            <td width="30%">&nbsp;
            </td>
            <td width="5%">Indice</td>
            <td>
              <select size="1" name="paramIndice" id="paramIndice" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbClaveInstrumentoParam" next="formsLoaded" message="La Clave de Instrumento es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td  colspan="2">
            
                  <table class="texto">
                        <tr>
                              <td>Día</td>
                              <td>
                                 <input type="text" name="paramDia" id="paramDia" tipo="Num" size="10" maxlength="5"/>
                              </td>
                              <td>Mes</td>
                              <td>
                                <input type="text" name="paramMes" id="paramMes" tipo="Num" size="10" maxlength="5"/>
                              </td>
                              <td>Año</td>
                              <td>
                                <input type="text" name="paramAno" id="paramAno" tipo="Num" size="10" maxlength="5" required message="El año es un campo obligatorio"/>
                              </td>
                         </tr>
                     </table>
             </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosIndicesOficiales" fun="loadTableElement" tabla="tablaRegistrosDatosIndicesOficiales" onclick="consultaIndices(this)"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogoIndicesOficialesControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" width="25%">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td class="subtitulo" align="center" colspan="4">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogosIndicesOficialesControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogosIndicesOficialesControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogosIndicesOficialesControlGestion(3);"/>
            </td>
          </tr>
          <tr>
            <td class="subtitulo" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="150px">Clave</td>
                  <td width="60px">A&ntilde;o</td>
                  <td width="60px">Mes</td>
                  <td width="70px">Dia</td>
                  <td width="100px">Valor</td>
                  <td width="90px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:590px;">
                <table id="tablaRegistrosDatosIndicesOficiales" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosIndicesOficialesData" keys="indCveIndice,indAnoIndice,indMesIndice,indDiaIndice" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
</table>
</FORM>
