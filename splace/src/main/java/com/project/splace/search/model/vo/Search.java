package com.project.splace.search.model.vo;

import java.util.Arrays;

public class Search {
	private String searchBox;
	private String locationSelect;
	private String[] typeSelect;
	private String[] optionSelect;
	
	
	public Search() {
		
	}
	public Search(String searchBox, String locationSelect, String[] typeSelect, String[] optionSelect) {
		super();
		this.searchBox = searchBox;
		this.locationSelect = locationSelect;
		this.typeSelect = typeSelect;
		this.optionSelect = optionSelect;
	}

	public String getLocationSelect() {
		return locationSelect;
	}

	public void setLocationSelect(String locationSelect) {
		this.locationSelect = locationSelect;
	}

	public String[] getTypeSelect() {
		return typeSelect;
	}

	public void setTypeSelect(String[] typeSelect) {
		this.typeSelect = typeSelect;
	}

	public String[] getOptionSelect() {
		return optionSelect;
	}

	public void setOptionSelect(String[] optionSelect) {
		this.optionSelect = optionSelect;
	}



	public String getSearchBox() {
		return searchBox;
	}

	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}
	@Override
	public String toString() {
		return "Search [searchBox=" + searchBox + ", locationSelect=" + locationSelect
				+ ", typeSelect=" + Arrays.toString(typeSelect) + ", optionSelect=" + Arrays.toString(optionSelect)
				+ "]";
	}
	

	
}
