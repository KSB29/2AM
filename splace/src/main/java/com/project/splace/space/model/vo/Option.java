package com.project.splace.space.model.vo;

public class Option {
	
	private String optionId;
	private String optionName;
	private String optionIcon;
	
	public Option() {}

	public Option(String optionId, String optionName, String optionIcon) {
		super();
		this.optionId = optionId;
		this.optionName = optionName;
		this.optionIcon = optionIcon;
	}

	public String getOptionId() {
		return optionId;
	}

	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionIcon() {
		return optionIcon;
	}

	public void setOptionIcon(String optionIcon) {
		this.optionIcon = optionIcon;
	}

	@Override
	public String toString() {
		return "Option [optionId=" + optionId + ", optionName=" + optionName + ", optionIcon=" + optionIcon + "]";
	}
}
