package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class Tasks {

    private static final Todo entry = new Todo(1, "First task", "12/12/2017");

    @RequestMapping(value = "/todo", method = RequestMethod.GET, produces = "application/json")
    public List<Todo> getEntry() {
        List<Todo> entries = new ArrayList<Todo>();
        entries.add(entry);
        return entries;
    }

}
