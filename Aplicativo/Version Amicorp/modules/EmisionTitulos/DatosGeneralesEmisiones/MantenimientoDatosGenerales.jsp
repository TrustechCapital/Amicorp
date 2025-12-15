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
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap><!--Emisor-->Id RC</td>
              <td valign="middle" height="6" width="20%">
                <!--select size="1" name="eemiNomEmisor" id="eemiNomEmisor" ref="conETCmbEmisor" fun="loadComboElement" keyValue="fidNomFideicom" theValue="fidNomFideicom" next="formsLoaded" param="paramCmbProg" required message="El Emisor es un campo obligatorio"-->
                <!--select size="1" name="eemiNomEmisor" id="eemiNomEmisor" ref="conETCmbEmisor" fun="loadComboElement" keyValue="esorIdEmsisor" theValue="esorNombre" next="eemiIdPrograma" param="paramEmisor" onchange="consultaDivEmisor(this)" required message="El Emisor es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select-->
                <input type="text" name="eemiNomEmisor" id="eemiNomEmisor" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);consultaDivEmisor(this)"/>
              </td>
              <td valign="left" height="6" width="10%" nowrap>
                  <div id="dvTipoEmisor" class="textoNegrita"  >&nbsp;</div>
              </td>
              <td valign="middle" height="6" width="10%" nowrap colspan="3">&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Programa</td>
              <td width="20%" valign="middle">
                <select size="1" disabled name="eemiIdPrograma" id="eemiIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" param="cmbPrograma"  next="eemiIdFideicomiso" ><!--required message="El Programa es un campo obligatorio"-->
                <option value="0">-- Seleccione --</option><!--onchange="cargaComboFideicomiso(this,GI('eemiIdFideicomiso'),false,0);"-->
                </select>
              </td>
              <td width="20%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="20%" valign="middle" nowrap colspan="3">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Fideicomiso</td>
              <td width="20%" valign="middle">
                <select size="1" name="eemiIdFideicomiso" id="eemiIdFideicomiso" ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso" next="eemiCveInstrumento" param="cmbFideicomiso" onblur="determinaNumEmision(GI('eemiIdPrograma'),this,this);" ><!--  onchange="cargaComboFideicomiso(this,GI('eemiNomEmisor'),false,0);" required message="El Fideicomiso es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option>
                </select>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="10%" valign="middle" nowrap colspan="3">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <!---------------------------------------------------------------------------------->
            <!--tr valign="middle">
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Tipo de Negocio</td>
              <td width="20%" valign="middle">
                <select size="1" name="eemiTipoNegocio" id="eemiTipoNegocio" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" next="eemiNomEmisor" param="cmbTNegocioParam" />
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="10%" valign="middle" nowrap colspan="3">&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr-->
            <!---------------------------------------------------------------------------------->
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>&nbsp;<!--N&uacute;m. de la Emisi&oacute;n--></td>
              <td valign="middle" height="6" width="20%">
                <input type="hidden" name="eemiIdEmision" id="eemiIdEmision" tipo="Num" size="10" value="0" maxlength="10"  message="El Núm. de la Emisión es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Clave de Pizarra</td>
              <td valign="middle" height="6" width="20%">
                <input type="text" name="eemiCvePizarra" id="eemiCvePizarra" onblur="validaPizarraSerie();" size="10" maxlength="7" required message="La Clave de Pizarra es un campo obligatorio" />
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
                <input type="text" name="eemiNumSerie" id="eemiNumSerie" onblur="validaPizarraSerie();" size="10" maxlength="6" required message="La Serie es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="10%" nowrap colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Instrumento</td>
              <td valign="middle" height="6" width="20%" colspan="2">
                <select size="1" name="eemiCveInstrumento" id="eemiCveInstrumento" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbInstrumento" next="eemiNumMoneda" required message="El Instrumento es un campo obligatorio"/>
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
                    <td class="tab_blanco_azul">&nbsp;</td>
                    <td class="tab_relleno_azul" onclick="cargaMantenimientoDatosGeneralesTab();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Datos&nbsp;Generales&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="tab_azul_claro">&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cargaMantenimientoFechasEmision();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fechas&nbsp;de&nbsp;Emisi&oacute;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="tab_claro_blanco">&nbsp;</td>
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
              <td width="12%" valign="middle" nowrap>Fecha de Inicio</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiFecInicio" id="eemiFecInicio" tipo="Fecha" size="10" maxlength="10" onblur="plazoAniosDias(this,GI('eemiFecVencimiento'));" required message="La Fecha de Inicio es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td valign="middle" width="10%" nowrap colspan="2">Fecha de Vencimiento</td>
              <td valign="middle" width="20%" nowrap>
                <input type="text" name="eemiFecVencimiento" id="eemiFecVencimiento" tipo="Fecha" size="10" maxlength="10" onblur="plazoAniosDias(GI('eemiFecInicio'),this);" required message="La Fecha de Vencimiento es un campo obligatorio"/>
              </td>
              <td valign="middle" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Plazo en D&iacute;as</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiDiasPlazo" id="eemiDiasPlazo" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td align="left" valign="middle" width="10%" nowrap colspan="2">
                <P>Plazo en A&ntilde;os</P>
              </td>
              <td align="left" valign="middle" width="20%" nowrap>
                <input type="text" name="eemiAnoPlazo" id="eemiAnoPlazo" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td align="left" valign="middle" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" nowrap width="20%">&nbsp;</td>
              <td valign="middle" nowrap width="12%">Moneda</td>
              <td valign="middle" width="20%" colspan="2">
                <select size="1" name="eemiNumMoneda" id="eemiNumMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="eproMoneda" required message="La Moneda es un campo obligatorio"/>
              </td>
              <td valign="middle" nowrap width="10%" colspan="2">Moneda Programa</td>
              <td valign="middle" nowrap width="20%">
                <select size="1" name="eproMoneda" id="eproMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="eemiIntColocador"/>
              </td>
              <td valign="middle" nowrap width="15%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Monto de Emisi&oacute;n</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiImpEmision" id="eemiImpEmision" size="19" maxlength="19" style="text-align:right;" tipo="Money" prec="16.2" reqPrecValue required message="El Monto de Emisión es un campo obligatorio" onblur="calculaTotalTitulos(this,GI('eemiImpNomEmision'))" onfocus="if(this.value=='0.00')this.value=''"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" colspan="2">Monto Disponible Programa</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproImpDisponible" id="eproImpDisponible" style="text-align:right;" tipo="Money" size="19" maxlength="19" prec="16.2" reqPrecValue/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Valor Nominal</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiImpNomEmision" id="eemiImpNomEmision" style="text-align:right;" size="19" maxlength="19" tipo="Money" prec="16.2" reqPrecValue required onblur="calculaTotalTitulos(GI('eemiImpEmision'),this)" message="El Valor Nominal es un campo obligatorio" onfocus="if(this.value=='0.00')this.value=''"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">Total de T&iacute;tulos</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eemiNumTitulos" id="eemiNumTitulos" size="19" maxlength="19"  style="text-align:right;" tipo="Money" required message="El Total de Títulos es un campo obligatorio" decimales="false"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle">
                <input type="checkbox" name="eemiRepoDistChk" id="eemiRepoDistChk" class="check" tv="1" fv="0"/>Reporte de Distribuci&oacute;n
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <!--tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Destino de Recursos</td>
              <td width="20%" valign="middle" colspan="5">
                <textarea name="eemiDestinoRecurso" id="eemiDestinoRecurso" style="width:400px;height:80px" onkeydown="validaLongitud(this,200);"></textarea>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr-->
            <tr  style="position:absolute;">
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap><!--Representante Com&uacute;n--></td>
              <td width="20%" valign="middle" colspan="2">
                <!--select size="1" name="eemiRepComun" id="eemiRepComun" ref="conRepresComun" fun="loadComboElement" keyValue="repcIdRepComun" theValue="repcInstitucion" param="cmbRepComun" next="eemiIntColocador"/-->
                <input type="text"  name="eemiRepComun" id="eemiRepComun"  value="1"  style="visibility:hidden;">
              </td>
              <td width="10%" valign="middle" nowrap colspan="2"><!--Intermediario Colocador--></td>
              <td width="20%" valign="middle" nowrap colspan="2">
                <select size="1" name="eemiIntColocador" id="eemiIntColocador" ref="conETCmb2Cla" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbLoadParam26y27" next="asignaValues2ObjHTML"  style="visibility:hidden;"/>
              </td>
            </tr>
            <tr >
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
                <input type="text" name="eemiAutorizacionCnbv" id="eemiAutorizacionCnbv" size="50" maxlength="50"/><!-- required message="La Autorización CNBV es un campo obligatorio"/-->
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eemiFecCnbv" tipo="Fecha" id="eemiFecCnbv" size="10" maxlength="10"/><!-- required message="La Fecha de Autorización es un campo obligatorio"/-->
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>N&uacute;m. Reg. Nacional de Valores</td>
              <td width="20%" valign="middle">
                <input type="text" name="eemiAutorizacionBanxico" id="eemiAutorizacionBanxico" size="50" maxlength="50"/><!-- required message="El Núm. Reg. Nacional de Valores es un campo obligatorio"/-->
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap colspan="2">Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eemiFecBanxico" id="eemiFecBanxico" tipo="Fecha" size="10" maxlength="10"/><!-- required message="La Fecha de Autorización es un campo obligatorio"/-->
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap><!--Status--></td>
              <td width="20%" valign="middle">
                <!--elect size="1" name="eemiStEmision" id="eemiStEmision" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio" style="visibility:hidden;"/-->
                <input type="text"  name="eemiStEmision" id="eemiStEmision" value="ACTIVO" style="visibility:hidden;"/>
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
          <input type="BUTTON" value=" Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
          <input type="BUTTON" value="Siguiente" name="cmdSiguiente" class="boton" onclick="guardaInfoSiguiente();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar " name="cmdCancelar" class="boton_x" onclick="manto=false;onButtonClickPestania('EmisionTitulos.DatosGeneralesEmisiones.PrincipalDatosGenerales','');" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
