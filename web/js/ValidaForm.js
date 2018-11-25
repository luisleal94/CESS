function ValidaForm(){
	var Folio=document.getElementById('Folio').value;
	var Precio=document.getElementById('Precio').value;
	var Peso=document.getElementById('multiplicando').value;
	var Talla=document.getElementById('multiplicador').value;
	var Temp=document.getElementById('Temperatura').value;
	var FC=document.getElementById('FC').value;
	var FR=document.getElementById('FR').value;
	var Sistolica=document.getElementById('Sistolica').value;
        var Diastolica=document.getElementById('Diastolica').value;
	var Padecimiento=document.getElementById('Padecimiento').value;
	var Exploracion=document.getElementById('Exploracion').value;
	var tags=document.getElementById('tags').value;
	var Tratamiento=document.getElementById('Tratamiento').value;
	var Bandera = false;

	if (Folio==null || Folio.length==0) {
		alert('El Folio no debe ir vacío');
		return false;
	}
	if(Precio == null || Precio.length == 0){
		alert('El costo de la consulta no debe ir vacío');
		return false;
	}
	if(Peso == null || Peso.length == 0){
		alert('El campo Peso no debe ir vacío');
		return false;
	}
	if(Talla == null || Talla.length == 0){
		alert('El campo Talla no debe ir vacío');
		return false;
	}
	if(Temp == null || Temp.length == 0){
		alert('El campo temperatura no debe ir vacío');
		return false;
	}
	if(FC == null || FC.length == 0){
		alert('El campo frecuencia cardica no debe ir vacío');
		return false;
	}
        if(parseFloat(FC)<60 || parseFloat(FC)>100){
            alert('Parametros incorrectos en la frecuencia cardica: '+parseFloat(FC));
            return false;
        }
	if(FR == null || FR.length == 0){
            alert('El campo Frecuencia respiratorio no debe ir vacío');
            return false;
	}
        if(parseFloat(FR)<13 || parseFloat(FR)>40){
            alert('Parametros incorrectos en la frecuencia respiratoria: '+parseFloat(FR));
            return false;
        }
        if(Sistolica == null || Sistolica.length == 0){
		alert('El parametro Sistolico no debe ir vacío');
		return false;
	}
        if(parseFloat(Sistolica)<110 || parseFloat(Sistolica)>200){
            alert('Parametros incorrectos en el parametro Sistolico: '+parseFloat(Sistolica));
            return false;
        }
	if(Diastolica == null || Diastolica.length == 0){
		alert('El parametro diastolico no debe ir vacío');
		return false;
	}
        if(parseFloat(Diastolica)<60 || parseFloat(Diastolica)>90){
            alert('Parametros incorrectos en el parametro diastolico: '+parseFloat(Diastolica));
            return false;
        }
	if(Padecimiento == null || Padecimiento.length == 0){
		alert('El campo Padecimiento no debe ir vacío');
		return false;
	}
	if(Exploracion == null || Exploracion.length == 0){
		alert('La explotación física no debe ir vacío');
		return false;
	}
	if(tags == null || tags.length == 0){
		alert('El diagnóstico no debe ir vacío');
		return false;
	}
	if(Tratamiento == null || Tratamiento.length == 0){
		alert('El campo tratamiento no debe ir vacío');
		return false;
	}
        else{
            var answer = confirm("¿Estas seguro de guardar?")
            if (answer){
            	//window.location = "http://www.google.com/";
            	document.formulario.submit() 
            }
	}
}

function AnioUsuarios(){
    var Anio=document.getElementById('Anio').value;
    if(Anio.length!=4){
        alert('El campo Año de nacimiento incorrecto');
        return false;
    }else{
        return true;
    }
}