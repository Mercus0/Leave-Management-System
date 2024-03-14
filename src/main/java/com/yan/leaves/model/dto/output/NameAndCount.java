package com.yan.leaves.model.dto.output;

public class NameAndCount {
	private String name;
	private long count;
	
	public NameAndCount() {
		// TODO Auto-generated constructor stub
	}

	public NameAndCount(String name, long count) {
		super();
		this.name = name;
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

}
