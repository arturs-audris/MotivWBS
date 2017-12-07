
function addTaskToList(task) {
var rootElement = document.getElementById("taskContainer");
var taskContainer = document.createElement("li");
taskContainer.setAttribute("id", "taskButton" + task.id);
taskContainer.setAttribute("class", "list-group-item");
taskContainer.setAttribute("data-toggle", "modal");
taskContainer.setAttribute("data-target", "#taskPopup" + task.id);

var taskStatus = getTaskStatus(task);
var taskStatusLabel = getTaskLabelClass(taskStatus);

rootElement.appendChild(taskContainer);

var mediaBody = document.createElement("div");
mediaBody.setAttribute("class", "media-body");

taskContainer.appendChild(mediaBody);

var title = document.createElement("strong");
title.appendChild(document.createTextNode(task.title));

var status = document.createElement("span");
status.setAttribute("class", "label " +taskStatusLabel);
status.appendChild(document.createTextNode(taskStatus));

var dueDate = document.createElement("span");
dueDate.setAttribute("class", "pull-right");
dueDate.appendChild(document.createTextNode(task.dueDate));

mediaBody.appendChild(title);
mediaBody.appendChild(status);
mediaBody.appendChild(dueDate);
}

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

function getTaskStatus(task) {
    var todaysDate = getTodaysDate();

    var dueMonth = task.dueDate.substr(0, 2);
    var dueDay = task.dueDate.substr(3, 2);
    var dueYear = task.dueDate.substr(6, 4);
    var result = "";

    if (dueYear < todaysDate.year || (dueMonth < todaysDate.month && dueDay < todaysDate.day && dueYear <= todaysDate.year)) {
        if (task.completed !== true) {
            result = "OVERDUE";
        } else {
            result = "DONE";
        }
    } else {
        if (task.completed !== true) {
            result = "PENDING";
        } else {
            result = "DONE";
        }

    }

    return result;
}

function getTaskLabelClass(taskStatus) {
    var result = "";
    if(taskStatus === "OVERDUE") {
        result = "label-danger";
    }
    if(taskStatus === "PENDING") {
        result = "label-warning";
    }
    if(taskStatus === "DONE") {
        result = "label-success";
    }

    return result;
}

function createTaskPopup(task) {
    var rootElement = document.getElementById("taskPopupContainter");

    var popupContainer = document.createElement("div");
    popupContainer.setAttribute("class", "modal fade");
    popupContainer.setAttribute("id", "taskPopup"+task.id);
    popupContainer.setAttribute("role", "dialog");
    popupContainer.setAttribute("aria-labbeledby", "taskPopup"+task.id);
    popupContainer.setAttribute("aria-hidden", "true");

    rootElement.appendChild(popupContainer);

    var wrapper = document.createElement("div");
    wrapper.setAttribute("class", "modal-wrapper");
    popupContainer.appendChild(wrapper);

    var dialog = document.createElement("div");
    dialog.setAttribute("class", "modal-dialog");
    wrapper.appendChild(dialog);

    var content = document.createElement("div");
    content.setAttribute("class", "modal-content");
    dialog.appendChild(content);

    content.appendChild(createPopupHeader(task));
    content.appendChild(createPopupForm(task));

}

function createTaskCloseButton() {
    var closeButton = document.createElement("button");
    closeButton.setAttribute("type", "button");
    closeButton.setAttribute("class", "btn btn-default");
    closeButton.setAttribute("data-dismiss", "modal");
    closeButton.appendChild(document.createTextNode("Close"));
    return closeButton;
}

function createTaskFinishedButton(task) {
    var finishedButton = document.createElement("button");
    finishedButton.setAttribute("type", "button");
    finishedButton.setAttribute("class", "btn btn-success pull-left");
    finishedButton.setAttribute("data-dismiss", "modal");
    finishedButton.setAttribute("onclick", "finishTodo(this)");
    finishedButton.setAttribute("id", "f"+task.id);
    finishedButton.appendChild(document.createTextNode("Finished"));
}

function createTaskDeleteButton(task) {
    var deleteButton = document.createElement("button");
    deleteButton.setAttribute("type", "button");
    deleteButton.setAttribute("class", "btn btn-default");
    deleteButton.setAttribute("id", ""+ task.id);
    deleteButton.setAttribute("onclick", "removeTodo(this)");
    deleteButton.appendChild(document.createTextNode("Delete"));
    return deleteButton;
}

function createPopupHeader(task) {
    var header = document.createElement("div");
    header.setAttribute("class", "modal-header bg-blue");

    var closeHeaderButton = document.createElement("button");
    closeHeaderButton.setAttribute("type", "button");
    closeHeaderButton.setAttribute("class", "close");
    closeHeaderButton.setAttribute("data-dismiss", "modal");
    closeHeaderButton.setAttribute("aria-hidden", "true");
    closeHeaderButton.appendChild(document.createTextNode("×"));
    header.appendChild(closeHeaderButton);

    var titleText = document.createElement("h4");
    titleText.setAttribute("class", "modal-title");
    titleText.appendChild(document.createTextNode(task.title));

    header.appendChild(titleText);

    return header;
}

function createPopupForm(task) {
    var popupForm = document.createElement("form");
    popupForm.setAttribute("method", "post");
    popupForm.setAttribute("action", "#");

    popupForm.appendChild(getTaskDescription(task));

    var footer = document.createElement("div");
    footer.setAttribute("class", "modal-footer");
    popupForm.appendChild(footer);

    footer.appendChild(createTaskDeleteButton(task));
    footer.appendChild(createTaskCloseButton());
    if (getTaskStatus(task) !== "DONE") {
        footer.appendChild(createTaskFinishedButton(task));
    }
    return popupForm;
}

function getTaskDescription(task) {
    var container = document.createElement("div");
    container.setAttribute("class", "modal-body");
    container.appendChild(document.createTextNode(task.description));

    return container;
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
                console.log('An error occurred');
            }
        });
    });
}

function removeTodo(row) {
        $.ajax({
            type: 'POST',
            url: '/removeTodo/' + row.getAttribute("id"),
            data: JSON.stringify(row.getAttribute("id")),
            contentType: 'application/json',
            success: function () {
                location.reload(true);
            },
            error: function () {
            }
        });
}

function finishTodo(row) {
    var taskId = row.getAttribute("id").substr(1, row.length);
    $.ajax({
        type: 'POST',
        url: '/finishTodo/' + taskId,
        data: JSON.stringify(taskId),
        contentType: 'application/json',
        success: function () {
            location.reload(true);
        },
        error: function () {
        }
    });
}

jQuery(function () {
    $.get("/user", function(user) {
        var userID = user.userAuthentication.details.id;
        $.getJSON("/todo.json?id="+userID, function (data) {
            var step = 0;
                while (step<data.length) {
                addTaskToList(data[step]);
                createTaskPopup(data[step]);
                step++;
                }
        });
        sendNewEntry(userID);

});
    $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });
});

