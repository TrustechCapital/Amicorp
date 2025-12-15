<form name="frmCargaDuplicar" id="frmCargaDuplicar" onsubmit="" enctype="multipart/form-data">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Carga Duplicar</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
         <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%">Fideicomiso</td>
            <td width="15%">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td nowrap>
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>&nbsp;
            </td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="NombreArchivo" id="NombreArchivo" size="15" style="visibility:hidden"/>
            </td>
            <td width="15%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap width="15%">
              <input type="radio" name="rdTipoMovimiento" id="rdTipoIndividualizacion" value2="1" class="radio"  required message="El Fideicomiso es un campo obligatorio" onclick="asignaValueRadio2Master('rdTipoMovimiento',this)"/>Duplicar
            </td>
            <td nowrap>&nbsp;
              </td>
            <td nowrap>&nbsp;
              </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="3" align="center">
              <iframe id="frameUpload" align="middle" style="z-index:1;" src="<%=request.getContextPath()%>/modules/Garantias/Inmuebles/CargaDuplicar/FileUpload.do" frameborder="0" scrolling="no" width="100%" height="100px" AllowTransparency>
              </iframe>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Cargar " name="cmdCargar" id="cmdAceptar" class="boton" onclick="ejecutaCargaDuplicar();" style="visibility:hidden"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Contabilidad.BienesFideicomitidos.CargaDuplicar.PrincipalCargaDuplicar','');" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>