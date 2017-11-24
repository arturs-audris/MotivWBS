package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repo.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Tasks {

    @Autowired
    private TodoRepo repo;

    @RequestMapping(value = "/todo", method = RequestMethod.GET, produces = "application/json")
    public Iterable<Todo> getTodoList() {
        return repo.findAll();
    }

}
