<form name="frmDatos" id="frmDatos" onsubmit=" ">
  <table width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">
        <div id="dvTitulo">Par&aacute;metros de C&aacute;lculo</div>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr>
            <td>&nbsp;</td>
            <td>
              <table align="center" class="texto">
                <tr valign="middle">
                  <td nowrap>Id RC</td>
                  <td nowrap colspan="2">
                    <input type="text" name="idRC" id="idRC" size="5" maxlength="10"/>
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
                </tr>
                <tr valign="middle">
                  <td nowrap>No. de Programa</td>
                  <td nowrap colspan="2">
                    <input type="text" name="txtPrograma" id="txtPrograma" size="10" maxlength="10"/>
                  </td>
                  <td nowrap>
                    <div id="dvPrograma" class="textoNegrita">&nbsp;</div>
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap width="1%"><div id="dvFid">Fideicomiso</div></td>
                  <td nowrap width="1%">
                    <input type="text" name="txtFideicomiso" id="txtFideicomiso" size="10" maxlength="10"/>
                  </td>
                  <td nowrap>
                    <div id="dvFideicomiso" class="textoNegrita">&nbsp;</div>
                  </td>
                </tr>
                <tr>
                  <td nowrap>No. de Emisi&oacute;n</td>
                  <td nowrap colspan="2">
                    <input type="text" name="txtEmision" id="txtEmision" size="10" maxlength="10"/>
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap colspan="2">&nbsp;</td>
                  <td nowrap width="5%">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap>Clave Pizarra de Emisi&oacute;n</td>
                  <td colspan="4" nowrap>
                    <input type="text" name="txtPizarra" id="txtPizarra" size="20" maxlength="50"/>
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap colspan="2">No. de Serie de Emisi&oacute;n</td>
                  <td nowrap>
                    <input type="text" name="txtSerie" id="txtSerie" size="20" maxlength="50"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>Moneda</td>
                  <td colspan="4" nowrap>
                    <input type="text" name="txtMoneda" id="txtMoneda" size="20" maxlength="50"/>
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap colspan="2">Importe Valor Nominal en T&iacute;tulos</td>
                  <td nowrap>
                    <input type="text" name="txtImporteVNT" id="txtImporteVNT" size="20" maxlength="20"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>Importe Valor Nominal</td>
                  <td colspan="4" nowrap>
                    <input type="text" name="txtImporteVN" id="txtImporteVN" size="20" maxlength="20" tipo="Money" prec="16.2" />
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap colspan="2"><!--Monto en Circulaci&oacute;n--></td>
                  <td nowrap>
                    <input type="text" name="txtMontoC" id="txtMontoC" size="20" maxlength="20"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>No. de T&iacute;tulos</td>
                  <td colspan="4" nowrap>
                    <input type="text" name="txtTitulos" id="txtTitulos" size="20" maxlength="20"/>
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap colspan="2">Plazo</td>
                  <td nowrap>
                    <input type="text" name="txtPlazo" id="txtPlazo" size="20" maxlength="15"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap>Fecha Inicio Emisión</td>
                  <td colspan="4" nowrap>
                    <input type="text" name="txtFecIni" id="txtFecIni" size="20" maxlength="20"/>
                  </td>
                  <td nowrap>&nbsp;</td>
                  <td nowrap colspan="2">Fecha Fin Emisión</td>
                  <td nowrap>
                    <input type="text" name="txtFecFin" id="txtFecFin" size="20" maxlength="15"/>
                  </td>
                </tr>
                <tr>
                  <td height="100%" align="center" colspan="9">
                    <input type="BUTTON" value="Regresar" name="cmdRegresar" id="cmdRegresar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.ParametrosCalculo.PrincipalParametrosCalculo','')"/>
                  </td>
                </tr>
                <tr>
                  <td nowrap colspan="9">&nbsp;</td>
                </tr>
                <tr>
                  <td nowrap colspan="9">&nbsp;</td>
                </tr>
              </table>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
              <div id="dvContenido2">
                <table class="texto" align=center>
                  <tr>
                    <td id="td_rdOpcion" align=center nowrap width="30%" class="pestaniaEmision" style="cursor:pointer;" onmouseover="mouse(this,'pestaniaEmisionSobre')" onmouseout="mouse(this,'pestaniaEmision')" onclick="mouse(this,'rdOpcion')">
                      Tasas de Rendimiento
                    </td>
                    <td id="td_rdInstrumentos" align=center nowrap colspan="3" width="30%" class="pestaniaEmision" style="cursor:pointer;" onmouseover="mouse(this,'pestaniaEmisionSobre')" onmouseout="mouse(this,'pestaniaEmision')" onclick="mouse(this,'rdInstrumentos')">
                      Instrumentos
                      </td>
                    <!--td id="td_rdProteccionVsInflacion" align=center nowrap colspan="2" width="30%" class="pestaniaEmision" style="cursor:pointer;" onmouseover="mouse(this,'pestaniaEmisionSobre')" onmouseout="mouse(this,'pestaniaEmision')" onclick="mouse(this,'rdProteccionVsInflacion')">
                      Protecci&oacute;n contra Inflaci&oacute;n
                    </td-->
                  </tr>
                  <tr>
                    <td id="td_rdAmortizacion" align=center nowrap width="30%" class="pestaniaEmision" style="cursor:pointer;" onmouseover="mouse(this,'pestaniaEmisionSobre')" onmouseout="mouse(this,'pestaniaEmision')" onclick="mouse(this,'rdAmortizacion')">
                      Amortizaci&oacute;n
                    </td>
                    <td id="td_rdPagos" align=center nowrap colspan="3" width="30%" class="pestaniaEmision" style="cursor:pointer;" onmouseover="mouse(this,'pestaniaEmisionSobre')" onmouseout="mouse(this,'pestaniaEmision')" onclick="mouse(this,'rdPagos')">
                      Pagos
                    </td>
                    <!--td id="td_rdDiasFeriados" align=center nowrap colspan="2" width="30%" class="pestaniaEmision" style="cursor:pointer;" onmouseover="mouse(this,'pestaniaEmisionSobre')" onmouseout="mouse(this,'pestaniaEmision')" onclick="mouse(this,'rdDiasFeriados')">
                      D&iacute;as Feriados
                    </td-->
                  </tr>
                  <!--tr>
                    <td nowrap width="30%" align=center class="pestaniaEmisionIncompleto" style="cursor:pointer;"  onclick="mouse(this,'rdEmisionesAdicionales')">
                      Emisiones Adicionales
                    </td>
                    <td nowrap colspan="3" align=center width="30%" class="pestaniaEmisionIncompleto" style="cursor:pointer;" onclick="mouse(this,'rdEmisionesSegregables')">
                      Emisiones Segregables
                    </td>
                    <td nowrap colspan="2" align=center width="30%" class="pestaniaEmisionIncompleto" style="cursor:pointer;"  onclick="mouse(this,'rdInteresesMoratorios')">
                      Intereses Moratorios
                    </td>
                  </tr-->
                </table>
              </div>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan=3>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdOpcion" value2="PrincipalTasasRendimiento" ref="emision.verETExiTasRen" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);" required message="Es necesario seleccionar una opción"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdInstrumentos" value="PrincipalInstrumentos" ref="emision.verETExiIns" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdProteccionVsInflacion" value="PrincipalProteccionVsInflacion" ref="emision.verETExiProInf" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdAmortizacion" value="PrincipalAmortizacion" ref="emision.verETExiAmo" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdPagos" value="PrincipalPagos" ref="emision.verETExiPag" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdDiasFeriados" value="PrincipalDiasFeriadosPaises" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdEmisionesAdicionales" value="PrincipalEmisionesAdicionales" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);" disabled/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdEmisionesSegregables" value="PrincipalEmisionesSegregables" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);" disabled title="Emisiones Segregables"/>
                    <input style="visibility:hidden;position:absulute;" type="radio" name="rdOpcion" id="rdInteresesMoratorios" value="PrincipalInteresesMoratorios" class="radio" onclick="validaTipoOperacionOpcionParametrosCalculo('rdOpcion',this);" disabled/>
                    
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td >&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td align="center">
        <input type="BUTTON" value="   Alta  " name="cmdAltaPrincipal" id="cmdAltaPrincipal" class="boton" onclick="cargaOpcionParametrosCalculo(1);" disabled/>
        <input type="BUTTON" value="Modificar" name="cmdModificarPrincipal" id="cmdModificarPrincipal" class="boton" onclick="cargaOpcionParametrosCalculo(2);" disabled/>
        <input type="button" value="Consultar" name="cmdConsultarPrincipal" id="cmdConsultarPrincipal" class="boton" onclick="cargaOpcionParametrosCalculo(4);" disabled/>
      </td>
    </tr>
  </table>
</form>