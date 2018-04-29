function mostrar(){
	document.getElementById("muestra").style.display="block";
}
		
function ocultar(){
	document.getElementById("muestra").style.display="none";
}

function mostrar2(){
	document.getElementById("muestra2").style.display="block";
}

function ocultar2(){
	document.getElementById("muestra2").style.display="none";
}

function mostrar3(){
	document.getElementById("muestra3").style.display="block";
}

function ocultar3(){
	document.getElementById("muestra3").style.display="none";
}

function mostrarA(){
	document.getElementById("muestraA").style.display="block";
}

function ocultarA(){
	document.getElementById("muestraA").style.display="none";
}

function mostrarCiga(){
	document.getElementById("muestraC").style.display="block";
}

function ocultarCiga(){
	document.getElementById("muestraC").style.display="none";
}

function cirujia(){
	document.getElementById("ciru").style.display="block";
}

function Oculcirujia(){
	document.getElementById("ciru").style.display="none";
}

function mostrarDiabe(){
	document.getElementById("diabetes").style.display="block";
}

function ocultarDiabe(){
	document.getElementById("diabetes").style.display="none";
}

function mostrarH(){
	document.getElementById("hiper").style.display="block";
}

function ocultarH(){
	document.getElementById("hiper").style.display="none";
}

function mostrarCon(){
	document.getElementById("convulcion").style.display="block";
}

function ocultarCon(){
	document.getElementById("convulcion").style.display="none";
}

function mostrarEs(){
	document.getElementById("estreni").style.display="block";
}

function ocultarEs(){
	document.getElementById("estreni").style.display="none";
}

function mostrarDia() {
	document.getElementById("diarrea").style.display="block";
}

function ocultarDia() {
	document.getElementById("diarrea").style.display="none";
}

function mostrarDes(){
	document.getElementById("despa").style.display="block";
}

function ocultarDes(){
	document.getElementById("despa").style.display="none";
}

function ocultarMujer(genero){
    if(genero.value=='Masculino'){
        document.getElementById("mujer").style.display="none"
    }else{
        document.getElementById("mujer").style.display="block"
    }
}