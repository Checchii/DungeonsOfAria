function save_room()
{
	// slimes and item drops
	if room == rm_dungeon1F
	{
	// get the count of each savable object
	var _slimeNum = instance_number(oSlimeNormal);
	
	var _coinNum = instance_number(oCoin);
	var _slimeGoopNum = instance_number(oSlimeGoop);
	
	var _roomStruct = 
	{
		slimeNum : _slimeNum,
		slimeData : array_create(_slimeNum),
		
		coinNum : _coinNum,
		coinData : array_create(_coinNum),
		
		slimeGoopNum : _slimeGoopNum,
		slimeGoopData : array_create(_slimeGoopNum),
	}
	
	// get the data from the different savable objects
		
		/*
				// enemies
		for (var i = 0; i < _slimeNum; i++) {
			
			var _inst = instance_find(oSlimeNormal, i);
			
			_roomStruct.slimeData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
			*/
					// Coins ( old ) 
			for (var i = 0; i < _coinNum; i++) {
			
			var _inst = instance_find(oCoin, i);
			
			_roomStruct.coinData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
			
				// Slime Goop
			for (var i = 0; i < _slimeGoopNum; i++) {
			
			var _inst = instance_find(oSlimeGoop, i);
			
			_roomStruct.slimeGoopData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
			
	
	}
	
	
	// Skele and item drops
	if room == rm_dungeon2F
	{
		// get the count of each savable object
		var _skeleNum = instance_number(oSkele);
		
		var _coinNum = instance_number(oCoin);
		var _magicalSkullnum = instance_number(oMagicalSkull);
	
		var _roomStruct = 
		{
			skeleNum : _skeleNum,
			skeleData : array_create(_skeleNum),
			
			coinNum : _coinNum,
			coinData : array_create(_coinNum),
			
			magicalSkullNum : _magicalSkullnum,
			magicalSkullData : array_create(_magicalSkullnum),
		}
	
		// get the data from the different savable objects
	
			// enemies
			for (var i = 0; i < _skeleNum; i++) 
			{
			
				var _inst = instance_find(oSkele, i);
			
				_roomStruct.skeleData[i] = {
					x : _inst.x,
					y : _inst.y, 
					}
				
			}
			
					// Coins
			for (var i = 0; i < _coinNum; i++) {
			
			var _inst = instance_find(oCoin, i);
			
			_roomStruct.coinData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
			
				// Magical Skulls
			for (var i = 0; i < _magicalSkullnum; i++) {
			
			var _inst = instance_find(oMagicalSkull, i);
			
			_roomStruct.magicalSkullData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
	
	}
	
	
	
	// store the room specific struct in global.levelData's variable meant for that level
	if room == rm_dungeon1F 
	{ 
		global.leveldata.dungeon1F = _roomStruct; 
	} 
	
	if room == rm_dungeon2F 
	{ 
		global.leveldata.dungeon2F = _roomStruct;
	}
	// if room == rm_boss3F { global.leveldata.boss = _roomStruct; }

}

function load_room()
{
	var _roomStruct = 0;
	
	// get the correct struct for the room you're in
	if room == rm_dungeon1F 
	{ 
		_roomStruct = global.leveldata.dungeon1F; 
		
	}
	
	if room == rm_dungeon2F 
	{ 
		_roomStruct = global.leveldata.dungeon2F; 
		
	}
	
	// if room == rm_boss3F { _roomStruct = global.leveldata.dungeon_3; }
	
	// EXIT if roomstruct isn't a struct
	if !is_struct(_roomStruct) { exit; }

	
	// get rid of default room editor instance
	// then create new instances with all of the data previously saved
	if room == rm_dungeon1F
	{
		/*
		// slime npc
		if instance_exists(oSlimeNormal) { instance_destroy(oSlimeNormal); };
		for (var i = 0; i < _roomStruct.slimeNum; i++)
		{
			instance_create_depth(_roomStruct.slimeData[i].x, _roomStruct.slimeData[i].y,depth, oSlimeNormal );
		}
		*/
		
		// item drops
		if instance_exists(oCoin) { instance_destroy(oCoin); };
		for (var i = 0; i < _roomStruct.coinNum; i++)
		{
			instance_create_depth(_roomStruct.coinData[i].x, _roomStruct.coinData[i].y,depth, oCoin );
		}
		
		if instance_exists(oSlimeGoop) { instance_destroy(oSlimeGoop); };
		for (var i = 0; i < _roomStruct.slimeGoopNum; i++)
		{
			instance_create_depth(_roomStruct.slimeGoopData[i].x, _roomStruct.slimeGoopData[i].y,depth, oSlimeGoop);
		} 
	}
	
	if room == rm_dungeon2F
	{
		/*
		// skele npc
		if instance_exists(oSkele) { instance_destroy(oSkele); };
		for (var i = 0; i < _roomStruct.skeleNum; i++)
		{
			instance_create_depth(_roomStruct.skeleData[i].x, _roomStruct.skeleData[i].y,depth, oSkele );
		}
		*/
		
		// item drops
		if instance_exists(oCoin) { instance_destroy(oCoin); };
		for (var i = 0; i < _roomStruct.coinNum; i++)
		{
			instance_create_depth(_roomStruct.coinData[i].x, _roomStruct.coinData[i].y,depth, oCoin );
		}

		
		if instance_exists(oMagicalSkull) { instance_destroy(oMagicalSkull); };
		for (var i = 0; i < _roomStruct.magicalSkullNum; i++)
		{
			instance_create_depth(_roomStruct.magicalSkullData[i].x, _roomStruct.magicalSkullData[i].y,depth, oMagicalSkull);
		} 
	}
	
	
}