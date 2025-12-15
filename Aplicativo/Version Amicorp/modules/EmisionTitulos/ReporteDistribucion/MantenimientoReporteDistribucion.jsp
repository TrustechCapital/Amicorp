<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">
        <div id="dvTitulo">Reporte de Distribuci&oacute;n</div>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
        <tr valign="middle">
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">Id RC</td>
            <td nowrap colspan="2">
              <input type="text" name="txtIdRC" id="txtIdRC" size="10" maxlength="10"/>
            </td>
            <td nowrap>
              &nbsp;
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="1%">&nbsp;</td>
            <td nowrap width="1%">
              &nbsp;
            </td>
            <td nowrap>
              &nbsp;
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">No. de Programa</td>
            <td nowrap colspan="2">
              <input type="text" name="paramPrograma" id="paramPrograma" size="10" maxlength="10"/>
            </td>
            <td nowrap>
              <div id="dvPrograma" class="textoNegrita">&nbsp;</div>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="1%">Fideicomiso</td>
            <td nowrap width="1%">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10"/>
            </td>
            <td nowrap>
              <div id="dvFideicomiso" class="textoNegrita">&nbsp;</div>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">No. de Emisi&oacute;n</td>
            <td nowrap colspan="2">
              <input type="text" name="paramEmision" id="paramEmision" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Emisor</td>
            <td nowrap colspan="2">
              <div id="dvEmisor" class="textoNegrita">&nbsp;</div>
            </td>
            <td nowrap width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">Cup&oacute;n</td>
            <td colspan="4" nowrap>
              <input type="text" name="txtCupon" id="txtCupon" size="10" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>No. Rep. Distribuci&oacute;n</td>
            <td nowrap>
              <input type="text" name="paramReporte" id="paramReporte" size="10" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">Clave Pizarra de Emisi&oacute;n</td>
            <td colspan="4" nowrap>
              <input type="text" name="txtPizarra" id="txtPizarra" size="20" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Serie de Emisi&oacute;n</td>
            <td nowrap colspan="2">
              <input type="text" name="txtSerie" id="txtSerie" size="20" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">Fecha Inicio</td>
            <td colspan="4" nowrap>
              <input type="text" name="txtFechaInicio" id="txtFechaInicio" size="20" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Fecha Fin</td>
            <td nowrap colspan="2">
              <input type="text" name="txtFechaFin" id="txtFechaFin" size="20" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="8%">Fecha de Pago</td>
            <td colspan="4" nowrap>
              <input type="text" name="txtFechaPago" id="txtFechaPago" size="20" maxlength="50"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap colspan="2">
              &nbsp;
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap colspan="11">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="11">
              <input type="BUTTON" value="Regresar" name="cmdRegresar" id="cmdRegresar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.ReporteDistribucion.PrincipalReporteDistribucion','')"/>
            </td>
          </tr>
          <tr>
            <td nowrap colspan="11">&nbsp;</td>
          </tr>
        </table>
        <div id="dvContenido2">
          <table align="center" class="texto">
            <tr>
              <td nowrap width="10%"></td>
              <td nowrap width="20%" id="tdFC">
                <input type="radio" name="rdOpcion" id="rdOpcion" value2="PrincipalFlujoCobranza" class="radio" onclick="asignaValueRadio2Master('rdOpcion',this);" required message="Es necesario seleccionar una opción"/>Flujo de Cobranza
              </td>
              <td nowrap width="20%"  id="tdGP">
                <input type="radio" name="rdOpcion" id="rdGastosPeriodo" value="PrincipalGastosPeriodo" class="radio" onclick="asignaValueRadio2Master('rdOpcion',this);"/>Gastos Periodo
              </td>
              <td nowrap width="20%" id="tdEM">
                <input type="radio" name="rdOpcion" id="rdEstadisticaMorosidad" value="PrincipalEstadisticaMorosidad" class="radio" onclick="asignaValueRadio2Master('rdOpcion',this);"/>Estad&iacute;stica de Morosidad
              </td>
              <td nowrap colspan="2" width="20%" id="tdOE">
                <input type="radio" name="rdOpcion" id="rdOtrosEventos" value="PrincipalOtrosEventos" class="radio" onclick="asignaValueRadio2Master('rdOpcion',this);"/>Otros Eventos
              </td>
              <td nowrap width="10%"></td>
            </tr>
            <tr>
              <td nowrap width="30%">&nbsp;</td>
              <td nowrap colspan="5" width="13%"><hr></td>
              <td nowrap width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="10%" class="subtitulo" align="right">Totales&nbsp;</td>
              <td nowrap width="20%">
                <input type="text" name="totalFC" id="totalFC"/><!--Flujo de Cobranza-->
              </td>
              <td nowrap width="20%">
                <input type="text" name="totalGP" id="totalGP"/><!--Gastos Periodo-->
              </td>
              <td nowrap width="20%">
                <input type="text" name="totalEM" id="totalEM"/><!--Estad&iacute;stica de Morosidad-->
              </td>
              <td nowrap width="20%">
                <input type="text" name="totalOE" id="totalOE"/><!--Otros Eventos-->
              </td>
              <td nowrap width="10%"></td>
            </tr>
            <tr>
              <td nowrap width="30%">&nbsp;</td>
              <td nowrap width="13%">&nbsp;</td>
              <td nowrap colspan="3" width="13%">&nbsp;</td>
              <td nowrap width="13%">&nbsp;</td>
              <td nowrap width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="30%" colspan="7" align="center">
                <input type="BUTTON" value="   Alta  " name="cmdAltaPrincipal" id="cmdAltaPrincipal" class="boton" onclick="cargaOpcionReporteDistribucion(1);"/>
              </td>
            </tr>
            <tr>
              <td nowrap width="30%" colspan="7" align="center">
                <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="emision.conETTabFluCob" fun="loadTableElement" tabla="tblRegFluCob" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td nowrap  colspan="7" align="center">
              
                  <table id="tableFCGPEM">
                     <tr>
                        <td><!--FLUJO DE COBRANZA-->
                                 <table>
                                       <tr>
                                         <td nowrap width="30%" colspan="7" align="center" class="subtitulo">Flujo de Cobranza</td>
                                       </tr>
                                       <tr align="center">
                                            <td nowrap width="30%" colspan="7">
                                              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                                                <tr align="left" class="cabeceras">
                                                  <td width="23" align="center" nowrap>&nbsp;</td>
                                                  <td width="70" nowrap>Sec.</td>
                                                  <!--td width="100" nowrap>Fecha Inicio</td>
                                                  <td width="100" nowrap>Fecha Fin</td>
                                                  <td width="100" nowrap>Fecha Pago</td-->
                                                  <td width="250" nowrap>Concepto</td>
                                                  <td width="120" nowrap>Importe</td>
                                                  <!--td width="200" nowrap>Comentario</td-->
                                                </tr>
                                              </table>
                                              <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:463px;">
                                                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegFluCob" dataInfo="arrTblDatFluCob" keys="ecfcIdPrograma,ecfcIdFideicomiso,ecfcIdEmision,ecfcIdPeriodo,ecfcIdSecCob" fun="clickTablaFluCob" radioWidth="23px">
                                                </table>
                                              </div>
                                            </td>
                                          </tr>
                                    </table>
                        </td>
                        <td><!--GASTOS PERIODO-->
                                    <table>
                                       <tr>
                                         <td nowrap width="30%" colspan="7" align="center" class="subtitulo">Gastos Periodo</td>
                                       </tr>
                                       <tr align="center">
                                         <td nowrap width="30%" colspan="7">
                                           <table cellspacing="0" cellpadding="0" border="0" class="texto">
                                             <tr align="left" class="cabeceras">
                                               <td width="23" align="center" nowrap>&nbsp;</td>
                                               <td width="70" nowrap>Sec.</td>
                                               <td width="250" nowrap>Concepto</td>
                                               <td width="120" nowrap>Importe Honorario</td>
                                             </tr>
                                           </table>
                                           <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:463px;">
                                             <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegGasPer" dataInfo="arrTblDatGasPer" keys="ecpaIdPrograma,ecpaIdFideicomiso,ecpaIdEmision,ecpaIdPeriodo,ecpaIdSecPago" fun="clickTablaGasPer" radioWidth="23px">
                                             </table>
                                           </div>
                                         </td>
                                       </tr>
                                    </table>
                        </td>
                     </tr>
                     <tr>
                        <td><!--ESTADISTICA MOROSIDAD-->
                                    <table>
                                       <tr>
                                         <td nowrap width="30%" colspan="7" align="center" class="subtitulo">Estad&iacute;stica de Morosidad</td>
                                       </tr>
                                       <tr align="center">
                                         <td nowrap width="30%" colspan="7">
                                           <table cellspacing="0" cellpadding="0" border="0" class="texto">
                                             <tr align="left" class="cabeceras">
                                               <td width="23" align="center" nowrap>&nbsp;</td>
                                               <td width="70" nowrap>Sec.</td>
                                               <td width="250" nowrap>Concepto</td>
                                               <td width="80" nowrap>No. Cuentas</td>
                                               <td width="80" nowrap>% Cuentas</td>
                                               <td width="120" nowrap>Saldo</td>
                                             </tr>
                                           </table>
                                           <div style="height:100px; overflow:auto; position:relative; vertical-align:top;width:723px;">
                                             <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegEstMor" dataInfo="arrTblDatEstMor" keys="ecmoIdPrograma,ecmoIdFideicomiso,ecmoIdEmision,ecmoIdPeriodo,ecmoIdSecMor" fun="clickTablaEstMor" radioWidth="23px">
                                             </table>
                                           </div>
                                         </td>
                                       </tr>
                                    </table>
                        </td>
                        <td >
                                    &nbsp;
                        </td>
                     </tr>
                  </table>
              
              
                                       <table id="tableOE"><!--OTROS EVENTOS-->
                                       <tr>
                                         <td nowrap width="30%" colspan="7" align="center" class="subtitulo">Otros Eventos</td>
                                       </tr>
                                       <tr align="center">
                                         <td nowrap width="30%" colspan="7">
                                           <table cellspacing="0" cellpadding="0" border="0" class="texto">
                                             <tr align="left" class="cabeceras">
                                               <td width="23" align="center" nowrap>&nbsp;</td>
                                               <td width="70" nowrap>Sec.</td>
                                               <td width="350" nowrap>Concepto</td>
                                               <!--td width="80" nowrap>No. Cuentas</td-->
                                               <td width="120" nowrap>Importe</td>
                                               <td width="120" nowrap>Disponible</td>
                                             </tr>
                                           </table>
                                           <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:683px;">
                                             <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegOtrEven" dataInfo="arrTblDatOtrEven" keys="ecpgIdPrograma,ecpgIdFideicomiso,ecpgIdEmision,ecpgIdPeriodo,ecfcIdConPag" fun="clickTablaOtrEven" radioWidth="23px">
                                             </table>
                                           </div>
                                         </td>
                                       </tr>
                                    </table>
              
              </td>
            </tr>
            

            <tr>
              <td nowrap width="30%" colspan="7" align="center">
                <input type="BUTTON" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="cargaOpcionReporteDistribucion2(2);"/>
                <input type="button" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="eliminarCatalogo(3);"/>
                <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaOpcionReporteDistribucion2(4);"/>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
</form>
