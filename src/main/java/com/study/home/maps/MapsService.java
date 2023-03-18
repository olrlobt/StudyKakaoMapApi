package com.study.home.maps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapsService {

	@Autowired
	private MapsMapper mapsMapper;
	
	public MapsVO getBuilding() {
		
		return mapsMapper.getBuilding();
	}
	
}
