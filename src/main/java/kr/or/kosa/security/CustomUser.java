package kr.or.kosa.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.kosa.dto.Member;
import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private Member member;

	public CustomUser(String memberid, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(memberid, password, authorities);
	}

	public CustomUser(Member vo) {

		super(vo.getMemberId(), vo.getPassword(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.member = vo;
	}
}