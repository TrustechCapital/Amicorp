<FORM name="frmCharolaSolicitudes" id="frmCharolaSolicitudes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="vertical-align:top;">
      <tr>
        <td align="center" height="100%" class="titulo">Charola de Solicitudes No Monetarias</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr>
              <td width="30%"><input type="hidden" id="txtuserId" name="txtusername" value="<%=session.getAttribute("userid")%>" /></td>
              <td width="10%">Etapa</td>
              <td colspan="2">
                <input type="text" name="paramEtapa" id="paramEtapa" ref="qryMuestraNombreEtapa" fun="loadTxtElementX" theValue="nombreEtapa"  param="asignaPerfil" next="formsLoaded" size="25" disabled="disabled"/>
              </td>
              <td width="30%">
                <input type="text" name="Perfil" id="Perfil" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("puestoId")!=null?session.getAttribute("puestoId").toString():"0"%>" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="30%"><input type="hidden" id="paramStatus" name="paramStatus"/></td>
              <td width="10%">Fideicomiso</td>
              <td colspan="2"><input type="text" name="paramFiso" id="paramFiso"  size="10"  onchange="verNomFiso();"></input></td>
              <td width="30%"><div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div></td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="10%">Folio</td>
              <td colspan="2"><input  id="paramnumfolio" name="paramnumfolio" size="10" fun="loadTableElement" tabla="tblRegCharSol"/></input></td>
              <td width="30%"><input id="paramNomUsuario" name="paramNomUsuario" type="hidden" value="<%=session.getAttribute("username").toString()%>"/></td>
            </tr>    
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td colspan="2"><input  id="paramnumEtapa" name="paramnumEtapa" size="10" style="visibility:hidden" /></input></td>
              <td width="30%"><input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/></td>
            </tr>             
            <tr><td colspan="5" align="center" valign="middle">&nbsp;
            </td></tr>
            <tr>
              <td colspan="5" align="center" valign="middle">
                <input type="button" value="Buscar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="qryCharolInstrucAdmon" fun="loadTableElement" tabla="tblRegCharSol" param="paramQueryAdmon" onclick="consultar(this, frmCharolaSolicitudes, false);"/>
                <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="regresarAlaCharola();"/>
              </td>
            </tr>
            <tr><td colspan="5" align="center" valign="middle">&nbsp;
            </td></tr>
          </table>

        </td>
      </tr>
<tr><td align="center" valign="middle"><font color="#2C3587" size="-1"><strong>Solicitudes con Estatus ACTIVO</strong></font></td></tr>
<tr>
<td align="center">
                <table cellspacing="1" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px">&nbsp;</td>
                    <td width="100px">Folio</td>
                    <td width="100px">Fch Instrucción</td>                    
                    <td width="70px">Fideicomiso</td>
                    <td width="100px">Tipo Instruccion</td>
                    <td width="300px">Solicitud</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:693px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegCharSol" dataInfo="arrTblDatCharSol" keys="insNumContrato,insNumFolioInst,insCveStInstruc,insNumOper,insTxtComentario" fun="clickTablaCharSol" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </td>
             </tr>
<tr><td align="center" valign="middle">&nbsp;</td></tr>
<tr><td align="center" valign="middle">
                <input type="BUTTON" value="Puntos de Revisión" class="boton" onclick="funcionDelBoton(1);">
                <input type="BUTTON" value="    Documentos    " class="boton" onclick="funcionDelBoton(2);">
</td></tr>
<tr><td align="center" valign="middle">&nbsp;</td></tr>
<tr><td align="center" valign="middle">
                <input type="BUTTON" name="cmdAutoriza" value="Autorizar" class="boton" onclick="autorizaRechaza(1);">
                <input type="BUTTON" name="cmdRechaza" value="Rechazar" class="boton" onclick="autorizaRechaza(2);">
</td></tr>
<tr align="center"><td colspan="5"><a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a></td></tr>
  </table>
</FORM>