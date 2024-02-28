package com.yan.leaves.model.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageStorageService {
	private Path imageFolder=Path.of("images");
	private static final DateTimeFormatter DF=DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
	public enum ImageType{
		Profile,Post
	}
	
	public String save(MultipartFile file, ImageType profile, int imageNumber) {
		
		var fileName = getFileName(ImageType.Profile,file.getOriginalFilename(),imageNumber);
		var target=imageFolder.resolve(fileName);
		try {
			Files.copy(file.getInputStream(),target,StandardCopyOption.REPLACE_EXISTING);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	// type_trim(username)_yyyyMMddHHmmssSSS_imageNumber.extension
	private String getFileName(ImageType type, String fileName, int imageNumber) {
		var extension = getExtension(fileName);
		var userName = SecurityContextHolder.getContext().getAuthentication().getName().trim();
		var timeStamp = LocalDateTime.now().format(DF);
		return "%s_%s_%s_%s.%s".formatted(type,userName,timeStamp,imageNumber,extension);
	}

	private String getExtension(String fileName) {
		var array = fileName.split("\\.");
		if(array.length > 0) {
			return array[array.length-1];
		}
		return "";
	}
}
