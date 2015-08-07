package com.bankspring.service;

import java.util.List;

import com.bankspring.domain.ItemDto;
import com.bankspring.factory.Command;

public interface ItemService {
/*===== executeUpdate =====*/	
	
    public int insert(ItemDto item);
    public int update(ItemDto item);
    public int delete(ItemDto item);
    
/*===== executeQuery =====*/    
    
    public List<ItemDto> search(Command command);
    public List<ItemDto> list(Command command);
    public ItemDto login(Command command);
    public int size();
    public int count(Command command);
    public ItemDto detail(Command command);
}
