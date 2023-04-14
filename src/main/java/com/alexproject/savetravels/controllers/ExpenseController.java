package com.alexproject.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.alexproject.savetravels.models.Expense;
import com.alexproject.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {

	@Autowired
	private ExpenseService eservice;
	
	@GetMapping("/expenses")
	public String index(Model mv) {
		List<Expense> expenses = eservice.getAllExpenses();
		mv.addAttribute("expenses", expenses);
		mv.addAttribute("expense", new Expense());
		return "index.jsp";
	}
	
	@GetMapping("/expenses/{id}")
	public String showExpense(
			@PathVariable("id") Long id,
			Model mv) 
	{
		Expense expenseToShow = eservice.getOneExpense(id);
		mv.addAttribute("expense", expenseToShow);
		return "show.jsp";
	}
	
	@PostMapping("/create")
	public String createExpense(
			@Valid @ModelAttribute("expense") Expense newExpense,
			BindingResult result,
			Model mv) 
	{
		if(result.hasErrors()) {
			mv.addAttribute("expenses", eservice.getAllExpenses());
			return "index.jsp";
		} else {
			eservice.createExpense(newExpense);
			return "redirect:/expenses";
		}
	}

	@GetMapping("/expenses/edit/{id}")
	public String editExpense(
			@PathVariable("id") Long id,
			Model mv)
	{
		Expense expenseToUpdate = eservice.getOneExpense(id);
		mv.addAttribute("expense", expenseToUpdate);
		return "edit.jsp";
	}

	@PutMapping("/expenses/{id}")
	public String updateExpense(
			@Valid @ModelAttribute("expense") Expense updatedExpense,
			BindingResult result)
	{
		if(result.hasErrors())
		{
			return "edit.jsp";
		} else
		{
			eservice.updateExpense(updatedExpense);
			return "redirect:/expenses";
		}
	}

	@DeleteMapping("/expenses/{id}")
	public String destroy(@PathVariable("id") Long id)
	{
		eservice.deleteExpense(id);
		return "redirect:/expenses";
	}












}
