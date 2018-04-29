function Numerico(variable){
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        return Numer;
    }

function ValNumero(Control){
	Control.value=Numerico(Control.value);
}


function decimal(dato){
	numero=parseFloat(dato)
	if (isNaN(numero)==true || numero<=0 || numero>=2.5) {
		return ""
	}
	return numero
}

function validateDecimal(valor) {
    var RE = /^\d*\.?\d*$/;
    if (RE.test(valor)) {
        return valor;
    } else {
        return "";
    }
} 

function decimales(Control){
	//Control.value=decimal(Control.value);
	Control.value=validateDecimal(Control.value);
}