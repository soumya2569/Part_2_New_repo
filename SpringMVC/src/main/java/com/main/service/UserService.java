package com.main.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.main.entity.User;
import com.main.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userrepo;
	
	public String validateUser(User user) {
		
		// Get all the details of User from Repository
		List<User> userlist=userrepo.findAll();
		
		for(User exuser:userlist) {
			if(exuser.getUsername().equals(user.getUsername()) && exuser.getPassword().equals(user.getPassword()))
				return "User exists.. Login Successful";
		}
		
		
		return "User does not exist";
	}
}
