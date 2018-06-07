package com.mypet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mypet.service.PetService;
import com.mypet.ssm.po.PageResult;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;
import com.mypet.utils.GsonUtil;
import com.mypet.utils.IDUtils;

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
	
	
	@RequestMapping("/{pid}")
	@ResponseBody
	public Pet getPetById(@PathVariable("pid") Long pid) {
		Pet pet = petService.getPetById(pid);
		String[] imgs=pet.getImgurl().split(";");
		pet.setImgs(imgs);
		return pet;
	}
//	//http://localhost:8080/pet/pname=?   点击宠物名字时
//	@RequestMapping("/{pname}")
//	@ResponseBody
//	public Pet getPetByName(@PathVariable String pname) {
//		Pet pet = petService.getPetByName(pname);
//		return pet;
//	}
	//http://localhost:8080/pet/publish   点击发布宠物的时候
	@RequestMapping("/publish")
	@ResponseBody
	public String publishPet( Pet pet,HttpSession session){
		User u=(User) session.getAttribute("user");
		pet.setPid(IDUtils.genId());
		pet.setUserid(u.getId());
		pet.setUsername(u.getUsername());
		petService.addPet(pet);
		return GsonUtil.getSuccessJson();	
	}
	//http://localhost:8080/pet/list?page=1&rows=30
	@RequestMapping("/list/{type}")
	public PageResult listPetByStatus(@PathVariable String type, @RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows){
		PageResult petResult= petService.listPetByType(type,page,rows);
		return petResult;	
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public String deletePet(Long pid){
		petService.deletePet(pid);
		return GsonUtil.getSuccessJson();	
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updatePet(Pet p){
		petService.updatePet(p);
		return GsonUtil.getSuccessJson();	
	}
	
}
