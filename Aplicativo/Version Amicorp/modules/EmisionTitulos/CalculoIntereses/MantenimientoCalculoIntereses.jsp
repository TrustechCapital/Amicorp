<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" height="100%" class="titulo">C&aacute;lculo Intereses</td>
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
              <input type="text" name="paramPrograma" id="paramPrograma" size="10" maxlength="10"/>
            </td>
            <td nowrap colspan="5">
              <input type="text" name="fintNomPrograma" id="fintNomPrograma" size="50" maxlength="50"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Fideicomiso</td>
            <td height="6">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10"/>
            </td>
            <td nowrap colspan="4">
              <input type="text" name="fintNomContrato" id="fintNomContrato" size="50" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Emisi&oacute;n</td>
            <td height="6">
              <input type="text" name="paramEmision" id="paramEmision" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Clave Pizarra</td>
            <td height="6" nowrap>
              <input type="text" name="fintCvePizarra" id="fintCvePizarra" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Serie</td>
            <td height="6" nowrap>
              <input type="text" name="fintNumSerie" id="fintNumSerie" size="7" maxlength="7"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Nombre de Emisora</td>
            <td height="6" colspan="4">
              <input type="text" name="fintNomEmisor" id="fintNomEmisor" size="50" maxlength="50"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap class="subtitulo" colspan="14">Par&aacute;metros de C&aacute;lculo</td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Valor Nominal Emisi&oacute;n</td>
            <td height="6">
              <input type="text" name="fintImpValNomTot" id="fintImpValNomTot" size="15" maxlength="15"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Valor Nominal X T&iacute;tulo</td>
            <td height="6" nowrap>
              <input type="text" name="fintValnomTitulos" id="fintValnomTitulos" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>N&uacute;mero de T&iacute;tulos</td>
            <td height="6" nowrap colspan="7">
              <input type="text" name="fintNumTitulos" id="fintNumTitulos" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tipo de C&aacute;lculo</td>
            <td height="6" colspan="8">
              <input type="text" name="fintIdTipoCalculo" id="fintIdTipoCalculo" size="50" maxlength="50"/>
            </td>
            <td height="6" nowrap>Tasa Fija</td>
            <td height="6">
              <input type="text" name="fintPorcTasaFija" id="fintPorcTasaFija" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>No. de Tasas</td>
            <td height="6" nowrap>
              <input type="text" name="txtNoTasas" id="txtNoTasas" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap colspan="14" align="center">
              <input type="text" id="paramRepInfoUrlLogo" name="paramRepInfoUrlLogo" value="<%="http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/imagenes/logo_bn.jpg"%>" style="visibility:hidden"/>
              <input type="button" value="AceptarAtm" name="cmdAceptarAtm" id="cmdAceptarAtm" class="boton" ref="emision.conETPriIns" fun="loadTableElementSpecial" tabla="tblReg" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden;"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr align="center">
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap colspan="14">
              <table cellspacing="0" cellpadding="0" border="0" align="center" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="70" nowrap>Sec</td>
                  <td width="150" nowrap>Tasa</td>
                  <td width="150" nowrap>Plazo</td>
                  <td width="150" nowrap>Tasa Equivalente</td>
                </tr>
              </table>
              <div style="height:80px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDatMnt">
                </table>
              </div>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6">&nbsp;
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Plazo</td>
            <td height="6">
              <input type="text" name="ecalPlazo" id="ecalPlazo" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tipo de Promedio</td>
            <td height="6" colspan="8">
              <input type="text" name="fintTasaPromedio" id="fintTasaPromedio" size="50" maxlength="50"/>
            </td>
            <td height="6" nowrap>Tasa</td>
            <td height="6" nowrap>
              <input type="text" name="fintTasa" id="fintTasa" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap class="subtitulo" colspan="14">C&aacute;lculo</td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>F&oacute;rmula C&aacute;lculo</td>
            <td height="6">
              <input type="text" name="fintIdFormula" id="fintIdFormula" size="5" maxlength="5"/>
            </td>
            <td height="6" nowrap colspan="5">
              <input type="text" name="fintNomFormula" id="fintNomFormula" size="50" maxlength="50"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>No. Periodo</td>
            <td height="6" nowrap colspan="4">
              <input type="text" name="fintIdCalcSecuencial" id="fintIdCalcSecuencial" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Fecha Inicial</td>
            <td height="6">
              <input type="text" name="fintInicioPeriodo" id="fintInicioPeriodo" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Fecha Final</td>
            <td height="6" nowrap>
              <input type="text" name="fintFinDePeriodo" id="fintFinDePeriodo" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>D&iacute;as</td>
            <td height="6" nowrap>
              <input type="text" name="fintPeriodicidadDias" id="fintPeriodicidadDias" size="6" maxlength="6"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6">Fecha de Pago Intereses</td>
            <td height="6" nowrap>
              <input type="text" name="fintFechaDePago" id="fintFechaDePago" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Base</td>
            <td height="6">
              <input type="text" name="fintTasaBase" id="fintTasaBase" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Sobretasa</td>
            <td height="6" nowrap>
              <input type="text" name="fintSobretasa" id="fintSobretasa" size="8" maxlength="8"/> <!--Verificar: Debe ser el porcentaje-->
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Bruta</td>
            <td height="6" nowrap>
              <input type="text" name="fintTasaBruta" id="fintTasaBruta" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>ISR</td>
            <td height="6" nowrap>
              <input type="text" name="fintIsr" id="fintIsr" size="6" maxlength="6"/> <!--Verificar: Debe ser el porcentaje-->
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Neta</td>
            <td height="6" nowrap>
              <input type="text" name="fintTasaNeta" id="fintTasaNeta" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>D&oacute;lar Inicio</td>
            <td height="6">
              <input type="text" name="fintDolarInicio" id="fintDolarInicio" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>D&oacute;lar Fin</td>
            <td height="6" nowrap>
              <input type="text" name="fintDolarFin" id="fintDolarFin" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Neta</td>
            <td height="6" nowrap>
              <input type="text" name="fintTasaNeta" id="fintTasaNeta" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>ISR</td>
            <td height="6" nowrap>
              <input type="text" name="fintIsr2" id="fintIsr2" size="6" maxlength="6"/> <!--Verificar: Debe ser el porcentaje-->
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Bruta</td>
            <td height="6" nowrap>
              <input type="text" name="fintTasaBruta" id="fintTasaBruta" size="8" maxlength="8"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Absoluta</td>
            <td height="6">
              <input type="text" name="fintTasaAbsoluta" id="fintTasaAbsoluta" size="6" maxlength="6"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Tasa Equivalente</td>
            <td height="6" nowrap>
              <input type="text" name="fintTasaEquibalente" id="fintTasaEquibalente" size="6" maxlength="6"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Fecha de C&aacute;lculo</td>
            <td height="6" nowrap>
              <input type="text" name="fintFechaCalculo" id="fintFechaCalculo" size="10" maxlength="10"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap colspan="16">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Intereses Calculados</td>
            <td height="6" colspan="4">
              <input type="text" name="fintInteresesPer" id="fintInteresesPer" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap colspan="2">Capitalizaci&oacute;n de Intereses</td>
            <td height="6" nowrap colspan="3">
              <input type="text" name="fintInteresesCap" id="fintInteresesCap" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Intereses Netos</td>
            <td height="6" nowrap>
              <input type="text" name="fintInteresesNetos" id="fintInteresesNetos" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Amortizaci&oacute;n</td>
            <td height="6" colspan="4">
              <input type="text" name="fintImpAmortizacion" id="fintImpAmortizacion" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap colspan="2">Amortizaci&oacute;n Adicional</td>
            <td height="6" nowrap colspan="3">
              <input type="text" name="fintAmortExt" id="fintAmortExt" size="20" maxlength="20"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" colspan="4">&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap colspan="2">&nbsp;</td>
            <td height="6" nowrap colspan="3">&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Elaboro</td>
            <td height="6" colspan="4">
              <input type="text" name="fintElaboro" id="fintElaboro" size="50" maxlength="30" required message="El Nombre de la Persona que Elaboro es un campo obligatorio"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>Vo. Bo.</td>
            <td height="6" nowrap colspan="4">
              <input type="text" name="fintFirmaVobo" id="fintFirmaVobo" size="50" maxlength="30" required message="El Nombre de la Persona que da el Visto Bueno es un campo obligatorio"/>
            </td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
            <td height="6" nowrap>&nbsp;</td>
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
          <!--FIRMAS REPORTE-->
            <tr>
                  <td height="6" nowrap>&nbsp;</td>
                  <td height="6" nowrap>
                    &nbsp;
                  </td>
                  <td height="6" align="right">Firma 1</td>
                  <td height="6">&nbsp;</td>
                  <td height="6" align="right">
                    <select size="1" name="paramFirma1" id="paramFirma1" ref="conETUsuarios" fun="loadComboElement" keyValue="perNomUsuario" theValue="perNomUsuario" param="paramFirmaUsuario" next="paramFirma2" style="width:120;"/>
                  </td>
                   <td height="6" nowrap align="right">Firma 2</td>
                  <td height="6" nowrap align="right">&nbsp;</td>
                  
                  <td height="6" nowrap align="right">
                    <select size="1" name="paramFirma2" id="paramFirma2" ref="conETUsuarios" fun="loadComboElement" keyValue="perNomUsuario" theValue="perNomUsuario" param="paramFirmaUsuario" next="formsLoaded" style="width:120;"/>
                  </td>
                   <td height="6" colspan="4" nowrap>&nbsp;</td>
                  <td height="6" nowrap>&nbsp;</td>
                  <td height="6" nowrap>&nbsp;</td>
                  <td height="6" nowrap>&nbsp;</td>
                  <td height="6" nowrap>&nbsp;</td>
            </tr>
         <!-- FIRMAS REPORTE-->
    
        </table>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Previo " name="cmdPrevio" id="cmdPrevio" class="boton" onclick="ejecutaOperacionCalculoInteres(1);" style="visibility:hidden"/>
        <input type="BUTTON" value="Calcular Periodo" name="cmdCalcularPeriodo" id="cmdCalcularPeriodo" class="boton" onclick="ejecutaOperacionCalculoInteres(2);"/>
        <input type="BUTTON" value="Imprimir" name="cmdImprimir" id="cmdImprimir" class="boton" onclick="ejecutaOperacionCalculoInteres(3);"/>
        <input type="BUTTON" value="Regresar" name="cmdRegresar" id="cmdRegresar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.CalculoIntereses.PrincipalCalculoIntereses','');"/>
        <!--input type="BUTTON" value="Reporte " name="cmdReporte" class="boton" onclick="imprimeReporte();"/-->
      </td>
    </tr>
  </table>
</form>
