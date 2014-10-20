<?php
/**
*@package pXP
*@file gen-ACTContacto.php
*@author  (gsarmiento)
*@date 16-10-2014 14:03:15
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTContacto extends ACTbase{    
			
	function listarContacto(){
		$this->objParam->defecto('ordenacion','idContacto');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODContacto','listarContacto');
		} else{
			$this->objFunc=$this->create('MODContacto');
			
			$this->res=$this->objFunc->listarContacto($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarContacto(){
		$this->objFunc=$this->create('MODContacto');	
		if($this->objParam->insertar('idContacto')){
			$this->res=$this->objFunc->insertarContacto($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarContacto($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarContacto(){
			$this->objFunc=$this->create('MODContacto');	
		$this->res=$this->objFunc->eliminarContacto($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>