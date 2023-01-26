//Skyrim Special Edition


state("SkyrimSE"){
	
	bool isLoadingScreen:  0x2FBF230; //True when in Loading Screen
	bool isLoading: 0x2FC4170; //True when loading 
}



isLoading{

	return(current.isLoading || current.isLoadingScreen);
	
}

