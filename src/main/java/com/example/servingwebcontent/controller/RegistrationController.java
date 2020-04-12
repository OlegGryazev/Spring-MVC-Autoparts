package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.Domain.User;
import com.example.servingwebcontent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login(){
        if(SecurityContextHolder.getContext().getAuthentication() != null &&
                        SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                        !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)
        ) {
            return "redirect:/main";
        }
        return "login";
    }

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        if (!userService.addUser(user)) {
            model.put("message", "User already exists!");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activateUser(@PathVariable String code, Map<String, Object> model){
        boolean isActivated = userService.activateUser(code);

        if (isActivated)
            model.put("message", "Activation done!");
        else
            model.put("message", "Activation code not found!");

        return "login";
    }
}
