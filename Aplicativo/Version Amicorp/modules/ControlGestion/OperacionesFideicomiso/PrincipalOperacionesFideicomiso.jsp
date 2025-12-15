<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Operaciones Por Fideicomiso</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%">Fideicomiso</td>
            <td width="15%">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td nowrap>
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="consultaConceptosAsignados">&nbsp;</div>
            </td>
            <td>&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="5" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">
              <table id="tabs" cellpadding="0" cellspacing="0" border="0" align="left">
                <tr>
                  <td class="tab_blanco_azul">
                    <img src="imagenes/spacer.gif" width="37" height="1"/>
                  </td>
                  <td class="tab_relleno_azul" onclick="cambiaTab(this,'onButtonClickPestania(\'ControlGestion.OperacionesFideicomiso.PrincipalOperacionesFideicomiso\',\'\')');">Conceptos de Dep. y Ret</td>
                  <td class="tab_azul_claro">
                    <img src="imagenes/spacer.gif" width="37" height="1"/>
                  </td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this,'cargaPrincipalCuentasPersonasOperacionesFideicomiso()');">Cuentas y Personas (Liquidaciones)</td>
                  <td class="tab_claro_blanco">
                    <img src="imagenes/spacer.gif" width="35" height="1"/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" class="subtitulo" align="center">Conceptos</td>
          </tr>
          <tr>
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="100" nowrap>N. Oper</td>
                  <td width="300" nowrap>Descripci&oacute;n</td>
                  <td width="150" nowrap>Tipo de Operaci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:573px">
                <table id="tblRegConFid" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegConDat" keys="oafNumOperacion,oafNumClave,tipoOperacion" fun="clickTabla1" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" class="subtitulo" align="center">
              <input type="button" value="Agregar" name="cmdAgregar" id="cmdAgregar" onclick="agregarConcepto();"/>
              <input type="button" value="  Quitar  " name="cmdQuitar" id="cmdQuitar" onclick="quitarConcepto();"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" class="subtitulo" align="center">Conceptos Asignados</td>
          </tr>
          <tr>
            <td colspan="5">
              <table cellspacing="0" width="50%" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="100" nowrap>N. Oper</td>
                  <td width="300" nowrap>Descripci&oacute;n</td>
                  <td width="150" nowrap>Tipo de Operaci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:92%">
                <table id="tblRegConAsiFid" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegConDat" keys="oafNumOperacion,oafNumClave,descripcion,tipoOperacion,columna4,columna5,columna6,columna7,columna8,columna9,columna10,columna11,columna12,columna13,columna14,columna15" fun="clickTabla2" radioWidth="23">
                </table>
              </div>
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
        <input type="button" value="Cuentas X Fisos" name="cmdCuentasFisos" id="cmdCuentasFisos" class="boton" ref="conPriConFid" fun="loadTableElement" tabla="tblRegConFid" onclick="if(fvOperacionesFideicomiso.checkForm())cargaPrincipalCuentasFideicomiso();"/>
        <input type="button" value="Personas I" name="cmdPersonasI" id="cmdPersonasI" class="boton" ref="conPriConAsiFid" fun="loadTableElement" tabla="tblRegConAsiFid" onclick="if(fvOperacionesFideicomiso.checkForm())cargaPrincipalPersonasIFideicomiso();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
