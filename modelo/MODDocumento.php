<?php
/**
*@package pXP
*@file gen-MODDocumento.php
*@author  (gsarmiento)
*@date 16-10-2014 14:14:16
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODDocumento extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarDocumento(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='prov.ft_documento_sel';
		$this->transaccion='PROV_DOC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_documento','int4');
		$this->captura('id_proveedor','int4');
		$this->captura('fecha_vencimiento','date');
		$this->captura('estado','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('version','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarDocumento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='prov.ft_documento_ime';
		$this->transaccion='PROV_DOC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_proveedor','id_proveedor','int4');
		$this->setParametro('fecha_vencimiento','fecha_vencimiento','date');
		$this->setParametro('estado','estado','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('version','version','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarDocumento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='prov.ft_documento_ime';
		$this->transaccion='PROV_DOC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_documento','id_documento','int4');
		$this->setParametro('id_proveedor','id_proveedor','int4');
		$this->setParametro('fecha_vencimiento','fecha_vencimiento','date');
		$this->setParametro('estado','estado','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('version','version','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarDocumento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='prov.ft_documento_ime';
		$this->transaccion='PROV_DOC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_documento','id_documento','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>