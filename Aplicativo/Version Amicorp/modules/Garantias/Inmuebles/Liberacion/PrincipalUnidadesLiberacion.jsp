<FORM name="frmPrincipalUnidadesLiberacion" id="frmPrincipalUnidadesLiberacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Liberacion</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="30%" align="left">&nbsp;</td>
            <td width="8%" nowrap>Fideicomiso:</td>
            <td>
              <!--<input type="text" name="paramNumUsuario" id="paramNumUsuario" tipo="Num" size="10" maxlength="10"/>-->
               <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td width="45%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="30%" align="left">&nbsp;</td>
            <td width="8%" nowrap>Unidad:</td>
            <td>
               <input type="text" name="paramNumUnidad" id="paramNumUnidad"  size="10" maxlength="10"/>
            </td>
          </tr>
          <tr>
            <td width="30%" align="left">&nbsp;</td>
            <td width="8%" nowrap>Status:</td>
            <td>
              <select size="1" name="paramCveStatus" id="paramCveStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNotario" param="clavesCombo560"/>
            </td>
          </tr>
          
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="prinLiberacion" fun="loadTableElement" tabla="tablaConsultaUnidadesLiberacion" onclick="consultaLiberacion();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalUnidadesLiberacion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <!--input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoUnidades(1);" style="visibility:hidden"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoUnidades(2);" style="visibility:hidden"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();" style="visibility:hidden"/-->
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoUnidades(3);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Mantenimiento" id="cmdMantenimientoLiberacion" name="cmdMantenimientoLiberacion" class="boton" onclick="cargaMantenimientoUnidades(4);"/>
            </td>
          </tr>
           <tr>
            <td width="100%" colspan="5" align="center" valign="middle">
              <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">Fideicomiso</td>
                  <td width="124px">Sub Fideicomiso</td>
                  <td width="126px">Num. Inmueble</td>
                  <td width="120px">Edificio</td>
                  <td width="150px">Num. Unidad</td>
                  <td width="150px">Registro Contable</td>
                  <td width="85px">Moneda</td>
                  <td width="80px">Status</td>
                </tr>
              </table>
              <div style="height:180px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tablaConsultaUnidadesLiberacion" border="0" cellspacing="0" cellpadding="0" dataInfo="arregloParametrosUnidadesLiberacion" keys="funiIdFideicomiso,funiIdSubcuenta,funiIdBien,funiIdDepto,funiIdEdificio,fplNotario,fplAdquirente,fplTercero,fplFideicomBenefici,fplNomPersona,fplNumLugar,fplNomPersona1,fplNumLugar1,fplFidBenSaneamiento,fplNomSaneamiento,fplNumLugarSaneamiento,fplNomSaneamiento1,fplNumLugarSaneamiento1,fplFidBenResponsabilidad,fplNomResponsabilidad,
                  fplNumLugarResponsabilidad,fplNomResponsabilidad1,fplNumLugarResponsabilidad1,fplFidBenOtorgamiento,fplNomOtorgamiento,fplNumLugarOtorgamiento,fplNomOtorgamiento1,fplNumLugarOtorgamiento1,fplTransmisionReversion,fplParcialTotal,fplSujetoRegimen,fplTipoInmueble,fplNomEnvio,fplEmailEnvio,fplObservacion,fplEscritura,fplFecEscritura,fplDelegado,fplFecFirma,funiStatus"  fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          
          <!--LIBRACIONES-->
          
          <tr>
            <td colspan="4">
                  <table class="texto" width="75%" align="center" id="dvLiberacion" style="visibility:hidden;">
                        <tr>
                          <td colspan="3" class="subtitulo">Liberación<hr></td>
                        </tr>
                        <tr>
                          <td width="20%">Notario:</td>
                          <td width="30%" align="left">
                            <select name="cmbNotario" id="cmbNotario" ref="claveNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="cmbDelegado"/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="40%">Adquirente:</td>
                                    <td width="40%" align="left">
                                      <input type="text" name="txtAdquirente" id="txtAdquirente" size="45" maxlength="125"/>
                                    </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">                        
                                <table class="texto">
                                  <tr>
                                    <td width="40%">Tercero:</td>
                                    <td width="40%" align="left">
                                      <input type="text" name="txtTercero" id="txtTercero" size="45" maxlength="125"/>
                                    </td>
                                  </tr>
                                </table>  
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="50%">
                            &nbsp;
                          </td>
                        </tr>
                        <tr>
                          <td width="20%">Delegado:</td>
                          <td width="30%" align="left">
                            <select size="1" name="cmbDelegado" id="cmbDelegado" ref="muestraEjecutivos" fun="loadComboElement" keyValue="ejeNomEjecutivo" theValue="ejeNomEjecutivo" param="cmbFirma" next="cmbFideicomBenefici"/>
                          </td>
                          <td width="50%">
                            &nbsp;
                          </td>
                        </tr>
                        <tr>
                          <td width="20%">Observación:</td>
                          <td width="30%" align="left">
                            <textarea type="text" name="txtObservacion" id="txtObservacion" cols="25" rows="5" maxlength="500" style="width:250px;"></textarea>
                          </td>
                          <td width="50%" align="right">
                            <input type="BUTTON" value="Primer Paso" id="cmdReporte1" name="cmdReporte1" class="boton" onclick="procesoLiberacion(1);"/>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="3"><hr></td>
                        </tr>
                        
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Instruido por:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbFideicomBenefici" id="cmbFideicomBenefici" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomPersona" param="clavesCombo750" onchange="cargaCmbPersonas(this,GI('cmbNomPersona'));"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto" id="dvNomPersona">
                                  <tr>
                                    <td width="30%" align="left">Representado por:</td>
                                    <td width="40%" align="left"> <input type="text" name="txtComiteFidBen" id="txtComiteFidBen" size="45" maxlength="125"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomPersona" id="cmbNomPersona" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugar" param="paramTipoPersona"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugar" id="cmbNumLugar" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomPersona1" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomPersona1" id="cmbNomPersona1" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugar1" param="paramTipoPersona1"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugar1" id="cmbNumLugar1" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbTransmisionReversion" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="20%">Transmision/Reversion:</td>
                          <td width="30%" align="left">
                            <select size="1" name="cmbTransmisionReversion" id="cmbTransmisionReversion" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbParcialTotal" param="clavesCombo752"/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="20%">Parcial/Total:</td>
                          <td width="30%" align="left">
                            <select size="1" name="cmbParcialTotal" id="cmbParcialTotal" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomEnvio" param="clavesCombo753"/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="20%">Enviar a:</td>
                          <td width="30%" align="left">
                            <select size="1" name="cmbNomEnvio" id="cmbNomEnvio" ref="muestraEjecutivos" fun="loadComboElement" keyValue="ejeNomEjecutivo" theValue="ejeNomEjecutivo" param="cmbEjecutivos" next="cmbFirma"  onchange="cargaEmailEnvio(this)"/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="20%">Email Envío</td>
                          <td width="30%" align="left">
                            <input type="text" name="txtEmailEnvio" id="txtEmailEnvio" size="45" maxlength="125" disabled/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="20%">Firma:</td>
                          <td width="30%" align="left">
                            <select size="1" name="cmbFirma" id="cmbFirma" ref="muestraEjecutivos" fun="loadComboElement" keyValue="ejeNomEjecutivo" theValue="ejeNomEjecutivo" param="cmbFirma" next="formsLoaded"/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        
                        <!--Clausula 1-->
                        <tr>
                          <td colspan=3>&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan=2 class="subtitulo">Clausula de Saneamiento para el caso de evicción</td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Instruido por:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbFidBenSaneamiento" id="cmbFidBenSaneamiento" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomSaneamiento" param="clavesCombo750" onchange="cargaCmbPersonas(this,GI('cmbNomSaneamiento'));"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto" id="dvNomSaneamiento">
                                  <tr>
                                    <td width="30%" align="left">Representado por:</td>
                                    <td width="40%" align="left"> <input type="text" name="txtComiteSaneamiento" id="txtComiteSaneamiento" size="45" maxlength="125"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomSaneamiento" id="cmbNomSaneamiento" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugarSaneamiento" param="paramTipoPersona"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugarSaneamiento" id="cmbNumLugarSaneamiento" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomSaneamiento1" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomSaneamiento1" id="cmbNomSaneamiento1" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugarSaneamiento1" param="paramTipoPersona1"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugarSaneamiento1" id="cmbNumLugarSaneamiento1" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        
                        <!--Clausula 2-->
                        <tr>
                          <td colspan=3>&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan=2 class="subtitulo">Clausula liberación de responsabilidad.</td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Instruido por:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbFidBenResponsabilidad" id="cmbFidBenResponsabilidad" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomResponsabilidad" param="clavesCombo750" onchange="cargaCmbPersonas(this,GI('cmbNomResponsabilidad'));"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto" id="dvNomResponsabilidad">
                                  <tr>
                                    <td width="30%" align="left">Representado por:</td>
                                    <td width="40%" align="left"> <input type="text" name="txtComiteResponsabilidad" id="txtComiteResponsabilidad" size="45" maxlength="125"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomResponsabilidad" id="cmbNomResponsabilidad" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugarResponsabilidad" param="paramTipoPersona"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugarResponsabilidad" id="cmbNumLugarResponsabilidad" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomResponsabilidad1" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomResponsabilidad1" id="cmbNomResponsabilidad1" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugarResponsabilidad1" param="paramTipoPersona1"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugarResponsabilidad1" id="cmbNumLugarResponsabilidad1" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        
                        <!--Otorgamiento-->
                        <tr>
                          <td colspan=3>&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan=2 class="subtitulo">Otorgamiento</td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Instruido por:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbFidBenOtorgamiento" id="cmbFidBenOtorgamiento" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomOtorgamiento" param="clavesCombo750" onchange="cargaCmbPersonas(this,GI('cmbNomOtorgamiento'));"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto" id="dvNomOtorgamiento">
                                  <tr>
                                    <td width="30%" align="left">Representado por:</td>
                                    <td width="40%" align="left"> <input type="text" name="txtComiteOtorgamiento" id="txtComiteOtorgamiento" size="45" maxlength="125"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td colspan=2>                          
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomOtorgamiento" id="cmbNomOtorgamiento" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugarOtorgamiento" param="paramTipoPersona"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugarOtorgamiento" id="cmbNumLugarOtorgamiento" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbNomOtorgamiento1" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>  
                          </td>
                          <td width="50%">              
                                <table class="texto">
                                  <tr>
                                    <td width="30%" align="left">Persona:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNomOtorgamiento1" id="cmbNomOtorgamiento1" ref="prinNomPersonaLiberacion" fun="loadComboElement" keyValue="nombre" theValue="nombre" next="cmbNumLugarOtorgamiento1" param="paramTipoPersona1"/> </td>
                                  </tr>
                                  <tr>
                                    <td width="30%" align="left">Lugar:</td>
                                    <td width="40%" align="left"> <select size="1" name="cmbNumLugarOtorgamiento1" id="cmbNumLugarOtorgamiento1" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo751"/> </td>
                                  </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td width="20%">&nbsp;</td>
                          <td width="30%" align="left">&nbsp;</td>
                          <td width="50%" align="right">
                            <input type="BUTTON" value="Generar Carta" id="cmdReporte2" name="cmdReporte2" class="boton" onclick="procesoLiberacion(2);"/>
                          </td>
                        </tr>
                        
                        
                        
                        <tr>
                          <td colspan="3"><hr></td>
                        </tr>
                        <tr>
                          <td width="20%">Escritura:</td>
                          <td width="30%" align="left">
                            <input type="text" name="txtEscritura" id="txtEscritura"  size="10" maxlength="10"/>
                          </td>
                          <td width="50%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="20%">Fecha Escritura:</td>
                          <td width="30%" align="left">
                            <input type="text" name="txtFecEscritura" id="txtFecEscritura" tipo="Fecha" size="10" maxlength="10"/>
                          </td>
                          <td width="40%" align="right"><input type="BUTTON" value="Tercer Paso" id="cmdReporte3" name="cmdReporte3" class="boton" onclick="procesoLiberacion(3);"/></td>
                        </tr>
                        <tr>
                          <td colspan="3"><hr></td>
                        </tr>
                        
                        
                            
                        
                        <tr>
                          <td width="20%">Fecha Firma:</td>
                          <td width="30%" align="left">
                            <input type="text" name="txtFecFirma" id="txtFecFirma" tipo="Fecha" size="10" maxlength="10"/>
                          </td>
                          <td width="50%" align="right">
                            <input type="BUTTON" value="Liberar" id="cmdReporte" name="cmdReporte" class="boton" onclick="procesoLiberacion(4);"/>
                          </td>
                        </tr>
                        <tr>
                          <td width="20%">&nbsp;</td>
                          <td width="30%" align="left">
                            &nbsp;
                          </td>
                          <td width="40%" align="right">
                            <input type="BUTTON" value="Limpiar" id="cmdReporte4" name="cmdReporte4" class="boton_x" onclick="procesoLiberacion(5);"/>
                          </td>
                        </tr>
                  
                  </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>