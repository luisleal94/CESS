function Numerico(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer<8){
        	return Numer;	
        }
       	else{
            return "";	
       	}
}

function MenarcaCorrecta(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer<50){
        	return Numer;	
        }
       	else{
            return "";	
       	}
}

function Numerico2(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer<4){
        	return Numer;	
        }
       	else{
            return "";	
       	}
}

function Tel(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer< 9999999999){
            return Numer;
        }
        else{
            return "";
        }
}

function EdadCorrecta(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer<32){
        	return Numer;	
        }
       	else{
            return "";	
       	}
}

function AnioCorrecto(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer<2050){
        	return Numer;	
        }
       	else{
            return "";	
       	}
}

function Mescorrecto(variable){
        Numer=variable;
        if(Numer[0]=='-'){
            return "";
        }
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        if(Numer<13){
        	return Numer;	
        }
       	else{
            return "";	
       	}
}

function ValNumero(Control){
	Control.value=Numerico(Control.value);
}

function Menarca(Control){
	Control.value=MenarcaCorrecta(Control.value);
}

function ValNumero2(Control){
	Control.value=Numerico2(Control.value);
}

function Telefono(Control){
	Control.value=Tel(Control.value);
}

function Edad(Control){
	Control.value=EdadCorrecta(Control.value);
}

function AnioCorrec(Control){
	Control.value=AnioCorrecto(Control.value);
}

function Mes(Control){
	Control.value=Mescorrecto(Control.value);
}

function decimal(dato){
        Numer=dato;
        if(Numer[0]=='-'){
            return "";
        }
	numero=parseFloat(dato)
	if (isNaN(numero)==true || numero<=0 || numero>=2.5) {
		return ""
	}
	return numero
}

function validateDecimal(valor) {
    Numer=valor;
    if(Numer[0]=='-'){
        return "";
    }
    var RE = /^\d*\.?\d*$/;
    if (RE.test(valor)) {
        return valor;
    } else {
        return "";
    }
} 

function validaPeso(valor) {
	Numer=valor;
	if(Numer[0]=='-'){
            return "";
	}
        var RE = /^\d*\.?\d*$/;
	if (RE.test(valor)) {
            if(parseFloat(valor)<200){
		return valor;
   	}else{
            return "";
   	}
    } else {
        return "";
    }
} 

function validaEdad(valor) {
	Numer=valor;
	if(Numer[0]=='-'){
            return "";
	}
        var RE = /^\d*\.?\d*$/;
	if (RE.test(valor)) {
            if(parseFloat(valor)<250){
		return valor;
   	}else{
            return "";
   	}
    } else {
        return "";
    }
} 

function validaTemp(valor) {
	Numer=valor;
	if(Numer[0]=='-'){
            return "";
	}
        var RE = /^\d*\.?\d*$/;
	if (RE.test(valor)) {
            if(parseFloat(valor)<50){
		return valor;
   	}else{
            return "";
   	}
    } else {
        return "";
    }
}

function validaFc(valor){
    Numer=valor;
    if(Numer[0]=='-'){
        return "";
    }
    var RE = /^\d*\.?\d*$/;
    if (RE.test(valor)) {
            return valor;
    }else {
        return "";
    }
}
function decimales(Control){
	//Control.value=decimal(Control.value);
	Control.value=validateDecimal(Control.value);
}

function decimalTalla(Control){
	//Control.value=decimal(Control.value);
	Control.value=validaEdad(Control.value);
}

function decimalPeso(Control){
	//Control.value=decimal(Control.value);
	Control.value=validaPeso(Control.value);
}

function decimalTemp(Control){
	//Control.value=decimal(Control.value);
	Control.value=validaTemp(Control.value);
}

function decimalFC(Control){
    Control.value=validaFc(Control.value);
}
function IsNumeric(valor){ 
    var log=valor.length; var sw="S"; 
    for (x=0; x<log; x++) 
    { v1=valor.substr(x,1); 
    v2 = parseInt(v1); 
    //Compruebo si es un valor numérico 
    if (isNaN(v2)) { sw= "N";} 
    } 
    if (sw=="S") {return true;} else {return false; } 
} 
var primerslap=false; 
var segundoslap=false; 

function formateafecha(fecha){ 
    var long = fecha.length; 
    var dia; 
    var mes; 
    var ano; 
    if ((long>=2) && (primerslap==false)) { dia=fecha.substr(0,2); 
    if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00")) { fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); primerslap=true; } 
    else { fecha=""; primerslap=false;} 
    } 
    else 
    { dia=fecha.substr(0,1); 
    if (IsNumeric(dia)==false) 
    {fecha="";} 
    if ((long<=2) && (primerslap=true)) {fecha=fecha.substr(0,1); primerslap=false; } 
    } 
    if ((long>=5) && (segundoslap==false)) 
    { mes=fecha.substr(3,2); 
    if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); segundoslap=true; } 
    else { fecha=fecha.substr(0,3);; segundoslap=false;} 
    } 
    else { if ((long<=5) && (segundoslap=true)) { fecha=fecha.substr(0,4); segundoslap=false; } } 
    if (long>=7) 
    { ano=fecha.substr(6,4); 
    if (IsNumeric(ano)==false) { fecha=fecha.substr(0,6); } 
    else { if (long==10){ if ((ano==0) || (ano<1900) || (ano>2100)) { fecha=fecha.substr(0,6); } } } 
    } 
    if (long>=10) 
    { 
    fecha=fecha.substr(0,10); 
    dia=fecha.substr(0,2); 
    mes=fecha.substr(3,2); 
    ano=fecha.substr(6,4); 
    // Año no viciesto y es febrero y el dia es mayor a 28 
    if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { fecha=fecha.substr(0,2)+"/"; } 
    } 
    return (fecha); 
}