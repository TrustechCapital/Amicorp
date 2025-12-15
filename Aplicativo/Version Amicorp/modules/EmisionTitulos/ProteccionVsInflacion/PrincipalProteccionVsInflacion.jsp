<table align="center" class="texto" width="35%">
  <tr>
    <td nowrap colspan="2">
      <input type="checkbox" name="eepiProtInflacionChk" id="eepiProtInflacionChk" class="check" tv="1" fv="2" onclick="estableceObjetosProteccion(this);"/>&nbsp;Protecci&oacute;n contra Inflaci&oacute;n
    </td>
  </tr>
  <tr>
    <td nowrap colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>Periodo de C&aacute;lculo</td>
    <td nowrap>
      <select size="1" name="eepiPeriodoCalculo" id="eepiPeriodoCalculo" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbPeriodoCalculoParam" next="eepiNumMonedaInfla" message="El Periodo de Cálculo es un campo obligatorio" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap>Moneda</td>
    <td nowrap>
      <select size="1" name="eepiNumMonedaInfla" id="eepiNumMonedaInfla" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="asignaValues2ObjHTMLProteccion" message="La Moneda es un campo obligatorio" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <input type="text" name="eepiStEmiproi" id="eepiStEmiproi" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
    </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap align="center" colspan="2">
      <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionProteccion();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaDetalleParametrosCalculo(2);" style="visibility:hidden"/>
    </td>
  </tr>
</table>
