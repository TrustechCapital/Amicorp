<table align="center" class="texto">
<tr>
    <td nowrap colspan="5" align="center">
            <div style="visibility:hidden; position:absolute;width:0px; height:0px;">
                    <input type="checkbox" name="eeacCveCapitalizacionChk" id="eeacCveCapitalizacionChk" class="check" tv="1" fv="0" operacion="Se capitalizarán intereses"/>
                    <input type="text" name="eeacImpCapitalizacion" id="eeacImpCapitalizacion"  style="text-align:right;"  size="10" maxlength="19" tipo="Money" prec="16.2" reqPrecValue onblur="formatoMonto(this)"/>
                    <input type="text" name="eeacStEmiamorc" id="eeacStEmiamorc" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden;position:absolute;"/>
                    <input type="checkbox" name="eeacAmortUltChk" id="eeacAmortUltChk" class="check" tv="1" fv="0"/>
             </div>       
             
            <table align="center" class="texto" style="width:450px;">
               <tr style="visibility:hidden;position:absolute;">
                  <td nowrap width="50%">Periodo</td>
                  <td nowrap width="50%">
                    <input type="text" name="eeacIdPeriodo" id="eeacIdPeriodo" size="10" maxlength="10" tipo="Fecha" message="La Fecha Fin Per es un campo obligatorio"/>
                  </td>
                </tr>
                
               <tr>
                  <td nowrap width="50%">Tipo de Amortizaci&oacute;n</td>
                  <td nowrap width="50%">
                    <select size="1" name="eeacTipoAmortizacion" id="eeacTipoAmortizacion" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbTipoAmortizacionParam" next="eeacPeriodicidad" message="El Tipo de Amortización es un campo obligatorio"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap width="50%">Periodicidad</td>
                  <td nowrap width="50%">
                    <select size="1" name="eeacPeriodicidad" id="eeacPeriodicidad" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbFormaAmortizacionParam" next="asignaValues2ObjHTMLAmortizacion" message="La Periodicidad es un campo obligatorio"/>
                  </td>
                </tr>
                <tr style="position:absolute;visibility:hidden;">
                  <td nowrap>Fecha Inicio</td>
                  <td nowrap>
                    <input type="text" name="eeacFecInicioAmort" id="eeacFecInicioAmort" size="10" maxlength="10" tipo="Fecha"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>Fecha Fin</td>
                  <td nowrap>
                    <input type="text" name="eeacFecFinAmort" id="eeacFecFinAmort" size="10" maxlength="10" tipo="Fecha"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>Importe</td>
                  <td nowrap>
                    <input type="text" name="eeacImpAmort" id="eeacImpAmort" style="text-align:right;" size="10" maxlength="19" tipo="Money" prec="16.2" reqPrecValue onblur="formatoMonto(this)"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>
                    Tasa por Amortizaci&oacute;n Anticipada
                  </td>
                  <td nowrap>
                    <input type="text" name="eeacPjeTasa" id="eeacPjeTasa"  size="10" maxlength="19" tipo="Money"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap colspan="2">
                    <input type="checkbox" name="eeacAmortTitulosChk" id="eeacAmortTitulosChk" class="check" tv="1" fv="0"/>&nbsp;Amortiza sobre T&iacute;tulos
                  </td>
                </tr>
                <tr>
                  <td nowrap colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap colspan="2">
                      <table cellspacing="0" cellpadding="0" border="0" class="texto">
                        <tr class="cabeceras">
                          <td width="23" align="center" nowrap>&nbsp;</td>
                          <td width="70" nowrap>Periodo</td>
                          <td width="150" nowrap>Tipo</td>
                          <td width="100" nowrap>Periodicidad</td>
                          <td width="70" nowrap>Fec Inicio</td>
                          <td width="70" nowrap>Fec Fin</td>
                          <td width="100" nowrap>Importe</td>
                        </tr>
                      </table>
                      <div style="height:100px; overflow:auto; position:relative; vertical-align:top;">
                        <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg0" dataInfo="arrTblDat0" keys="eeacIdPrograma,eeacIdFideicomiso,eeacIdEmision,eeacIdPeriodo,eeacImpAmort,eeacFecInicioAmort,eeacFecFinAmort,eeacPjeTasa,eeacAmortTitulos,eeacPeriodicidad,eeacTipoAmortizacion" fun="clickTabla3" radioWidth="23px">
                        </table>
                      </div>
                  </td>
                </tr>
                <tr>
                  <td nowrap colspan="2" align="center">
                    <input type="BUTTON" value=" Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionAmortizacion(1);" style="visibility:hidden;"/>
                    <input type="BUTTON" value="Modificar" name="cmdModify" id="cmdModify" class="boton" onclick="ejecutaOperacionAmortizacion(2);" style="visibility:hidden;"/>
                    <input type="BUTTON" value="  Baja  " name="cmdDrop" id="cmdDrop" class="boton" onclick="ejecutaOperacionAmortizacion(3);" style="visibility:hidden;"/>
                    &nbsp;<input type="BUTTON" value="Regresar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaDetalleParametrosCalculo(2);" style="visibility:hidden"/>
                  </td>
                </tr>
            </table>
            
      </td>
   </tr>
                
  <tr>
    <td nowrap colspan="5" align="center">
      <hr/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="5" align="center">
      <table class="texto">
        <tr>
          <td nowrap colspan="5" class="subtitulo">Captura de Amortizaci&oacute;n y Capitalizaci&oacute;n</td>
        </tr>
        <tr>
          <td nowrap colspan="5">&nbsp;</td>
        </tr>
        <tr>
          <td nowrap>
            <input type="radio" name="rdTipoAC" id="rdTipoAAP" value2="AAP" class="radio" message="Debe seleccionar el tipo de registro" onclick="estableceMantenimientoTablas('rdTipoAAP',this);"/>&nbsp;Amortizaci&oacute;n Anticipada / Parcial
          </td>
          <td nowrap style="visibility:hidden;">Periodo</td>
          <td nowrap style="visibility:hidden;">
            <input type="text" name="txtSec" id="txtSec" size="5" maxlength="10" tipo="Num"/><!-- message="El Secuencial es un campo obligatorio"/-->
          </td>
          <td nowrap>Fecha Fin Per</td>
          <td nowrap>
            <input type="text" name="txtFechaFinPer" id="txtFechaFinPer" size="10" maxlength="10" tipo="Fecha" message="La Fecha Fin Per es un campo obligatorio"/>
          </td>
        </tr>
        <tr>
          <td nowrap>
            <input type="radio" name="rdTipoAC" id="rdTipoCI" value="CI" class="radio" onclick="estableceMantenimientoTablas('rdTipoAAP',this);"/>&nbsp;Captalizaci&oacute;n de Intereses
          </td>
          <td nowrap colspan="2">&nbsp;</td>
          <td nowrap>Importe</td>
          <td nowrap>
            <input type="text" name="txtImporte" id="txtImporte" size="10"  style="text-align:right;" maxlength="19" tipo="Money" prec="16.4" reqPrecValue onblur="formatoMonto(this)"/>
          </td>
        </tr>
        <tr>
          <td nowrap>
            <input type="radio" name="rdTipoAC" id="rdTipoAA" value="AA" class="radio" onclick="estableceMantenimientoTablas('rdTipoAAP',this);"/>&nbsp;Amortizaci&oacute;n Adicional
          </td>
          <td nowrap colspan="2">&nbsp;</td>
          <td nowrap>Tasa por Amortizaci&oacute;n Anticipada</td>
          <td nowrap>
            <input type="text" name="tasaAmorAnt" id="tasaAmorAnt"  size="10" maxlength="19" tipo="Money"/>
          </td>
        </tr>
        <tr>
          <td nowrap colspan="5" align="center">
            <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
          </td>
        </tr>
        <tr>
          <td align="center" colspan="5" nowrap>
            <input type="button" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="ejecutaOperacionAmortizacionCapitalizacion(1);" style="visibility:hidden"/>
            <input type="button" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="ejecutaOperacionAmortizacionCapitalizacion(2);" style="visibility:hidden"/>
            <input type="button" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="ejecutaOperacionAmortizacionCapitalizacion(3);" style="visibility:hidden"/>
            &nbsp;<input type="button" value=" Limpiar " name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiaDatosAmortizacion(tblReg,tblReg2,tblReg3);" style="visibility:hidden"/>
          </td>
        </tr>
        <tr>
          <td nowrap colspan="5" align="center">
            <input type="text" name="txtStatus" id="txtStatus" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
            <input type="text" name="paramPrograma" id="paramPrograma" size="5" style="visibility:hidden"/>
            <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="5" style="visibility:hidden"/>
            <input type="text" name="paramEmision" id="paramEmision" size="5" style="visibility:hidden"/>
          </td>
        </tr>
        <tr>
          <td nowrap colspan="5">
            <table>
              <tr>
                <td class="subtitulo" align="center">Amortizaci&oacute;n Anticipada / Parcial</td>
                <td class="subtitulo" align="center">Captalizaci&oacute;n de Intereses</td>
                <td class="subtitulo" align="center">Amortizaci&oacute;n Adicional</td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="0" border="0" class="texto">
                    <tr class="cabeceras">
                      <td width="23" align="center" nowrap>&nbsp;</td>
                      <td width="70" nowrap>Periodo</td>
                      <td width="70" nowrap>Fecha</td>
                      <td width="100" nowrap>Importe</td>
                    </tr>
                  </table>
                  <div style="height:100px; overflow:auto; position:relative; vertical-align:top;">
                    <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg3" dataInfo="arrTblDat3" keys="eeapIdPrograma,eeapIdFideicomiso,eeapIdEmision,eeapIdAmortizacion,eeapImpAmortizacion,eeapFecAmort,tipoReg" fun="clickTabla2" radioWidth="23px">
                    </table>
                  </div>
                </td>
                <td>
                  <table cellspacing="0" cellpadding="0" border="0" align="center" class="texto">
                    <tr class="cabeceras">
                      <td width="23" align="center" nowrap>&nbsp;</td>
                      <td width="70" nowrap>Periodo</td>
                      <td width="70" nowrap>Fecha</td>
                      <td width="100" nowrap>Importe</td>
                    </tr>
                  </table>
                  <div style="height:100px; overflow:auto; position:relative; vertical-align:top;">
                    <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg2" dataInfo="arrTblDat2" keys="eeciIdPrograma,eeciIdFideicomiso,eeciIdEmision,eeciIdCapInte,eeciImpCapInte,eeciFecCapInte,tipoReg" fun="clickTabla2" radioWidth="23px">
                    </table>
                  </div>
                </td>
                <td>
                  <table cellspacing="0" cellpadding="0" border="0" align="center" class="texto">
                    <tr class="cabeceras">
                      <td width="23" align="center" nowrap>&nbsp;</td>
                      <td width="70" nowrap>Periodo</td>
                      <td width="70" nowrap>Fecha</td>
                      <td width="100" nowrap>Importe</td>
                    </tr>
                  </table>
                  <div style="height:100px; overflow:auto; position:relative; vertical-align:top;">
                    <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eeadIdPrograma,eeadIdFideicomiso,eeadIdEmision,eeadIdAmortizacion,eeadImpAmortizacion,eeadFecAmort,tipoReg" fun="clickTabla2" radioWidth="23px">
                    </table>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<div id="dvOperacion"></div>