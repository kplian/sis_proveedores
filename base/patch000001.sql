/***********************************I-SCP-GSS-PROV-0-20/10/2014****************************************/

--  
-- Structure for table tcategoria 
--
CREATE TABLE prov.tcategoria (
  id_categoria INTEGER DEFAULT nextval('prov.tcategoria_proveedor_id_categoria_proveedor_seq'::regclass) NOT NULL, 
  nombre_categoria VARCHAR, 
  CONSTRAINT pk_tcategoria_proveedor__id_categoria_proveedor PRIMARY KEY(id_categoria)
) INHERITS (pxp.tbase)

WITH (oids = false);

COMMENT ON COLUMN prov.tcategoria.nombre_categoria
IS 'nombre de la categoria de compra';

--  
-- Structure for table tclasificacion 
--
CREATE TABLE prov.tclasificacion (
  id_clasificacion INTEGER DEFAULT nextval('prov.tclasificacion_proveedor_id_clasificacion_proveedor_seq'::regclass) NOT NULL, 
  nombre_clasificacion VARCHAR, 
  descripcion VARCHAR, 
  CONSTRAINT fk_tclasificacion_proveedor__id_clasificacion_proveedor PRIMARY KEY(id_clasificacion)
) INHERITS (pxp.tbase)

WITH (oids = false);

COMMENT ON COLUMN prov.tclasificacion.nombre_clasificacion
IS 'nombre de la clasificacion del proveedor';

COMMENT ON COLUMN prov.tclasificacion.descripcion
IS 'descripcion de la clasificacion del proveedor';

--  
-- Structure for table tcontacto 
--
CREATE TABLE prov.tcontacto (
  "idContacto" INTEGER DEFAULT nextval('prov."tcontacto_proveedor_idContacto_seq"'::regclass) NOT NULL, 
  "nombreContacto" VARCHAR, 
  "emailContacto" VARCHAR, 
  id_proveedor INTEGER, 
  CONSTRAINT pk_tcontacto_proveedor__id_contacto PRIMARY KEY("idContacto"), 
  CONSTRAINT fk_tcontacto_proveedor__id_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES param.tproveedor(id_proveedor)
    MATCH PARTIAL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) INHERITS (pxp.tbase)

WITH (oids = false);

COMMENT ON COLUMN prov.tcontacto."nombreContacto"
IS 'Nombre del contacto del proveedor';

COMMENT ON COLUMN prov.tcontacto."emailContacto"
IS 'Email del contacto del proveedor';

COMMENT ON COLUMN prov.tcontacto.id_proveedor
IS 'Relacion con la tabla proveedor';

--  
-- Structure for table tcuenta_bancaria 
--
CREATE TABLE prov.tcuenta_bancaria (
  id_cuenta_bancaria INTEGER DEFAULT nextval('prov.tcuenta_bancaria_proveedor_id_cuenta_bancaria_proveedor_seq'::regclass) NOT NULL, 
  id_proveedor INTEGER NOT NULL, 
  nro_cuenta_bancaria VARCHAR NOT NULL, 
  estado VARCHAR NOT NULL, 
  nombre_banco VARCHAR, 
  id_moneda INTEGER, 
  CONSTRAINT pk_tcuenta_bancaria_proveedor__id_cuenta_bancaria_proveedor PRIMARY KEY(id_cuenta_bancaria), 
  CONSTRAINT tcuenta_bancaria_proveedor_chk CHECK ((estado)::text = ANY (ARRAY[('habilitado'::character varying)::text, ('inhabilitado'::character varying)::text])), 
  CONSTRAINT fk_tcuenta_bancaria__id_moneda FOREIGN KEY (id_moneda)
    REFERENCES param.tmoneda(id_moneda)
    MATCH PARTIAL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE, 
  CONSTRAINT fk_tcuenta_bancaria_proveedor__id_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES param.tproveedor(id_proveedor)
    MATCH PARTIAL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) INHERITS (pxp.tbase)

WITH (oids = false);

COMMENT ON COLUMN prov.tcuenta_bancaria.nro_cuenta_bancaria
IS 'numero de la cuenta bancaria del proveedor';

COMMENT ON COLUMN prov.tcuenta_bancaria.estado
IS 'estado de la cuenta bancaria del proveedor';

--  
-- Structure for table tdocumento  
--
CREATE TABLE prov.tdocumento (
  id_documento INTEGER DEFAULT nextval('prov.tdocumento_proveedor_id_documento_proveedor_seq'::regclass) NOT NULL, 
  id_proveedor INTEGER, 
  estado VARCHAR, 
  fecha_vencimiento DATE, 
  version INTEGER, 
  CONSTRAINT pk_tdocumento_proveedor__id_documento_proveedor PRIMARY KEY(id_documento), 
  CONSTRAINT fk_tdocumento_proveedor__id_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES param.tproveedor(id_proveedor)
    MATCH PARTIAL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) INHERITS (pxp.tbase)

WITH (oids = false);

--  
-- Structure for table tdocumento_categoria  
--
CREATE TABLE prov.tdocumento_categoria_clasificacion (
  id_documento_categoria_clasificacion INTEGER DEFAULT nextval('prov.documento_categoria_clasifica_id_documento_categoria_clasif_seq'::regclass) NOT NULL, 
  id_categoria INTEGER, 
  id_clasificacion INTEGER, 
  documento VARCHAR, 
  presentar_legal VARCHAR(2), 
  CONSTRAINT pk_documento_categoria_clasificacion__id_documento_categ_clas PRIMARY KEY(id_documento_categoria_clasificacion), 
  CONSTRAINT fk_documento_categoria_clasificacion__id_categoria FOREIGN KEY (id_categoria)
    REFERENCES prov.tcategoria(id_categoria)
    MATCH PARTIAL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE, 
  CONSTRAINT fk_documento_categoria_clasificacion__id_clasificacion FOREIGN KEY (id_clasificacion)
    REFERENCES prov.tclasificacion(id_clasificacion)
    MATCH PARTIAL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) INHERITS (pxp.tbase)

WITH (oids = false);

--  
-- Structure for table tsucursal 
--
CREATE TABLE prov.tsucursal (
  id_sucursal INTEGER DEFAULT nextval('prov.tsucursal_proveedor_id_sucursal_proveedor_seq'::regclass) NOT NULL, 
  nombre VARCHAR, 
  direccion VARCHAR, 
  CONSTRAINT pk_tsucursal_proveedor__id_sucursal_proveedor PRIMARY KEY(id_sucursal)
) INHERITS (pxp.tbase)

WITH (oids = false);

COMMENT ON COLUMN prov.tsucursal.nombre
IS 'nombre de la sucursal del proveedor';

COMMENT ON COLUMN prov.tsucursal.direccion
IS 'direccion de la sucursal del proveedor';

/***********************************F-SCP-GSS-PROV-0-20/10/2014****************************************/