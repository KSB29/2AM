package com.project.splace.common.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Schedule {
	
	// 12시간 이후
	@Scheduled(fixedDelay=43200000)
	public void bookDeadline() {
		
	}
}
