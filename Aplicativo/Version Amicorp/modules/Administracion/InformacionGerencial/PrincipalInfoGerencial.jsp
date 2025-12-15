<%@page contentType="text/html"%>
<HTML>
<BODY>
<FORM name="frmInformesGerenciales" id="frmInformesGerenciales" onsubmit="">
<input type="hidden" id="paramtipoReporte" name="paramtipoReporte" value=""/>
<input type="hidden" id="paramEstructura" name="paramEstructura" value="1"/>
<script type="javascript" href="PrincipalInfoGerencial.js"></script>
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Informaci&oacute;n Gerencial</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>      
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td align="right" nowrap width="20%">&nbsp;</td>
            <td nowrap>Seleccione el Informe</td>
            <td align="center">
              <select id="slcReportes" name="slcReportes" onchange="cargaReporte(this.value)" required message="El tipo de Reporte es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="BalanceGeneral">Balance General</option>                
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
</FORM>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a> 
</BODY>
</HTML>
