<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <FORM name="frmPresupuestoAnualHonorariosMantenimiento" id="frmPresupuestoAnualHonorariosMantenimiento" onsubmit="">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento a Presupuesto de Honorarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">N&uacute;m. Fideicomiso</td>
              <td width="15%">
                <input type="text" name="prhNumContrato" id="prhNumContrato" tipo="Num" size="10" onblur="mostrarDatosInformativos(2);" required/>
              </td>
              <td colspan="3" width="60%">&nbsp;
                <input type="text" name="txtNomFiso" id="txtNomFiso" tipo="AlphaNumeric" size="50"/>
              </td>
            </tr>
            <tr>
              <td width="25%">A&ntilde;o</td>
              <td colspan="2">
                <input type="text" name="prhAnoRegistro" id="prhAnoRegistro" tipo="Num" size="4" maxlength="4" onblur="mostrarDatosInformativos(2);"/>
              </td>
              <td>Suma Presupuesto Anual</td>
              <td>
                <input type="text" name="prhTotalAno" id="prhTotalAno" tipo="Num" size="15" onchange="presupuestoTotalActivado(this.value);"/>
              </td>
            </tr>
            <tr>
              <td width="25%" colspan="5">
                <hr/>
              </td>
            </tr>
            <tr>
              <td width="25%" class="subtitulo">Calendario Anual</td>
              <td width="25%" colspan="2">&nbsp;</td>
              <td width="25%">&nbsp;</td>
              <td width="25%">
                <input type="text" name="prhCveStPreshon" id="prhCveStPreshon" tipo="AlphaNumeric" size="15" value="ACTIVO" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="25%" colspan="2">&nbsp;</td>
              <td width="25%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Enero</td>
              <td width="25%" colspan="2">Febrero</td>
              <td width="25%">Marzo</td>
              <td width="25%">Abril</td>
            </tr>
            <tr>
              <td width="25%">
                <input type="text" name="prhEnePres" id="prhEnePres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%" colspan="2">
                <input type="text" name="prhFebPres" id="prhFebPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%">
                <input type="text" name="prhMarPres" id="prhMarPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%">
                <input type="text" name="prhAbrPres" id="prhAbrPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
            </tr>
            <tr>
              <td width="25%">Mayo</td>
              <td width="25%" colspan="2">Junio</td>
              <td width="25%">Julio</td>
              <td width="25%">Agosto</td>
            </tr>
            <tr>
              <td width="25%">
                <input type="text" name="prhMayPres" id="prhMayPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%" colspan="2">
                <input type="text" name="prhJunPres" id="prhJunPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%">
                <input type="text" name="prhJulPres" id="prhJulPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%">
                <input type="text" name="prhAgoPres" id="prhAgoPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
            </tr>
            <tr>
              <td width="25%">Septiembre</td>
              <td width="25%" colspan="2">Octubre</td>
              <td width="25%">Noviembre</td>
              <td width="25%">Diciembre</td>
            </tr>
            <tr>
              <td width="25%">
                <input type="text" name="prhSepPres" id="prhSepPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%" colspan="2">
                <input type="text" name="prhOctPres" id="prhOctPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%">
                <input type="text" name="prhNovPres" id="prhNovPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
              <td width="25%">
                <input type="text" name="prhDicPres" id="prhDicPres" tipo="Money" size="15" onchange="sumaPresupuesto(this.value);"/>
              </td>
            </tr>
            <tr>
              <td colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" valign="middle">Comentario</td>
              <td align="center" valign="middle">&nbsp;</td>
              <td align="center" valign="middle">&nbsp;</td>
              <td align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="5" align="center" valign="middle">
                <textarea name="prhComentario" id="prhComentario" style="width:400px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="verificaSumaTotales();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalPresupuestoAnualHonorarios();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
    </FORM>
  </table>
</TD>
