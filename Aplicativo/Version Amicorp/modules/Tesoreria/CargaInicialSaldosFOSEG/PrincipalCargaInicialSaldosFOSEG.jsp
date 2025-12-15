<form name="frmDatos" id="frmDatos" onsubmit="" enctype="multipart/form-data">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Carga Inicial de Saldos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%">Fideicomiso</td>
            <td colspan="2">
              <select size="1" name="Fideicomiso" id="Fideicomiso" ref="conNumFidNomFidFOSEG" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="txtFechaContable" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%">Ejercicio</td>
            <td>
              <input type="text" name="txtEjercicio" id="txtEjercicio" size="4" maxlength="4" required message="El Ejercicio es un campo obligatorio" tipo="Num" onblur="if(this.value!='' && this.value.length!=4){alert('Introduzca un Ejercicio valido!');this.value='';}"/>
            </td>
            <td>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap width="15%">Origen de Recursos</td>
            <td>
              <select size="1" name="cmbOrigenRecursos" id="cmbOrigenRecursos" required message="El Origen de Recursos es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="1">FEDERAL</option>
                <option value="2">ESTATAL</option>
                <option value="3">RENDIMIENTOS</option>
              </select>
            </td>
            <td>
              <input type="text" name="NombreArchivo" id="NombreArchivo" size="15" style="visibility:hidden"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%">Concepto</td>
            <td colspan="2">
              <input type="text" name="txtConcepto" id="txtConcepto" size="50" required message="El Concepto es un campo obligatorio" tipo="AlphaNumeric" maxlength="250"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap width="15%">&nbsp;
              </td>
            <td nowrap>
              <input type="radio" name="rdTipo" id="rdTipoA" value2="1" class="check" required message="El Tipo de Carga es un campo obligatorio" onclick="asignaValueRadio2Master('rdTipoA',this)"/>&nbsp;Aportaciones
            </td>
            <td nowrap>
              <input type="radio" name="rdTipo" id="rdTipoC" value="2" class="check" onclick="asignaValueRadio2Master('rdTipoA',this)"/>&nbsp;Carga Inicial
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
              <iframe id="frameUpload" align="middle" style="z-index:1;" src="<%=request.getContextPath()%>/modules/Tesoreria/CargaInicialSaldosFOSEG/FileUpload.do" frameborder="0" scrolling="no" width="100%" height="100px">
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
        <input type="button" value="Cargar " name="cmdCargar" id="cmdAceptar" class="boton" onclick="ejecutaCargaInicial();" style="visibility:hidden"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClick('Tesoreria.CargaInicialSaldosFOSEG.PrincipalCargaInicialSaldosFOSEG','');" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
