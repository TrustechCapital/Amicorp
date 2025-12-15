<table align="center" class="texto">
  <tr>
    <td colspan="6" align="center">
      <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaDetalleParametrosCalculo(2);" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap width="30%">&nbsp;</td>
    <td nowrap width="7%">&nbsp;</td>
    <td nowrap colspan="3">&nbsp;</td>
    <td nowrap width="5%">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap width="30%">&nbsp;</td>
    <td nowrap width="7%">Pais</td>
    <td nowrap colspan="3">
      <select size="1" name="eedpIdPais" id="eedpIdPais" ref="conNumPaiNomPai" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="asignaValues2ObjHTMLDiasFeriadosPaises" message="El Pais es un campo obligatorio"/>
    </td>
    <td nowrap width="5%">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6" nowrap align="center">
      <input type="text" name="eedpStEmidiasf" id="eedpStEmidiasf" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
      <input type="text" name="paramPrograma" id="paramPrograma" size="5" style="visibility:hidden"/>
      <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="5" style="visibility:hidden"/>
      <input type="text" name="paramEmision" id="paramEmision" size="5" style="visibility:hidden"/>
      <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td height="100%" align="center" colspan="6">
      <input type="button" value=" Limpiar " name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiaDatosDiasFeriadosPaises(tblReg);" style="visibility:hidden"/>
      <input type="button" value="  Alta   " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionDiasFeriadosPaises(1);" style="visibility:hidden"/>
      <input type="button" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="ejecutaOperacionDiasFeriadosPaises(3);" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap colspan="6" align="center" class="subtitulo">Dias Feriados Paises</td>
  </tr>
  <tr>
    <td nowrap colspan="6" align="center">
      <table cellspacing="0" cellpadding="0" border="0" class="texto">
        <tr align="left" class="cabeceras">
          <td width="23" nowrap>&nbsp;</td>
          <td width="200" nowrap>Programa</td>
          <td width="200" nowrap>Fideicomiso</td>
          <td width="200" nowrap>Emision</td>
          <td width="150" nowrap>Pais</td>
        </tr>
      </table>
      <div style="height:100px; overflow:auto; position:relative; vertical-align:top;width:810px">
        <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eedpIdPrograma,eedpIdFideicomiso,eedpIdEmision,eedpIdPais" fun="clickTabla6" radioWidth="23px">
        </table>
      </div>
    </td>
  </tr>
</table>
