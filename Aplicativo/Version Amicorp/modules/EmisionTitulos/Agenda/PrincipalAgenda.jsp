<FORM name="frmDatosPrincipalAgenda" id="frmDatosPrincipalAgenda" onsubmit=" ">
  <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="vertical-align:top;">
      <tr>
        <td align="center" height="100%" class="titulo">Agenda de Eventos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto"> 
           <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td nowrap>Usuario</td>
              <td>
                <select size="1" name="paramnumUsu" id="paramnumUsu" ref="muestraUsuariosActivos" fun="loadComboElement" keyValue="perNumUsuario" theValue="perNomUsuario" param="statusUsuActivo" next="paramPrograma" style="width:120;"/>
              </td>       
                <td width="45%" align=left>
                <input type="checkbox" id="edito" name="edito" onclick="if(this.checked){GI('paramnumUsu').name ='paramusuMod';GI('paramnumUsu').id ='paramusuMod';}else{GI('paramusuMod').name ='paramnumUsu';GI('paramusuMod').id ='paramnumUsu';}">&nbsp;Ultima Modificación
              </td>
            </tr>
            
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td>
              &nbsp;  
              </td>              
              <td width="25%">
                <input type="checkbox" id="siUnAno" name="siUnAno" onclick="if(this.checked){SA(GI('cmdAceptar'),'ref','qryConsultaAgendaUnAno')}else{SA(GI('cmdAceptar'),'ref','qryConsultaAgenda')}">&nbsp;Completar Año
             </td>
            </tr>
            
            <tr valign="middle" style="width:120;position:absolute;visibility:hidden">
              <td width="25%">&nbsp;</td>
              <td nowrap>No. Folio</td>
              <td>
                <input type="text" name="paramidFolio" id="paramidFolio" tipo="Num" size="10" maxlength="10" style="width:120;position:absolute;visibility:hidden"/>
              </td>              
              <td width="25%">&nbsp;</td>
            </tr>
            </tr>
             <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Id RC</td>
              <td>
                <input type="text" name="paramidRC" id="paramidRC" tipo="Texto" size="10" maxlength="5" onblur="upperRC(this);cargaProgFid(this,GI('paramPrograma'),GI('paramFideicomiso'),GI('paramNumEmision'));"/>
              </td>              
              <td width="25%">&nbsp;</td>
            </tr>
            </tr>
             <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Emision</td>
              <td>
                <select size="1" name="paramNumEmision" id="paramNumEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie"  next="paramStatus" style="width:120;" param="cmbEmision"><!--onchange="cargaComboSiguiente(this);" /-->
                     <option value="-1">-- Seleccione --</option>
                  </select>
              </td>              
              <td width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Programa</td>
              <td>
                  <select size="1" disabled name="paramPrograma" id="paramPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramFideicomiso" param="cmbPrograma" style="width:120;"/>
              </td>              
              <td width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Fideicomiso</td>
              <td>
                  <select size="1" disabled name="paramFideicomiso" id="paramFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="paramNumEmision" param="cmbFideicomiso" style="width:120;"/>
              </td>              
              <td width="25%">&nbsp;</td>
            
             <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Estatus</td>
              <td>
                <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo7" next="formsLoaded" style="width:120;"/>
              </td>              
              <td width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="25%" colspan="2"  class="subtitulo">
              Fecha por Periodo
              <hr/>
              </td>
              <td width="25%">
                &nbsp;
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Fecha Inicio</td>
              <td>
                 <input type="hidden" id="paramAtrasado" maxlength="10" size="10" name="paramAtrasado" style="position:absolute;"/>
                 <input type="text" id="paramfecEvento" maxlength="10" size="10" name="paramfecEvento" tipo="Fecha" onchange="GI('paramfecfinEvento').value=this.value" onclick="GI('botonLista').click();GI('skinhelper-Normal').rel = 'stylesheet'; GI('skinhelper-Minis').rel = '';GI('incluir_personalizados').value=0;consultaFeriados();"/>
              </td>              
              <td width="25%">
                Fecha Fin&nbsp;&nbsp;
               <input type="text" id="paramfecfinEvento" maxlength="10" size="10" name="paramfecfinEvento" tipo="Fecha" onclick="GI('botonLista').click();GI('skinhelper-Normal').rel = 'stylesheet'; GI('skinhelper-Minis').rel = '';GI('incluir_personalizados').value=0;consultaFeriados();"/>
              </td>
            </tr>
            
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td  colspan="5" align="center" valign="middle">
              <table width="224" cellpadding="0" cellspacing="0">
              <tr>
              <td width="112"  align="center" valign="middle">
                <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="qryConsultaAgendaEmision" fun="loadTableElement" tabla="tablaConsultaAgenda" onclick="consultaAgenda(this);">
                </td>
                <td width="112" align="center" valign="middle">
                <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar(frmDatosPrincipalAgenda);"/>            
              
              </td>
              </tr>
              </table>
              </td>
            </tr>

              <td width="100%" colspan="5" align="center" valign="middle">
                <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <input type="hidden" id="incluir_personalizados" value="0">
            <tr>  <input type="BUTTON" value="" title="Ver Calendarios" id="botonCalendario" class="CalendarioAgenda"  style="position:absolute;top:200px;left:10px" onclick="GI('botonLista').className='ListaAgenda';this.className='CalendarioAgendaSobre';GI('incluir_personalizados').value=1;consultaFeriados();"/>
                    <input type="BUTTON" value="" title="Ver Lista"  id="botonLista" class="ListaAgenda" style="position:absolute;top:200px;left:55px"  onclick="GI('botonCalendario').className='CalendarioAgenda';this.className='ListaAgendaSobre';GI('div_resultados').style.visibility='visible';GI('mosaico_calendarios').style.visibility='hidden';"/>                                  
              <td colspan="5" align="center" valign="middle">
                <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoAgenda(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoAgenda(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="cargaMantenimientoAgenda(3)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Reporte" id="cmdReporte" name="cmdReporte" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="ObtenReporte()"/>   </td>           
                  </td>
                </tr>
                </table>
              </td>
            </tr> 
            <tr align="center">            
              <td colspan="5">
              <div id="div_resultados">
                <table cellspacing="0" cellpadding="0" border="0"  class="cabeceras">
                  <tr align="left">
                    <td width="20px">&nbsp;</td>
                    <td width="60px">Folio</td>
                    <td width="50px">Id RC</td>
                    <td width="70px">Fideicomiso</td>
                    <td width="70px">Subcuenta</td>
                    <td width="100px">Programa</td>
                    <td width="80px">Emision</td>
                    <td width="70px">Serie</td>
                    <td width="80px">Fecha</td>
                    <td width="400px">Descripción</td>
                    <td width="100px">Periodicidad</td>
                    <td width="50px">Eventos</td>                    
                    <td width="100px">Estatus</td>
                  </tr>
                </table>
                <div style="height:300px; overflow:auto; position:relative; vertical-align:top; width:1323px;">
                  <table id="tablaConsultaAgenda" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaAgendaData" keys="eageIdFolio,eageNumEventos,eagePeriodicidad,eageFecEvento" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
            </div>
                <div id="mosaico_calendarios" style="visibility:hidden;position:absolute;top:250px;left:0px;height:400px; overflow:auto; width:850px;z-index:2;">
                  <table>
                    <tr>
                      <td style="color: #070 !important; font-weight: bold; font-size:11px">eventos activos</td><td width="23px">&nbsp;</td>
                      <td style="color: #f00 !important; font-weight: bold; font-size:11px">eventos pendientes</td><td width="23px">&nbsp;</td>
                      <td style="color: #004 !important; font-weight: bold; font-size:11px">eventos atendidos</td><td width="23px">&nbsp;</td>
                      <td style="color: #00f !important; font-weight: bold; font-size:11px">fecha actual</td><td width="23px">&nbsp;</td>
                      <td style="color: #830 !important; font-weight: bold; font-size:11px">dia feriado</td><td width="23px">&nbsp;</td>
                    </tr>                  
                  </table>
                  <table align="center" cellpadding="0" cellspacing="0">                 
                  <tr>
                    <td><div id="calendar1"></div></td><td width="60"></td>
                    <td><div id="calendar2"></div></td><td width="60"></td>
                    <td><div id="calendar3"></div></td><td width="60"></td>
                    <td><div id="calendar4"></div></td><td width="60"></td>
                    <td><div id="calendar5"></div></td><td width="60"></td>
                    <td><div id="calendar6"></div></td><td width="60"></td>
                  </tr>
                  <tr>
                    <td colspan="12" height="50"></td>                    
                  </tr>
                  <tr>
                    <td><div id="calendar7"></div></td><td width="60"></td>
                    <td><div id="calendar8"></div></td><td width="60"></td>
                    <td><div id="calendar9"></div></td><td width="60"></td>
                    <td><div id="calendar10"></div></td><td width="60"></td>
                    <td><div id="calendar11"></div></td><td width="60"></td>
                    <td><div id="calendar12"></div></td><td width="60"></td>
                  </tr>                    
                  
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
            <tr>
                <td width="60%" height="100%">&nbsp;</td>
              </tr>
                <tr>
                  <td width="60%" height="100%" align="center">
                    <a id="linkReporte" href="#" style="visibility:hidden" target="_new">Archivo</a> 
                    <a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a>
                    <input type="hidden" id="refSP" name="refSP" value=""/>
                    <input type="hidden" id="refQry" name="refQry" value="muestraTextosAgenda"/>
                    <input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Administracion/EnviarCorreoAgenda.jsp"/>
                    <input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
                    <input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false"/>
                    <input type="hidden" id="paramnumFolio" name="paramnumFolio" value=""/>
                    
                  </td>
                </tr>             
            <tr>      
  </table>
</FORM>
