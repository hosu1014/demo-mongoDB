package com.example.demo.Repository;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Car;

@Repository
public class CarSearchRepository {

	@Autowired
	MongoTemplate mongoTemplate;
	
	public Collection<Car> searchCars(String keyword) {
		return mongoTemplate.find(Query.query(new Criteria().orOperator(
				Criteria.where("description").regex(keyword, "i"),
				Criteria.where("model").regex(keyword, "i"),
				Criteria.where("make").regex(keyword, "i"))
				), Car.class);
		
		
	}
	
	public void updateCar(Car car) {
		Update update = new Update();
		update.set("make", car.getMake());
		update.set("description", car.getDescription());
		update.set("model", car.getModel());
		
		mongoTemplate.updateFirst(
				Query.query(Criteria.where("id").is(car.getCarId())),
				update, 
				Car.class);
	}
}
