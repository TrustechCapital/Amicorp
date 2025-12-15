<form name="frmMantenimientoUnidadesLiberacion" id="frmMantenimientoUnidadesLiberacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Liberacion</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
            <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Fideicomiso</td>
            <td>
              <input type="text" name="funiIdFideicomiso" id="funiIdFideicomiso" tipo = "Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" required message = "Valor obligatorio"/>
            </td>
            <td width="25%" colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">N&uacute;m. Inmueble</td>
            <td colspan="2">
              <input type="text" name="funiIdBien" id="funiIdBien" size="10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <!--td>Sub Cuenta</td-->
            <td>
              <input type="hidden" name="funiIdSubcuenta" id="funiIdSubcuenta" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Edificio:</td>
            <td>
              <input type="text" name="funiIdEdificio" id="funiIdEdificio" size="10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td>
              Unidad Condominal:
            </td>
            <td>
              <input type="text" name="funiIdDepto" id="funiIdDepto" size="10" maxlength="10" required message = "Valor obligatorio"/>
              
              <!--Num. Unidad-->
              <!--input type="text" name="funiTipo" id="funiTipo" size="10" maxlength="10" required message="Valor obligatorio"/-->
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Niveles:</td>
            <td>
              <input type="text" name="funiNiveles" id="funiNiveles" size="10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
           <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Calle</td>
            <td>
              <input type="text" name="funiCalleNum" id="funiCalleNum" size="30" maxlength="30"/>
            </td>
            <td>Colonia</td>
            <td>
              <input type="text" name="funiNomColonia" id="funiNomColonia" size="20" maxlength="20"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
            <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Poblaci&oacute;n</td>
            <td>
              <input type="text" name="funiNomPoblacion" id="funiNomPoblacion" size="10" maxlength="10"/>
            </td>
            <td>C&oacute;digo Postal</td>
            <td>
              <input type="text" name="funiCodigoPostal" id="funiCodigoPostal" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
           <tr>
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Pa&iacute;s</td>
            <td>
              <select size="1" name="funiNumPais" id="funiNumPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="funiMoneda" onchange="cargaParamComboEstado(this,false);"/>
            </td>
            <td>Estado</td>
            <td>
              <select size="1" name="funiNumEstado" id="funiNumEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNumEstado" theValue="edoNomEstado" next="formsLoaded" param="parametroComboEstado">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
           <tr>
           
           
           <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
            
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Estacionamiento 1:</td>
            <td><input type="text" name="funiEstacionamiento1" id="funiEstacionamiento1" tipo="Num" size="10" maxlength="10"/></td>
            <td>Superficie 1:</td>
            <td><input type="text" name="funiSuperficie1" id="funiSuperficie1" tipo="Num" size="10" maxlength="10"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Estacionamiento 2:</td>
            <td><input type="text" name="funiEstacionamiento2" id="funiEstacionamiento2" tipo="Num" size="10" maxlength="10"/></td>
            <td>Superficie 2:</td>
            <td><input type="text" name="funiSuperficie2" id="funiSuperficie2" tipo="Num" size="10" maxlength="10"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Estacionamiento 3:</td>
            <td><input type="text" name="funiEstacionamiento3" id="funiEstacionamiento3" tipo="Num" size="10" maxlength="10"/></td>
            <td>Superficie 3:</td>
            <td><input type="text" name="funiSuperficie3" id="funiSuperficie3" tipo="Num" size="10" maxlength="10"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Otro:</td>
            <td><input type="text" name="funiRoofGarden" id="funiRoofGarden" tipo="Alphanumeric" size="10" maxlength="10"/></td>
            <td>Superficie Otro:</td>
            <td><input type="text" name="funiRoofSuperficie" id="funiRoofSuperficie" tipo="Alphanumeric" size="10" maxlength="10"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Otro 2:</td>
            <td><input type="text" name="funiSotano" id="funiSotano" tipo="Num" size="10" maxlength="10"/></td>
            <td>Superficie Otro 2:</td>
            <td><input type="text" name="funiSotanoSuperficie" id="funiSotanoSuperficie" tipo="Num" size="10" maxlength="10"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          
           <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Indiviso:</td>
            <td><input type="text" name="funiIndiviso" id="funiIndiviso" tipo="Money" size="10" maxlength="10"/></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Registro Contable:</td>
            <td>
              <input type="text" name="funiPrecio" id="funiPrecio" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
            </td>
            <td>Precio Catastro:</td>
            <td><input type="text" name="funiPrecioCatastro" id="funiPrecioCatastro" tipo="Num" size="10" maxlength="10"/></td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <!--tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&Uacute;ltimo Valor Registrado:</td>
            <td>
              <input type="text" name="funiUltimoAvaluo" id="funiUltimoAvaluo" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>Fecha &Uacute;ltimo Valor Registrado</td>
            <td>
              <input type="text" name="funiFechaUltimoAvaluo" id="funiFechaUltimoAvaluo" tipo = "Date" size="10" maxlength="10" />
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr-->
          
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Moneda:</td>
            <td>
              <select name="funiMoneda" id="funiMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="funiStatus" required message="La Moneda es un campo obligatorio"/>
            </td>
            <td>Estatus:</td>
            <td>
              <select size="1" name="funiStatus" id="funiStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo560"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Acto 1:</td>
            <td><input type="text" name="funiActo1" id="funiActo1"  size="15" maxlength="50"/></td>
            <td>Acto 2:</td>
            <td><input type="text" name="funiActo2" id="funiActo2"  size="15" maxlength="50"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Acto 3:</td>
            <td><input type="text" name="funiActo3" id="funiActo3"  size="15" maxlength="50"/></td>
            <td>Acto 4:</td>
            <td><input type="text" name="funiActo4" id="funiActo4"  size="15" maxlength="50"/></td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
           
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Notario</td>
            <td>
              <input type="text" name="funiNotario" id="funiNotario"  size="25" maxlength="25" disabled/>
            </td>
            <td>Escritura</td>
            <td>
              <input type="text" name="funiNumEscritura" id="funiNumEscritura"  size="10" maxlength="10" disabled/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Folio</td>
            <td>
              <input type="text" name="funiFolioReal" id="funiFolioReal"  size="10" maxlength="10" disabled/>
            </td>
            <td>Fecha Traslativo</td>
            <td>
              <input type="text" name="funiFechaTrasladoDominio" id="funiFechaTrasladoDominio" tipo="Date" size="10" maxlength="10" disabled/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalUnidades();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
