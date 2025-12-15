<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Líneas de Crédito</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
      
      <table cellpading=0 cellspacing=0>
                    <tr>
                      <td width="168" align="right" height="300" style="vertical-align:top;">
                        
                          <table border =0 cellpadding=0 cellspacing=0 width="168" >
                            <tr id="gar_0" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)" siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaLineas(this,'1,2,3,4','Registro')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Registro</td>
                            </tr>
                            <tr id="gar_1" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)" siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaLineas(this,'0,2,3,4','Disposición')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Disposición</td>
                            </tr>
                            <tr id="gar_2" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaLineas(this,'0,1,3,4','Pago Línea')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Pago Línea</td>
                            </tr>
                            <tr id="gar_3" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaLineas(this,'0,1,2,4','Provisión Intereses')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Provisión Intereses</td>
                            </tr>
                            <tr id="gar_4" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaLineas(this,'0,1,2,3','Pago Intereses')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Pago Intereses</td>
                            </tr>
                          </table>
                          
                      </td>
                      <td align="center" height="300" class="divPantallaDark" valign="top">
                        <div id="tituloLineasCred" style="position:absolute; top:5px;color:#888888;font-size:20;"> 
                          Seleccione Opción
                        </div>
                        <div id="contenedorLineaCred" style="vertical-align:top;width:600"><br>
                            <input type="hidden" id="paramOrder" name="paramOrder" value="s" style="position:absolute;"/>
                            
                              <table align="center" class="texto" border="0"  cellpadding="1" cellspacing=1>
                                <tr valign="middle">
                                  <td align="left" colspan=2>
                                    <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" style="width:300;" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fideicomiso</td>
                                  <td align="left">
                                    <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="paramLinea" required message="El Fideicomiso es un campo obligatorio" onchange="cargaCmbLineas(this);"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Línea de Crédito</td>
                                  <td align="left">
                                    <select id="paramLinea" name="paramLinea" ref="cmbLineasCredito" fun="loadComboElement" keyValue="lcrIdLinea" theValue="lcrNomLinea" next="paramctaCheques" param="cmbLineasCredito" required  message="La Línea de Crédito es un campo obligatorio" onchange="getSubcuenta();"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Sub Cuenta</td>
                                  <td align="left">
                                    <div id="dvSubCuenta" style ="font-weight:bold;">...</div>
                                    <input type="hidden" id="paramsCta" name="paramsCta" maxlength="10" size="10" style="position:absolute;"/>

                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Cuenta de Cheques</td>
                                  <td align="left">
                                  <select id="paramctaCheques" name="paramctaCheques" ref="muestraCuentaBancaria" fun="loadComboElement" keyValue="fcbaClabeCba" theValue="fcbaClabeCba" next="formsLoaded" param="cmbCtaCheques"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fecha</td>
                                  <td align="left">
                                    <input type="text" id="paramFecha" name="paramFecha" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Importe</td>
                                  <td align="left">
                                    <input type="text" id="paramImporte" name="paramImporte" maxlength="10" size="10" tipo="Money" required message="El Importe es un campo obligatorio"/>
                                  </td>
                                </tr>
                                
                                <tr valign="middle">
                                  <td  colspan=2>
                                    &nbsp; 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=2 align="center">
                                  <table width="224" cellpadding="0" cellspacing="0">
                                    <tr>
                                    <td width="112"  align="center" valign="middle">
                                      <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="conNumCredito" fun="loadTableElement" tabla="tablaCreditos" onclick="funcionLineasCredito();">
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
                    </tr>
                  </table>
      
      </td>
    </tr>
  </table>
</FORM>
