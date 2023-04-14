package com.alexproject.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alexproject.savetravels.models.Expense;
import com.alexproject.savetravels.services.ExpenseService;

@RestController
public class ExpenseAPI {

	@Autowired
	private ExpenseService eservice;
	
	@GetMapping("/")
	public List<Expense> index()
	{
		return eservice.getAllExpenses();
	}
	
	@PostMapping("/new")
	public Expense create(Expense newExpense) 
	{
		return eservice.createExpense(newExpense);
	}
	
	@GetMapping("/expense/{id}")
	public Expense getOne(@PathVariable("id") Long id)
	{
		return eservice.getOneExpense(id);
	}
	
	@PutMapping("/update/{id}")
	public Expense update(@PathVariable("id") Long id, Expense updatedExpense)
	{
		return eservice.updateExpense(updatedExpense);
	}
	
	
	
	
}
