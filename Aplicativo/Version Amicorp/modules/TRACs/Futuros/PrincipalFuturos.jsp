<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Futuros</td>
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
                            <tr id="gar_0" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)" siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaFuturos(this,'1,2,3','Compra')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Compra</td>
                            </tr>
                            <tr id="gar_1" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaFuturos(this,'0,2,3','Venta')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Venta</td>
                            </tr>
                            <tr id="gar_2" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaFuturos(this,'0,1,3','Provisión Intereses')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Provisión Intereses</td>
                            </tr>
                            <tr id="gar_3" class="pestaniaKYC" claseOriginal="pestaniaKYC" onmouseover="cambiaClassFila(this)"  siSeleccionada="NO" onmouseout="cambiaClassFila(this)" onclick="clickPestaniaFuturos(this,'0,1,2','Pago Intereses')">
                              <td align=center style="font-size: 11px; font-family: Arial, Helvetica, sans-serif;color: #FFFFFF;">Pago Intereses</td>
                            </tr>
                          </table>
                          
                      </td>
                      <td align="center" height="300" class="divPantallaDark" valign="top">
                        <div id="tituloFuturos" style="position:absolute; top:5px;color:#888888;font-size:20;"> 
                          Seleccione Opción
                        </div>
                        <div id="contenedorLineaCred" style="vertical-align:top;width:600"><br>
                            <input type="hidden" id="paramorder" name="paramorder" value="s" style="position:absolute;"/>
                            
                              <table align="center" class="texto" border="0"  cellpadding="2" cellspacing=2>
                                <tr valign="middle">
                                  <td align="left" colspan=2>
                                    <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" style="width:300;" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fideicomiso</td>
                                  <td align="left">
                                    <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="paramPizarra" required message="El Fideicomiso es un campo obligatorio" onchange="cargaCmbFuturos(this);"/>
                                  </td>
                                  <td nowrap>Pizarra</td>
                                  <td align="left">
                                    <select size="1" name="paramPizarra" id="paramPizarra" ref="conPriEmi" fun="loadComboElement" keyValue="emiNomPizarra" theValue="emiNomPizarra"  param="cmbEmision" next="paramSCta" required message="La Pizarra es un campo obligatorio" onchange="cargaSeCu(this);"/>
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
                                    <select id="paramSCta" value="" name="paramSCta" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctIdNomSubCuenta" next="paramCtoInver" param="cmbScta" onchange="cargaCmbFuturos2(this);" required message="La Sub Cuenta es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>Cto. Inversión</td>
                                  <td align="left">
                                    <select id="paramCtoInver" value="" name="paramCtoInver" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprNomIntermed" next="" param="cmbCtoInver" required message="El Contrato de Inversión es un campo obligatorio" onchange="consultaPosicionFuturos(GI('cmdConsultar'));"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>No. Ctos. de Futuros</td>
                                  <td align="left">
                                    <input type="text" id="CtosFut" name="CtosFut" maxlength="10" size="10" tipo="Num" required message="El número de Ctos. de Futuro es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>IPC</td>
                                  <td align="left">
                                    <input type="text" id="IPC" name="IPC" maxlength="10" size="10" tipo="Money" required message="El IPC es un campo obligatorio"/>
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td nowrap>Fecha</td>
                                  <td align="left">
                                    <input type="text" id="fFecha" name="fFecha" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
                                  </td>
                                  <td nowrap>&nbsp;</td>
                                  <td align="left">
                                    &nbsp;  
                                  </td>
                                </tr>
                                <tr valign="middle">
                                  <td  colspan=4 align="center">
                                  <table width="224" cellpadding="0" cellspacing="0">
                                    <tr>
                                    <td width="112"  align="center" valign="middle">
                                      <input type="BUTTON" value="Ejecutar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="conNumCredito" fun="loadTableElement" tabla="tablaCreditos" onclick="funcionFuturos();">
                                      </td>
                                      <td width="112" align="center" valign="middle">
                                      <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar();"/>
                                    </td>
                                    </tr>
                                </table> 
                                  </td>
                                </tr>
                                <tr valign="middle" >
                                  <td id="posFuturos" colspan=4 align="center" style="visibility:hidden">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                          <tr align="left" class="cabeceras">
                                            <td width="23px">
                                              <input type="BUTTON" value="" id="cmdConsultar" name="cmdConsultar" class="btnSearch" ref="qryFuturosTrack" fun="loadTableElement" tabla="tabla" onclick="consultaPosicionFuturos(this)" title="Consultar"/> 
                                            </td>
                                            <td width="50px">Fiso</td>
                                            <td width="50px">SubCta</td>
                                            <td width="80px">CtoInver</td>
                                            <td width="80px">Id</td>
                                            <td width="100px">Fec Compra</td>
                                            <td width="80px">Pizarra</td>
                                            <td width="50px">Serie</td>
                                            <td width="50px">Cupón</td>
                                            <td width="80px">Contratos</td>
                                            <td width="100px">V Nominal</td>
                                            <td width="80px">IPC</td>
                                          </tr>
                                        </table>
                                        <div style="height:150px; width:823px; overflow:auto; position:relative; vertical-align:top;">
                                          <table id="tabla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaData" keys="defNumContratos,defIpc,defIdSecuencial" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                                          </table>
                                        </div> 
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
