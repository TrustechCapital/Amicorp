<table cellspacing="1" cellpadding="1" border="0" width="90%" align="center" style="height:auto;">
    <tr>
      <td align="left" class="tituloPestania">
              ETFs
      </td>
      <td align="left" width="50%">
              <!--img  src="<%=request.getContextPath()%>/imagenes/smartshares.png" height=50-->
      </td>
      <td align="right" valign="bottom" width="10%" style="position:relative;">
        <div id="fecTrac" class="subtitulo" style="position:absolute;width:200;bottom:0;right:0;font-size:12px;"></div>
      </td>
    </tr>
    <tr><td colspan=3> <hr></td></tr>
    <tr>
      <td colspan=3>
        <div id="secciones">
        </div>    
      </td>
    </tr>
    <tr><td colspan=3><hr size="4" width="90%" align="right" style="color:#4199f0;"><hr size="4" width="100%" align="right" style="color:#4199f0;"></td></tr>
  </table>
  <input type="hidden" style="position:absolute;" id="usuario" name="usuario" value="<%=session.getAttribute("userid").toString()%>"/>
  <div id="contenedor" align="center" style="width:1200px;">  
  </div>   
</td></tr>
</table>