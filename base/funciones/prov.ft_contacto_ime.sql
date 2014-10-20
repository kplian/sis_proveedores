CREATE OR REPLACE FUNCTION "prov"."ft_contacto_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema Proveedores
 FUNCION: 		prov.ft_contacto_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'prov.tcontacto'
 AUTOR: 		 (gsarmiento)
 FECHA:	        16-10-2014 14:03:15
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
	v_idContacto	integer;
			    
BEGIN

    v_nombre_funcion = 'prov.ft_contacto_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'PROV_CONTAC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:03:15
	***********************************/

	if(p_transaccion='PROV_CONTAC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into prov.tcontacto(
			id_proveedor,
			emailContacto,
			estado_reg,
			nombreContacto,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_proveedor,
			v_parametros.emailContacto,
			'activo',
			v_parametros.nombreContacto,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING idContacto into v_idContacto;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Contactos almacenado(a) con exito (idContacto'||v_idContacto||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'idContacto',v_idContacto::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'PROV_CONTAC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:03:15
	***********************************/

	elsif(p_transaccion='PROV_CONTAC_MOD')then

		begin
			--Sentencia de la modificacion
			update prov.tcontacto set
			id_proveedor = v_parametros.id_proveedor,
			emailContacto = v_parametros.emailContacto,
			nombreContacto = v_parametros.nombreContacto,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where idContacto=v_parametros.idContacto;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Contactos modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'idContacto',v_parametros.idContacto::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'PROV_CONTAC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:03:15
	***********************************/

	elsif(p_transaccion='PROV_CONTAC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from prov.tcontacto
            where idContacto=v_parametros.idContacto;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Contactos eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'idContacto',v_parametros.idContacto::varchar);
              
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
ALTER FUNCTION "prov"."ft_contacto_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
