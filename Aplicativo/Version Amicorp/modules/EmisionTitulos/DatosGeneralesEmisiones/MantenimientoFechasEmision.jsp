<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento Emisiones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Emisor</td>
              <td width="20%" valign="middle">
               <select size="1" name="eemiNomEmisor" id="eemiNomEmisor" ref="conETCmbEmisor" fun="loadComboElement" keyValue="esorIdEmsisor" theValue="esorNombre" next="eemiIdPrograma" param="paramEmisor" onchange="consultaDivEmisor(this)" required message="El Emisor es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              
                <!--select size="1" name="eemiIdPrograma" id="eemiIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="eemiNomEmisor" required message="El Programa es un campo obligatorio"/-->
              </td>
              <td width="20%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="20%" valign="middle" nowrap colspan="3">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Programa</td>
              <td width="20%" valign="middle">
               <select size="1" name="eemiIdPrograma" id="eemiIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" param="cmbPrograma"  next="eemiIdFideicomiso"  ><!--required message="El Programa es un campo obligatorio"-->
                <option value="0">-- Seleccione --</option><!--onchange="cargaComboFideicomiso(this,GI('eemiIdFideicomiso'),false,0);"-->
                </select>
              
                <!--select size="1" name="eemiIdFideicomiso" id="eemiIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="formsLoaded" param="paramCmbProg" onchange="alert(this.value)" required message="El Fideicomiso es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select-->
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="10%" valign="middle" nowrap colspan="3">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            
            
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Fideicomiso</td>
              <td width="20%" valign="middle">
                 <select size="1" name="eemiIdFideicomiso" id="eemiIdFideicomiso" ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso" next="eemiCveInstrumento" param="cmbFideicomiso" onblur="determinaNumEmision(GI('eemiIdPrograma'),this,this);" ><!--  onchange="cargaComboFideicomiso(this,GI('eemiNomEmisor'),false,0);" required message="El Fideicomiso es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option>
                </select>
                
                <!--select size="1" name="eemiIdFideicomiso" id="eemiIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="formsLoaded" param="paramCmbProg" onchange="alert(this.value)" required message="El Fideicomiso es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select-->
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="10%" valign="middle" nowrap colspan="3">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            
          
            
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>N&uacute;m. de la Emisi&oacute;n</td>
              <td valign="middle" height="6" width="20%">
                <input type="text" name="eemiIdEmision" id="eemiIdEmision" tipo="Num" size="10" maxlength="10" required message="El Número de Emisión es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <!--tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Emisor</td>
              <td valign="middle" height="6" width="20%">
                <select size="1" name="eemiNomEmisor" id="eemiNomEmisor" ref="conETCmbEmisor" fun="loadComboElement" keyValue="esorNombre" theValue="esorNombre" next="eemiCveInstrumento"  required message="El Emisor es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;
              </td>
              <td valign="middle" height="6" width="10%" nowrap colspan="3">&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr-->
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Clave de Pizarra</td>
              <td valign="middle" height="6" width="20%">
                <input type="text" name="eemiCvePizarra" id="eemiCvePizarra" size="50" maxlength="50" required message="La Clave de Pizarra es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" nowrap>&nbsp;</td>
              <td valign="middle" height="6" nowrap width="4%">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;
              </td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Serie</td>
              <td valign="middle" height="6" width="20%" colspan="2">
                <input type="text" name="eemiNumSerie" id="eemiNumSerie" size="50" maxlength="50" required message="La Serie es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Instrumento</td>
              <td valign="middle" height="6" width="20%" colspan="2">
                <select size="1" name="eemiCveInstrumento" id="eemiCveInstrumento" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbInstrumento" next="eemiStEmision" required message="El Instrumento es un campo obligatorio"/>
                <!--select size="1" name="eemiCveInstrumento" id="eemiCveInstrumento" ref="conETCmbInstrEmision" fun="loadComboElement" keyValue="eproInstrumento" theValue="eproInstrumento" next="eemiStEmision" required message="El Instrumento es un campo obligatorio"/-->
              </td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="20%">&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap colspan="6" class="subtitulo">
                <table cellpadding="0" cellspacing="0" border="0" id="Tabs" style="visibility:hidden">
                  <tr>
                    <td class="tab_blanco_claro">&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cargaMantenimientoDatosGeneralesTab();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Datos&nbsp;Generales&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="tab_claro_azul">&nbsp;</td>
                    <td class="tab_relleno_azul" onclick="cargaMantenimientoFechasEmision();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fechas&nbsp;de&nbsp;Emisi&oacute;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="tab_azul_blanco">&nbsp;</td>
                  </tr>
                </table>
              </td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="20%">&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Fecha de Emisi&oacute;n</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiFecEmision" id="eemiFecEmision" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td valign="middle" width="10%" nowrap colspan="2">Fecha de Ofrecimiento</td>
              <td valign="middle" width="20%" nowrap>
                <input type="text" name="eemiFecOfrecimiento" id="eemiFecOfrecimiento" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td valign="middle" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Fecha&nbsp;de Subasta</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiFecSubasta" id="eemiFecSubasta" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td align="left" valign="middle" width="10%" nowrap colspan="2">
                <P>Fecha de Registro BMV</P>
              </td>
              <td align="left" valign="middle" width="20%" nowrap>
                <input type="text" name="eemiFecBolsa" id="eemiFecBolsa" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td align="left" valign="middle" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" nowrap width="20%">&nbsp;</td>
              <td valign="middle" nowrap width="12%">Fecha de Cruce</td>
              <td valign="middle">
                <input type="text" name="eemiFecCruce" id="eemiFecCruce" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td valign="middle">&nbsp;</td>
              <td valign="middle" nowrap width="10%" colspan="2">Fecha de Liquidaci&oacute;n</td>
              <td valign="middle" nowrap width="20%">
                <input type="text" name="eemiFecLiquidacion" id="eemiFecLiquidacion" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td valign="middle" nowrap width="15%">&nbsp;</td>
            </tr>
            <!--tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Fecha de Inicio Serie</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiFecSerie" id="eemiFecSerie" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" colspan="2">&nbsp;</td>
              <td width="20%" valign="middle">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr-->
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Tipo Subasta</td>
              <td width="20%" valign="middle" colspan="2">
                <input type="text" name="eemiTipoSubasta" id="eemiTipoSubasta" size="50" maxlength="50"/>
              </td>
              <td width="10%" valign="middle" nowrap colspan="2">&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Comit&eacute; T&eacute;cnico</td>
              <td width="20%" valign="middle" colspan="5">
                <textarea name="eemiComiteTecnico" id="eemiComiteTecnico" style="width:400px;height:80px" onkeydown="validaLongitud(this,200);"></textarea>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Acto Constitutivo</td>
              <td width="20%" valign="middle" colspan="5">
                <textarea name="eemiActoConstitutivo" id="eemiActoConstitutivo" style="width:400px;height:80px" onkeydown="validaLongitud(this,200);"></textarea>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle">&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Autorizaci&oacute;n CNBV</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiAutorizacionCnbv" id="eemiAutorizacionCnbv" size="50" maxlength="50" required message="La Autorización CNBV es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eemiFecCnbv" tipo="Fecha" id="eemiFecCnbv" size="10" maxlength="10" required message="La Fecha de Autorización es un campo obligatorio"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>N&uacute;m. Reg. Nacional de Valores</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiAutorizacionBanxico" id="eemiAutorizacionBanxico" size="50" maxlength="50" required message="El Núm. Reg. Nacional de Valores es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eemiFecBanxico" id="eemiFecBanxico" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Autorización es un campo obligatorio"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Status</td>
              <td width="20%" valign="middle">
                <select size="1" name="eemiStEmision" id="eemiStEmision" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.DatosGeneralesEmisiones.PrincipalDatosGenerales','');" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
