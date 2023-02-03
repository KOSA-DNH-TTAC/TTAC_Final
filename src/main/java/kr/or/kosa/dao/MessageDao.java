package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Message;

public interface MessageDao {
	
	public List<Message> getReceivedMessage(String memberid);
	public List<Message> getSendMessage(String memberid);
	public Message getMessage(int index);
	public int sendMessage(Message msg);
	
}
