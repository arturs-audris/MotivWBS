package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repo.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddTask {

    @Autowired
    TodoRepo taskRepository;

    @RequestMapping(value = "/addTodo",
            method = RequestMethod.POST,
            consumes = "application/x-www-form-urlencoded")
    public String addTodo(@RequestBody Todo todo) {
        taskRepository.save(todo);
        return "index";
    }
}
