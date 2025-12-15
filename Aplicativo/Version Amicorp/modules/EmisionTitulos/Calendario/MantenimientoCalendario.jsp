<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Calendario</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr>
            <td class="textoRP" nowrap>&nbsp;</td>
            <td nowrap class="subtitulo" colspan="14">Programa / Emisi&oacute;n</td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td class="textoRP" nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td class="textoRP" nowrap>&nbsp;</td>
            <td nowrap>Programa</td>
            <td>
              <input type="text" name="ecalIdPrograma" id="ecalIdPrograma" size="10" maxlength="10"/>
            </td>
            <td nowrap colspan="5">
              <input type="text" name="eproNomPrograma" id="eproNomPrograma" size="50" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Fideicomiso</td>
            <td>
              <input type="text" name="ctoNumContrato" id="ctoNumContrato" size="10" maxlength="10"/>
            </td>
            <td nowrap colspan="4">
              <input type="text" name="ctoNomContrato" id="ctoNomContrato" size="50" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap>&nbsp;</td>
            <td nowrap>Emisi&oacute;n</td>
            <td>
              <input type="text" name="ecalIdEmision" id="ecalIdEmision" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Clave Pizarra</td>
            <td nowrap>
              <input type="text" name="eemiCvePizarra" id="eemiCvePizarra" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Serie</td>
            <td nowrap>
              <input type="text" name="eemiNumSerie" id="eemiNumSerie" size="7" maxlength="7"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Nombre de Emisora</td>
            <td colspan="4">
              <input type="text" name="eemiNomEmisor" id="eemiNomEmisor" size="50" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap>&nbsp;</td>
            <td nowrap class="subtitulo" colspan="14">Par&aacute;metros de C&aacute;lculo</td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap>&nbsp;</td>
            <td nowrap>Valor Nominal Emisi&oacute;n</td>
            <td>
              <input type="text" name="ecalImpValNomTot" id="ecalImpValNomTot" size="15" maxlength="15"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Valor Nominal T&iacute;tulos</td>
            <td nowrap>
              <input type="text" name="ecalValNomTitulos" id="ecalValNomTitulos" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>N&uacute;mero de T&iacute;tulos</td>
            <td nowrap colspan="2">
              <input type="text" name="eepcNumTitulos" id="eepcNumTitulos" size="20" maxlength="20"/>
            </td>
            <td nowrap>Total de Dias</td>
            <td nowrap colspan="4">
              <input type="text" name="eepcNumTitulos" id="eepcNumTitulos" size="20" maxlength="20"/>              
            </td>            
            <td nowrap>&nbsp;</td>
          </tr>

          <tr>
            <td nowrap>&nbsp;</td>
            <td nowrap>Tipo de C&aacute;lculo</td>
            <td colspan="3">
              <input type="text" name="eepcIdTipoCalculo" id="eepcIdTipoCalculo" size="5" maxlength="5"/>
              <input type="text" name="eepcIdTipoCalculo" id="eepcIdTipoCalculo" size="20" maxlength="50"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Tasa Considerada</td>
            <td colspan="2">
              <input type="text" name="ecalImpValNomTot" id="ecalImpValNomTot" size="15" maxlength="15"/>
            </td>
            <td nowrap>Tasa Fija</td>
            <td>
              <input type="text" name="ecalTasaAplicada" id="ecalTasaAplicada" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Plazo</td>
            <td nowrap>
              <input type="text" name="ecalPlazo" id="ecalPlazo" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap>&nbsp;</td>
            <td nowrap>Periodo</td>
            <td>
              <input type="text" name="ecalPeriodo" id="ecalPeriodo" size="15" maxlength="15"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap></td>
            <td nowrap>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap></td>
            <td nowrap colspan="2">
            </td>
            <td nowrap></td>
            <td nowrap colspan="4">
            </td>            
            <td nowrap>&nbsp;</td>
          </tr>

          <tr>
            <td nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>
              <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>
            </td>
            <td height="6">&nbsp;</td>
            <td height="6">&nbsp;</td>
            <td height="6" align="right">
              <input type="radio" name="radio" id="rdRep1" class="radio" onclick="validaImprimeReporte2(this);" style="visibility:hidden"/>
            </td>
            <td height="6">
              <div id="nomRep1">&nbsp;</div>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap align="right">
              <input type="radio" name="radio" id="rdRep2" class="radio" onclick="validaImprimeReporte2(this);" style="visibility:hidden"/>
            </td>
            <td height="6" nowrap colspan="4">
              <div id="nomRep2">&nbsp;</div>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>    


          <tr>
            <td nowrap colspan="16" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto" id="tblCabeceras">
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="" fun="clickTabla2" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <input type="hidden" id="refQry" name="refQry" value="emision.getFunRepDistribucion"/>
      </td>
    </tr>
    
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Previo " name="cmdPrevio" id="cmdPrevio" class="boton" onclick="ejecutaOperacionCalendarioPagos();"/>
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionCalendarioPagos1();"/>
        <input type="BUTTON" value="Regresar" name="cmdRegresar" id="cmdRegresar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.CalendarioPagos.PrincipalCalendarioPagos','');"/>
        <input type="BUTTON" value="Imprimir" name="cmdImprimir" id="cmdImprimir" class="boton" onclick="ejecutaOperacionCalculoInteres(3);"/>
        <input type="BUTTON" value="Genera Excel" name="cmdGeneraExcel" class="boton" onclick="generaDatosExcel();"/>
      </td>
    </tr>
  </table>
</form>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>
