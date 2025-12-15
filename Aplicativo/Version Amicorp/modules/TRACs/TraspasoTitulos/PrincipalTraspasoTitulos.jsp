<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Traspaso Títulos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
        
        <div id="contenedorLineaCred" style="vertical-align:top;width:600"><br>
                            <input type="hidden" id="paramorder" name="paramorder" value="s" style="position:absolute;"/>
                            
                              <table align="center" class="texto" border="0"  cellpadding="2" cellspacing=2>
                                <tr valign="middle">
                                  <td nowrap>Fideicomiso</td>
                                  <td align="left" colspan=3>
                                    <select size="1" name="paramNumFideicomiso" id="paramNumFideicomiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="SCtaO" required message="El Fideicomiso es un campo obligatorio" onchange="cargaCmbTraspaso(this);"/>
                                  </td>
                                  
                                </tr>   
                                <tr valign="middle">
                                  <td  colspan=4>
                                    <hr> 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 class="subtitulo" align =left>
                                    Origen
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Sub Cuenta</td>
                                  <td align="left">
                                    <select id="SCtaO" name="SCtaO" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctIdNomSubCuenta" next="paramNumContratoInversion" param="cmbScta" onchange="cargaCmbTraspaso2(this,'O');" required message="La Sub Cuenta Origen es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>Cto. Inversión</td>
                                  <td align="left">
                                    <select id="paramNumContratoInversion" name="paramNumContratoInversion" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprNomIntermed" next="SCtaD" param="cmbCtoInverO" required message="El Contrato de Inversión Origen es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 class="subtitulo" align =left>
                                    Destino
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Sub Cuenta</td>
                                  <td align="left">
                                    <select id="SCtaD" name="SCtaD" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctIdNomSubCuenta" next="CtoInverD" param="cmbScta" onchange="cargaCmbTraspaso2(this,'D');" required message="La Sub Cuenta Destino es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>Cto. Inversión</td>
                                  <td align="left">
                                    <select id="CtoInverD" name="CtoInverD" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprNomIntermed" next="paramNumMercado" param="cmbCtoInverD" required message="El Contrato de Inversión Destino es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4>
                                    <hr> 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fecha</td>
                                  <td align="left">
                                    <input type="text" id="tFecha" name="tFecha" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>Mercado</td>
                                  <td align="left">
                                    <select size="1" name="paramNumMercado" id="paramNumMercado" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave"  param="cmbMercadoParam" next="formsLoaded" required message="El mercado es un campo obligatorio" onchange="GI('cmdConsultar').click();"/>
                                 </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>No. Titulos</td>
                                  <td align="left">
                                    <input type="text" id="numTitulos" name="numTitulos" maxlength="10" size="10" tipo="Num" required message="El número de Títulos es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>Importe</td>
                                  <td align="left">
                                    <input type="text" id="importe" name="importe" maxlength="10" size="10" tipo="Money" required message="El Importe es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4>
                                    &nbsp; 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 align="center" class="subtitulo">
                                    Datos Emisión
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 align="center">
                                  
                                    <table cellspacing="0" cellpadding="0" border="0">
                                      <tr align="left" class="cabeceras">
                                        <td width="23px">
                                          <input type="BUTTON" value="" id="cmdConsultar" name="cmdConsultar" class="btnSearch" ref="conPriPosCon" fun="loadTableElement" tabla="tabla" onclick="consultaPosicionTraspaso(this)" title="Consultar"/> 
                                        </td>
                                        <td width="200px">Pizarra</td>
                                        <td width="80px">Serie</td>
                                        <td width="80px">Cupón</td>
                                        <td width="100px">Posición
                                        </td>
                                      </tr>
                                    </table>
                                    <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                                      <table id="tabla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaData" keys="posNomPizarra,posNumSerEmis,posNumCuponVig" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                                      </table>
                                    </div>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 align="center">
                                  <table width="224" cellpadding="0" cellspacing="0">
                                    <tr>
                                    <td width="112"  align="center" valign="middle">
                                      <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" onclick="funcionTraspaso();">
                                      </td>
                                      <td width="112" align="center" valign="middle">
                                      <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar();"/>
                                    </td>
                                    </tr>
                                </table> 
                                  </td>
                                </tr>
                                </table>
                        </div>
        
        </td>  
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td colspan = 2 align="left">
        <div id="dvProcedimiento">
        </div>
      
      </td>
    </tr>
  </table>
</FORM>
