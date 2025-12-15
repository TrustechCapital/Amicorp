/*
insert into f_funcion values (2000,'Archiveros','','DocumentsTree.DocumentsTree.PrincipalDocumentsTree',13)

insert into f_per_fun values(100,2000)

insert into f_funcion values (2001,'ParametrizacionArchiveros','','DocumentsTree.parametrizacion',1)
insert into f_funcion values (2002,'ManejoArchivos','','DocumentsTree.parametrizacion',1)

insert into f_per_fun values(100,2001)
insert into f_per_fun values(100,2002)

*/
if(confirm("Se recomienda ver esta pantalla en una nueva ventana")){
  window.open (ctxRoot+"/modules/DocumentsTree/manejoArchivos.do","_new");
}

