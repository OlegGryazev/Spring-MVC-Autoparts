package com.example.servingwebcontent.service;

import com.example.servingwebcontent.Domain.Role;
import com.example.servingwebcontent.Domain.User;
import com.example.servingwebcontent.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    //private final MailService mailService;

    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
   //     this.mailService = mailService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public boolean addUser(User user){
        User userFromDb = userRepository.findByUsername(user.getUsername());
        if (userFromDb != null)
            return false;
        user.setFirstName(user.getFirstName());
        user.setLastName(user.getLastName());
        user.setMiddleName(user.getMiddleName());

        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        userRepository.save(user);

        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format("Hello %s! \n" +
                            "To activate your account, please visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(), user.getActivationCode());
   //         mailService.send(user.getEmail(), "Account activation", message);
        }

        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);
        if (user == null)
            return false;
        user.setActivationCode(null);
        user.setActive(true);

        userRepository.save(user);

        return true;
    }
}
