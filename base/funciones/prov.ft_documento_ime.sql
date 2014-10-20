CREATE OR REPLACE FUNCTION "prov"."ft_documento_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema Proveedores
 FUNCION: 		prov.ft_documento_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'prov.tdocumento'
 AUTOR: 		 (gsarmiento)
 FECHA:	        16-10-2014 14:14:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_documento	integer;
			    
BEGIN

    v_nombre_funcion = 'prov.ft_documento_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'PROV_DOC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:14:16
	***********************************/

	if(p_transaccion='PROV_DOC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into prov.tdocumento(
			id_proveedor,
			fecha_vencimiento,
			estado,
			estado_reg,
			version,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_proveedor,
			v_parametros.fecha_vencimiento,
			v_parametros.estado,
			'activo',
			v_parametros.version,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_documento into v_id_documento;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Documento almacenado(a) con exito (id_documento'||v_id_documento||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_documento',v_id_documento::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'PROV_DOC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:14:16
	***********************************/

	elsif(p_transaccion='PROV_DOC_MOD')then

		begin
			--Sentencia de la modificacion
			update prov.tdocumento set
			id_proveedor = v_parametros.id_proveedor,
			fecha_vencimiento = v_parametros.fecha_vencimiento,
			estado = v_parametros.estado,
			version = v_parametros.version,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_documento=v_parametros.id_documento;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Documento modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_documento',v_parametros.id_documento::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'PROV_DOC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:14:16
	***********************************/

	elsif(p_transaccion='PROV_DOC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from prov.tdocumento
            where id_documento=v_parametros.id_documento;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Documento eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_documento',v_parametros.id_documento::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "prov"."ft_documento_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
