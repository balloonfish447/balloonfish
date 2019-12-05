package com.se.util;

import java.util.List;

public class DataTablePage<T> {
	private int draw;
	private int recordsTotal;
	private int recordsFiltered;
	private List<T> data;

	
	
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
	public DataTablePage(List<T> data, int recordsTotal, int recordsFiltered, int draw) {
		super();
		this.data = data;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.draw = draw;
	}
	public DataTablePage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
