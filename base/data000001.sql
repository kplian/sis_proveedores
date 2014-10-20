/***********************************I-DAT-GSS-PROV-0-20/10/2014*****************************************/

select pxp.f_insert_tgui ('SISTEMA PROVEEDORES', '', 'PROV', 'si', 1, '', 1, '', '', 'PROV');
select pxp.f_insert_tgui ('Categoria Proveedor', 'categoria proveedor', 'CARPRO', 'si', 1, 'sis_proveedores/vista/categoria_proveedor/CategoriaProveedor.php', 2, '', 'CategoriaProveedor', 'PROV');
select pxp.f_insert_tgui ('Clasificacion Proveedor', 'clasificacion proveedor', 'CLAPRO', 'si', 2, 'sis_proveedores/vista/clasificacion_proveedor/ClasificacionProveedor.php', 2, '', 'ClasificacionProveedor', 'PROV');
select pxp.f_insert_tgui ('Documento Categoria Clasificacion', 'documento categoria clasificacion', 'DOCATCLA', 'si', 3, 'sis_proveedores/vista/documento_categoria_clasificacion/DocumentoCategoriaClasificacion.php', 2, '', 'DocumentoCategoriaClasificacion', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_categoria_proveedor_ime', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_categoria_proveedor_sel', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_clasificacion_proveedor_ime', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_clasificacion_proveedor_sel', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_contacto_ime', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_contacto_sel', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_documento_categoria_clasificacion_ime', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tfuncion ('prov.ft_documento_categoria_clasificacion_sel', 'Funcion para tabla     ', 'PROV');
select pxp.f_insert_tprocedimiento ('PM_CATPRO_INS', 'Insercion de registros', 'si', '', '', 'prov.ft_categoria_proveedor_ime');
select pxp.f_insert_tprocedimiento ('PM_CATPRO_MOD', 'Modificacion de registros', 'si', '', '', 'prov.ft_categoria_proveedor_ime');
select pxp.f_insert_tprocedimiento ('PM_CATPRO_ELI', 'Eliminacion de registros', 'si', '', '', 'prov.ft_categoria_proveedor_ime');
select pxp.f_insert_tprocedimiento ('PM_CATPRO_SEL', 'Consulta de datos', 'si', '', '', 'prov.ft_categoria_proveedor_sel');
select pxp.f_insert_tprocedimiento ('PM_CATPRO_CONT', 'Conteo de registros', 'si', '', '', 'prov.ft_categoria_proveedor_sel');
select pxp.f_insert_tprocedimiento ('PM_CLAPRO_INS', 'Insercion de registros', 'si', '', '', 'prov.ft_clasificacion_proveedor_ime');
select pxp.f_insert_tprocedimiento ('PM_CLAPRO_MOD', 'Modificacion de registros', 'si', '', '', 'prov.ft_clasificacion_proveedor_ime');
select pxp.f_insert_tprocedimiento ('PM_CLAPRO_ELI', 'Eliminacion de registros', 'si', '', '', 'prov.ft_clasificacion_proveedor_ime');
select pxp.f_insert_tprocedimiento ('PM_CLAPRO_SEL', 'Consulta de datos', 'si', '', '', 'prov.ft_clasificacion_proveedor_sel');
select pxp.f_insert_tprocedimiento ('PM_CLAPRO_CONT', 'Conteo de registros', 'si', '', '', 'prov.ft_clasificacion_proveedor_sel');
select pxp.f_insert_tprocedimiento ('PROV_CONTAC_INS', 'Insercion de registros', 'si', '', '', 'prov.ft_contacto_ime');
select pxp.f_insert_tprocedimiento ('PROV_CONTAC_MOD', 'Modificacion de registros', 'si', '', '', 'prov.ft_contacto_ime');
select pxp.f_insert_tprocedimiento ('PROV_CONTAC_ELI', 'Eliminacion de registros', 'si', '', '', 'prov.ft_contacto_ime');
select pxp.f_insert_tprocedimiento ('PROV_CONTAC_SEL', 'Consulta de datos', 'si', '', '', 'prov.ft_contacto_sel');
select pxp.f_insert_tprocedimiento ('PROV_CONTAC_CONT', 'Conteo de registros', 'si', '', '', 'prov.ft_contacto_sel');
select pxp.f_insert_tprocedimiento ('PM_DOCATCLA_INS', 'Insercion de registros', 'si', '', '', 'prov.ft_documento_categoria_clasificacion_ime');
select pxp.f_insert_tprocedimiento ('PM_DOCATCLA_MOD', 'Modificacion de registros', 'si', '', '', 'prov.ft_documento_categoria_clasificacion_ime');
select pxp.f_insert_tprocedimiento ('PM_DOCATCLA_ELI', 'Eliminacion de registros', 'si', '', '', 'prov.ft_documento_categoria_clasificacion_ime');
select pxp.f_insert_tprocedimiento ('PM_DOCATCLA_SEL', 'Consulta de datos', 'si', '', '', 'prov.ft_documento_categoria_clasificacion_sel');
select pxp.f_insert_tprocedimiento ('PM_DOCATCLA_CONT', 'Conteo de registros', 'si', '', '', 'prov.ft_documento_categoria_clasificacion_sel');
select pxp.f_insert_trol ('administrador de proveedores', 'PROV - Administrador', 'PROV');

/***********************************F-DAT-GSS-PROV-0-20/10/2014*****************************************/