package com.project.splace.board.model.vo;

import java.util.Date;

public class Board {
	private int boardId;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private String boardStatus;
	private Date boardEnroll;
	private Date boardUpdate;
	
	public Board() {}

	public Board(int boardId, int boardType, String boardTitle, String boardContent, String boardStatus,
			Date boardEnroll, Date boardUpdate) {
		super();
		this.boardId = boardId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardStatus = boardStatus;
		this.boardEnroll = boardEnroll;
		this.boardUpdate = boardUpdate;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public Date getBoardEnroll() {
		return boardEnroll;
	}

	public void setBoardEnroll(Date boardEnroll) {
		this.boardEnroll = boardEnroll;
	}

	public Date getBoardUpdate() {
		return boardUpdate;
	}

	public void setBoardUpdate(Date boardUpdate) {
		this.boardUpdate = boardUpdate;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardStatus=" + boardStatus + ", boardEnroll=" + boardEnroll
				+ ", boardUpdate=" + boardUpdate + "]";
	}
	
}
