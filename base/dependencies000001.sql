/***********************************I-DEP-GSS-PROV-0-20/10/2014*****************************************/


select pxp.f_insert_testructura_gui ('PROV', 'SISTEMA');
select pxp.f_insert_testructura_gui ('CARPRO', 'PROV');
select pxp.f_insert_testructura_gui ('CLAPRO', 'PROV');
select pxp.f_insert_testructura_gui ('DOCATCLA', 'PROV');
select pxp.f_insert_tprocedimiento_gui ('PM_CATPRO_INS', 'CARPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATPRO_MOD', 'CARPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATPRO_ELI', 'CARPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATPRO_SEL', 'CARPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CLAPRO_INS', 'CLAPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CLAPRO_MOD', 'CLAPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CLAPRO_ELI', 'CLAPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CLAPRO_SEL', 'CLAPRO', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATPRO_SEL', 'DOCATCLA', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CLAPRO_SEL', 'DOCATCLA', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DOCATCLA_INS', 'DOCATCLA', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DOCATCLA_MOD', 'DOCATCLA', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DOCATCLA_ELI', 'DOCATCLA', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DOCATCLA_SEL', 'DOCATCLA', 'no');
select pxp.f_insert_tgui_rol ('PROV', 'PROV - Administrador');
select pxp.f_insert_tgui_rol ('SISTEMA', 'PROV - Administrador');
select pxp.f_insert_tgui_rol ('DOCATCLA', 'PROV - Administrador');
select pxp.f_insert_tgui_rol ('CLAPRO', 'PROV - Administrador');
select pxp.f_insert_tgui_rol ('CARPRO', 'PROV - Administrador');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CATPRO_SEL', 'DOCATCLA');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CLAPRO_SEL', 'DOCATCLA');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_DOCATCLA_INS', 'DOCATCLA');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_DOCATCLA_MOD', 'DOCATCLA');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_DOCATCLA_ELI', 'DOCATCLA');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_DOCATCLA_SEL', 'DOCATCLA');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CLAPRO_SEL', 'CLAPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CLAPRO_INS', 'CLAPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CLAPRO_MOD', 'CLAPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CLAPRO_ELI', 'CLAPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CATPRO_INS', 'CARPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CATPRO_SEL', 'CARPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CATPRO_MOD', 'CARPRO');
select pxp.f_insert_trol_procedimiento_gui ('PROV - Administrador', 'PM_CATPRO_ELI', 'CARPRO');



/***********************************F-DEP-GSS-PROV-0-20/10/2014*****************************************/