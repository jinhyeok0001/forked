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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GamePlayRecordDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 18.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 18., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
public class PlayRecordDAO {
	
public static PlayRecordDAO instance;
	
	public synchronized static PlayRecordDAO getInstance() {
		if (instance == null) {
			instance = new PlayRecordDAO();
		}
		return instance;
	}
	
	public PlayRecordDAO() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
    /** 
     * @Method Name  : listCate
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 별 질문 & 답변 출력
     * @param String category
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
	
	public GamePlayRecordDTO selectRecentlyPlayGame(String id) throws Exception{
		
		String sql = "select r.play_record_seq, r.user_id, r.play_date, r.play_score, g.game_title, g.game_seq from play_record r left outer join game g on r.game_seq = g.game_seq where r.user_id=? order by 3";
		
		try(Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			
			 try (ResultSet rs = pstat.executeQuery();) {
				 GamePlayRecordDTO dto = new GamePlayRecordDTO();
	                while (rs.next()) {
	                    int recordSeq = rs.getInt(1);
	                    String userId = rs.getString(2);
	                    Timestamp date  = rs.getTimestamp(3);
	                    int score = rs.getInt(4);
	                    String title = rs.getString(5);
	                    int gameSeq = rs.getInt(6);
	                    dto = new GamePlayRecordDTO(recordSeq, userId, date, score, title, gameSeq);
	                }
	                System.out.println(dto.getPlayRecordSeq() +":"+ dto.getUserId()+":"+ dto.getPlayDate()+":"+ dto.getPlayScore()+":"+ dto.getGameTitle()+":"+ dto.getGameSeq());
	                return dto;
	            }
			
		}
		
		
	}

}
