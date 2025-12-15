<form name="frmDatos" id="frmDatos" onsubmit="" enctype="multipart/form-data">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;"> 
    <tr>
      <td align="center" height="100%" class="titulo">Carga Masiva de Movimientos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%" nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>"/>
            </td>
            <td nowrap width="15%" colspan="4">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
            </td>
            <td nowrap width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();" next="txtFechaMovimientos">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%" nowrap>Separador de Campos</td>
            <td nowrap width="15%">
              <input type="radio" name="rdSeparador" id="rdSeparador" class="radio" value2="t" required message="El Separador es un campo obligatorio" onclick="asignaValueRadio2MasterX('rdSeparador',this);"/>
              Tabulador
            </td>
            <td nowrap width="15%">
              <input type="radio" name="rdSeparador" id="rdComa" value="," class="radio" onclick="asignaValueRadio2MasterX('rdSeparador',this);"/>
              Coma
            </td>
            <td nowrap width="15%">
              <input type="radio" name="rdSeparador" id="rdOtro" class="radio" onclick="SA(GI('txtSeparador'),'required','true'); muestraObj('txtSeparador');"/>
              Otro
            </td>
            <td width="15%">
              <input type="text" name="txtSeparador" id="txtSeparador" maxlength="1" size="1" message="El Carácter Separador es un campo obligatorio" onblur="asignaValueRadio2Master('rdSeparador',this);"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%" nowrap>Tipo de Movimiento</td>
            <td nowrap>
              <input type="radio" name="rdTipoMovimiento" id="rdTipoMovimiento" class="radio" value2="D" required message="El Tipo de Movimiento es un campo obligatorio" onclick="asignaValueRadio2Master('rdTipoMovimiento',this);" onchange="ejecutaborrartabla();"/>
              &nbsp;Dep&oacute;sitos
            </td>
            <td nowrap>
              <input type="radio" name="rdTipoMovimiento" id="rdRetiro" class="radio" value="R" onclick="asignaValueRadio2Master('rdTipoMovimiento',this);" onchange="ejecutaborrartabla();"/>&nbsp;Retiros
            </td>
            <td nowrap colspan="2">&nbsp;
              </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%" nowrap>Fecha de Movimientos</td>
            <td>
              <input type="text" name="txtFechaMovimientos" id="txtFechaMovimientos" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaContable" tipo="Fecha"/>
            </td>
            <td>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="6" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="NombreArchivo" id="NombreArchivo" size="5" style="visibility:hidden" />
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="5" align="center"><a href="" style="visibility:hidden">Aqui Frame</a></td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="5" align="center">
              <iframe id="frameUpload" align="middle" style="z-index:1;" src="<%=request.getContextPath()%>/modules/CuentasIndividuales/CargaMasivaMovimientos/FileUpload.do" frameborder="0" AllowTransparency scrolling="no" width="100%" height="100px">
              </iframe>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          </table>
          <table align="center" class="texto" width="100%">
          <tr>
          <td width="15%">&nbsp;</td>
          <td colspan="3" height="69" align="right">
           <div id="divArchivo" style="visibility:hidden">Archivo seleccionado:</div>
            <td colspan="5" height="69" align="left">
            <textarea name="archivo" id="archivo" disabled="disabled" rows="3" cols="31" style="visibility:hidden"></textarea>
          </td>
          </td>
          <table align="center" class="texto" width="100%">
          <tr>
           <td colspan="3" height="65" align="center">&nbsp;
            <input type="button" value="Cargar " name="cmdCargar" id="cmdAceptar" class="boton" onclick="ejecutaCargaMasiva();" style="visibility:hidden"/>
            <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="cargaPantalla();" style="visibility:hidden"/>
          </td>
          </tr>
          </table>     
        </table>
      </td>
    </tr>
  </table>
  <a id="ligaArchivo" href="#"/>  
</form>
