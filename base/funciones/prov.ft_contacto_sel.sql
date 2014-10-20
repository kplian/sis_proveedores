CREATE OR REPLACE FUNCTION "prov"."ft_contacto_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Sistema Proveedores
 FUNCION: 		prov.ft_contacto_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'prov.tcontacto'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'prov.ft_contacto_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'PROV_CONTAC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:03:15
	***********************************/

	if(p_transaccion='PROV_CONTAC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						contac.idContacto,
						contac.id_proveedor,
						contac.emailContacto,
						contac.estado_reg,
						contac.nombreContacto,
						contac.id_usuario_ai,
						contac.fecha_reg,
						contac.usuario_ai,
						contac.id_usuario_reg,
						contac.id_usuario_mod,
						contac.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from prov.tcontacto contac
						inner join segu.tusuario usu1 on usu1.id_usuario = contac.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = contac.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'PROV_CONTAC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		gsarmiento	
 	#FECHA:		16-10-2014 14:03:15
	***********************************/

	elsif(p_transaccion='PROV_CONTAC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(idContacto)
					    from prov.tcontacto contac
					    inner join segu.tusuario usu1 on usu1.id_usuario = contac.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = contac.id_usuario_mod
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
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
ALTER FUNCTION "prov"."ft_contacto_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
