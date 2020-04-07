package com.example.servingwebcontent.repository;

import com.example.servingwebcontent.Domain.Part;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PartRepository extends CrudRepository<Part, Long> {
    List<Part> findByManufacturerIgnoreCase(String manufacturer);
    List<Part> findByArticleIgnoreCase(String article);
    List<Part> findByArticleAndManufacturerIgnoreCase(String article, String manufacturer);
}
