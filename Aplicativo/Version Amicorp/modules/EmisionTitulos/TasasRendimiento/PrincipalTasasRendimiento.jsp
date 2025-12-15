<table align="center" class="texto" width="100%">
  <tr>
    <td nowrap>
      <input type="radio" name="rdTipoTasa" id="eereTipoCalculo" value2="1" class="radio" onclick="estableceObjetosTasa('eereTipoCalculo',this);" required message="El Tipo de Tasa es un campo obligatorio"/>&nbsp;Tasa Fija
    </td>
    <td nowrap colspan="3">
      <input type="radio" name="rdTipoTasa" id="rdTasaVariable" value="2" class="radio" onclick="estableceObjetosTasa('eereTipoCalculo',this);"/>&nbsp;Tasa Variable
    </td>
    <td nowrap colspan="2">
      <!--<input type="radio" name="rdTipoTasa" id="rdTasaPromedio" value="3" class="radio" onclick="estableceObjetosTasa('eereTipoCalculo',this);"/>&nbsp;Tasa Promedio-->
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="2">
      <!--<input type="radio" name="rdTipoTasa" id="rdTasaDescuento" value="4" class="radio" onclick="estableceObjetosTasa('eereTipoCalculo',this);"/>&nbsp;Tasa a Descuento-->
    </td>
    <td nowrap colspan="2">
      <!--<input type="radio" name="rdTipoTasa" id="rdIndizado" value="5" class="radio" onclick="estableceObjetosTasa('eereTipoCalculo',this);"/>&nbsp;Indizado-->
    </td>
  </tr>
  <tr>
    <td nowrap ><div id="tfija">% Tasa Fija</div></td>
    <td nowrap colspan="5">
      <input type="text" name="eerePjeTasa" id="eerePjeTasa" size="10" maxlength="19" value="0" tipo="Money" prec="9.6" reqPrecValue required message="El % de Tasa Fija es un campo obligatorio"/>
      <input type="text" name="eereNumTasaInt" id="eereNumTasaInt" size="2" maxlength="4" value="0" style="visibility:hidden"/>
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="3">
        &nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap >Tasa de Inter&eacute;s 1er. Periodo</td>
    <td nowrap colspan="5">
      <input type="text" name="eereTasaInteres1" id="eereTasaInteres1" size="10" maxlength="19" value="0" tipo="Money" required message="La Tasa de Interés 1er. periodo es un campo obligatorio"/>
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="3">
     &nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap >F&oacute;rmula de C&aacute;lculo</td>
    <td nowrap colspan="5">
      <select size="1" name="eereNumFormula" id="eereNumFormula" ref="conETNumForNomFor" fun="loadComboElement" keyValue="efrmIdFormula" theValue="efrmNomFormula" next="eerePeriodicidadProm" required message="La Fórmula es un campo obligatorio" operacion="Mediante la Formula ####"/>
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="3">
     &nbsp;
    </td>
  </tr>
  
  <tr>
    <td nowrap>
      <input type="checkbox" name="eereDecimalesChk" id="eereDecimalesChk" class="check" tv="1" fv="2"/>&nbsp;C&aacute;lculo con Decimales
    </td>
    <td nowrap>No. Decimales</td>
    <td nowrap>
      <input type="text" name="eereNumDecimales" id="eereNumDecimales" size="4" maxlength="4" value="0" tipo="Num" required message="El No. de Decimales es un campo obligatorio"/>
      </td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="2">
      <input type="checkbox" name="eereRedondeoChk" id="eereRedondeoChk" class="check" tv="1" fv="0"/>&nbsp;Redondeo &gt;= 5
    </td>
    <td nowrap>&nbsp;</td>
    <td height="40" class="xl66" colspan="2" nowrap>&nbsp;</td>
    <td height="40" class="xl66">
      &nbsp;
    </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>
      <input type="checkbox" name="eereDeterminaTrbChk" id="eereDeterminaTrbChk" class="check" tv="1" fv="2"/>&nbsp;Determina TRB
    </td>
    <td nowrap>
      <input type="checkbox" name="eereSumaIsrChk" id="eereSumaIsrChk" class="check" tv="1" fv="0"/>&nbsp;Suma ISR
    </td>
    <td nowrap>&nbsp;
      </td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="2">
      <input type="checkbox" name="eereDeterminaTrnChk" id="eereDeterminaTrnChk" class="check" tv="1" fv="2"/>&nbsp;Determina TRN
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap width="5%">&nbsp;
      </td>
    <td nowrap>&nbsp;
      </td>
    <td nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td nowrap colspan="11">&nbsp;</td>
  </tr>
  <!--tr >
    <td nowrap class="subtitulo" colspan="11">Par&aacute;metros de Promedios Ponderados</td>
  </tr>
  <tr>
    <td nowrap colspan="11">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>Tipo de Promedio</td>
    <td nowrap colspan="3">
      <select size="1" name="eereTipoPromedio" id="eereTipoPromedio" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbTipoPromedioParam" next="eerePerPromedio"/>
    </td>
    <td nowrap colspan="2">
      <input type="checkbox" name="eereCalcSobretasaChk" id="eereCalcSobretasaChk" class="check" tv="1" fv="0"/>&nbsp;C&aacute;lculo con Sobretasa
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="2">P&eacute;riodo para Promedio</td>
    <td nowrap colspan="2">
      <select size="1" name="eerePerPromedio" id="eerePerPromedio" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbPeriodoPromedioParam" next="eereProceso" required message="El Périodo para Promedio es un campo obligatorio"/>
    </td>
  </tr>
  <tr>
    <td nowrap>Proceso</td>
    <td nowrap colspan="3">
      <select size="1" name="eereProceso" id="eereProceso" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbProcesoParam" next="eerePeriodicidadProm"/>
    </td>
    <td nowrap>No. Decimales</td>
    <td nowrap>
      <input type="text" name="eereNumDecimalesPp" id="eereNumDecimalesPp" size="4" maxlength="4" value="0" tipo="Num" required message="El No. de Decimales es un campo obligatorio"/>
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>
      <input type="checkbox" name="eereDiasNaturalChk" id="eereDiasNaturalChk" class="check" tv="1" fv="2"/>&nbsp;D&iacute;as Naturales
    </td>
    <td nowrap width="5%">&nbsp;
    </td>
    <td nowrap>&nbsp;
      </td>
    <td nowrap>&nbsp;</td>
  </tr-->
  <tr>
    <td nowrap colspan="11">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap class="subtitulo" colspan="11">Determinaci&oacute;n de la TRB</td>
  </tr>
  <tr>
    <td nowrap colspan="11">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>Periodo de C&aacute;lculo de Tasa</td>
    <td colspan="5" nowrap>
      <select size="1" name="eerePeriodicidadProm" id="eerePeriodicidadProm" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbPeriodoCalculoParam" next="asignaValues2ObjHTMLTasas"/>
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="2"><!--No. D&iacute;as Fijos--></td>
    <td nowrap colspan="2">
      <!--input type="text" name="eereNumDias" id="eereNumDias" size="4" maxlength="4" tipo="Num"/-->
    </td>
  </tr>
  <tr>
    <td nowrap colspan="2">
      <input type="checkbox" name="eereNumDiaFijoChk" id="eereNumDiaFijoChk" class="check" tv="1" fv="2" onclick="accionChkDias(this)"/>&nbsp;D&iacute;a Fijo Dentro del P&eacute;riodo
    </td>
    <td nowrap><div id="nDia" style="visibility:hidden">No. D&iacute;a</td>
    <td nowrap colspan="2">&nbsp;
      <input style="visibility:hidden" type="text" name="eereDiaFijo" id="eereDiaFijo" size="4" maxlength="4" value="0" message="El No. de Día es un campo obligatorio" tipo="Num"/>
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap colspan="2">No. de D&iacute;as antes C&aacute;lculo</td>
    <td nowrap colspan="2">
      <input type="text" name="eereDiasAntesAvi" id="eereDiasAntesAvi" size="4" maxlength="4" value="0" required message="El No. de Días antes Cálculo es un campo obligatorio"/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="11">
      <input type="text" name="eereStEmirend" id="eereStEmirend" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td height="100%" align="center" colspan="11">
      <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionTasaRendimiento();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaDetalleParametrosCalculo(2);" style="visibility:hidden"/>
    </td>
  </tr>
</table>

<div id="dvOperacion"></div>