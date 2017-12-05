package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repositaries.TodoRepo;
import my.training.motivwbs.utils.ValidateDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AddTodoController {

    private final TodoRepo taskRepository;
    private final ValidateDateFormat dateFormatValidator;

    @Autowired
    public AddTodoController(TodoRepo taskRepository, ValidateDateFormat dateFormatValidator) {
        this.taskRepository = taskRepository;
        this.dateFormatValidator = dateFormatValidator;

    }

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping(value = "/addTodo")
    public String addTodo(@RequestBody Todo todo) {
        if (dateFormatValidator.isValidDate(todo.getDueDate())) {
            taskRepository.save(todo);
        }
        return "index";
    }

}
