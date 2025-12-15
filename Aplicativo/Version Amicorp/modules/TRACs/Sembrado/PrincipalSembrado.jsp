<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Sembrado</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
      
      <table cellpading=0 cellspacing=0 style = "position:relative;">
                    <tr>
                      <td width="168" align="right" height="300" style="vertical-align:top;">
                        
                          <table border =0 cellpadding=0 cellspacing=0 width="168" >
                            
                            <tr id="gar_1" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaSembrado(this,'0,2,3','Recepción NAFTRACs T-2')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Recepción NAFTRACs T-2</td>
                            </tr>
                            <tr id="gar_2" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaSembrado(this,'0,1,3','Entrega NAFTRACs T')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Entrega NAFTRACs T</td>
                            </tr>
                            <tr id="gar_0" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)" siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaSembrado(this,'1,2,3','Emisión Inicial')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Emisión Inicial</td>
                            </tr>
                            <tr id="gar_3" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaSembrado(this,'0,1,2','Colocación')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Colocación</td>
                            </tr>
                          </table>
                          
                      </td>
                      <td align="center" height="300" class="divPantallaDark" valign="top">
                        <div id="tituloSembrado" style="position:absolute; top:5px;color:#888888;font-size:20;"> 
                          Seleccione Opción
                        </div>
                        <div id="contenedorLineaCred" style="vertical-align:top;width:600"><br>
                            <input type="hidden" id="paramOrder" name="paramOrder" value="s" style="position:absolute;"/>
                            
                              <table align="center" class="texto" border="0"  cellpadding="2" cellspacing=2>
                                <tr valign="middle">
                                  <td align="left" colspan=2>
                                    <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" style="width:300;" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fideicomiso</td>
                                  <td align="left">
                                    <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="paramSCta" required message="El Fideicomiso es un campo obligatorio" onchange="cargaCmbSembrado(this);"/>
                                  </td>
                                  <td nowrap>Pizarra</td>
                                  <td align="left">
                                    <div id="paramPizarra" style="font-weight:bold;">...</div> 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Serie</td>
                                  <td align="left">
                                    <div id="paramSerie" style="font-weight:bold;">...</div> 
                                  </td>
                                  <td nowrap>Cupón</td>
                                  <td align="left">
                                    <div id="paramCupon" style="font-weight:bold;">...</div> 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4>
                                    <hr> 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Sub Cuenta</td>
                                  <td align="left">
                                    <select id="paramSCta" name="paramSCta" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctNombreSubCuenta" next="paramCtoInver" param="cmbScta" onchange="cargaCmbSembrado2(this);" required message="La Sub Cuenta es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>Cto. Inversión</td>
                                  <td align="left">
                                    <select id="paramCtoInver" name="paramCtoInver" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprNomIntermed" next="paramTercero" param="cmbCtoInver" required message="El Contrato de Inversión es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Tercero</td>
                                  <td align="left">
                                    <select id="paramTercero" name="paramTercero" ref="conNumTerceroNomTercero" fun="loadComboElement" keyValue="terNumTercero" theValue="terNomTercero" next="" param="cmbTercero"  required message="El Tercero es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>No. NAFTRACS</td>
                                  <td align="left">
                                    <input type="text" id="paramUnidades" name="paramUnidades" maxlength="10" size="10" tipo="Num" required message="El número de Unidades es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fecha aplicación</td>
                                  <td align="left">
                                    <input type="text" id="paramFecha" name="paramFecha" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
                                  </td>
                                   <td nowrap>Precio</td>
                                  <td align="left">
                                    <input type="text" id="paramImporte" name="paramImporte" maxlength="10" size="10" tipo="Money" required message="El IPC es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4>
                                    &nbsp; 
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 align="center">
                                  <table width="224" cellpadding="0" cellspacing="0">
                                    <tr>
                                    <td width="112"  align="center" valign="middle">
                                      <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="conNumCredito" fun="loadTableElement" tabla="tablaCreditos" onclick="funcionSembrado();">
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
