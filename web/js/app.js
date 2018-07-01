function addRow() {
         
    var myName = document.getElementById("name");
    var dosis = document.getElementById("dosis");
	var forma = document.getElementById("formaf");
	var unidades = document.getElementById("unidades");
	var via = document.getElementById("viaa");
	var presentacionn = document.getElementById("presentacion");
	var piezas = document.getElementById("pzas");
	var cadad = document.getElementById("cada");
	var diass = document.getElementById("dias");
    var table = document.getElementById("myTableData");

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= '<input type="button" class="boton2" value = "X" onClick="Javacsript:deleteRow(this)">';
    row.insertCell(1).innerHTML= myName.value;
	
    row.insertCell(2).innerHTML= dosis.value;
	row.insertCell(3).innerHTML= forma.value;
	row.insertCell(4).innerHTML= unidades.value;
	row.insertCell(5).innerHTML= via.value;
	row.insertCell(6).innerHTML= presentacionn.value;
	row.insertCell(7).innerHTML= piezas.value;
	row.insertCell(8).innerHTML= cadad.value;
	row.insertCell(9).innerHTML= diass.value;

}

function deleteRow(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("myTableData");
    table.deleteRow(index);
   
}

function addTable() {
     
    var myTableDiv = document.getElementById("myDynamicTable");
     
    var table = document.createElement('TABLE');
    table.border='1';
   
    var tableBody = document.createElement('TBODY');
    table.appendChild(tableBody);
     
    for (var i=0; i<3; i++){
       var tr = document.createElement('TR');
       tableBody.appendChild(tr);
      
       for (var j=0; j<4; j++){
           var td = document.createElement('TD');
           td.width='75';
           td.appendChild(document.createTextNode("Cell " + i + "," + j));
           tr.appendChild(td);
       }
    }
    myTableDiv.appendChild(table);
   
}

function load() {
   
    console.log("Page load finished");

}// JavaScript Document