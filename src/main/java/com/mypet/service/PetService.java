package com.mypet.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mypet.ssm.mapper.PetMapper;
import com.mypet.ssm.po.PageResult;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.PetExample;
import com.mypet.ssm.po.PetExample.Criteria;
import com.mypet.ssm.po.User;

@Service
public class PetService {

	@Autowired
	private PetMapper petMapper;

	@Autowired
	private UserService userService;

	public int addPet(Pet p) {
		return petMapper.insert(p);
	}

	public int updatePet(Pet p) {
		return petMapper.updateByPrimaryKey(p);
	}

	public List<Pet> getPetInfoByType(String type) {
		// TODO Auto-generated method stub
		PetExample example = new PetExample();
		Criteria c = example.createCriteria();
		c.andPtypeEqualTo(type);
		return petMapper.selectByExample(example);
	}

	public List<Pet> getPetInfoByName(String name) {
		PetExample example = new PetExample();
		Criteria c = example.createCriteria();
		c.andPnameEqualTo(name);
		return petMapper.selectByExample(example);
	}

	public int deletePet(Long id) {
		return petMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            总行数
	 * @return
	 * @return
	 */
	public PageResult listPublishPetAll(User u, Integer page, Integer rows) {
		// 得到所有宠物
		PetExample example = new PetExample();
		/*
		 * PageHelper.startPage(1, 10); 第一个参数是page，要显示第几页。 第二个参数是rows，没页显示的记录数。
		 * 第四步：取查询结果的总数量。 创建一个PageInfo类的对象，从对象中取分页信息。
		 * 源码：https://github.com/pagehelper/Mybatis-PageHelper/tree/master/src/
		 * main/java/com/github/pagehelper
		 */
		PageHelper.startPage(page, rows);
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(u.getUsername());
		List<Pet> list = petMapper.selectByExample(example);
//		List<Pet> resultList = new ArrayList<>();
//		for (Pet pet : list) {
//			pet.setOwner(userService.getUserByName(pet.getUsername()));
//			String[] imgs = pet.getImgurl().split(";");
//			pet.setImgs(imgs);
//			resultList.add(pet);
//		}
		PageResult result = new PageResult();
		result.setRows(list);
		PageInfo<Pet> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		result.setCurrentPage(page);
		result.setRow(pageInfo.getPages());
		return result;

	}

	public Pet getPetById(Long id) {
		PetExample petExample = new PetExample();
		Criteria c = petExample.createCriteria();
		c.andPidEqualTo(id);
		List<Pet> list = petMapper.selectByExample(petExample);
		if (list != null && list.size() > 0) {
			Pet p = list.get(0);
			return p;
		}
		return null;
	}

	public Pet getPetByName(String pname) {
		PetExample petExample = new PetExample();
		Criteria c = petExample.createCriteria();
		c.andPnameEqualTo(pname);
		List<Pet> list = petMapper.selectByExample(petExample);
		if (list != null && list.size() > 0) {
			Pet p = list.get(0);
			return p;
		}
		return null;
	}

	public PageResult listPetByType(String type, Integer page, Integer rows) {
		PetExample example = new PetExample();
		Criteria c = example.createCriteria();
		c.andPtypeEqualTo(type);
		PageHelper.startPage(page, rows);
		List<Pet> list = petMapper.selectByExample(example);
		PageResult result = new PageResult();
		result.setRows(list);
		PageInfo<Pet> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	// 发布者查看发布历史
	public List<Pet> listPublishPet(User u) {
		PetExample example = new PetExample();
		Criteria c = example.createCriteria();
		c.andUsernameEqualTo(u.getUsername());
		List<Pet> list = petMapper.selectByExample(example);
		return list;
	}

	// 领养者查看所有宠物
	public List<Pet> listPet() {
		PetExample example = new PetExample();
		List<Pet> list = petMapper.selectByExample(example);
		List<Pet> resultList = new ArrayList<>();
		for (Pet pet : list) {
			pet.setOwner(userService.getUserByName(pet.getUsername()));
			String[] imgs = pet.getImgurl().split(";");
			pet.setImgs(imgs);
			resultList.add(pet);
		}
		return resultList;
	}

	// 领养者查看所有宠物
	public PageResult listPet(Integer page, Integer rows) {
		PetExample example = new PetExample();
		if (page == null || page < 0) {
			page = 1;
		}
		PageHelper.startPage(page, rows);
		List<Pet> list = petMapper.selectByExample(example);
		List<Pet> resultList = new ArrayList<>();
		for (Pet pet : list) {
			pet.setOwner(userService.getUserByName(pet.getUsername()));
			String[] imgs = pet.getImgurl().split(";");
			pet.setImgs(imgs);
			resultList.add(pet);
		}
		PageResult result = new PageResult();
		result.setRows(resultList);
		PageInfo<Pet> pageInfo = new PageInfo<>(resultList);
		result.setTotal(pageInfo.getTotal());
		result.setCurrentPage(page);
		result.setRow(pageInfo.getPages());
		return result;
	}

}
