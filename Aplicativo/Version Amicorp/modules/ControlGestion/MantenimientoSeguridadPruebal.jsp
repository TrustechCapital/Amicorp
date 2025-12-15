<FORM name="frmMantenimientoSeguridadPruebal" id="frmMantenimientoSeguridadPruebal" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">
        <P>Personal</P>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td class="subtitulo" width="20%">&nbsp;</td>
            <td nowrap width="7%">N&uacute;mero</td>
            <td width="35%">
              <input type="text" name="perNumUsuario" id="perNumUsuario" tipo="Num" size="10" maxlength="10" onblur="verificaExistenciaRegistro();" required message="El Número de Usuario es un dato obligatorio"/>
            </td>
            <td class="subtitulo" nowrap width="8%">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Nombre</td>
            <td colspan="3">
              <input type="text" name="perNomUsuario" id="perNomUsuario" size="50" maxlength="50" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td class="subtitulo" nowrap width="7%" colspan="4">Datos Generales
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">&nbsp;</td>
            <td width="35%">&nbsp;</td>
            <td nowrap width="8%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Clave</td>
            <td width="35%">
              <input type="text" name="perClave" id="perClave" size="8" maxlength="8" required message="La Clave es un campo obligatorio"/>
            </td>
            <td nowrap width="8%">Fecha de Ingreso</td>
            <td>
              <input type="text" name="txtFecIngreso" id="txtFecIngreso" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('perDiaIng'),GI('perMesIng'),GI('perAnoIng'));" required message="La Fecha de Ingreso es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Nivel</td>
            <td width="35%">
              <input type="text" name="perRangoNivel" id="perRangoNivel" size="10" maxlength="10" required message="El Nivel es un campo obligatorio"/>
            </td>
            <td nowrap width="8%">Fecha de Nacimiento</td>
            <td>
              <input type="text" name="txtFecNacimiento" id="txtFecNacimiento" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('perDiaNac'),GI('perMesNac'),GI('perAnoNac'));" required message="La Fecha de Nacimiento es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">N&oacute;mina
            </td>
            <td width="35%">
              <input type="text" name="perNumNomina" id="perNumNomina" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">RFC
            </td>
            <td width="35%">
              <input type="text" name="perRfc" id="perRfc" size="20" maxlength="20" required message="El RFC es un campo obligatorio"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Tel&eacute;fono Particular
            </td>
            <td width="35%">
              <input type="text" name="perTelefParti" id="perTelefParti" size="20" maxlength="20" required message="El Teléfono Particular es un campo obligatorio"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">&nbsp;
            </td>
            <td width="35%">&nbsp;</td>
            <td nowrap width="8%">&nbsp;
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Registro del IMSS</td>
            <td width="35%">
              <input type="radio" name="rdRegistroIMSS" id="perImss" value2="SI" class="radio" onclick="asignaValueRadio2Master('perImss',this)" required message="El Registro del IMSS es un dato obligatorio"/>Si &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="rdRegistroIMSS" id="perImss2" value="0" class="radio" onclick="asignaValueRadio2Master('perImss',this)"/>No
            </td>
            <td nowrap width="8%">No. Hijos</td>
            <td>
              <input type="text" name="perNoHijos" id="perNoHijos" tipo="AlphaNumeric" size="2" maxlength="2"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Direcci&oacute;n</td>
            <td colspan="3">
              <textarea name="perDireccion" id="perDireccion" style="width:400px;height:80px" onkeydown="validaLongitud(this,110);" required message="La Dirección es un campo obligatorio"></textarea>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Estado Civil</td>
            <td width="35%">
              <input type="radio" name="rdEdoCivil" id="perEdoCivil" class="radio" value2="1" onclick="asignaValueRadio2Master('perEdoCivil',this)" required message="El Estado Civil es un dato obligatorio"/>Soltero &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <input type="radio" name="rdEdoCivil" id="perEdoCivil2" class="radio" value="2" onclick="asignaValueRadio2Master('perEdoCivil',this)"/>Divorciado &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="rdEdoCivil" id="perEdoCivil3" class="radio" value="3" onclick="asignaValueRadio2Master('perEdoCivil',this)"/>Casado</td>
            <td nowrap width="8%">
</td>
            <td>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">&nbsp;</td>
            <td width="35%">
              <input type="radio" name="rdEdoCivil" id="perEdoCivil4" class="radio" value="4" onclick="asignaValueRadio2Master('perEdoCivil',this)"/>Viudo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
              <input type="radio" name="rdEdoCivil" id="perEdoCivil5" class="radio" value="5" onclick="asignaValueRadio2Master('perEdoCivil',this)"/>Union Libre</td>
            <td nowrap width="8%">
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%">Sueldo</td>
            <td width="35%">
              <input type="text" name="perSueldoPerc" id="perSueldoPerc" tipo="Money" size="11" maxlength="11" prec="8.2" reqPrecValue/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">
        <input type="text" name="perDiaIng" id="perDiaIng" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
        <input type="text" name="perMesIng" id="perMesIng" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
        <input type="text" name="perAnoIng" id="perAnoIng" tipo="Num" size="4" maxlength="4" style="visibility:hidden"/>
        <input type="text" name="perDiaNac" id="perDiaNac" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
        <input type="text" name="perMesNac" id="perMesNac" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
        <input type="text" name="perAnoNac" id="perAnoNac" tipo="Num" size="4" maxlength="4" style="visibility:hidden"/>
        <input type="text" name="perNivelEstudios" id="perNivelEstudios" size="1" maxlength="50" value=" " style="visibility:hidden"/>
        <input type="text" name="perTelefono" id="perTelefono" size="1" maxlength="40" value=" " style="visibility:hidden"/>
        <input type="text" name="perExtension" id="perExtension" size="1" maxlength="10" value=" " style="visibility:hidden"/>
        <input type="text" name="perFax" id="perFax" size="1" maxlength="10" value=" " style="visibility:hidden"/>
        <input type="text" name="perAntigPuesto" id="perAntigPuesto" size="1" maxlength="10" value=" " style="visibility:hidden"/>
        <input type="text" name="perDesPza" id="perDesPza" size="1" maxlength="100" value=" " style="visibility:hidden"/>
        <input type="text" name="perRegistroAsis" id="perRegistroAsis" size="1" maxlength="20" value=" " style="visibility:hidden"/>
        <input type="text" name="perObservaciones" id="perObservaciones" size="1" maxlength="250" value=" " style="visibility:hidden"/>
        <input type="text" name="perUbicacion" id="perUbicacion" size="1" maxlength="30" value=" " style="visibility:hidden"/>
        <input type="text" name="perClaveInic" id="perClaveInic" size="1" maxlength="10" value=" " style="visibility:hidden"/>
        <input type="text" name="perCargoFide" id="perCargoFide" size="1" maxlength="40" value=" " style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadPersonal();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr/>
  </table>
</FORM>
