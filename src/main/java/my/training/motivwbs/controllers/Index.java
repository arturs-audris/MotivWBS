package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.Todo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

    @RequestMapping("/")
    public String landing(Model model) {
        return "index";
    }

}
