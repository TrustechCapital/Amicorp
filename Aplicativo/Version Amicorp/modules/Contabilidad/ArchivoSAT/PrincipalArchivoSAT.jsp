<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Archivo SAT</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td width="13%" nowrap>Ejercicio</td>
            <td colspan="4" nowrap>
              <select size="1" name="cmbEjercicio" id="cmbEjercicio" fun="loadComboElement" keyValue="movAnoMovto" theValue="movAnoMovto" next="formsLoaded" param="cmbEjercicioParam" required message="El Ejercicio es un campo obligatorio"/>
            </td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td width="13%" nowrap>Tipo de Archivo</td>
            <td nowrap width="13%">
              <input type="radio" name="rdTipoArchivo" id="rdTipoArchivo" class="radio" value2="1" required message="El Tipo de Archivo es un campo obligatorio" onclick="asignaValueRadio2Master('rdTipoArchivo',this);"/>
              &nbsp;Fiduciario
            </td>
            <td nowrap width="13%">
              <input type="radio" name="rdTipoArchivo" id="rdFideicomiso" class="radio" value="2"  onclick="asignaValueRadio2Master('rdTipoArchivo',this);"/>
              &nbsp;Fideicomiso
            </td>
            <td nowrap width="13%">
              <input type="radio" name="rdTipoArchivo" id="rdFideicomitente" class="radio" value="3" onclick="asignaValueRadio2Master('rdTipoArchivo',this);"/>
              &nbsp;Fideicomitente
            </td>
            <td nowrap width="13%">
              <input type="radio" name="rdTipoArchivo" id="rdFideicomisario" class="radio" value="4" onclick="asignaValueRadio2Master('rdTipoArchivo',this);"/>
              &nbsp;Fideicomisario
            </td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td width="13%" nowrap>Separador</td>
            <td colspan="4" nowrap>
              <input type="radio" name="rdSeparador" id="rdSeparador" class="radio" value2="  " required message="El Separador es un campo obligatorio" onclick="asignaValueRadio2MasterX('rdSeparador',this);"/>&nbsp;Tabulaci&oacute;n</td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td width="13%" nowrap>&nbsp;</td>
            <td colspan="4" nowrap>
              <input type="radio" name="rdSeparador" id="rdPuntoComa" value=";" class="radio" onclick="asignaValueRadio2MasterX('rdSeparador',this);"/>&nbsp;Punto y Coma</td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td width="13%" nowrap>&nbsp;</td>
            <td colspan="4" nowrap>
              <input type="radio" name="rdSeparador" id="rdComa" value="," class="radio" onclick="asignaValueRadio2MasterX('rdSeparador',this);"/>&nbsp;Coma
            </td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td width="13%" nowrap>&nbsp;</td>
            <td colspan="4" nowrap>
              <input type="radio" name="rdSeparador" id="rdEspacio" value=" " class="radio" onclick="asignaValueRadio2MasterX('rdSeparador',this);"/>&nbsp;Espacio</td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td nowrap width="13%">&nbsp;
            
            </td>
            <td nowrap>
              <input type="radio" name="rdSeparador" id="rdOtro" class="radio" onclick="SA(GI('txtSeparador'),'required','true'); muestraObj('txtSeparador');"/>&nbsp;Otro</td>
              <td nowrap>
                <input type="text" name="txtSeparador" id="txtSeparador" maxlength="1" size="1" message="El Carácter Separador es un campo obligatorio" onblur="asignaValueRadio2Master('rdSeparador',this);"/>
              </td>
              <td nowrap width="30%" colspan="2">
                <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a> 
                <input type="text" name="txtAno" id="txtAno" size="4" maxlength="4" ref="conFecCon" fun="asignaAnoMovimiento" style="visibility:hidden"/>
              </td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionArchivoSAT();"/>
      </td>
    </tr>
  </table>
</form>
