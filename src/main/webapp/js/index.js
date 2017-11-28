function tableCreate(data) {
    var root = document.getElementById("todoTable"),
        tbl = document.createElement('table');
    tbl.setAttribute("id", "todoEntries");
    tbl.setAttribute("class", "table table-filter");
    var tr = tbl.insertRow();
    var td = tr.insertCell();
    td.appendChild(document.createTextNode("ID"));
    var td = tr.insertCell();
    td.appendChild(document.createTextNode("Description"));
    var td = tr.insertCell();
    td.appendChild(document.createTextNode("Due Date"));

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }
    today = mm + '/' + dd + '/' + yyyy;


    for (var i = 0; i < data.length; i++) {
        var tr = tbl.insertRow();
        for (var j = 0; j < 3; j++) {
            if (i == data.length && j == 1) {
                break;
            } else {
                var td = tr.insertCell();
                if (j == 0) {
                    td.appendChild(document.createTextNode(data[i].id));
                }
                if (j == 1) {
                    td.appendChild(document.createTextNode(data[i].description));
                }
                if (j == 2) {
                    td.appendChild(document.createTextNode(data[i].dueDate));
                    var dueMonth = data[i].dueDate.substr(0, 2);
                    var dueDay = data[i].dueDate.substr(3, 2);
                    var dueYear = data[i].dueDate.substr(6, 4);

                    if (dueYear < yyyy || (dueMonth < mm && dueDay < dd && dueYear <= yyyy)) {
                        if (data[i].completed != true) {
                            td.setAttribute("class", "overdue");
                        } else {
                            td.setAttribute("class", "finished");
                        }
                    } else {
                        if (data[i].completed != true) {
                            td.setAttribute("class", "pending");
                        } else {
                            td.setAttribute("class", "finished");
                        }

                    }

                }
            }
        }
    }
    root.appendChild(tbl);
}

$(document).ready(function () {
    $.getJSON("/todo.json", function (data) {
        tableCreate(data)
    });
});

$('#addNewTodo').submit(function(e) {
    var form = this;
    e.preventDefault();
    var formData = {}
    $.each(this, function (i, v) {
        var input = $(v);
        formData[input.attr("id")] = input.val();
    });
    $.ajax({
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        type: form.attr('method'),
        url: form.attr('action'),
        dataType: 'json',
        contentType: 'text/plain',
        data: $.toJSON(formData),
    });

});

