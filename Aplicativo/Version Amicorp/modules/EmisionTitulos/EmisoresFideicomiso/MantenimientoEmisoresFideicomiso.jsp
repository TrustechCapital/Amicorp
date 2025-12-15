<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento  Emisores</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
        <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>&nbsp;Emisor con Fideicomiso?</td>
            <td width="20%" valign="middle">
              <input type="checkbox" class="check" name="chkFiso" id="chkFiso" size="10" maxlength="10" onclick="dvDatos(this.checked);" />
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
         </tr>
         
         <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>&nbsp;Id. RC</td>
            <td width="20%" valign="middle">
              <input type="text" name="esorIdEmsisor" id="esorIdEmsisor" size="10" maxlength="10" onblur="upperRC(this);"  style="visibility:hidden;position:absolute;" />
               <input type="text" name="esorEmisor" id="esorEmisor" size="10" maxlength="5" onblur="asignaSecuencial(this);upperRC(this); "  required/>
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
         </tr>
         
          <tr>
            <td width="25%" valign="middle" nowrap>&nbsp;</td>
            <td  colspan=2 align="left" style="position:relative">
                    <div id="dvEmisor" style="position:absolute;">
                            <table align="left" width="100%" align="center" class="texto" border="0">
                                      <tr valign="middle">
                                        <td valign="middle" nowrap colspan="3" class="subtitulo" >Datos Emisor<hr/></td>
                                      </tr>
                                      <!--tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Id. Emisor</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" name="esorIdEmsisor" id="esorIdEmsisor" size="10" maxlength="10"   />
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr-->
                                     
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Nombre Emisor</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" name="esorNombre" id="esorNombre" size="50" maxlength="150"   />
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Tipo de Emisor</td>
                                        <td width="20%" valign="middle">
                                          <select size="1" name="esorTipoEmisor" id="esorTipoEmisor" ref="conTipoEmisor" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion"  param="cmbTipoEmisorParam" next="efsoNumFiduciario" required message="El tipo de Emisor es un campo obligatorio">
                                            <option value="-1">-- Seleccione --</option>
                                          </select>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Fecha de Alta</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" id="esorFecCreacion" name="esorFecCreacion" maxlength="10" size="15" tipo="Fecha" required message="La Fecha de Alta es un campo obligatorio"/>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <!--tr>
                                        <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
                                        <td valign="middle" height="6" width="10%" nowrap>Caracteristicas</td>
                                        <td valign="middle" height="6" width="20%">
                                          <input type="text" name="esorComentario1" id="esorComentario1" size="100" maxlength="2500"   />
                                        </td>
                                        <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
                                        <td valign="middle" height="6" width="10%" nowrap>Comentarios</td>
                                        <td valign="middle" height="6" width="20%">
                                          <input type="text" name="esorComentario" id="esorComentario" size="100" maxlength="500"   />
                                        </td>
                                        <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
                                      </tr-->
                                      <tr>
                                        <td valign="middle" height="6" width="10%" nowrap><!--Status:--></td>
                                        <td valign="middle" height="6" width="20%">
                                          <!--select size="1" name="esorStFEmifisos" id="esorStFEmifisos" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="efsoNumFiduciario" required message="El Status es un campo obligatorio"/-->
                                          <input type="text" name="esorStFEmifisos" id="esorStFEmifisos" style="visibility:hidden;" value="ACTIVO">
                                        </td>
                                        <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
                                      </tr>
                                      
                                  </table>
                            </div>
                  <!--/td>
                  <td width="20%" valign="middle" nowrap>&nbsp;</td>
              </tr>       
              <tr>
            <td width="25%" valign="middle" nowrap>&nbsp;</td>
            <td  colspan=2 align="left" style="position:relative"-->
                            <div id="dvFideicomiso"  style="position:ansolute;visibility:hidden;">
                            <table align="left" width="100%" align="center" class="texto" border="0">
                                     <tr valign="middle">
                                        <td valign="middle" nowrap colspan="3" class="subtitulo" >Datos Fideicomiso<hr/></td>
                                      </tr>
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Fiduciario</td>
                                        <td width="20%" valign="middle">
                                           <select size="1" name="efsoNumFiduciario" id="efsoNumFiduciario" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion"  param="cmbFiduciarios" next="asignaValues2ObjHTML" required message="La Institucion es un campo obligatorio"/>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>No. Fideicomiso</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" name="efsoIdFideicomiso" id="efsoIdFideicomiso" size="10" onblur="asignaSecuencialFideicomiso(GI('esorEmisor'),this);" maxlength="10"  tipo="Num"/>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Nombre Fideicomiso</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" name="efsoNomFideicomiso" id="efsoNomFideicomiso" size="50" maxlength="150"  tipo="Texto"/>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>                                    
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Fideicomitente</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" name="efsoNomFideicomitente" id="efsoNomFideicomitente" size="50" maxlength="150"  tipo="Texto"/>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr valign="middle">
                                        <td width="10%" valign="middle" nowrap>Fecha de Constitución</td>
                                        <td width="20%" valign="middle">
                                          <input type="text" id="efsoFecCreacion" name="efsoFecCreacion" maxlength="10" size="10" tipo="Fecha" required message="La Fecha de Alta es un campo obligatorio"/>
                                        </td>
                                        <td width="20%" valign="middle" nowrap>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td valign="middle" height="6" width="10%" nowrap><!--Status:--></td>
                                        <td valign="middle" height="6" width="20%">
                                          <!--select size="1" name="efsoStFEmifisos" id="efsoStFEmifisos" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/-->
                                          <input type="text" name="efsoStFEmifisos" id="efsoStFEmifisos" style="visibility:hidden;" value="ACTIVO">
                                        </td>
                                        <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
                                      </tr>
                                  </table>
                            </div>
                  </td>
                  <td width="20%" valign="middle" nowrap>&nbsp;</td>
              </tr>       
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.EmisoresFideicomiso.PrincipalEmisoresFideicomiso','')" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
