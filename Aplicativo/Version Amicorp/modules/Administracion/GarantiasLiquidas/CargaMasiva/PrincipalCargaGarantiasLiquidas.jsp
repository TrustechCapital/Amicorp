<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <FORM name="frmGarLiq" id="frmGarLiq" method="post">

      <input type="hidden" id="paramInterfaceID" name="paramInterfaceID" value="1" />
      <input type="hidden" id="paramFechaAnt" name="paramFechaAnt" value="" />
      <input type="hidden" id="paramMesAbierto" name="paramMesAbierto" value="1" />
      <input type="hidden" id="paramUsuario" name="paramUsuario" value="300" />
      
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Interfase Garantias Liquidas</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td>
          <table align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="300">&nbsp;</td>
              <td align="right" nowrap width="100">Fideicomiso:&nbsp;</td>
              <td width="200">
                <input type="text" name="paramFideicomiso" id="paramFideicomiso" tipo="Num" size="10" maxlength="10" onblur="verificacionActivo();" required message="El Fideicomiso es un campo obligatorio"/>
              </td>
              <td width="300"><div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div></td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td>&nbsp;</td>
              <td align="right" nowrap>Tipo:&nbsp;</td>
              <td align="left">
                  <select size="1" name="paramTipo" id="paramTipo" ref="" fun="" keyValue="" theValue="" required message="El Tipo es un campo obligatorio">
                    <option value=-1>--Selecccione--</option>
                    <option value=1>Creditos</option>
                    <option value=2>Disposiciones</option>
                  </select>  
              </td>
              <td colspan=2>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td>&nbsp;</td>
              <td align="right" nowrap>Fecha:&nbsp;</td>
              <td align="left">
                <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" size=10 required message="La Fecha es un campo obligatorio">
              </td>
              <td colspan=2>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td>&nbsp;</td>
              <td align="right" nowrap>Separador:&nbsp;</td>
              <td align="left">
                <input type="text" name="paramSeparador" id="paramSeparador" size="1"  maxlength="1" value=";" required message="El Separador es un campo obligatorio"/>
              </td>
              <td colspan=2>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3">
                <hr/>
              </td>
            </tr>
            <tr>
              <td colspan="4">
                <iframe id="frameUpload" align="middle" style="z-index:1;" src="modules/Administracion/GarantiasLiquidas/CargaMasiva/GarantiasLiquidasUpload.do" frameborder="0" scrolling="no" AllowTransparency width="600" height="50"></iframe>
                <div id="dvInterface" class="texto"></div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
    </form>
  </table>
  
  <div id="dvFileUpload" style="position: absolute; top: 0; left: 0;"></div>
</TD>
