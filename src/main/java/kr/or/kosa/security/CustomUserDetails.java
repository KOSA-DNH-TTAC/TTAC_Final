package kr.or.kosa.security;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.MemberAuth;
import kr.or.kosa.service.MemberService;
import lombok.Data;

public class CustomUserDetails implements UserDetails {
	
	private String username;
	private String universityCode;
	private String memberId;
	private String password;
	private String name;
	private String major;
	private String email;
	private String gender;
	private String phone;
	private String parentsPhone;
	private String room;
	private int memberPoint;
	private int demerit;
	private int status;
	private String enabled;
	private boolean isEnabled;
	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private List<MemberAuth> authList;
	
	private Collection<?extends GrantedAuthority>authorities;

	@Override
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUniversityCode() {
		return universityCode;
	}

	public void setUniversityCode(String universityCode) {
		this.universityCode = universityCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getParentsPhone() {
		return parentsPhone;
	}

	public void setParentsPhone(String parentsPhone) {
		this.parentsPhone = parentsPhone;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public int getDemerit() {
		return demerit;
	}

	public void setDemerit(int demerit) {
		this.demerit = demerit;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public boolean isEnabled() {
		return isEnabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	@Override
	public boolean isAccountNonExpired() {
		return isAccountNonExpired;
	}

	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}
	@Override
	public boolean isAccountNonLocked() {
		return isAccountNonLocked;
	}

	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return isCredentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}

	public List<MemberAuth> getAuthList() {
		return authList;
	}

	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	public CustomUserDetails(Member vo, Collection<GrantedAuthority> auth) {
		
		username = vo.getMemberId();
		universityCode = vo.getUniversityCode();
		memberId = vo.getMemberId();
		password = vo.getPassword();
		name = vo.getName();
		major = vo.getMajor();
		email = vo.getEmail();
		gender = vo.getGender();
		phone = vo.getPhone();
		parentsPhone = vo.getParentsPhone();
		room = vo.getRoom();
		memberPoint = vo.getMemberPoint();
		demerit = vo.getDemerit();
		status = vo.getStatus();
		enabled = vo.getEnabled();
		isEnabled = true;
		isAccountNonExpired = true;
		isAccountNonLocked = true;
		isCredentialsNonExpired = true;
		authList = vo.getAuthList();
		
		authorities = auth;
	}

	@Override
	public String toString() {
		return "CustomUserDetails [username=" + username + ", universityCode=" + universityCode + ", memberId="
				+ memberId + ", password=" + password + ", name=" + name + ", major=" + major + ", email=" + email
				+ ", gender=" + gender + ", phone=" + phone + ", parentsPhone=" + parentsPhone + ", room=" + room
				+ ", memberPoint=" + memberPoint + ", demerit=" + demerit + ", status=" + status + ", enabled="
				+ enabled + ", isEnabled=" + isEnabled + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialsNonExpired=" + isCredentialsNonExpired
				+ ", authList=" + authList + ", authorities=" + authorities + "]";
	}

	
    
}
