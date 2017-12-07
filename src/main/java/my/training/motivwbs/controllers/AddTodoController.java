package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.MotivUser;
import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repositaries.TodoRepo;
import my.training.motivwbs.utils.ValidateDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class AddTodoController {

    private final ValidateDateFormat dateFormatValidator;
    private final TodoRepo repository;


    @Autowired
    public AddTodoController(ValidateDateFormat dateFormatValidator, TodoRepo repository) {
        this.repository = repository;
        this.dateFormatValidator = dateFormatValidator;
    }

    @RequestMapping(value = "/addTodo", method = RequestMethod.POST)
    public String addTodo(@RequestBody Todo todo, @RequestParam("id") long id) {
        if(todo.getDueDate()!=null) {
        if (dateFormatValidator.isValidDate(todo.getDueDate())) {
            todo.setUserId(id);
            repository.save(todo);
        }} else {
            System.out.println(todo.toString());
        }
        return "todo";
    }

}
