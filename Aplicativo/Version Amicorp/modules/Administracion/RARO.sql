select * from f_reportes
select * from f_indices

select frep_id_reporte, indice1.eind_descripcion, indice2.eind_descripcion, frep_nombre, frep_nom_fisico, frep_estado
from f_reportes, f_indices indice1, f_indices  indice2
where indice1.eind_id_indice=650 and frep_tipo_reporte=indice1.eind_id_subindice
and indice2.eind_id_indice= 651 and frep_tipo_reporte=indice2.eind_id_subindice

select indice1.eind_descripcion, indice2.eind_descripcion from f_indices indice1, f_indices  indice2


select frep_id_reporte, indice1.eind_descripcion, indice2.eind_descripcion, frep_nombre, frep_nom_fisico, frep_estado
from f_reportes, f_indices indice1, f_indices  indice2
 where indice2.eind_id_indice= 651 and frep_tipo_reporte=indice2.eind_id_subindice
 
 
select frep_id_reporte, indice1.eind_descripcion, indice2.eind_descripcion, frep_nombre, frep_nom_fisico, frep_estado
from f_reportes, f_indices indice1, f_indices  indice2
where  frep_tipo_reporte=indice1.eind_id_subindice
and indice2.eind_id_indice= 651 and frep_tipo_reporte=indice2.eind_id_subindice

SELECT * FROM F_INDICES WHERE EIND_ID_INDICE = 651