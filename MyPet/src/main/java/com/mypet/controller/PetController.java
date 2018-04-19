package com.mypet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mypet.service.PetService;
import com.mypet.ssm.po.Pet;

/**
 * PetController
 * @author Dan
 *
 */
@Controller
@RequestMapping("/pet")
public class PetController {
	@Autowired
	private PetService petService;
	
	
	@RequestMapping("/{itemId}")
	@ResponseBody
	public Pet getItemById(@PathVariable Long pid) {
		Pet pet = petService.getPetById(pid);
		return pet;
	}
	@RequestMapping("/upload/")
	public String uploadPet(@PathVariable Pet p){
		petService.addPet(p);
		return null;	
	}
	
	@RequestMapping("/list/")
	public String listPet(@PathVariable Pet p){
		petService.listPet(p);
		return null;	
	}
}
