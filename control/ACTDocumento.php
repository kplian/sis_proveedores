<?php
/**
*@package pXP
*@file gen-ACTDocumento.php
*@author  (gsarmiento)
*@date 16-10-2014 14:14:16
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTDocumento extends ACTbase{    
			
	function listarDocumento(){
		$this->objParam->defecto('ordenacion','id_documento');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODDocumento','listarDocumento');
		} else{
			$this->objFunc=$this->create('MODDocumento');
			
			$this->res=$this->objFunc->listarDocumento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarDocumento(){
		$this->objFunc=$this->create('MODDocumento');	
		if($this->objParam->insertar('id_documento')){
			$this->res=$this->objFunc->insertarDocumento($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarDocumento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarDocumento(){
			$this->objFunc=$this->create('MODDocumento');	
		$this->res=$this->objFunc->eliminarDocumento($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>