package kr.or.kosa.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String memberid) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		return null;
	}

}
