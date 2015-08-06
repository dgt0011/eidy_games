 

minetest.register_privilege("sorcery", "Can use /spell")

local changed = false

minetest.register_chatcommand("spell", {
    description = "Cast a spell",
    privs = {sorcery=true},
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
		
        if player == nil then                                                                                                                                              
            -- just a check to prevent the server crashing
            return false
        end
			
		local playerpos = player:getpos()
	
		if playerpos == nil then
			minetest.chat_send_player(name, "No player pos" )
            -- just a check to prevent the server crashing
            return false
        end
		  
		 
		playerpos["y"] = playerpos["y"] + 1
		
		if param.find(param,"summon") ~= nil and param.find(param,"volcano") ~= nil then
			playerpos["z"] = playerpos["z"] + 1
			minetest.add_item(playerpos,"default:lava_source")
			minetest.chat_send_player(name, "The gods give you a volcano")
		end
		
		
		
		if param.find(param,"stone") ~= nil and param.find(param,"pick") ~= nil then
			minetest.add_item(playerpos,"default:pick_stone")
			minetest.chat_send_player(name, "The gods give you a pickaxe")
		end
		
		if param.find(param,"paper") ~= nil then
			minetest.add_item(playerpos,"default:paper")
			minetest.chat_send_player(name, "The gods give you paper. Please wipe thy butt with it")
		end
		
		if param.find(param,"wood") ~= nil then
			minetest.add_item(playerpos,"default:wood")
			minetest.chat_send_player(name, "A block of wood appears")
		end
        
		minetest.sound_play("eidysorcery_magic", { to_player = name, gain = 2.0,})
         
    end,
})

 