<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Archivo de Depositos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Estado del D&eacute;posito</td>
            <td>
              <input type="radio" name="rdEstadoDeposito" id="rdEstadoDeposito1" class="radio" value2="1" required message="El Estado del Déposito es un campo obligatorio" onclick="asignaValueRadio2Master('rdEstadoDeposito1',this);"/>Operable
            </td>
            <td>
              <input type="radio" name="rdEstadoDeposito" id="rdEstadoDeposito2" class="radio" value="2" onclick="asignaValueRadio2Master('rdEstadoDeposito1',this);"/>No operable
            </td>
            <td>
              <input type="radio" name="rdEstadoDeposito" id="rdEstadoDeposito3" class="radio" value="3" onclick="asignaValueRadio2Master('rdEstadoDeposito1',this);"/>Cancelado
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Archivo</td>
            <td colspan="3">
              <input type="radio" name="rdArchivo" id="rdArchivo1" class="radio" value2="1" required message="El Archivo es un campo obligatorio" onclick="asignaValueRadio2Master('rdArchivo1',this);"/>Control Operativo
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">
              <input type="radio" name="rdArchivo" id="rdArchivo2" value="2" class="radio" onclick="asignaValueRadio2Master('rdArchivo1',this);"/>Administraci&oacute;n Fiduciaria
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">
              <input type="radio" name="rdArchivo" id="rdArchivo3" value="3" class="radio" onclick="asignaValueRadio2Master('rdArchivo1',this);"/>Mesa de Dinero
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">
              <input type="radio" name="rdArchivo" id="rdArchivo4" value="4" class="radio" onclick="asignaValueRadio2Master('rdArchivo1',this);"/>Formas de Recepci&oacute;n
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">
              <input type="radio" name="rdArchivo" id="rdArchivo5" value="5" class="radio" onclick="asignaValueRadio2Master('rdArchivo1',this);"/>Contabilidad
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Fecha de Recepci&oacute;n</td>
            <td colspan="3">
              <input type="text" name="txtFechaAnterior" id="txtFechaAnterior" maxlength="10" size="10" tipo="Fecha"/>&nbsp;de&nbsp;
              <input type="text" name="txtDeFechaAnterior" id="txtDeFechaAnterior" maxlength="5" size="5" onblur="validaHora(this);" required message="La Hora es un campo obligatorio"/>&nbsp;a&nbsp;
              <input type="text" name="txtAFechaAnterior" id="txtAFechaAnterior" maxlength="5" size="5" onblur="validaHora(this);" required message="La Hora es un campo obligatorio"/>&nbsp;hrs.
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>&nbsp;</td>
            <td colspan="3">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="asignaFechaValor" maxlength="10" tipo="Fecha"/>&nbsp;de&nbsp;
              <input type="text" name="txtDeFechaContable" id="txtDeFechaContable" maxlength="5" size="5" onblur="validaHora(this);" required message="La Hora es un campo obligatorio"/>&nbsp;a&nbsp;
              <input type="text" name="txtAFechaContable" id="txtAFechaContable" maxlength="5" size="5" onblur="validaHora(this);" required message="La Hora es un campo obligatorio"/>&nbsp;hrs.
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>
              <a  id="linkArchivo" href="#"></a>
            </td>
            <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hh24:mm59 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hh24:mm59</td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaFuncionArchivosDepositos();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Tesoreria.ArchivosDepositos.PrincipalArchivosDepositos','');"/>
      </td>
    </tr>
  </table>
</form>
