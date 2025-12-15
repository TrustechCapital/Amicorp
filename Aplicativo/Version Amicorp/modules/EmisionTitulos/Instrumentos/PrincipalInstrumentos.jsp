<table align="center" class="texto">
  <tr>
    <td nowrap width="2%">Tasa a Considerar</td>
    <td nowrap colspan="3" width="1%">
      <select size="1" name="eeinTasaConsiderar" id="eeinTasaConsiderar" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbTasaConsiderarParam" next="eeinMayorMenor" required message="La Tasa a Considerar es un campo obligatorio" operacion="Se considerara una tasa del #### "/>
    </td>
    <td nowrap>Tasa Mayor/Menor</td>
    <td nowrap>
      <select size="1" name="eeinMayorMenor" id="eeinMayorMenor" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbTasaMayorMenorParam" next="eintCveInstrumento"/><!-- required message="La Tasa Mayor/Menor es un campo obligatorio"/-->
    </td>
  </tr>
  <tr>
    <td nowrap width="2%">
      <input type="radio" name="rdTasa" id="eeinPublicadaConocer" value2="1" class="radio" onclick="asignaValueRadio2Master('eeinPublicadaConocer',this);" required message="El Tipo de Tasa es un campo obligatorio"/>&nbsp;Tasa Publicada
    </td>
    <td nowrap>
      <input type="radio" name="rdTasa" id="rdTasaConocer" value="2" class="radio" onclick="asignaValueRadio2Master('eeinPublicadaConocer',this);"/>&nbsp;Tasa dada a Conocer
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap>
      <input type="checkbox" name="eeinCapitaEquivalChk" id="eeinCapitaEquivalChk" class="check" tv="1" fv="0"/>&nbsp;Tasa Capitalizada
    </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap width="2%">&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap width="2%">Sobretasa</td>
    <td nowrap>
      <input type="text" name="eeinPjeSobretasa" id="eeinPjeSobretasa" size="10" maxlength="19" tipo="Money" reqPrecValue="16.2"/>
    </td>
    <td nowrap>
      <!--input type="checkbox" name="eeinPpAdicionalChk" id="eeinPpAdicionalChk" class="check" tv="1" fv="0"/>&nbsp;PP Adicional-->
    </td>
    <td nowrap>&nbsp;
      </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap width="2%">
      <input type="checkbox" name="eeinIsrChk" id="eeinIsrChk" class="check" tv="1" fv="0" onclick="estableceObjetosInstrumento(this);"/>&nbsp;Utilizar ISR
    </td>
    <td nowrap width="1%">Monto de ISR</td>
    <td nowrap>
      <input type="text" name="eeinImpIsr" id="eeinImpIsr" size="10" maxlength="19" tipo="Money" reqPrecValue="16.2" value="0" style="visibility:hidden" message="El Monto de ISR es un campo obligatorio"/>
    </td>
    <td nowrap>&nbsp;
    </td>
    <td nowrap>
      <input type="text" name="eeinStEmiinte" id="eeinStEmiinte" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
    </td>
    <td nowrap>&nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap colspan="6" align="center">
      <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionCatalogoInstrumentos();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaDetalleParametrosCalculo(2);" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="6">
      <hr/>
    </td>
  </tr>
  <tr>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="5" class="subtitulo">Captura de Instrumentos</td>
  </tr>
  <tr>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="3">&nbsp;</td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>&nbsp;</td>
    <td nowrap>Clave de Instrumento</td>
    <td nowrap colspan="3">
      <select size="1" name="eintCveInstrumento" id="eintCveInstrumento" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbClaveInstrumentoParam" next="asignaValues2ObjHTMLInstrumentos" onchange="asignaPlazoInstrumento(this)" message="La Clave de Instrumento es un campo obligatorio"/>
    </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>&nbsp;</td>
    <td nowrap>Plazo</td>
    <td nowrap colspan="3">
      <input type="text" name="eintPlazo" id="eintPlazo" size="10" maxlength="10" tipo="Num" message="El Plazo es un campo obligatorio"/>
    </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>&nbsp;</td>
    <td nowrap>
      <input type="radio" name="rdInstrumento" id="eintTipoInstPlazo" value2="1" class="radio" onclick="asignaValueRadio2Master('eintTipoInstPlazo',this);" message="El Tipo de Instrumento es un campo obligatorio"/>&nbsp;Instrumento a su Plazo
    </td>
    <td nowrap colspan="3">
      <input type="radio" name="rdInstrumento" id="rdInstrumentoPlazoMaximo" value="2" class="radio" onclick="asignaValueRadio2Master('eintTipoInstPlazo',this);"/>&nbsp;Instrumento Plazo M&aacute;ximo
    </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6" nowrap align="center">
      <input type="text" name="eintIdSecInstrumento" id="eintIdSecInstrumento" size="2" style="visibility:hidden"/>
      <input type="text" name="eintStEmiinst" id="eintStEmiinst" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
      <input type="text" name="paramPrograma" id="paramPrograma" size="5" style="visibility:hidden"/>
      <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="5" style="visibility:hidden"/>
      <input type="text" name="paramEmision" id="paramEmision" size="5" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td height="100%" align="center" colspan="6">
      <input type="button" value=" Limpiar " name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiaDatosInstrumento(tblReg);" style="visibility:hidden"/>
      <input type="button" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="ejecutaOperacionInstrumento(1);" style="visibility:hidden"/>
      <input type="button" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="ejecutaOperacionInstrumento(2);" style="visibility:hidden"/>
      <input type="button" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="ejecutaOperacionInstrumento(3);" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap colspan="6" align="center" class="subtitulo">Instrumentos</td>
  </tr>
  <tr>
    <td nowrap colspan="6" align="center">
      <table cellspacing="0" cellpadding="0" border="0" class="texto">
        <tr align="left" class="cabeceras">
          <td width="23" nowrap>&nbsp;</td>
          <td width="50" nowrap>Sec.</td>
          <td width="250" nowrap>Instrumento</td>
          <td width="50" nowrap>Plazo</td>
          <td width="100" nowrap>Tipo de Inst.</td>
        </tr>
      </table>
      <div style="height:100px; overflow:auto; position:relative; vertical-align:top;width:486px">
        <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eintIdPrograma,eintIdFideicomiso,eintIdEmision,eintIdSecInstrumento,eintCveInstrumento,eintPlazo,eintTipoInstPlazo" fun="clickTabla2" radioWidth="23px">
        </table>
      </div>
    </td>
  </tr>
</table>

<div id="dvOperacion"></div>
