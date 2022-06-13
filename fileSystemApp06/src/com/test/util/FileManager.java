/* ====================
	FileManager.java
==================== */

package com.test.util;

import java.io.File;

import javax.servlet.http.HttpServletResponse;

public class FileManager
{
	// 파일 다운로드
	// - saveFileName : 서버에 저장된 파일 이름
	// - originalFilename : 클라이언트가 업로드한 파일 이름
	// - path : 서버에 저장된 경로
	// - response : HttpServletResponse
	public static boolean doFileDownload(String saveFileName, String originalFileName
			                           , String path, HttpServletResponse response)
	{
		String loadDir = path + File.separator + saveFileName;
		
		
		
		
		
		
		return false;
	}
}
