package com.cg.walletApp.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cg.walletApp.beans.Customer;

//mobileNo is string
public interface WalletRepo extends JpaRepository<Customer, String> {

}
