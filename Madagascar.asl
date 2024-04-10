//Madagascar (PC) Load Remover
//Code and Addresses by Triguii (Triguii#0929)



state("Game"){
	
	byte load: 0x229740; //0 When in loading screen
	byte level: 0x206A38; //number of level, 14 when on map
	//byte level2: 0x22A2F8; //same as level, but 16 in first cutscene (for some reason)
	//byte load: 0x22ACDC; //1 When in loading screen
	byte levelUnlocked: 0x21F9AC, 0x368, 0x1C; //It starts in 0, it adds 1 each time you complete a level and the next one unlocks. This happens in the load screen at the end of each level
	byte movie: "binkw32.dll", 0x54A9C; //1 When playing an outside video file (eg. the initial cutscene)
	float bossHealth: 0x21F9AC, 0x678, 0x10, 0x1C; //Final boss health
}

init{
	
	vars.fossaPhase = 0;

}



start{
	if(current.level == 0 && old.level == 15){
		return(true);
	}

}


split{
	if(old.level != 15){
		
		if(current.levelUnlocked > old.levelUnlocked){
			return (true);
		}
		if (current.level == 11 && current.bossHealth == 0 && current.load != 0){
			if (current.bossHealth < old.bossHealth){
				vars.fossaPhase = vars.fossaPhase + 1;
			}
			
			if (vars.fossaPhase >= 2){
				return (true);
			}
		}
	}

}


isLoading{
	if (current.movie == 1 && current.load == 0){
		return (false);
	}   
	
	else{
		return (current.load == 0);
	}

}

