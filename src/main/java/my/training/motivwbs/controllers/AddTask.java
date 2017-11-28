package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repo.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class AddTask {

    @Autowired
    TodoRepo taskRepository;

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping(value = "/addTodo")
    public String addTodo(@RequestBody Todo todo) {
        taskRepository.save(todo);
        return "index";
    }
}
