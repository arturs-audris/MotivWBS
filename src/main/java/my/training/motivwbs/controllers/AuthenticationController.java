package my.training.motivwbs.controllers;

import my.training.motivwbs.dto.MotivUser;
import my.training.motivwbs.dto.Todo;
import my.training.motivwbs.repositaries.MotivUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
public class AuthenticationController {

    final
    MotivUserRepository userRepository;

    @Autowired
    public AuthenticationController(MotivUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping("/user")
    public Principal user(Principal principal) {

        if(principal.getName()!=null) {
            if(userRepository.findByUserId(Long.parseLong(principal.getName()))==null)
            {
                List<Todo> emptyList = new ArrayList<>();
                MotivUser newUser = new MotivUser(Long.parseLong(principal.getName()),emptyList);
                userRepository.save(newUser);
                System.out.println("Created user: "+ principal.getName());
            }
        }
        return principal;
    }
}
