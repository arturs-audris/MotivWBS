function tableCreate(data){
    var body = document.body,
        tbl  = document.createElement('table');
    tbl.style.width  = '100px';
    tbl.style.border = '1px solid black';

    for(var i = 0; i < data.length; i++){
        var tr = tbl.insertRow();
        for(var j = 0; j < 3; j++){
            if(i == data.length&& j == 1){
                break;
            } else {
                var td = tr.insertCell();
                if (j == 0) {td.appendChild(document.createTextNode(data[i].id));}
                if (j == 1) {td.appendChild(document.createTextNode(data[i].description));}
                if (j == 2) {td.appendChild(document.createTextNode(data[i].dueDate));}
                td.style.border = '1px solid black';
            }
        }
    }
    body.appendChild(tbl);
}

$(document).ready(function () {
        document.getElementById('feature').innerHTML = "Not many features implemented yet"
    $.getJSON("/todo.json", function(data){
        tableCreate(data)
    });
    });


