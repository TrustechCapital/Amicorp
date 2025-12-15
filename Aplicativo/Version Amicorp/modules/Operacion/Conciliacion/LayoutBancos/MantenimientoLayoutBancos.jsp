<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Líneas de Crédito</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <td colspan=7 >&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Banco</td>
              <td nowrap colspan="4">
                <select size="1" name="flyIdBanco" id="flyIdBanco" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave"  param="cmbClaves26" next="flyIdInterfase" required message="El Banco es un campo Obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Interfase</td>
              <td nowrap colspan="4">
                <select name="flyIdInterfase" id="flyIdInterfase" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindNomSubindice"  param="cmbInterfase" next="flyIdLayout"  required message="La Interfase es un campo Obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5" class="subtitulo">Movimiento</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Tipo Movto</td>
              <td>
                  <select name="flyIdLayout" id="flyIdLayout" ref="conETDatInd" fun="loadComboElement" keyValue="eindFormaEmp" theValue="eindDescripcion"  param="cmbLayout" next="loadCatalogo"  required message="El Identificador de Movimiento es un campo Obligatorio" onchange="actualizaTargets(this)"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Descripción</td>
              <td nowrap>
                <input type="text" name="flyNomLayout" id="flyNomLayout"  size="25" maxlength="80"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
             <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Identificador</td>
              <td>
                   <input type="text" name="flyCampoTarget3" id="flyCampoTarget3" size="5" maxlength="5"/>
               </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">Posición Inicio</td>
              <td>
                   <input type="text" name="flyInicio3" id="flyInicio3" tipo="Num" size="10" maxlength="10"/>
               </td>
              <td width="10%">&nbsp;</td>
               
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5" class="subtitulo">Fecha</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Posición Inicio</td>
              <td nowrap>
                 <input type="text" name="flyInicioFecha" id="flyInicioFecha" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
               <td nowrap>Formato</td>
              <td nowrap>
                <input type="text" name="flyFormatoFecha" id="flyFormatoFecha" value="YYYY-MM-DD" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5" class="subtitulo">Cuenta</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Posición Inicio</td>
              <td nowrap>
                 <input type="text" name="flyInicio1" id="flyInicio1" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
               <td nowrap>Longitud</td>
              <td nowrap>
                <input type="text" name="flyLongitud1" id="flyLongitud1" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7" class="subtitulo">Importe</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Posición Inicio</td>
              <td nowrap>
                 <input type="text" name="flyInicio2" id="flyInicio2" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
               <td nowrap>Longitud</td>
              <td nowrap>
                <input type="text" name="flyLongitud2" id="flyLongitud2" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap>
                 &nbsp;
              </td>
              <td nowrap width="5%">&nbsp;</td>
               <td nowrap><b>Decimales ("." en importe)</b></td>
              <td nowrap>
                <input type="checkbox" class="check" name="flyDecimales2chk" id="flyDecimales2chk" tipo="Num" size="10" maxlength="10" onclick="decimalesChk(this);"/>
                <input type="hidden" name="flyDecimales2" id="flyDecimales2" tipo="Num" size="10" maxlength="10" value="2"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5">
              
              <!--Valores Ocultos-->
                
                <input type="hidden" name="flyNomCampo1" id="flyNomCampo1" value="CUENTA CHEQUES" size="10"/>
                <input type="hidden" name="flyNomCampo2" id="flyNomCampo2" value="IMPORTE" size="10"/>
                
                <input type="hidden" name="flyNomCampo3" id="flyNomCampo3" value="IDENTIFICADOR" size="10"/>
                <input type="hidden" name="flyLongitud3" id="flyLongitud3" tipo="Num"  value="1"  size="10" maxlength="10" />
                 
                <input type="hidden" name="flyTablaTarget1" id="flyTablaTarget1" tipo="Num" size="10" maxlength="10"/>
                <input type="hidden" name="flyCampoTarget1" id="flyCampoTarget1" tipo="Num" size="10" maxlength="10"/>
                <input type="hidden" name="flyTablaTarget2" id="flyTablaTarget2" tipo="Num" size="10" maxlength="10"/>
                <input type="hidden" name="flyCampoTarget2" id="flyCampoTarget2" tipo="Num" size="10" maxlength="10"/>
              
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
           
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" ><!--style="visibility:hidden"/>-->
          &nbsp;&nbsp;&nbsp;
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipal();" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
      <tr>
      <td height="100%" colspan="3">&nbsp;</td>
    </tr>
      <tr>
       <td height="100%" >&nbsp;</td>
      <td height="100%" class="subtitulo" >Vista Previa<hr widrh="80%"></td>
       <td height="100%">&nbsp;</td>
    </tr>
      <tr>
        <td width="60%" colspan="3" height="300px" align="center"  valign="top">
         
               <table width="790" height="116" style="position:relative;">
                  <tr>
                     <td style="position:absolute;top:0px;left:0px;z-index:0;"><img src="<%=request.getContextPath()%>/imagenes/Operacion/ArchivoConcilia.png"/></td>
                  </tr>
                  <tr>
                     <td style="position:absolute;top:47px;left:8px;z-index:1;"><div style="width:775px;height:61px;overflow:auto;"><textarea id="taPreview" style=" width:1500px;height:61px;background-color:#FFFFFF;overflow:hidden;"></textarea></div></td>
                  </tr>
                  <tr>
                     <td style="position:absolute;top:120px;right:8px;z-index:2;"><input type="button" value="Ver " name="cmdVer" class="boton" onclick="vpLayout();" ></td>
                  </tr>
               </table>
               <table class="texto" style="background-color:#FFFFFF;">
                  <tr>
                    <td nowrap colspan="2" height="130" width="700" class="subtitulo">&nbsp;</td>
                  </tr>
                  <tr>
                    <td nowrap colspan="2" class="subtitulo">Movimiento</td>
                  </tr>
                  <tr>
                    <td nowrap width="5%">&nbsp;</td>
                    <td id="tdTipoMovto" style="font-weight:bold;">&nbsp;</td>
                  </tr>
                  <tr>
                    <td nowrap colspan="2" class="subtitulo">Fecha</td>
                  </tr>
                  <tr>
                    <td nowrap width="5%">&nbsp;</td>
                    <td id="tdFecha" style="font-weight:bold;">&nbsp;</td>
                  </tr>
                  <tr>
                    <td nowrap colspan="2" class="subtitulo">Cuenta</td>
                  </tr>
                  <tr>
                    <td nowrap width="5%">&nbsp;</td>
                    <td id="tdCuenta" style="font-weight:bold;">&nbsp;</td>
                  </tr>
                  <tr>
                    <td nowrap colspan="2" class="subtitulo">Importe</td>
                  </tr>
                  <tr>
                    <td nowrap width="5%">&nbsp;</td>
                    <td id="tdImporte" style="font-weight:bold;">&nbsp;</td>
                  </tr>
                </table>
         
        </td>
      </tr>
  </table>
</FORM>