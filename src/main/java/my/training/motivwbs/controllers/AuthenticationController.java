package my.training.motivwbs.controllers;

import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class AuthenticationController {

    @RequestMapping("/user")
    public Principal user(Principal principal) {
        return principal;
    }
}
