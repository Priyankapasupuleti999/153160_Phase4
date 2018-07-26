package com.cg.walletApp.controllers;

import java.math.BigDecimal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cg.walletApp.beans.Customer;
import com.cg.walletApp.beans.Transactions;
import com.cg.walletApp.exception.CustomerDetailsNotFoundException;
import com.cg.walletApp.exception.InsufficientBalanceException;
import com.cg.walletApp.exception.InvalidInputException;
import com.cg.walletApp.service.WalletService;
@SessionAttributes()
@Scope
@Controller
public class CustomerActionController {

	@Autowired
	WalletService walletService;

	@RequestMapping(value="/registerCustomer")
	public ModelAndView registerCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult result) {

		try {
			//send req to same page and display errors
			if(result.hasErrors()) return new ModelAndView("registrationPage");
			customer = walletService.createAccount(customer);
		} catch (InvalidInputException e) {
			return new ModelAndView("registrationPage","errorPage",e.getMessage());
		}
		return new ModelAndView("registrationSuccessPage", "customer", customer);		
	}

	//login customer and show balance
	@RequestMapping(value="/findCustomer", method=RequestMethod.POST)
	public ModelAndView findCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult result) {
		try {
			customer = walletService.showBalance(customer.getMobileNo());
			return new ModelAndView("showBalanceSuccess","customer", customer);
		} catch (CustomerDetailsNotFoundException e) {
			return new ModelAndView("loginPage","errorPage",e.getMessage());
		}	
	}

	@RequestMapping(value="/depositAmt")
	public ModelAndView depositAmt(@RequestParam("mobileNo") String mobileNo, @RequestParam("wallet.balance") BigDecimal amount) {
		Customer customer = new Customer();
		try {
			customer = walletService.depositAmount(mobileNo, amount);
		} catch (InvalidInputException e) {
			return new ModelAndView("depositAmountPage","errorPage",e.getMessage());
		}
		return new ModelAndView("depositAmountSuccess", "customer", customer);	
	}

	@RequestMapping(value="/withdrawAmount")
	public ModelAndView withdrawAmount(@RequestParam("mobileNo") String mobileNo, @RequestParam("wallet.balance") BigDecimal amount) {
		
		Customer customer = new Customer();
		
		try {
			customer = walletService.withdrawAmount(mobileNo, amount);
		} catch (InvalidInputException | InsufficientBalanceException e) {
			return new ModelAndView("withdrawAmountPage","errorPage",e.getMessage());
		}
		return new ModelAndView("withdrawAmountSuccess", "customer", customer);	
	}

	@RequestMapping(value="/fundTsf")
	public ModelAndView fundTsf(@RequestParam("sourceMobile") String sourceMobile, @RequestParam("targetMobile") String targetMobile, @RequestParam("wallet.balance") BigDecimal amount) {

		Customer customer = new Customer();

		try {
			customer = walletService.fundTransfer(sourceMobile, targetMobile, amount);
		} catch (InvalidInputException | InsufficientBalanceException e) {
			return new ModelAndView("fundTransferPage","errorPage",e.getMessage());
		}
		return new ModelAndView("fundTransferSuccess", "customer", customer);	
	}

	@RequestMapping(value="/printAllTransactions")
	public ModelAndView printAllTransactions(@RequestParam("mobileNo") String mobileNo) {

		List<Transactions> transaction;
		try {	
			transaction = walletService.getAllTransactions(mobileNo);
		} catch (InvalidInputException e) {
			return new ModelAndView("transactionPage","errorPage",e.getMessage());
		}
		return new ModelAndView("transactionSuccessPage", "transactions1", transaction);
	}
	
	@RequestMapping(value="/getAllCustomersPage")
	public ModelAndView getAllCustomers() {

		List<Customer> customers;
		try {	
			customers = walletService.getAllCustomers();
		} catch (InvalidInputException e) {
			return new ModelAndView("showBalanceSuccess","errorPage",e.getMessage());
		}
		return new ModelAndView("AllCustomersSuccessPage", "customer", customers);
	}
	
	@RequestMapping(value="/getCustomersPage")
	public ModelAndView getCustomers() {

		List<Customer> customers;
		try {	
			customers = walletService.getCustomer();
		} catch (InvalidInputException e) {
			return new ModelAndView("showBalanceSuccess","errorPage",e.getMessage());
		}
		return new ModelAndView("CustomerSuccessPage", "customer", customers);
	}
	
	@RequestMapping(value="/updatefun")
	public ModelAndView updateFun(@RequestParam("mobileNo") String mobileNo) {

		Customer customer = new Customer();
		try {	
			customer = walletService.showBalance(mobileNo);
		} catch (CustomerDetailsNotFoundException e) {
			return new ModelAndView("showBalanceSuccess","errorPage",e.getMessage());
		}
		return new ModelAndView("updateFunPage", "customer", customer);
	}
	
	public String getMobileNo(@RequestParam(value="mobileNo",required=true)String mobileNo) {
		return mobileNo;
	}
	
}
