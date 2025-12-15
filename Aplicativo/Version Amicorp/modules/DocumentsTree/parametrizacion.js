/*
insert into f_funcion values (2000,'Archiveros','','DocumentsTree.DocumentsTree.PrincipalDocumentsTree',13)
insert into f_funcion values (2001,'ParametrizacionArchiveros',4020,'DocumentsTree.parametrizacion',1)
insert into f_funcion values (2002,'ManejoArchivos',4020,'DocumentsTree.manejoArchivos',2)

insert into f_per_fun values(100,2000)
insert into f_per_fun values(100,2001)
insert into f_per_fun values(100,2002)

*/
if(confirm("Se recomienda ver esta pantalla en una nueva ventana")){
  window.open (ctxRoot+"/modules/DocumentsTree/parametrizacion.do","_new");
}

