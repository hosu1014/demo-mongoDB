package com.example.demo.Repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Car;

public interface CarMongoRepository extends CrudRepository<Car, String> {

}
