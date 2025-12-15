<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Interrnas
                                                        Preocupantes</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap >Tipo Reporte</td>
              <td nowrap>
                <input type="text" name="iprTipoReporte" id="iprTipoReporte" value="3" disabled size="5" maxlength="5"/>
              </td>
              <td nowrap colspan=6 style="font-weight:bold;">&nbsp;Interna Preocupante</td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Periodo del reporte</td>
              <td nowrap colspan=6><input type="text" name="iprPeriodoReporte" id="iprPeriodoReporte" size="10" maxlength="8" onblur="verificarAlta();"/> Formato AAAAMMDD</td>
              <td width="10%">&nbsp;</td>
            </tr>

            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Folio</td>
              <td nowrap colspan=6><input type="text" name="iprFolio" id="iprFolio" disable size="10" maxlength="5" tipo="Num"/></td>
              <td width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Organo Supervisor</td>
              <td nowrap colspan =3>
                <input type="text" name="iprOrganoSup" id="iprOrganoSup" disabled size="10" maxlength="6" value="001002"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Clave del Sujeto Obligado</td>
              <td nowrap>
                <input type="text" name="iprCveSujObl" id="iprCveSujObl" disabled size="10" maxlength="7"j value="0692323"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%" height="16">&nbsp;</td>
              <td nowrap height="16">Localidad</td>
              <td nowrap colspan =3 height="16">
                <input type="text" name="iprLocalidad" id="iprLocalidad" disabled value="01001002" size="10" maxlength="8"/>
              </td>
              <td nowrap width="5%" height="16">&nbsp;</td>
              <td nowrap height="16">Codigo Postal de la Sucursal</td>
              <td nowrap height="16">
                <input type="text" name="iprCp" id="iprCp" disabled value="11000" size="10" maxlength="5"/>
              <td nowrap width="10%" height="16">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Tipo de Operación</td>
              <td nowrap colspan =3>
                <input type="text" name="iprTipoOpe" id="iprTipoOpe"  size="10" maxlength="2"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Instrumento Monetario</td>
              <td nowrap>
                <input type="text" name="iprInstrMon" id="iprInstrMon" size="10" maxlength="2"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Num. Cta / Cto / Ope </td>
              <td nowrap colspan =3>
                <input type="text" name="iprCtaCtoOpe" id="iprCtaCtoOpe"  size="16" maxlength="16"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Monto</td>
              <td nowrap>
                <input type="text" name="iprMonto" id="iprMonto" size="17" maxlength="17"  tipo="Money"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Moneda</td>
              <td nowrap colspan =3>
                <input type="text" name="iprMoneda" id="iprMoneda"  size="10" maxlength="3"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Fecha de la Operación</td>
              <td nowrap>
                <input type="text" name="iprFechaOpe" id="iprFechaOpe" size="10" maxlength="8"  tipo="Num" /> Formato AAAAMMDD
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Fecha Detección Operación</td>
              <td nowrap colspan =3>
                <input type="text" name="iprFechaDetOpe" id="iprFechaDetOpe"  size="10" maxlength="8" tipo="Num" /> Formato AAAAMMDD
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Nacionalidad</td>
              <td nowrap>
                <input type="text" name="iprNacionalidad" id="iprNacionalidad" size="5" maxlength="1"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Tipo de Persona</td>
              <td nowrap colspan =3>
                <input type="text" name="iprTipoPersona" id="iprTipoPersona"  size="5" maxlength="1" onblur="funcactivacampos()"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Razón Social o Denominación</td>
              <td nowrap>
                <input type="text" name="iprRazonSocial" id="iprRazonSocial" size="30" maxlength="125"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Nombre</td>
              <td nowrap colspan =3>
                <input type="text" name="iprNombre" id="iprNombre"  size="25" maxlength="60"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Apellido Paterno</td>
              <td nowrap>
                <input type="text" name="iprApPat" id="iprApPat" size="25" maxlength="60"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Apellido Materno</td>
              <td nowrap colspan =3>
                <input type="text" name="iprApMat" id="iprApMat"  size="25" maxlength="60"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>RFC</td>
              <td nowrap>
                <input type="text" name="iprRfc" id="iprRfc" size="13" maxlength="13" onblur="ValidaLongRFC()"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>CURP</td>
              <td nowrap colspan =3>
                <input type="text" name="iprCurp" id="iprCurp"  size="20" maxlength="18" onblur="ValidaLongCURP()"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Fecha Nac. / Const.</td>
              <td nowrap>
                <input type="text" name="iprFecNacimiento" id="iprFecNacimiento" size="10" maxlength="8" tipo="Num" /> Formato AAAAMMDD
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Domicilio</td>
              <td nowrap colspan =3>
                <input type="text" name="iprDomicilio" id="iprDomicilio"  size="30" maxlength="60"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Colonia</td>
              <td nowrap>
                <input type="text" name="iprColonia" id="iprColonia" size="20" maxlength="30"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Ciudad/Población</td>
              <td nowrap colspan =3>
                <input type="text" name="iprCiudad" id="iprCiudad"  size="10" maxlength="8"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Telefono Ofic/Part</td>
              <td nowrap>
                <input type="text" name="iprTelOfPar" id="iprTelOfPar" size="25" maxlength="40"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Actividad Económica</td>
              <td nowrap colspan =3>
                <input type="text" name="iprActivEcon" id="iprActivEcon"  size="10" maxlength="7"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Cons. Cuentas/Personas </td>
              <td nowrap>
                <input type="text" name="iprConsecCta" id="iprConsecCta" size="5" maxlength="2"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Núm Cta/Cto/Ope/Pol/Seg</td>
              <td nowrap colspan =3>
                <input type="text" name="iprCtaCtoOpPol" id="iprCtaCtoOpPol"  size="15" maxlength="16"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Clave Sujeto Obl.</td>
              <td nowrap>
                <input type="text" name="iprCveSujObl2" id="iprCveSujObl2" size="7" maxlength="7"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Nombre Tit. Cta / Pers. Obl.</td>
              <td nowrap colspan =3>
                <input type="text" name="iprTitularCta" id="iprTitularCta"  size="30" maxlength="60"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Apellido Paterno</td>
              <td nowrap>
                <input type="text" name="iprApPaterno" id="iprApPaterno" size="30" maxlength="60"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Apellido Materno</td>
              <td nowrap colspan =3>
                <input type="text" name="iprApMaterno" id="iprApMaterno"  size="30" maxlength="60"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>

            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Descr. Oper.</td>
              <td nowrap colspan =3>
                <input type="text" name="iprDescOpe" id="iprDescOpe"  size="100" maxlength="4000"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>


            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Razones</td>
              <td nowrap colspan =3>
                <input type="text" name="iprRazon" id="iprRazon"  size="100" maxlength="4000"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
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
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipal();" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
