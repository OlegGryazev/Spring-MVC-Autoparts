package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.Domain.Part;
import com.example.servingwebcontent.Domain.User;
import com.example.servingwebcontent.repository.PartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private PartRepository partRepository;

    @GetMapping
    public String greeting(Map<String, Object> model){
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false) String filterManufacturer,
                       @RequestParam(required = false) String filterArticle,
                       Map<String, Object> model){
        Iterable<Part> parts;

        if (filterManufacturer != null && !filterManufacturer.isEmpty() && (filterArticle == null || filterArticle.isEmpty()))
            parts = partRepository.findByManufacturerIgnoreCase(filterManufacturer);
        else if ((filterManufacturer == null || filterManufacturer.isEmpty()) && filterArticle != null && !filterArticle.isEmpty())
            parts = partRepository.findByArticleIgnoreCase(filterArticle);
        else if (filterManufacturer != null && filterArticle != null && !filterManufacturer.isEmpty() && !filterArticle.isEmpty())
            parts = partRepository.findByArticleAndManufacturerIgnoreCase(filterArticle, filterManufacturer);
        else
            parts = partRepository.findAll();

        model.put("parts", parts);
        model.put("filterManufacturer", filterManufacturer);
        model.put("filterArticle", filterArticle);
        return "main";
    }

    @PostMapping("add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String article,
            @RequestParam String manufacturer,
            Map<String,Object> model){
        Part part = new Part(article, manufacturer, user);
        partRepository.save(part);
        Iterable<Part> parts = partRepository.findAll();
        model.put("parts", parts);

        return "main";
    }

}
