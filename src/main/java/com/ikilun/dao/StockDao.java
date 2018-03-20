package com.ikilun.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.ikilun.model.Stock;

@Repository
public interface StockDao extends PagingAndSortingRepository<Stock, String>, JpaSpecificationExecutor<Stock> {
}
