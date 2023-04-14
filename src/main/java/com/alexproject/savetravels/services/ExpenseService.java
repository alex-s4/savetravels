package com.alexproject.savetravels.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alexproject.savetravels.models.Expense;
import com.alexproject.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	@Autowired
	private ExpenseRepository expenseRepo;
	
	// getAll
	public List<Expense> getAllExpenses()
	{
		return expenseRepo.findAll();
	}
	
	// getOne
	public Expense getOneExpense(Long id) 
	{
		return expenseRepo.findById(id).orElse(null);
	}
	
	// create
	public Expense createExpense(Expense newExpense) 
	{
		return expenseRepo.save(newExpense);
	}
	
	// update
	public Expense updateExpense(Expense updatedExpense) 
	{
		return this.expenseRepo.save(updatedExpense);
	}
	
	// delete
	public void deleteExpense(Long id) 
	{
		this.expenseRepo.deleteById(id);
	}
}
