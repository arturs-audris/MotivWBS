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
    var td = tr.insertCell();
    td.appendChild(document.createTextNode("Delete"));

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
        tr.setAttribute("id", data[i].id);
        for (var j = 0; j < 4; j++) {
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

                if (j == 3) {
                    var btn = document.createElement("BUTTON");
                    btn.appendChild(document.createTextNode("Delete"));
                    td.appendChild(btn);
                    btn.setAttribute("class", "btn-block btn");
                    btn.setAttribute("onclick", "removeTodo(this)");
                }
            }
        }
    }
    root.appendChild(tbl);
}

$(document).ready(function () {
    var cleave = new Cleave('.formattedDate', {
        date: true
    });

    $.getJSON("/todo.json", function (data) {
        tableCreate(data)
    });
sendNewEntry();

});

function sendNewEntry() {
    var frm = $('#addNewTodo');
    frm.submit(function (e) {
        e.preventDefault();
        var output = frm.serializeArray()
            .reduce(function(a, x) { a[x.name] = x.value; return a; }, {});
        console.log(JSON.stringify(output));
        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: JSON.stringify(output),
            contentType: 'application/json',
            success: function (data) {
                console.log('Submission was successful.');
                location.reload(true);
            },
            error: function (data) {
                console.log('An error occurred.');
            },
        });
    });
}

function removeTodo(element) {
    var row = element.parentNode.parentNode;
    $.ajax({
        type: 'POST',
        url: '/removeTodo/'+row.id,
        data: JSON.stringify(row.id),
        contentType: 'application/json',
        success: function (data) {
            console.log('Submission was successful.');
            location.reload(true);
        },
        error: function (data) {
            console.log('An error occurred.');
        },
    });
}



