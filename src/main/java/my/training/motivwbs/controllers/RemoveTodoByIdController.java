package my.training.motivwbs.controllers;

import my.training.motivwbs.repositaries.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RemoveTodoByIdController {

    private final TodoRepo taskRepository;

    @Autowired
    public RemoveTodoByIdController(TodoRepo taskRepository) {
        this.taskRepository = taskRepository;
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping(value = "/removeTodo/{id}")
    public String addTodo(@PathVariable("id") long id) {
        taskRepository.delete(id);
        return "index";
    }
}
