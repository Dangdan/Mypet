package com.mypet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypet.service.PetService;
import com.mypet.ssm.mapper.PetMapper;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.PetExample;
import com.mypet.ssm.po.PetExample.Criteria;
@Service
public class PetServiceImpl implements PetService {
	
	@Autowired
	private PetMapper petMapper;

	@Override
	public int addPet(Pet p) {
		return petMapper.insert(p);
	}

	@Override
	public int updatePet(Pet p) {
		return petMapper.updateByPrimaryKey(p);
	}

	@Override
	public List<Pet> getPetInfoByType(String type) {
		// TODO Auto-generated method stub
		PetExample example=new PetExample();
		Criteria c=example.createCriteria();
		c.andPtypeEqualTo(type);
		return petMapper.selectByExample(example);
	}

	@Override
	public List<Pet> getPetInfoByName(String name) {
		PetExample example=new PetExample();
		Criteria c=example.createCriteria();
		c.andPnameEqualTo(name);
		return petMapper.selectByExample(example);
	}

	@Override
	public int deletePet(Long id) {
		return petMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Pet> listPet(Pet p) {
		// TODO Auto-generated method stub
		PetExample example=new PetExample();
		return petMapper.selectByExample(example);
		
	}

	@Override
	public Pet getPetById(Long id) {
		PetExample petExample=new PetExample();
		Criteria c=petExample.createCriteria();
		c.andPidEqualTo(id);
		List<Pet> list=petMapper.selectByExample(petExample);
		if(list!=null&&list.size()>0){
			Pet p=list.get(0);
			return p;
		}
		return null;
	}

}
