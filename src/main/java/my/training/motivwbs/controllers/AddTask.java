package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repo.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;


@Controller
public class AddTask {

    @Autowired
    TodoRepo taskRepository;

    final SimpleDateFormat dateFormat = new SimpleDateFormat("mm/dd/YYYY");

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping(value = "/addTodo")
    public String addTodo(@RequestBody Todo todo) {
        if (isValidDate(todo.getDueDate())) {
            taskRepository.save(todo);
        }
        return "index";
    }

    boolean isValidDate(String input) {
        try {
            dateFormat.parse(input);
            return  true;
        } catch (ParseException e) {
            return false;
        }
    }

}
