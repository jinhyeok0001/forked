/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CReplyDTO;



public class CReplyDAO {
	private static CReplyDAO instance;

	public synchronized static CReplyDAO getInstance() {
		if (instance == null) {
			return new CReplyDAO();
		} else {
			return instance;
		}
	}

	private CReplyDAO() {}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	//유저게시판 글에 댓글 등록
	public void addReple(CReplyDTO reple) throws Exception{
		String sql = "insert into c_reply values(c_reply_sequence.nextval, ?, ?, ?, sysdate, null)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, reple.getcBoardSeq());
			pstat.setString(2, reple.getUserId());
			pstat.setString(3, reple.getcReplyContent());
			pstat.executeUpdate();
		}
	}
	
	//유저게시판 글의 댓글 목록 반환
	public List<CReplyDTO> viewRepleList(int parentSeq) throws Exception{
		String sql = "select * from c_reply where c_board_seq = ? and c_reply_reply is null order by c_reply_seq";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,parentSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<CReplyDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(3);
					String content = rs.getString(4);
					Timestamp date = rs.getTimestamp(5);
					
					CReplyDTO reple = new CReplyDTO(seq, parentSeq, writer, content, date, 0);
					list.add(reple);
				}
				return list;
			}
		}
	}
	
	//유저게시판 글에 추가한 댓글 또는 대댓글 반환
	public CReplyDTO viewReple(String id, int boardSeq, int ReplySeq) throws Exception{
		String sql = null;
		if(ReplySeq == 0) {
			sql = "select * from c_reply where c_board_seq = ? and user_id = ? and c_reply_reply is null order by c_reply_seq desc";
		}else {
			sql = "select * from c_reply where c_board_seq = ? and user_id = ? and c_reply_reply = ? order by c_reply_seq desc";
		}
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, boardSeq);
			pstat.setString(2, id);
			if(ReplySeq != 0) {
				pstat.setInt(3, ReplySeq);
			}
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int seq = rs.getInt(1);
				String content = rs.getString(4);
				Timestamp date = rs.getTimestamp(5);
				
				CReplyDTO reple = new CReplyDTO(seq, boardSeq, id, content, date, ReplySeq);
				return reple;
			}
		}
	}
	
	//유저게시판 글의 대댓글 목록 반환
	public List<CReplyDTO> viewRepleRepleList(int boardSeq) throws Exception{
		String sql = "select * from c_reply where c_board_seq = ? and c_reply_reply is not null order by c_reply_seq";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,boardSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<CReplyDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(3);
					String content = rs.getString(4);
					Timestamp date = rs.getTimestamp(5);
					int replySeq = rs.getInt(6);
					
					CReplyDTO reple = new CReplyDTO(seq, boardSeq, writer, content, date, replySeq);
					list.add(reple);
				}
				return list;
			}
		}
	}
	
	//유저게시판 글의 댓글 삭제
	public void delReple(int seq) throws Exception {
		String sql = "delete from c_reply where c_reply_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
	//유저게시판 글의 대댓글 삭제
	public void delRepleChildren(int seq) throws Exception {
		String sql = "delete from c_reply where c_reply_reply = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
	
	//유저게시판 글의 총 댓글 수 반환
	public int countRepleList(int seq) throws Exception{
		String sql = "select count(*) from c_reply where c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	//유저게시판 글의 대댓글 작성
	public void addReplyReply(CReplyDTO rerpl) throws Exception{
		String sql = "insert into c_reply values(c_reply_sequence.nextval, ?, ?, ?, sysdate, ?)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, rerpl.getcBoardSeq());
			pstat.setString(2, rerpl.getUserId());
			pstat.setString(3, rerpl.getcReplyContent());
			pstat.setInt(4, rerpl.getcReplyReply());
			pstat.executeUpdate();
		}
		
	}
	
}
