package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.GalleryDao;
import com.jeonju.mypet.vo.GalleryVo;
import com.jeonju.mypet.vo.MemberVo;

@Service
public class GalleryService {
	
	private GalleryDao galleryDao;
	
	@Autowired
	public GalleryService(GalleryDao galleryDao) {
		this.galleryDao = galleryDao;
	}
	

	public int addGallery(GalleryVo galleryVo) {
		return galleryDao.addGallery(galleryVo);
	}


	public List<GalleryVo> getGalleryList() {
		return galleryDao.getGalleryList();
	}

}
