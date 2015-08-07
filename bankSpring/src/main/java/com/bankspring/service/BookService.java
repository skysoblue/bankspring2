package com.bankspring.service;

import java.util.List;

import com.bankspring.domain.BookDto;
import com.bankspring.factory.Command;

public interface BookService {
    public int add(BookDto item);
    public int update(BookDto item);
    public int delete(BookDto item);
    
/*===== executeQuery =====*/    
    
    public List<BookDto> search(Command command);
    public List<BookDto> list(Command command);
    public BookDto login(Command command);
    public int size();
    public int count(Command command);
    public BookDto detail(Command command);
}
