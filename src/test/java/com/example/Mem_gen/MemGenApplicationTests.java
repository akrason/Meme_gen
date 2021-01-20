package com.example.Mem_gen;

import com.example.Mem_gen.controller.CategoryController;
import com.example.Mem_gen.controller.ImageController;
import com.example.Mem_gen.controller.UserController;
import com.example.Mem_gen.exceptions.CategoryNotFound;
import com.example.Mem_gen.exceptions.UserNotFound;
import com.example.Mem_gen.model.User;
import com.example.Mem_gen.repository.CategoryRepository;
import com.example.Mem_gen.repository.UserRepository;

import com.example.Mem_gen.service.CategoryService;
import com.example.Mem_gen.service.UserService;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
class MemGenApplicationTests {
	@Autowired
	private UserController controller;
	@Autowired
	private CategoryController controller1;
	@Autowired
	private ImageController controller2;
	@Autowired
	private MockMvc mvc;
	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService usersService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CategoryRepository categoryRepository;


	@Test
	void UsersLoads() {
		assertThat(controller).isNotNull();
	}
	@Test
	void CategoryLoads() {
		assertThat(controller1).isNotNull();
	}
	@Test
	void ImageLoads() {
		assertThat(controller2).isNotNull();
	}
	@Test
	void listCategoryWorks() throws Exception {
		this.mvc.perform(get("/api/categories")).andDo(print()).andExpect(content().string(containsString("other")));
	}
	@Test
	void listImagesWorks() throws Exception {
		this.mvc.perform(get("/api/images")).andDo(print()).andExpect(content().string(containsString("other")));
	}

	@Test
	void UserNotFoundException(){
		int id = usersService.listAllUser().size();
		Assertions.assertThrows(UserNotFound.class,() ->{
			userRepository.findById(id+2).orElseThrow(() -> new UserNotFound());
		});
	}
	@Test
	void CategoryNotFoundException(){
		int id = categoryService.listAllCategory().size();
		Assertions.assertThrows(CategoryNotFound.class,() ->{
			categoryRepository.findById(id+2).orElseThrow(() -> new CategoryNotFound(id+2));
		});
	}

	@Test
	void deleteUserWorks() throws Exception {
		MvcResult result = mvc.perform(post("/authenticate")
				.contentType(MediaType.APPLICATION_JSON).content("{\"username\":\"" + "admin" + "\", \"password\":\""
						+ "admin" + "\"}"))
				.andExpect(status().isOk()).andReturn();
		String response = result.getResponse().getContentAsString();
		response = response.replace("{\"token\"", "");
		response = response.replace(":\"", "");
		String token = response.replace("\"}", "");
		int id = usersService.listAllUser().size();
		this.mvc.perform(delete("/api/users/"+id).header("Authorization", "Bearer " + token))
				.andExpect(status().isOk());
	}
	@Test
	void deleteUserWorks2() throws Exception {
		MvcResult result = mvc.perform(post("/authenticate")
				.contentType(MediaType.APPLICATION_JSON).content("{\"username\":\"" + "admin" + "\", \"password\":\""
						+ "admin" + "\"}"))
				.andExpect(status().isOk()).andReturn();
		String response = result.getResponse().getContentAsString();
		response = response.replace("{\"token\"", "");
		response = response.replace(":\"", "");
		String token = response.replace("\"}", "");
		int id = usersService.listAllUser().size();
		mvc.perform(delete("/api/users/"+(id+1))
				.header("Authorization", "Bearer " + token))
				.andExpect(status().isNotFound());
	}

	@Test
	public void existentUserCanGetTokenAndAuthentication() throws Exception {

		MvcResult result = mvc.perform(post("/authenticate")
				.contentType(MediaType.APPLICATION_JSON).content("{\"username\":\"" + "admin" + "\", \"password\":\""
						+ "admin" + "\"}"))
				.andExpect(status().isOk()).andReturn();
		String response = result.getResponse().getContentAsString();
		response = response.replace("{\"token\"", "");
		response = response.replace(":\"", "");
		String token = response.replace("\"}", "");

		mvc.perform(MockMvcRequestBuilders.get("/api/users")
				.header("Authorization", "Bearer " + token))
				.andExpect(status().isOk());
	}

	@Test
	public void existentUserCanGetTokenButForbidden() throws Exception {

		MvcResult result = mvc.perform(post("/authenticate")
				.contentType(MediaType.APPLICATION_JSON).content("{\"username\":\"" + "akrason" + "\", \"password\":\""
						+ "akrason" + "\"}"))
				.andExpect(status().isOk()).andReturn();
		String response = result.getResponse().getContentAsString();
		response = response.replace("{\"token\"", "");
		response = response.replace(":\"", "");
		String token = response.replace("\"}", "");

		mvc.perform(MockMvcRequestBuilders.get("/api/users")
				.header("Authorization", "Bearer " + token))
				.andExpect(status().isForbidden());
	}

	@Test
	public void nonexistentUserCannotGetToken() throws Exception {
		MvcResult result = mvc.perform(post("/authenticate")
				.contentType(MediaType.APPLICATION_JSON).content("{\"username\":\"" + "admiaa" + "\", \"password\":\""
						+ "adminsd" + "\"}"))
					.andExpect(status().isNotFound()).andReturn();
	}

}
