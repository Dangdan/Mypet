package com.mypet.service;

import java.util.List;

import com.mypet.ssm.po.Pet;

/**
 * 宠物service
 * 
 * @author Dan
 *
 */
public interface PetService {
	/**
	 * 根据id查询宠物
	 * @param id
	 * @return
	 */
	Pet getPetById(Long id);
	
	/**
	 * 新增宠物信息
	 * 
	 * @return
	 */
	int addPet(Pet p);

	/**
	 * 根据id更新宠物信息
	 * 
	 * @param id
	 * @return
	 */
	int updatePet(Pet p);

	/**
	 * 根据种类查询宠物信息
	 * 
	 * @param type
	 * @return
	 */
	List<Pet> getPetInfoByType(String type);

	/**
	 * 根据姓名查询宠物信息
	 * 
	 * @param name
	 * @return
	 */
	List<Pet> getPetInfoByName(String name);

	/**
	 * 根据id删除宠物
	 * 
	 * @param id
	 * @return
	 */
	int deletePet(Long id);

	/**
	 * 展示宠物列表
	 * @param p
	 */
	List<Pet> listPet(Pet p);

}
