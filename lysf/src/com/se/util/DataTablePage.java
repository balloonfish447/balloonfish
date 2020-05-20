package com.se.util;

import java.util.List;

public class DataTablePage<T> {
	private int draw;
	private int recordsTotal;
	private int recordsFiltered;
	private List<T> data;
	private String lirun;
	private String rkjgfzj;
	private String ckjgfzj;

	public String getRkjgfzj() {
		return rkjgfzj;
	}

	public void setRkjgfzj(String rkjgfzj) {
		this.rkjgfzj = rkjgfzj;
	}

	public String getCkjgfzj() {
		return ckjgfzj;
	}

	public void setCkjgfzj(String ckjgfzj) {
		this.ckjgfzj = ckjgfzj;
	}

	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public int getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public int getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}

	public String getLirun() {
		return lirun;
	}

	public void setLirun(String lirun) {
		this.lirun = lirun;
	}

	public DataTablePage(List<T> data, int recordsTotal, int recordsFiltered, int draw) {
		super();
		this.data = data;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.draw = draw;
	}

	public DataTablePage(int draw, int recordsTotal, int recordsFiltered, List<T> data, String lirun,String rkjgfzj,String ckjgfzj) {
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.data = data;
		this.lirun = lirun;
		this.rkjgfzj = rkjgfzj;
		this.ckjgfzj = ckjgfzj;
	}

	public DataTablePage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
