<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Reporte PLD &nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="90%">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Fideicomiso</td>
            <td>
              <!--input type="text" name="paramFideicomiso" id="paramFideicomiso" tipo="Num" size="10" maxlength="10" onblur="verificacioncredito(this);"/-->
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" tipo="Num" size="10" maxlength="10" onblur="verificacionActivo(this);"/>
            </td>
            <td width="25%">
              &nbsp;
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Fecha Inicio</td>
            <td>
              <input type="text" name="paramFechaInicio" id="paramFechaInicio" tipo="Fecha" size="10" maxlength="10" required message="La Fecha Inicio es un campo obligatorio"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Fecha Fin</td>
            <td>
              <input type="text" name="paramFechaFin" id="paramFechaFin" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Tipo Operaci�n</td>
            <td>
              <select name="paramTipoOperacion" id="paramTipoOperacion" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo705" onchange="this.disabled=true;" />
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="qryOperacionesRelevantesCreditos" fun="loadTableElement" tabla="tblReg" onclick="consultaOperacionesRelevantes(this)"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
              <input type="button" value="Archivo PLD" name="cmdArchivo" class="boton" onclick="generaReporteOperacionesPLD();"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden;"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" class="subtitulo">Operaciones</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="100" nowrap>Fiso/Credito</td>
                  <td width="100" nowrap>Folio</td>
                  <td width="150" nowrap>Tipo Operaci�n</td>
                  <td width="150" nowrap>Importe</td>
                  <td width="300" nowrap>Descripci�n</td>
                  <td width="100" nowrap>Fecha</td>
                </tr>
              </table>
              <div style="height:180px; overflow:auto; position:relative; vertical-align:top; width:923px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="folio,status" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de b�squeda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" class="subtitulo">Reporte
            <input type="button" value="Aceptar" name="cmdAceptarReporte" id="cmdAceptarReporte" class="boton" ref="qryReporteOperacionesRelevantes" fun="loadTableElement" tabla="tblRegReporte" onclick="consultar(this,frmDatos, false);" style="visibility:hidden;position:absolute;"/>
              </td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="100" nowrap>Fiso/Credito</td>
                  <td width="100" nowrap>Folio</td>
                  <td width="150" nowrap>Tipo Operaci�n</td>
                  <td width="150" nowrap>Importe</td>
                  <td width="300" nowrap>Descripci�n</td>
                  <td width="100" nowrap>Fecha</td>
                </tr>
              </table>
              <div style="height:180px; overflow:auto; position:relative; vertical-align:top; width:923px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegReporte" dataInfo="arrTblDat" keys="folio,status" fun="clickTablaReporte" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>


            <tr>
              <td></td>  
              <td></td>  
              <td height="100%">
                <table align="center" class="texto" width="90%">
                  <tr>
                    <td width="20%"><input type="checkbox" name="paramChkRep" id="paramChkRep" class="check"/>Reporta CNBV</td>
                    <td width="25%">Fecha Reporte</td>
                    <td width="25%"><input type="text" name="paramFechaRep" id="paramFechaRep" tipo="Fecha" size="10" maxlength="10" /></td>
                    <td width="25%">Nombre Reporte</td>
                    <td width="25%"><input type="text" name="paramNombreRep" id="paramNombreRep" size="50" maxlength="50" /></td>
                  </tr>                
                </table>
              </td>  
            </tr>
            
          <tr>
            <td colspan="4" align="right">
              <input type="button" value="Aceptar" name="cmbReporte" id="cmbReporte" class="boton" onclick="generaReporteOperacionesRelevantes()"/>&nbsp;&nbsp;&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;<a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
