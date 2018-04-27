package com.example.demo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Repository.CarMongoRepository;
import com.example.demo.Repository.CarSearchRepository;
import com.example.demo.model.Car;

@Controller
public class CarController {

	@Autowired
	CarMongoRepository carMongoRepository;
	
	@Autowired
	CarSearchRepository carSearchRepository;
	
	@RequestMapping("/home.do")
	public String viewHome(Model model) {
		model.addAttribute("carList", carMongoRepository.findAll());
		return "home";
	}
	
	@RequestMapping("/addCar.do")
	public String addCar(@ModelAttribute Car car) {
		
		if(car.getCarId() == null || car.getCarId().isEmpty()) {
			carMongoRepository.save(car);
		} else {
			carSearchRepository.updateCar(car);
		}
		
		return "redirect:home.do";
	}
	
	@RequestMapping("/delete.do")
	public String deleteCar(@ModelAttribute Car car) {
		carMongoRepository.delete(car);
		
		return "redirect:home.do";
	}
	
	
	@RequestMapping("/search.do")
	public String searchCar(@RequestParam String search, Model model) {
		model.addAttribute("carList", carSearchRepository.searchCars(search));
		model.addAttribute("search", search);
		return "home";
	}
}
