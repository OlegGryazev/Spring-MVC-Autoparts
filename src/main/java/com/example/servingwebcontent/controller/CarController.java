package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.Domain.Car;
import com.example.servingwebcontent.Domain.User;
import com.example.servingwebcontent.repository.CarRepository;
import com.example.servingwebcontent.repository.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/carList")
public class CarController {
    UserRepository userRepository;
    CarRepository carRepository;

    public CarController(UserRepository userRepository, CarRepository carRepository) {
        this.userRepository = userRepository;
        this.carRepository = carRepository;
    }

    @GetMapping
    public String getCarList(Map<String, Object> model, Principal principal){
        User user = userRepository.findByUsername(principal.getName());
        List<Car> cars = carRepository.findByOwner(user);
        model.put("cars", cars);
        return "carList";
    }

    @PostMapping("add")
    public String addCar(
            Principal principal,
            @RequestParam("mark") String carMark,
            @RequestParam("model") String carModel,
            @RequestParam("vin") String vin,
            @RequestParam("notes") String notes,
            Map<String, Object> model
    ){
        User user = userRepository.findByUsername(principal.getName());
        Car car = new Car(user, carMark, carModel, vin, notes);
        carRepository.save(car);
        List<Car> cars = carRepository.findByOwner(user);
        model.put("cars", cars);

        return "redirect:/carList";
    }

    @GetMapping("del")
    public String delete(
            Principal principal,
            @RequestParam Integer carid,
            Map<String, Object> model
    ){
        User user = userRepository.findByUsername(principal.getName());
        if (user.isAdmin()) {
            Car carToDel = carRepository.findById(carid);
            if (carToDel != null)
                carRepository.delete(carToDel);
        }
        List<Car> cars = carRepository.findByOwner(user);
        model.put("cars", cars);

        return "redirect:/carList";
    }
}
