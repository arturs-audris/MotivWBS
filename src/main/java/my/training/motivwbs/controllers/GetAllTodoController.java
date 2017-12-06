package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repositaries.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class GetAllTodoController {


    private final TodoRepo taskRepository;

    @Autowired
    public GetAllTodoController(TodoRepo taskRepository) {
        this.taskRepository = taskRepository;
    }

    @RequestMapping(value = "/todo", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody Iterable<Todo> getTodoList(@RequestParam("id") long currentUserId) {
        return taskRepository.findByUserId(currentUserId);
    }

}
