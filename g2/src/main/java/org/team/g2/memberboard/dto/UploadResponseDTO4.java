package org.team.g2.memberboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UploadResponseDTO4 {

	private String  userUuid;
	private String  userFileName;
	private boolean userImageCheck;
	private String  userFilePath;

	public String getThumbnail() {
		return userFilePath + "/s_" + userUuid + "_" + userFileName;
	}

	public String getFileLink() {
		return userFilePath + "/" + userUuid + "_" + userFileName;
	}

}