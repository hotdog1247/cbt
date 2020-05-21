package com.yi.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String fileName, byte[] fileData) throws IOException {
		//기본 폴더 만들기
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		//년,월.일 폴더 만들기
		String target = calcPath(uploadPath);
		
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString()+"_"+fileName;
		File file = new File(uploadPath+target+"/"+saveName);
		FileCopyUtils.copy(fileData, file);
		System.out.println("uploadPath : "+uploadPath);
		System.out.println("target : "+target);
		System.out.println("saveName : "+saveName);
		String thumbPath= makeThumbnail(uploadPath, target, saveName);
		
		return thumbPath;
	}
	public static void deleteFile(String uploadPath, String fileName) throws IOException {
		System.out.println("fileName : "+fileName);
		System.out.println("uploadPath : "+uploadPath);
		File dir = new File(uploadPath+fileName);
		String frontString = fileName.substring(0, 12);
		String backString = fileName.substring(14, fileName.length());
		System.out.println("target : "+uploadPath+frontString+backString);
		File dir2 = new File(uploadPath+frontString+backString);
		if(dir.exists()) {
			dir.delete();
		}
		if(dir2.exists()) {
			dir2.delete();
		}
	}
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = "/"+cal.get(Calendar.YEAR);//년도 ex)2020
		String monthPath = String.format("%s/%02d",  yearPath, cal.get(Calendar.MONTH)+1);//월 ex)2020/04
		String datePath = String.format("%s/%02d",  monthPath, cal.get(Calendar.DATE));//일 ex)2020/04/29
		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String...paths) {
		for(String path:paths) {
			File dir = new File(uploadPath+path);
			if(dir.exists()==false) {
				dir.mkdir();
			}
		}
	}
	//uploadPath = root, path = 년/월/일 폴더, fileName = 오리지널 파일 이름
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException {
		//원본 이미지 데이터를 컴퓨터 상의 가상 도화지에 옮겨옴
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+"/"+fileName));
		//가상 도화지에 옮겨온 원본을 기준으로 작은 이미지를 가상공간에 만듬
		BufferedImage destImg =Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath+path+"/s_"+fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//가상 작은 이미지 데이터를 원하는 경로에 저장을 함
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length());//root경로를 뺀 경로를 보냄
	}
}
