<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Movimientos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Fideicomiso</td>
            <td>Subcontrato</td>
            <td>Importe</td>
            <td>Folio</td>
            <td>Concepto</td>
            <td>D&iacute;a</td>
            <td>Mes</td>
            <td>A&ntilde;o</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramSubcontrato" id="paramSubcontrato" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramImporte" id="paramImporte" size="16" maxlength="17" tipo="Money" prec="14.2" reqPrecValue/>
            </td>
            <td>
              <input type="text" name="paramFolio" id="paramFolio" size="10" maxlength="10" tipo="Num" onblur="porFolio(this);"/>
            </td>
            <td>
              <input type="text" name="paramTransaccion" id="paramTransaccion" size="5" maxlength="5" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramDia" id="paramDia" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[0]%>"/>
            </td>
            <td>
              <input type="text" name="paramMes" id="paramMes" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[1]%>"/>
            </td>
            <td>
              <input type="text" name="paramAno" id="paramAno" size="4" maxlength="4" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[2]%>" required message="El Año es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <input type="checkbox" name="paramchkStatus" id="paramchkStatus" onclick="cambiaStatus(this,paramStatus);" class="check"/>&nbsp;Cancelados
            </td>
            <td>&nbsp;
              </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Descripcion</td>
            <td colspan="6">
              <input type="text" name="paramDescripcion" id="paramDescripcion" size="50" onblur="convertirMayusculas(this)"/>
            </td>
           <td>&nbsp;
              </td> 
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramStatus" id="paramStatus" size="2" value="ACTIVO" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="9">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriMov" fun="loadTableElement" tabla="tblRegPriMov" onclick="if(fvCat.checkForm())consultarSaveParameters(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="9">
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaPrincipalConsultarConsultaMovimientos();"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="9">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td nowrap width="23">&nbsp;</td>
                  <td width="30" nowrap>D&iacute;a</td>
                  <td width="32" nowrap>Mes</td>
                  <td width="32" nowrap>A&ntilde;o</td>
                  <td width="83" nowrap>Fideicomiso</td>
                  <td width="83" nowrap>Subcontrato</td>
                  <td width="70" nowrap>Folio</td>
                  <td width="70" nowrap>Concepto.</td>
                  <td width="300" nowrap>Descripci&oacute;n</td>
                  <td width="150" nowrap>Importe</td>
                  <td width="56" nowrap>Usuario</td>
                  <td width="44" nowrap>E/S</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:990px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriMov" dataInfo="arrTblMovDat" keys="movAnoMovto,movMesMovto,movDiaMovto,movNumContrato,movSubContrato,movFolioOpera,movNumModulo,movNumTransac" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
