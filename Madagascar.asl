//Madagascar (PC) Load Remover
//Code and Addresses by Triguii (Triguii#0929)



state("Game"){
	
	byte load: 0x229740; //0 When in loading screen
	byte level: 0x206A38; //number of level, 14 when on map
	//byte level2: 0x22A2F8; //same as level, but 16 in first cutscene (for some reason)
	//byte load: 0x22ACDC; //1 When in loading screen
	byte movie: "binkw32.dll", 0x54A9C; //1 When playing an outside video file (eg. the initial cutscene)
}



start{
	if(current.level == 0 && old.level == 15){
		return(true);
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

