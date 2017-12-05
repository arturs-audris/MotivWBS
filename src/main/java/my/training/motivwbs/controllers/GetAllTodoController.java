package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repositaries.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GetAllTodoController {


    private final TodoRepo taskRepository;

    @Autowired
    public GetAllTodoController(TodoRepo taskRepository) {
        this.taskRepository = taskRepository;
    }

    @RequestMapping(value = "/todo", method = RequestMethod.GET, produces = "application/json")
    public Iterable<Todo> getTodoList() {
        return taskRepository.findAll();
    }

}
