package com.studdype.test.model.dto.board;

import java.util.Date;

public class ScheduleDto {
	private int sche_no; 			// schedule no
	private int s_no; 				// study no
	private String sche_title; 		// meetDto title
	private int sche_writer; 		// meetDto writer
	private String sche_content; 	// meetDto content
	private Date sche_startdate; 	// meetDto vote startDate
	private Date sche_enddate; 		// meetDto vote endDate

	public ScheduleDto() {
		super();
	}

	public ScheduleDto(int sche_no, int s_no, String sche_title, int sche_writer, String sche_content,
			Date sche_startdate, Date sche_enddate) {
		super();
		this.sche_no = sche_no;
		this.s_no = s_no;
		this.sche_title = sche_title;
		this.sche_writer = sche_writer;
		this.sche_content = sche_content;
		this.sche_startdate = sche_startdate;
		this.sche_enddate = sche_enddate;
	}

	public int getSche_no() {
		return sche_no;
	}

	public void setSche_no(int sche_no) {
		this.sche_no = sche_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getSche_title() {
		return sche_title;
	}

	public void setSche_title(String sche_title) {
		this.sche_title = sche_title;
	}

	public int getSche_writer() {
		return sche_writer;
	}

	public void setSche_writer(int sche_writer) {
		this.sche_writer = sche_writer;
	}

	public String getSche_content() {
		return sche_content;
	}

	public void setSche_content(String sche_content) {
		this.sche_content = sche_content;
	}

	public Date getSche_startdate() {
		return sche_startdate;
	}

	public void setSche_startdate(Date sche_startdate) {
		this.sche_startdate = sche_startdate;
	}

	public Date getSche_enddate() {
		return sche_enddate;
	}

	public void setSche_enddate(Date sche_enddate) {
		this.sche_enddate = sche_enddate;
	}
}
