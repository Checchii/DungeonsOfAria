function save_room()
{
	// slimes and item drops
	if room == rm_dungeon1F
	{
	// get the count of each savable object
	var _slimeNum = instance_number(oSlimeNormal);
	var _coinNum = instance_number(oCoin);
	var _fhNum = instance_number(oFullHeal);
	var _mfhNum = instance_number(oManaFull);
	
	var _roomStruct = 
	{
		slimeNum : _slimeNum,
		slimeData : array_create(_slimeNum),
		
		coinNum : _coinNum,
		coinData : array_create(_coinNum),
		
		fhNum : _fhNum,
		fhData : array_create(_fhNum),
		
		mfhNum : _mfhNum,
		mfhData : array_create(_mfhNum),
	}
	
	// get the data from the different savable objects
	
				// enemies
		for (var i = 0; i < _slimeNum; i++) {
			
			var _inst = instance_find(oSlimeNormal, i);
			
			_roomStruct.slimeData[i] = {
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
					// Full heal
			for (var i = 0; i < _fhNum; i++) {
			
			var _inst = instance_find(oFullHeal, i);
			
			_roomStruct.fhData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
					// Mana Full Heal
			for (var i = 0; i < _mfhNum; i++) {
			
			var _inst = instance_find(oManaFull, i);
			
			_roomStruct.mfhData[i] = {
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
		var _fhNum = instance_number(oFullHeal);
		var _mfhNum = instance_number(oManaFull);
	
		var _roomStruct = 
		{
			skeleNum : _skeleNum,
			skeleData : array_create(_skeleNum),
			
			coinNum : _coinNum,
			coinData : array_create(_coinNum),
		
			fhNum : _fhNum,
			fhData : array_create(_fhNum),
		
			mfhNum : _mfhNum,
			mfhData : array_create(_mfhNum),
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
					// Full heal
			for (var i = 0; i < _fhNum; i++) {
			
			var _inst = instance_find(oFullHeal, i);
			
			_roomStruct.fhData[i] = {
				x : _inst.x,
				y : _inst.y, 
				}
				
			}
					// Mana Full Heal
			for (var i = 0; i < _mfhNum; i++) {
			
			var _inst = instance_find(oManaFull, i);
			
			_roomStruct.mfhData[i] = {
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
		// slime npc
		if instance_exists(oSlimeNormal) { instance_destroy(oSlimeNormal); };
		for (var i = 0; i < _roomStruct.slimeNum; i++)
		{
			instance_create_depth(_roomStruct.slimeData[i].x, _roomStruct.slimeData[i].y,depth, oSlimeNormal );
		}

		
		// item drops
		if instance_exists(oCoin) { instance_destroy(oCoin); };
		for (var i = 0; i < _roomStruct.coinNum; i++)
		{
			instance_create_depth(_roomStruct.coinData[i].x, _roomStruct.coinData[i].y,depth, oCoin );
		}
		
		if instance_exists(oFullHeal) { instance_destroy(oFullHeal); };
		for (var i = 0; i < _roomStruct.fhNum; i++)
		{
			instance_create_depth(_roomStruct.fhData[i].x, _roomStruct.fhData[i].y,depth, oFullHeal );
		}
		
		if instance_exists(oManaFull) { instance_destroy(oManaFull); };
		for (var i = 0; i < _roomStruct.mfhNum; i++)
		{
			instance_create_depth(_roomStruct.mfhData[i].x, _roomStruct.mfhData[i].y,depth, oManaFull);
		} 
	}
	
	if room == rm_dungeon2F
	{
		// skele npc
		if instance_exists(oSkele) { instance_destroy(oSkele); };
		for (var i = 0; i < _roomStruct.skeleNum; i++)
		{
			instance_create_depth(_roomStruct.skeleData[i].x, _roomStruct.skeleData[i].y,depth, oSkele );
		}
		
		// item drops
		if instance_exists(oCoin) { instance_destroy(oCoin); };
		for (var i = 0; i < _roomStruct.coinNum; i++)
		{
			instance_create_depth(_roomStruct.coinData[i].x, _roomStruct.coinData[i].y,depth, oCoin );
		}
		
		if instance_exists(oFullHeal) { instance_destroy(oFullHeal); };
		for (var i = 0; i < _roomStruct.fhNum; i++)
		{
			instance_create_depth(_roomStruct.fhData[i].x, _roomStruct.fhData[i].y,depth, oFullHeal );
		}
		
		if instance_exists(oManaFull) { instance_destroy(oManaFull); };
		for (var i = 0; i < _roomStruct.mfhNum; i++)
		{
			instance_create_depth(_roomStruct.mfhData[i].x, _roomStruct.mfhData[i].y,depth, oManaFull);
		} 
	}
	
	
}