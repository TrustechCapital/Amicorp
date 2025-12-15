<FORM name="frmReportes" id="frmReportes" onsubmit=" ">
  <input type="hidden" id="paramtipoReporte" name="paramtipoReporte" value=""/>
  <input type="hidden" id="paramEstructura" name="paramEstructura" value="1"/>
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Reportes de Contabilidad</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" class="texto" align="center">
        <input class="radio" type="radio" id="rdoSA" name="rdoTipoSaldo" value="" checked onclick="setTipoReporte(this.value)"/>Saldos Actuales
        <input class="radio" type="radio" id="rdoSM" name="rdoTipoSaldo" value="MSA" onclick="setTipoReporte(this.value)"/>Saldos Mes Anterior
        <input class="radio" type="radio" id="rdoSH" name="rdoTipoSaldo" value="H" onclick="setTipoReporte(this.value)"/>Saldos Hist&oacute;ricos
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td align="right" nowrap width="20%">&nbsp;</td>
            <td nowrap style="font-weight:bold;">Seleccione el Reporte</td>
            <td align="center">
              <select id="slcReportes" name="slcReportes" onchange="cargaReporte(this.value)" required message="El tipo de Reporte es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="AuxiliarPorCuenta">Auxiliar por Cuenta</option>
                <option value="BalanceGeneral">Balance General</option>
                <option value="BalanzaComprobacion">Balanza de Comprobación</option>
                <option value="BalanzaDesglosada">Balanza Desglosada</option>
                <option value="EnvioInfo">Envío de Información</option>
                <option value="EstadoCuenta">Estado de Cuenta</option>
                <option value="ContratosInversion">Estado de Cuenta de Contratos de Inversión</option>
                <option value="EstadoResultados">Estado de Resultados</option>
                <option value="EstadoResultadosMensual">Estado de Resultados Mensual</option>
                <option value="MovimientosDiario">Movimiento diario de operaciones</option>
                <option value="ReportePosicion">Posición por contrato</option>
                <option value="PosicionporPeriodo">Posición por Periodo</option>
                <option value="EstadoVariaciones">Variaciones en el Patrimonio</option>
                
                  <!-- POSIBLES A ECHAR A ANDAR
                  <option value="BalanzaComprobacionEje">Balanza de Comprobacion Desglosada por Eje</option>
                  <option value="BalanzaCuentasOrden">Balanza de Cuentas de Orden</option>
                  <option value="BalanceFiso">Balance Fideicomiso</option>
                  <option value="Poliza">Poliza</option>
                  <option value="BalanceContable">Balance de Mandatos y Comisiones</option>
                  <option value="ResumenMandatos">Resumen de Mandatos y Fideicomisos</option>
                  <option value="Concentracion">Concentracion de movimientos</option>
                 
                  <option value="Aplicacion">Aplicacion</option>
                  <option value="ConversionCuenta">Conversion de Cuentas</option>   
                  <option value="EstadoCambios">Cambios en la Situacion Financiera</option>
                -->
              </select>
            </td>
            <td align="center" width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td colspan="2">
              <div id="dvReporte" class="texto"/>
            </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaReporte();"/>
        <!--input type=&quot;BUTTON&quot; value=&quot;Cancelar&quot; name=&quot;cmdCancelar&quot; class=&quot;boton&quot; onclick=&quot;();&quot;/!-->
      </td>
    </tr>
  </table>
  <!--input type=&quot;hidden&quot; id=&quot;paramRepInfoUrlLogo&quot; name=&quot;paramRepInfoUrlLogo&quot; value=&quot;&lt;%=&quot;http://&quot; + request.getServerName() + &quot;:&quot; + request.getServerPort() + request.getContextPath()+&quot;/imagenes/logo_bn.jpg&quot;%&gt;&quot; /&gt;
    &lt;input type=&quot;hidden&quot; id=&quot;paramRepInfoFechaReporte&quot; name=&quot;paramRepInfoFechaReporte&quot; value=&quot;&lt;%=mx.gob.nafin.fiduciario.common.util.DateTimeUtils.formatDateTimeFromPattern(&quot;dd' de 'MMMMM' del 'yyyy&quot;, new java.util.Date(), java.util.Locale.getDefault())%&gt;&quot;/-->
</FORM>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a> 
