create or replace FUNCTION FN_CREA_BEAN (TABLA VARCHAR2)
 RETURN NUMBER AS
  BEGIN
    DECLARE
    AUX_ORA_ERR VARCHAR2(255);
    AUX_MSG_ERR VARCHAR2(512);
    CONT NUMBER;
    TYPE T_CURSOR IS REF CURSOR;
    CUR_ARCHIVO T_CURSOR;
    RS_ARCHIVOS_PLANOS T_CURSOR;
    NDATOS NUMBER;
    CADENA_SPLIT VINTA.t_array;
    CADENA VARCHAR2(500);
    NTRA_TIPO_MOVIMIENT NUMBER;
    
    NMERCADO NUMBER;
    NSECUENCIALEMISION NUMBER;  
    
    NINSTRUMENTO_FW NUMBER;
    VALOR_MERCADO NUMBER;
    
    NREGS_TAS NUMBER;
    
    VCOLUMNA VARCHAR2(100);
    VSQL VARCHAR2(5000);
    NCONT NUMBER;
    VTIPO VARCHAR2(500);
    VGET  VARCHAR2(500);
    VSET VARCHAR2(500);
    VCAP VARCHAR2(500);
BEGIN    
--SE RECUPERA LA ESTRUCTURA DE LA TABLA

DELETE FROM ARCHIVOS_PLANOS;
NCONT:=0;

    VSQL:='public class '||TABLA||' extends DomainObject {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;


OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;
  
  IF INSTR(VTIPO,'VARCHAR')=0 THEN
    VSQL:='BigDecimal '||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||' =null;';
  ELSE
    VSQL:='String '||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||' =null;';
  END IF;
  
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;

    VSQL:='public '||TABLA||'() {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='super();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='this.pkColumns = 8;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;



OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;
  
  IF INSTR(VTIPO,'CHAR')>0 OR INSTR(VTIPO,'DATE')>0 THEN
    VSQL:='public void '||VSET||' (String '||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||') {';
  ELSE
    VSQL:='public void '||VSET||' (BigDecimal '||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||') {';
  END IF;
  INSERT INTO ARCHIVOS_PLANOS values(NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:=REPLACE('this.'||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||' = '||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||';',' ','');
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='}';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;    

OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;
  
  IF INSTR(VTIPO,'CHAR')>0 OR INSTR(VTIPO,'DATE')>0  THEN
    VSQL:='public String '||VGET||'() {';
  ELSE
    VSQL:='public BigDecimal '||VGET||'() {';
  END IF;
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='return this.'||LOWER(SUBSTR(VCAP,1,1))||SUBSTR(VCAP,2,LENGTH(VCAP))||';';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='}';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;    

VSQL:='  public DMLObject getSelectByPK() {';
INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
NCONT:=NCONT+1;
VSQL:='  if(!retrieveSQL) return null;';
INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
NCONT:=NCONT+1;

VSQL:='  DMLObject result = new DMLObject();';
INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
NCONT:=NCONT+1;

VSQL:='  String sql = "SELECT * FROM '||TABLA||' ";';
INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
NCONT:=NCONT+1;

VSQL:='  String conditions = "";';
INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
NCONT:=NCONT+1;

VSQL:='  ArrayList values = new ArrayList();';
INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
NCONT:=NCONT+1;


OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;
  
  

  SELECT COUNT(1) INTO NDATOS FROM USER_CONS_COLUMNS
  WHERE TABLE_NAME=TABLA AND COLUMN_NAME=VCOLUMNA  AND CONSTRAINT_NAME NOT LIKE 'SYS_%'
   AND CONSTRAINT_NAME NOT LIKE '%FK';
  
  IF NDATOS>0 THEN
  
          IF INSTR(VTIPO,'CHAR')>0 OR INSTR(VTIPO,'DATE')>0 THEN
            VSQL:='if(this.'||VGET||'() != null && "null".equals(this.'||VGET||'())) {';
          ELSE
            VSQL:='if(this.'||VGET||'() != null && this.'||VGET||'().longValue() == -999) {';    
          END IF;
          INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
          NCONT:=NCONT+1;
        
          VSQL:='conditions += " AND '||VCOLUMNA||' IS NULL";';
          INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
          NCONT:=NCONT+1;
        
          VSQL:='} else if(this.'||VGET||'() != null) {';
          INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
          NCONT:=NCONT+1;
        
          VSQL:='conditions += " AND '||VCOLUMNA||' =?";';
          INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
          NCONT:=NCONT+1;
        
          VSQL:='values.add(this.'||VGET||'());';
          INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
          NCONT:=NCONT+1;
        
          VSQL:='}';
          INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
          NCONT:=NCONT+1;

  END IF;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;   

  VSQL:='if(!"".equals(conditions)) {';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='conditions = conditions.substring(4).trim();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='sql += "WHERE " + conditions;';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='result.setSql(sql);';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='result.setParameters(values.toArray());';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='}';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='return result;';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='}';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;


  VSQL:='public DMLObject getSelect() {';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='if(!retrieveSQL) return null;';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='DMLObject result = new DMLObject();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='String sql = "SELECT * FROM '||TABLA||' ";';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='String conditions = "";';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='ArrayList values = new ArrayList();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;


OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;
  


  SELECT COUNT(1) INTO NDATOS FROM USER_CONS_COLUMNS
  WHERE TABLE_NAME=TABLA AND COLUMN_NAME=VCOLUMNA  AND CONSTRAINT_NAME NOT LIKE 'SYS_%'
  AND CONSTRAINT_NAME LIKE 'SYS_%'  AND CONSTRAINT_NAME NOT LIKE '%FK';
  
  IF NDATOS>0 THEN  
  
      IF INSTR(VTIPO,'CHAR')>0 OR INSTR(VTIPO,'DATE')>0 THEN
        VSQL:='if(this.'||VGET||'() != null && "null".equals(this.'||VGET||'())) {';
      ELSE
        VSQL:='if(this.'||VGET||'() != null && this.'||VGET||'().longValue() == -999) {';    
      END IF;
      INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
      NCONT:=NCONT+1;
    
      VSQL:='conditions += " AND '||VCOLUMNA||' IS NULL";';
      INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
      NCONT:=NCONT+1;
    
      VSQL:='} else if(this.'||VGET||'() != null) {';
      INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
      NCONT:=NCONT+1;
    
      VSQL:='conditions += " AND '||VCOLUMNA||' =?";';
      INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
      NCONT:=NCONT+1;
    
      VSQL:='values.add(this.'||VGET||'());';
      INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
      NCONT:=NCONT+1;
    
      VSQL:='}';
      INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
      NCONT:=NCONT+1;

  END IF;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;   


  VSQL:='if(!"".equals(conditions)) {';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='conditions = conditions.substring(4).trim();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='sql += "WHERE " + conditions;';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='result.setSql(sql);';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='result.setParameters(values.toArray());';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='}';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='return result;';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;
  VSQL:='}';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;


  VSQL:='public DMLObject getUpdate() {';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='if(!retrieveSQL) return null;';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='DMLObject result = new DMLObject();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='String sql = "UPDATE '|| TABLA||' SET ";';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='String fields = "";';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='String conditions = "";';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

  VSQL:='ArrayList pkValues = new ArrayList();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;


  VSQL:='ArrayList values = new ArrayList();';
  INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
  NCONT:=NCONT+1;

OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;

  SELECT COUNT(1) INTO NDATOS FROM USER_CONS_COLUMNS
  WHERE TABLE_NAME=TABLA AND COLUMN_NAME=VCOLUMNA  AND CONSTRAINT_NAME NOT LIKE 'SYS_%'
   AND CONSTRAINT_NAME NOT LIKE '%FK';
  
  IF NDATOS>0 THEN
    VSQL:='conditions += " AND '||VCOLUMNA||' = ?";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='pkValues.add(this.'||VGET||'());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
  ELSE
    VSQL:='fields += " '||VCOLUMNA||' = ?, ";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='values.add(this.'||VGET||'());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
  END IF;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;   


    VSQL:='for(int i = 0; i < pkValues.size(); i++) {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='values.add(pkValues.get(i));';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='};';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='fields = fields.substring(0, fields.length() - 2).trim();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='conditions = conditions.substring(4).trim();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='sql += fields + " WHERE " + conditions;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='result.setSql(sql);';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='result.setParameters(values.toArray());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='return result;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

    VSQL:='public DMLObject getInsert() {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='if(!retrieveSQL) return null;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='DMLObject result = new DMLObject();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

    VSQL:='String sql = "INSERT INTO '|| TABLA||' ( ";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='String fields = "";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='String fieldValues = "";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='ArrayList values = new ArrayList();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;


OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;

  SELECT COUNT(1) INTO NDATOS FROM USER_CONS_COLUMNS
  WHERE TABLE_NAME=TABLA AND COLUMN_NAME=VCOLUMNA  AND CONSTRAINT_NAME NOT LIKE 'SYS_%'
   AND CONSTRAINT_NAME NOT LIKE '%FK';
  
    VSQL:='fields += ",'|| VCOLUMNA||' ";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='fieldValues += ", ?";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='values.add(this.'||VGET||'());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;   
    VSQL:='fields = fields.substring(1).trim();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='fieldValues = fieldValues.substring(1).trim();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='sql += fields + " ) VALUES (" + fieldValues + ")";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='result.setSql(sql);';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='result.setParameters(values.toArray());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='return result;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;


    VSQL:='public DMLObject getDelete() {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='    if(!retrieveSQL) return null;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='DMLObject result = new DMLObject();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='String sql = "DELETE FROM '||TABLA||' WHERE ";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

    VSQL:='String conditions = "";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='ArrayList values = new ArrayList();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;

  SELECT COUNT(1) INTO NDATOS FROM USER_CONS_COLUMNS
  WHERE TABLE_NAME=TABLA AND COLUMN_NAME=VCOLUMNA  AND CONSTRAINT_NAME NOT LIKE 'SYS_%'
   AND CONSTRAINT_NAME NOT LIKE '%FK';
  
  IF NDATOS>0 THEN
    VSQL:='conditions += " AND '||VCOLUMNA||' = ?";';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='values.add(this.'||VGET||'());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
  END IF;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;   

    VSQL:='conditions = conditions.substring(4).trim();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='result.setSql(sql + conditions);';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='result.setParameters(values.toArray());';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='return result;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;    
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;


    VSQL:='public boolean validate() {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='return true;  }';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;


    VSQL:='public boolean doCompare(Object compareWith) {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:=TABLA||' instance = ('||TABLA||')compareWith;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='boolean equalObjects = true;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;

  SELECT COUNT(1) INTO NDATOS FROM USER_CONS_COLUMNS
  WHERE TABLE_NAME=TABLA AND COLUMN_NAME=VCOLUMNA  AND CONSTRAINT_NAME NOT LIKE 'SYS_%'
   AND CONSTRAINT_NAME NOT LIKE '%FK';
  
    VSQL:='if(equalObjects && !this.'||VGET||'().equals(instance.'||VGET||'())) equalObjects = false;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;   

    VSQL:='return equalObjects;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

    VSQL:='public Object selectAsObject() {';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:=TABLA||' result = new '||TABLA||'();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

    VSQL:=' DataRow objectData = null;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:=' objectData = selectAsDataRow();';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

OPEN RS_ARCHIVOS_PLANOS FOR
SELECT COLUMN_NAME,DATA_TYPE,
   'get'||replace (initcap(column_name),'_','') column_get,
   'set'||replace (initcap(column_name),'_','') column_set, replace (initcap(column_name),'_','') column_cap 
    FROM ALL_TAB_COLUMNS WHERE TABLE_NAME =TABLA;

LOOP
  FETCH RS_ARCHIVOS_PLANOS INTO VCOLUMNA,VTIPO,VGET,VSET,VCAP;
  EXIT WHEN RS_ARCHIVOS_PLANOS%NOTFOUND;

  IF INSTR(VTIPO,'CHAR')>0 OR INSTR(VTIPO,'DATE')>0 THEN
    VSQL:='result.'||VSET||'((String)objectData.getData("'||VCOLUMNA||'"));';
  ELSE
    VSQL:='result.'||VSET||'((BigDecimal)objectData.getData("'||VCOLUMNA||'"));';
  END IF;
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

END LOOP;
CLOSE RS_ARCHIVOS_PLANOS;  

    VSQL:='return result;';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;
    VSQL:='}';
    INSERT INTO ARCHIVOS_PLANOS values (NCONT,SYSDATE,'BEAN',VSQL);  
    NCONT:=NCONT+1;

  COMMIT;
  RETURN 0;
  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        AUX_ORA_ERR := 'OTHERS; ' || SQLERRM;
        IF LENGTH(AUX_MSG_ERR) = 0 THEN
          AUX_MSG_ERR := 'ERROR OCURRIDO EN LA TRANSFERENCIA DE ARCHIVOS VALUACION.';
        END IF;
        HONORARIOS.P_Err_Error_Rutina(0,
                                      -1,
                                      'PROCESO',
                                      'INTERFASES_LLENA_PRECIOS',
                                      AUX_ORA_ERR,
                                      AUX_MSG_ERR);
        RETURN 1;
  END;
END FN_CREA_BEAN;
/