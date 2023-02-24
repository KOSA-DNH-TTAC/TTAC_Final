package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Message;

public interface MessageDao {

	// 받은 쪽지
	public List<Message> getReceivedMessage(String memberid);

	// 보낸 쪽지
	public List<Message> getSendMessage(String memberid);

	// 쪽지 1개 읽기
	public Message getMessage(int index);

	// 쪽지 읽으면 status 바꾸기
	public int setMsgRead(int index);

	// 쪽지 보내기
	public int sendMessage(Message msg);

}
