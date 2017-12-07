package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repositaries.TodoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SetTodoFinishedController {

    private final TodoRepo taskRepository;

    @Autowired
    public SetTodoFinishedController(TodoRepo taskRepository) {
        this.taskRepository = taskRepository;
    }

    @RequestMapping(value = "/finishTodo/{id}", method = RequestMethod.POST)
    public String addTodo(@PathVariable("id") long id) {
        Todo finishedTask = taskRepository.findOne(id);
        finishedTask.setCompleted(true);
        taskRepository.save(finishedTask);
        return "todo";
    }
}
