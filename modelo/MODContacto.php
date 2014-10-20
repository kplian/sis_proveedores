<?php
/**
*@package pXP
*@file gen-MODContacto.php
*@author  (gsarmiento)
*@date 16-10-2014 14:03:15
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODContacto extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarContacto(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='prov.ft_contacto_sel';
		$this->transaccion='PROV_CONTAC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('idContacto','int4');
		$this->captura('id_proveedor','int4');
		$this->captura('emailContacto','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('nombreContacto','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarContacto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='prov.ft_contacto_ime';
		$this->transaccion='PROV_CONTAC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_proveedor','id_proveedor','int4');
		$this->setParametro('emailContacto','emailContacto','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('nombreContacto','nombreContacto','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarContacto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='prov.ft_contacto_ime';
		$this->transaccion='PROV_CONTAC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('idContacto','idContacto','int4');
		$this->setParametro('id_proveedor','id_proveedor','int4');
		$this->setParametro('emailContacto','emailContacto','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('nombreContacto','nombreContacto','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarContacto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='prov.ft_contacto_ime';
		$this->transaccion='PROV_CONTAC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('idContacto','idContacto','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>