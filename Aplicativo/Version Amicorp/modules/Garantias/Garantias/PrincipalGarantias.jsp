<FORM name="frmPrincipalGarantias" id="frmPrincipalGarantias" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Garantias</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Fideicomiso:</td>
            <td>
              <input type="text" name="paramIdFideicomiso" id="paramIdFideicomiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td width="45%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Sub Fiso:</td>
            <td colspan="2">
              <input type="text" name="paramSubfiso" id="paramSubfiso" size="10" maxlength="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Tipo de Garantia: </td>
            <td>
              <select size="1" id="paramGarantia" name="paramGarantia" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo38" next="paramStatus"/>
            </td>
            <td width="45%">
              <div id="Fideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Estado</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbTipoGarantia" param="clavesCombo31"/>
            </td>
            <td width="45%">
              <div id="Fideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">&nbsp;</td>
            <td>&nbsp;
            </td>
            <td width="45%">
              <div id="nomFideicomiso2" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">&nbsp;</td>
            <td colspan="2">&nbsp;
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramIdGar" id="paramIdGar" size="10" style="visibility:hidden"/>
              <input type="text" name="paramIdBienGar" id="paramIdBienGar" size="10" style="visibility:hidden"/>
              <input type="text" name="paramCveTipoGar" id="paramCveTipoGar" size="10" style="visibility:hidden"/>
              <input type="text" name="paramFiso" id="paramFiso" size="10" style="visibility:hidden"/>
              
              
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="Aceptar" class="boton" ref="funRegistroGarantias" fun="loadTableElement" tabla="tablaRegistrosGarantias" onclick="consultaGarantia(this);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalGarantias'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="BUTTON" value="   Alta    " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoGarantias(1);"/>
              <input type="BUTTON" value=" Modificar " id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoGarantias(2);"/>
              <input type="BUTTON" value=" Consulta  " name="cmdConsultar" class="boton" onclick="cargaMantenimientoGarantias(4)"/>
               <!--eliminarRegistro()-->
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
            </td>
          </tr>
          <tr>
            <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
          </tr>
          
          <!----------------------->
          <!----- GARANTIAS ------->
          
          <tr align="center">
            <td colspan="5" class="subtitulo">Garantias<hr/></td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">Fideicomiso</td>
                  <td width="100px">Subfiso</td>
                  <td width="100px">Id Garantia</td>
                  <!--<td width="100px">Otros</td>-->
                  <td width="100px">Importe</td>
                  <td width="100px">Imp. Garantizado</td>
                   <td width="100px">Estatus</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tablaRegistrosGarantias" dataInfo="tablaGarantiasData" keys="fgarIdFideicomiso,fgarIdSubcuenta,fgarCveGarantia,ctoNumEscritura" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de b�squeda">
                </table>
              </div>
            </td>
          </tr>
          
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap colspan="3" align="right">
              
                <table class="texto" id="dvModificacionGarantia" style="visibility:hidden;">
                  <tr>
                    <td nowrap colspan="2" class="subtitulo">
                      Modificaci�n de la Garantia<hr/>
                    </td>
                  </tr>
                  <tr>
                    <td nowrap width="15%">Tipo de Garantia: </td>
                    <td>
                      <select size="1" id="cmbTipoGarantia" name="cmbTipoGarantia" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo38" next="formsLoaded"/>
                    </td>
                  </tr>
                  <tr>
                    <td width="45%">
                      &nbsp;
                    </td>
                    <td nowrap colspan="2" class="subtitulo" align="right">
                      <input type="BUTTON" value="Modificar Garantia" id="cmdModificarBienesGar" name="cmdModificarBienesGar" class="boton" onclick="modificacionGarantia();">
                    </td>
                  </tr>
                </table>
              
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          
          <!------------------------>
          <!-- BIENES EN GARANTIA -->
          
          <tr align="center">
            <td colspan="5" class="subtitulo">Bienes en garantia<hr/></td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="BUTTON" value="Registro de Bien" id="cmdRegistro" name="cmdAlta" class="boton" onclick="cargaMantenimientoBienesGar(1);"/>
              <input type="BUTTON" value="Revaluacion" id="cmdRevaluacion" name="cmdRevaluacion" class="boton" onclick="cargaMantenimientoBienesGar(3);"/>
              <input type="BUTTON" value="Salida de Bien" id="cmdSalidaBien" name="cmdSalidaBien" class="boton" onclick="cargaMantenimientoBienesGar(5);"/> <!--eliminarRegistro()-->
              <input type="BUTTON" value="Modificar" id="cmdModificarBien" name="cmdModificarBien" class="boton" onclick="cargaMantenimientoBienesGar(2);"/>
              <input type="BUTTON" value="Consulta"  id="cmdConsultarBien" name="cmdConsultarBien" class="boton" onclick="cargaMantenimientoBienesGar(4)"/>
              <!--<input type="BUTTON" value="Imagenes" id="cmdImagenes" name="cmdImagenes" class="boton" onclick="cargaMantenimientoBienesFideicomitidos(6)"/>-->
              <input type="BUTTON" value="Aceptar" id="cmdAceptarBienesGar" name="cmdAceptarBienesGar" class="boton" ref="consultarBienesGar" fun="loadTableElement" tabla="tablaRegistrosBienesGar" onclick="consultar(this, GI('frmPrincipalGarantias'), false);" style="visibility:hidden;position:absolute;">
              
            </td>
          </tr>
          <tr>
            <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="110px">Fideicomiso</td>
                  <td width="110px">Subfiso</td>
                  <td width="110px">Id Garantia</td>
                  <td width="110px">Id Bien</td>
                  <td width="110px">Clasificacion</td>
                  <td width="110px">Importe &Uacute;lt.Val.</td>
                   <td width="110px">Estatus</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:1123px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tablaRegistrosBienesGar" dataInfo="tablaBienesGarData" keys="fgrsIdFideicomiso,fgrsIdSubcuenta,forsIdGarantia,forsCveTipoGarantia,forsCveTipoBien,disponibleBien" fun="clickTablaBienesGar" radioWidth="23px" >
                </table>
              </div>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
