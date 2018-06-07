package com.mypet.model;

public class FileMsg {
	private String savePath;
	private String originFileName;
	private String saveName;

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public FileMsg() {
	}

	public FileMsg(String savePath, String originFileName, String saveName) {
		this.savePath = savePath;
		this.originFileName = originFileName;
		this.saveName = saveName;
	}

}
