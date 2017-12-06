function tableCreate() {
    var root = document.getElementById("todoTable");
    var table = document.createElement('table');
    table.setAttribute("id", "todoEntries");
    table.setAttribute("class", "table table-filter w-auto");
    var headingRow = table.insertRow();
    var descriptionCell = headingRow.insertCell(-1);
    descriptionCell.appendChild(document.createTextNode("Description"));
    var dueDateCell = headingRow.insertCell(-1);
    dueDateCell.appendChild(document.createTextNode("Due Date"));
    var deleteCell = headingRow.insertCell(-1);
    deleteCell.appendChild(document.createTextNode("Delete"));
    root.appendChild(table);
}

var data = {id: 0, description: "", dueDate: "", completed: false};

function addTodoToTable(data) {
    var todaysDate = getTodaysDate();
    var table = document.getElementById("todoEntries");

    for (var i = 0; i < data.length; i++) {
        var dynamicRow = table.insertRow();
        dynamicRow.setAttribute("id", data[i].id);

        for (var j = 0; j < 3; j++) {
            if (i === data.length && j === 1) {
                break;
            } else {
                var dynamicCell = dynamicRow.insertCell(-1);
                if (j === 0) {
                    dynamicCell.appendChild(document.createTextNode(data[i].description));
                }
                if (j === 1) {
                    dynamicCell.appendChild(document.createTextNode(data[i].dueDate));
                    var dueMonth = data[i].dueDate.substr(0, 2);
                    var dueDay = data[i].dueDate.substr(3, 2);
                    var dueYear = data[i].dueDate.substr(6, 4);

                    if (dueYear < todaysDate.year || (dueMonth < todaysDate.month && dueDay < todaysDate.day && dueYear <= todaysDate.year)) {
                        if (data[i].completed !== true) {
                            dynamicCell.setAttribute("class", "overdue");
                        } else {
                            dynamicCell.setAttribute("class", "finished");
                        }
                    } else {
                        if (data[i].completed !== true) {
                            dynamicCell.setAttribute("class", "pending");
                        } else {
                            dynamicCell.setAttribute("class", "finished");
                        }

                    }

                }

                if (j === 2) {
                    var deleteButton = document.createElement("BUTTON");
                    deleteButton.appendChild(document.createTextNode("Delete"));
                    dynamicCell.appendChild(deleteButton);
                    deleteButton.setAttribute("class", "btn-block btn removeTodo");
                }
            }
        }
    }
}

jQuery(function () {
    new Cleave('.formattedDate', {
        date: true
    });

    tableCreate();

    $.get("/user", function(user) {
        var userID = user.userAuthentication.details.id;
        console.log(userID);
        $.getJSON("/todo.json?id="+userID, function (data) {
            addTodoToTable(data);
        });
        removeTodo(userID);
        sendNewEntry(userID);
    });




});

function getTodaysDate() {
    var today = new Date();
    var todaysDate = {day: "", month: "", year: ""};
    var day = today.getDate();
    var month = today.getMonth() + 1;
    todaysDate.year = today.getFullYear();

    if (day < 10) {
        todaysDate.day = '0' + day
    }

    if (month < 10) {
        todaysDate.month = '0' + month
    }

    return todaysDate;
}

function sendNewEntry(userId) {
    var frm = $('#addNewTodo');
    frm.submit(function (e) {
        e.preventDefault();
        var output = frm.serializeArray()
            .reduce(function (a, x) {
                a[x.name] = x.value;
                return a;
            }, {});
        console.log(JSON.stringify(output));
        $.ajax({
            type: 'POST',
            url: '/addTodo?id='+userId,
            data: JSON.stringify(output),
            contentType: 'application/json',
            success: function () {
                console.log('Submission was successful.');
                location.reload(true);
            },
            error: function () {
                console.log('An error occurred.');
            }
        });
    });
}

function removeTodo() {
    $(document.body).on('click', ".removeTodo", function () {
        console.log("clicked");
        var row = this.parentNode.parentNode;
        $.ajax({
            type: 'POST',
            url: '/removeTodo/' + row.id,
            data: JSON.stringify(row.id),
            contentType: 'application/json',
            success: function () {
                location.reload(true);
            },
            error: function () {
            }
        });
    });
}



