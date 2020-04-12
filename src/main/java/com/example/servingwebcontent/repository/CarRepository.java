package com.example.servingwebcontent.repository;

import com.example.servingwebcontent.Domain.Car;
import com.example.servingwebcontent.Domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface CarRepository extends CrudRepository<Car, Long> {
    List<Car> findByOwner(User user);
    List<Car> findByVin(String vin);
    Car findById(Integer id);
}
