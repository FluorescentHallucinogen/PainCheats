--=======================================================================
-- PAINKILLER ADVANCED CHEATS
--=======================================================================
Cheats =
{
	PlatformXBox = false,
	ConsoleMessages = true
}
--=======================================================================
-- PCAddGoldBonusScore()
function Console:Cmd_PCADDGOLDBONUSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.BonusItems = Player.BonusItems + 20
	Game.PlayerMoneyFound = Game.PlayerMoneyFound + 20
end
--=======================================================================
-- PCBurnEnemies([time])
function Console:Cmd_PCBURNENEMIES(time)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if time == nil then
		time = 9999999
	end
	time = tonumber(time)
	if time and time > 0 then
		for i, v in Actors do
			if v._AIBrain and not v._died then
				local p = Templates["PBurningItem.CProcess"]:New(v, time)
				p:Init()
				GObjects:Add(TempObjName(), p)
			end
		end
	end
end
--=======================================================================
-- PCBurnObjects([time])
function Console:Cmd_PCBURNOBJECTS(time)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if time == nil then
		time = 9999999
	end
	time = tonumber(time)
	if time and time > 0 then
		for i, v in GObjects.Elements do
			if v._Class == "CItem" and v.Destroy and v.DestroyPack and v.OnDamage and not (v.Destroy._Timer or v.Immortal or v.NotCountable) then
				local p = Templates["PBurningItem.CProcess"]:New(v, time)
				p:Init()
				GObjects:Add(TempObjName(), p)
			end
		end
	end
end
--=======================================================================
-- PCCheats()
function Console:Cmd_PCCHEATS()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Console:Cmd_PCDOUBLEDEMONFACTOR()
	Console:Cmd_PCDOUBLEJUMPFACTOR()
	Console:Cmd_PCDOUBLESPEEDFACTOR()
	Game.Cheat_AlwaysGib = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGibOn)
	end
	GOD = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGodOn)
	end
	if not Cheats.PlatformXBox then
		Game.Cheat_KeepDecals = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepDecalsOff)
		end
	end
	Console:Cmd_PCMEGAAMMO()
	Console:Cmd_PCMEGAARMOR()
	Console:Cmd_PCMEGADAMAGEFACTOR()
	Console:Cmd_PCMEGAHEALTH()
	Console:Cmd_PCMEGARELOADSPEEDFACTOR()
	Console:Cmd_PCMEGASOULDISTANCEFACTOR()
	Console:Cmd_PCMEGASOULTIMEFACTOR()
	Game.NoAmmoLoss = true
	Game.GoldenCardsUseUnlimited = true
	Console:Cmd_PCUNLOCKWEAPONS()
	Game.Cheat_WeakEnemies = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKWeakOn)
	end
end
--=======================================================================
-- PCCloseSlabs()
function Console:Cmd_PCCLOSESLABS()
	if Cheats.PlatformXBox then
		return
	end
	for i, v in GObjects.Elements do
		if v.BaseObj == "Slab.CItem" then
			v:Close(9999999, false, false)
		end
	end
end
--=======================================================================
-- PCConfuseEnemies() <toggle>
function Console:Cmd_PCCONFUSEENEMIES()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.ConfuseEnemies then
		Game.ConfuseEnemies = false
	else
		Game.ConfuseEnemies = true
	end
end
--=======================================================================
-- PCConsoleMessages() <toggle>
function Console:Cmd_PCCONSOLEMESSAGES()
	if Cheats.ConsoleMessages then
		Cheats.ConsoleMessages = false
	else
		Cheats.ConsoleMessages = true
	end
end
--=======================================================================
-- PCCustomAmmo(amount)
function Console:Cmd_PCCUSTOMAMMO(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		for i, v in Player.Ammo do
			Player.Ammo[i] = amount
		end
	end
end
--=======================================================================
-- PCCustomAmmoFactor(amount)
function Console:Cmd_PCCUSTOMAMMOFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.AmmoFoundFactor = amount
	end
end
--=======================================================================
-- PCCustomAmmoScore(amount)
function Console:Cmd_PCCUSTOMAMMOSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.PlayerAmmoFound = amount
	end
end
--=======================================================================
-- PCCustomArmor(amount)
function Console:Cmd_PCCUSTOMARMOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Player.Armor = amount
		if amount >= 200 then
			Player.ArmorType = ArmorTypes.Strong
			Player.ArmorRescueFactor = Templates["ArmorStrong.CItem"].RescueFactor
		elseif amount >= 150 then
			Player.ArmorType = ArmorTypes.Medium
			Player.ArmorRescueFactor = Templates["ArmorMedium.CItem"].RescueFactor
		elseif amount >= 100 then
			Player.ArmorType = ArmorTypes.Weak
			Player.ArmorRescueFactor = Templates["ArmorWeak.CItem"].RescueFactor
		else
			Player.ArmorType = 0
			Player.ArmorRescueFactor = 0
		end
	end
end
--=======================================================================
-- PCCustomGoldBonusScore(amount)
function Console:Cmd_PCCUSTOMGOLDBONUSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.PlayerMoneyFound = Game.PlayerMoneyFound - Player.BonusItems
		Player.BonusItems = amount
		Game.PlayerMoneyFound = Game.PlayerMoneyFound + amount
	end
end
--=======================================================================
-- PCCustomDamageFactor(amount)
function Console:Cmd_PCCUSTOMDAMAGEFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.DamageFactor = amount
	end
end
--=======================================================================
-- PCCustomDemonFactor(amount)
function Console:Cmd_PCCUSTOMDEMONFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.Demon_HowManyCorpses = amount
		Game.Demon_Counter = Game.Demon_HowManyCorpses
	end
end
--=======================================================================
-- PCCustomGamePlayTimeScore(amount)
function Console:Cmd_PCCUSTOMGAMEPLAYTIMESCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.LevelTime = amount
	end
end
--=======================================================================
-- PCCustomArmorsScore(amount)
function Console:Cmd_PCCUSTOMARMORSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Player.ArmorFound = amount
	end
end
--=======================================================================
-- PCCustomGoldScore(amount)
function Console:Cmd_PCCUSTOMGOLDSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.PlayerMoneyFound = amount + Player.BonusItems
	end
end
--=======================================================================
-- PCCustomHealth(amount)
function Console:Cmd_PCCUSTOMHEALTH(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Player.Health = amount
	end
end
--=======================================================================
-- PCCustomHealthFactor(amount)
function Console:Cmd_PCCUSTOMHEALTHFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.HealthCapacity = amount
	end
end
--=======================================================================
-- PCCustomHolyItemsScore(amount)
function Console:Cmd_PCCUSTOMHOLYITEMSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Player.HolyItems = amount
	end
end
--=======================================================================
-- PCCustomJumpFactor(amount)
function Console:Cmd_PCCUSTOMJUMPFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount > 0 then
		local speed, jump = GetPlayerSpeed()
		SetPlayerSpeed(speed, amount)
	end
end
--=======================================================================
-- PCCustomMonstersScore(amount)
function Console:Cmd_PCCUSTOMMONSTERSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.BodyCountTotal = amount
	end
end
--=======================================================================
-- PCCustomObjectsScore(amount)
function Console:Cmd_PCCUSTOMOBJECTSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.PlayerDestroyedItems = amount
	end
end
--=======================================================================
-- PCCustomPlayerMoney(amount)
function Console:Cmd_PCCUSTOMPLAYERMONEY(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.PlayerMoney = amount
		MBOARD.SetCashCheat(amount)
		PMENU.SwitchToMap()
		PMENU.SwitchToBoard()
	end
end
--=======================================================================
-- PCCustomReloadSpeedFactor(amount)
function Console:Cmd_PCCUSTOMRELOADSPEEDFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount > 0 then
		Game.ReloadSpeedFactor = 1 / amount
	end
end
--=======================================================================
-- PCCustomSecretsScore(amount)
function Console:Cmd_PCCUSTOMSECRETSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Player.SecretsFound = amount
	end
end
--=======================================================================
-- PCCustomSoulDistanceFactor(amount)
function Console:Cmd_PCCUSTOMSOULDISTANCEFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.SoulCatchDistance = amount
	end
end
--=======================================================================
-- PCCustomSoulFactor(amount)
function Console:Cmd_PCCUSTOMSOULFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.SoulHealthFactor = amount
	end
end
--=======================================================================
-- PCCustomSoulTimeFactor(amount)
function Console:Cmd_PCCUSTOMSOULTIMEFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.SoulStayFactor = amount
	end
end
--=======================================================================
-- PCCustomSoulsScore(amount)
function Console:Cmd_PCCUSTOMSOULSSCORE(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Player.TotalSoulsCount = amount
	end
end
--=======================================================================
-- PCCustomSpeedFactor(amount)
function Console:Cmd_PCCUSTOMSPEEDFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount > 0 then
		local speed, jump = GetPlayerSpeed()
		SetPlayerSpeed(Player.PlayerSpeed * amount, jump)
	end
end
--=======================================================================
-- PCCustomTreasureFactor(amount)
function Console:Cmd_PCCUSTOMTREASUREFACTOR(amount)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if amount == nil then
		return
	end
	amount = tonumber(amount)
	if amount and amount >= 0 then
		Game.TreasureFoundFactor = amount
	end
end
--=======================================================================
-- PCDemon([time]) <toggle>
function Console:Cmd_PCDEMON(time)
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if time == nil then
		time = 9999999
	end
	time = tonumber(time)
	if time and time > 0 then
		if Game.IsDemon then
			Game:EnableDemon(false)
			if Cheats.ConsoleMessages then
				CONSOLE.AddMessage(TXT.Cheats.PKDemonOff)
			end
		else
			Game:EnableDemon(true, time)
			if Cheats.ConsoleMessages then
				CONSOLE.AddMessage(TXT.Cheats.PKDemonOn)
			end
		end
	end
end
--=======================================================================
-- PCDemonGun()
function Console:Cmd_PCDEMONGUN()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.EnabledWeapons[10] = "DemonGun"
	RawCallMethod(CPlayer.WeaponChangeConfirmation, Player._Entity, 10)
end
--=======================================================================
-- PCDifficultyDaydream()
function Console:Cmd_PCDIFFICULTYDAYDREAM()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Difficulty = 0
end
--=======================================================================
-- PCDifficultyInsomnia()
function Console:Cmd_PCDIFFICULTYINSOMNIA()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Difficulty = 1
end
--=======================================================================
-- PCDifficultyNightmare()
function Console:Cmd_PCDIFFICULTYNIGHTMARE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Difficulty = 2
end
--=======================================================================
-- PCDifficultyTrauma()
function Console:Cmd_PCDIFFICULTYTRAUMA()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Difficulty = 3
end
--=======================================================================
-- PCDisableCheats()
function Console:Cmd_PCDISABLECHEATS()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Cheat_AlwaysGib = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGibOff)
	end
	GOD = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGodOff)
	end
	if not Cheats.PlatformXBox then
		Game.Cheat_KeepDecals = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepDecalsOff)
		end
	end
	Console:Cmd_PCLOCKWEAPONS()
	Console:Cmd_PCNORMALDAMAGEFACTOR()
	Console:Cmd_PCNORMALDEMONFACTOR()
	Console:Cmd_PCNORMALHEALTH()
	Console:Cmd_PCNORMALJUMPFACTOR()
	Console:Cmd_PCNORMALRELOADSPEEDFACTOR()
	Console:Cmd_PCNORMALSOULTIMEFACTOR()
	Console:Cmd_PCNORMALSPEEDFACTOR()
	Console:Cmd_PCRESETAMMO()
	Console:Cmd_PCRESETARMOR()
	Console:Cmd_PCRESETSOULDISTANCEFACTOR()
	Game.NoAmmoLoss = false
	Game.GoldenCardsUseUnlimited = false
	Game.Cheat_WeakEnemies = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKWeakOff)
	end
end
--=======================================================================
-- PCDisableFluorescentHallucinogen()
function Console:Cmd_PCDISABLEFLUORESCENTHALLUCINOGEN()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Cheat_AlwaysGib = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGibOff)
	end
	GOD = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGodOff)
	end
	Game.Cheat_KeepBodies = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKKeepBodiesOff)
	end
	if not Cheats.PlatformXBox then
		Game.Cheat_KeepDecals = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepDecalsOff)
		end
	end
	Console:Cmd_PCLOCKWEAPONS()
	Console:Cmd_PCNORMALDAMAGEFACTOR()
	Console:Cmd_PCNORMALDEMONFACTOR()
	Console:Cmd_PCNORMALHEALTH()
	Console:Cmd_PCNORMALJUMPFACTOR()
	Console:Cmd_PCNORMALRELOADSPEEDFACTOR()
	Console:Cmd_PCNORMALSPEEDFACTOR()
	Console:Cmd_PCRESETAMMO()
	Console:Cmd_PCRESETARMOR()
	Game.NoAmmoLoss = false
	Game.GoldenCardsUseUnlimited = false
	Game.Cheat_WeakEnemies = false
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKWeakOff)
	end
end
--=======================================================================
-- PCDoubleAmmoFactor()
function Console:Cmd_PCDOUBLEAMMOFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.AmmoFoundFactor = 2
end
--=======================================================================
-- PCDoubleDamageFactor()
function Console:Cmd_PCDOUBLEDAMAGEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.DamageFactor = 2
end
--=======================================================================
-- PCDoubleDemonFactor()
function Console:Cmd_PCDOUBLEDEMONFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Demon_HowManyCorpses = 33
	Game.Demon_Counter = Game.Demon_HowManyCorpses
end
--=======================================================================
-- PCDoubleHealth()
function Console:Cmd_PCDOUBLEHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.Health = 200
end
--=======================================================================
-- PCDoubleHealthFactor()
function Console:Cmd_PCDOUBLEHEALTHFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.HealthCapacity = 200
end
--=======================================================================
-- PCDoubleJumpFactor()
function Console:Cmd_PCDOUBLEJUMPFACTOR()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local speed, jump = GetPlayerSpeed()
	SetPlayerSpeed(speed, 2)
end
--=======================================================================
-- PCDoubleReloadSpeedFactor()
function Console:Cmd_PCDOUBLERELOADSPEEDFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.ReloadSpeedFactor = 0.5
end
--=======================================================================
-- PCDoubleSoulDistanceFactor()
function Console:Cmd_PCDOUBLESOULDISTANCEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulCatchDistance = 2
end
--=======================================================================
-- PCDoubleSoulFactor()
function Console:Cmd_PCDOUBLESOULFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulHealthFactor = 2
end
--=======================================================================
-- PCDoubleSoulTimeFactor()
function Console:Cmd_PCDOUBLESOULTIMEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulStayFactor = 2
end
--=======================================================================
-- PCDoubleSpeedFactor()
function Console:Cmd_PCDOUBLESPEEDFACTOR()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local speed, jump = GetPlayerSpeed()
	SetPlayerSpeed(Player.PlayerSpeed * 2, jump)
end
--=======================================================================
-- PCDoubleTreasureFactor()
function Console:Cmd_PCDOUBLETREASUREFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.TreasureFoundFactor = 2
end
--=======================================================================
-- PCExplodeEnemies()
function Console:Cmd_PCEXPLODEENEMIES()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	for i, v in Actors do
		if v._AIBrain and v.OnDamage and not (v._died or Lev._Name == "C2L2_Prison" and v.BaseObj == "Psycho_elektro_explode.CActor") then
			local attackType = AttackTypes.Suicide
			if v.BaseObj == "Swamp.CActor" then
				v._canGetNormalDamage = true
			elseif v.BaseObj == "Lucifer.CActor" then
				v._ABdo = true
				v.Model = "lucy_sword"
				attackType = AttackTypes.Stone
			elseif v.BaseObj == "Thor.CActor" then
				v._ABdone = true
			elseif v.BaseObj == "Alastor.CActor" or v.BaseObj == "AlastorKing.CActor" or v.BaseObj == "Panzer_Spider.CActor" then
				attackType = AttackTypes.OutOfLevel
			end
			v:OnDamage(9999999, v, attackType)
			v:OnDamage(9999999, v, AttackTypes.OutOfLevel)
		end
	end
end
--=======================================================================
-- PCExplodeObjects()
function Console:Cmd_PCEXPLODEOBJECTS()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	for i, v in GObjects.Elements do
		if v._Class == "CItem" and v.Destroy and v.DestroyPack and v.OnDamage and not (v.Destroy._Timer or v.Immortal or v.NotCountable) then
			v:OnDamage(9999999, v, AttackTypes.Demon)
		end
	end
end
--=======================================================================
-- PCFinishLevel()
function Console:Cmd_PCFINISHLEVEL()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	GObjects:Add(TempObjName(), CloneTemplate("EndLevel.CProcess"))
end
--=======================================================================
-- PCFluorescentHallucinogen()
function Console:Cmd_PCFLUORESCENTHALLUCINOGEN()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Console:Cmd_PCDEMONGUN()
	Console:Cmd_PCDOUBLEJUMPFACTOR()
	Console:Cmd_PCDOUBLESPEEDFACTOR()
	Game.Cheat_AlwaysGib = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGibOn)
	end
	GOD = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGodOn)
	end
	Game.Cheat_KeepBodies = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKKeepBodiesOn)
	end
	if not Cheats.PlatformXBox then
		Game.Cheat_KeepDecals = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepDecalsOff)
		end
	end
	Console:Cmd_PCMEGAAMMO()
	Console:Cmd_PCMEGAARMOR()
	Console:Cmd_PCMEGADAMAGEFACTOR()
	Console:Cmd_PCMEGADEMONFACTOR()
	Console:Cmd_PCMEGAHEALTH()
	Console:Cmd_PCMEGARELOADSPEEDFACTOR()
	Game.NoAmmoLoss = true
	Game.GoldenCardsUseUnlimited = true
	Console:Cmd_PCUNLOCKWEAPONS()
	Game.Cheat_WeakEnemies = true
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKWeakOn)
	end
end
--=======================================================================
-- PCFlyMode() <toggle>
function Console:Cmd_PCFLYMODE()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game:SwitchPlayerToPhysics()
	Editor.Enabled = true
end
--=======================================================================
-- PCFreezeEnemies([time])
function Console:Cmd_PCFREEZEENEMIES(time)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if time == nil then
		time = 9999999
	end
	time = tonumber(time)
	if time and time > 0 then
		for i, v in Actors do
			if not (v._died or v._frozen or v.disableFreeze) then
				local frozenTime = Templates["Shotgun.CWeapon"]:GetSubClass()
				AddObject(Templates["FrozenObject.CProcess"]:New(v, time, frozenTime.FrozenFadeInTime, frozenTime.FrozenFadeOutTime), nil, nil, nil, true)
				if v.CustomOnFreeze then
					v:CustomOnFreeze()
					return
				end
			end
		end
	end
end
--=======================================================================
-- PCGibBodies() <toggle>
function Console:Cmd_PCGIBBODIES()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.Cheat_AlwaysGib then
		Game.Cheat_AlwaysGib = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKGibOff)
		end
	else
		Game.Cheat_AlwaysGib = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKGibOn)
		end
	end
end
--=======================================================================
-- PCGod() <toggle>
function Console:Cmd_PCGOD()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if GOD then
		GOD = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKGodOff)
		end
	else
		GOD = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKGodOn)
		end
	end
end
--=======================================================================
-- PCKeepBodies() <toggle>
function Console:Cmd_PCKEEPBODIES()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.Cheat_KeepBodies then
		Game.Cheat_KeepBodies = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepBodiesOff)
		end
	else
		Game.Cheat_KeepBodies = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepBodiesOn)
		end
	end
end
--=======================================================================
-- PCKeepDecals() <toggle>
function Console:Cmd_PCKEEPDECALS()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.Cheat_KeepDecals then
		Game.Cheat_KeepDecals = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepDecalsOff)
		end
	else
		Game.Cheat_KeepDecals = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKKeepDecalsOn)
		end
	end
	R3D.KeepDecals(Game.Cheat_KeepDecals)
end
--=======================================================================
-- PCLockCards()
function Console:Cmd_PCLOCKCARDS()
	for i = 1, table.getn(Game.CardsAvailable) do
		Game.CardsAvailable[i] = false
	end
	PMENU.SwitchToMap()
	PMENU.SwitchToBoard()
end
--=======================================================================
-- PCLockLevels()
function Console:Cmd_PCLOCKLEVELS()
	for i = 1, table.getn(Levels) do
		for j = 1, table.getn(Levels[i]) do
			Game:MakeEmptyLevelStats(Levels[i][j][1])
			Game.LevelsStats[Levels[i][j][1]].Finished = false
		end
	end
	PMENU.SwitchToMenu()
	PMENU.SwitchToMap()
end
--=======================================================================
-- PCLockTrauma()
function Console:Cmd_PCLOCKTRAUMA()
	PMENU.DisableItem("Trauma")
	PMENU.SetItemDesc("Trauma", TXT.MenuDesc.Trauma)
end
--=======================================================================
-- PCLockWeapons()
function Console:Cmd_PCLOCKWEAPONS()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	for i = 2, table.getn(Player.EnabledWeapons) do
		Player.EnabledWeapons[i] = nil
	end
end
--=======================================================================
-- PCMediumArmor()
function Console:Cmd_PCMEDIUMARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local armorType = Templates["ArmorMedium.CItem"]
	Player.Armor = armorType.ArmorAdd
	Player.ArmorType = armorType.ArmorType
	Player.ArmorRescueFactor = armorType.RescueFactor
end
--=======================================================================
-- PCMegaAmmo()
function Console:Cmd_PCMEGAAMMO()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		for i, v in pairs(Player.Ammo) do
			Player.Ammo[i] = 9999999
		end
	else
		for i, v in Player.Ammo do
			Player.Ammo[i] = 9999999
		end
	end
end
--=======================================================================
-- PCMegaArmor()
function Console:Cmd_PCMEGAARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.Armor = 9999999
	local armorType = Templates["ArmorStrong.CItem"]
	Player.ArmorType = armorType.ArmorType
	Player.ArmorRescueFactor = armorType.RescueFactor
end
--=======================================================================
-- PCMegaDamageFactor()
function Console:Cmd_PCMEGADAMAGEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.DamageFactor = 9999999
end
--=======================================================================
-- PCMegaDemonFactor()
function Console:Cmd_PCMEGADEMONFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Demon_HowManyCorpses = 9999999
	Game.Demon_Counter = Game.Demon_HowManyCorpses
end
--=======================================================================
-- PCMegaHealth()
function Console:Cmd_PCMEGAHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.Health = 9999999
end
--=======================================================================
-- PCMegaPlayerMoney()
function Console:Cmd_PCMEGAPLAYERMONEY()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.PlayerMoney = 999999
	MBOARD.SetCashCheat(999999)
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKGold)
	end
	PMENU.SwitchToMap()
	PMENU.SwitchToBoard()
end
--=======================================================================
-- PCMegaReloadSpeedFactor()
function Console:Cmd_PCMEGARELOADSPEEDFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.ReloadSpeedFactor = 1 / 9999999
end
--=======================================================================
-- PCMegaSoulDistanceFactor()
function Console:Cmd_PCMEGASOULDISTANCEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulCatchDistance = 9999999
end
--=======================================================================
-- PCMegaSoulTimeFactor()
function Console:Cmd_PCMEGASOULTIMEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulStayFactor = 9999999
end
--=======================================================================
-- PCNormalAmmoFactor()
function Console:Cmd_PCNORMALAMMOFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.AmmoFoundFactor = 1
end
--=======================================================================
-- PCNormalDamageFactor()
function Console:Cmd_PCNORMALDAMAGEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.DamageFactor = 1
end
--=======================================================================
-- PCNormalDemonFactor()
function Console:Cmd_PCNORMALDEMONFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.Demon_HowManyCorpses = 66
	Game.Demon_Counter = Game.Demon_HowManyCorpses
end
--=======================================================================
-- PCNormalHealth()
function Console:Cmd_PCNORMALHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.Health = 100
end
--=======================================================================
-- PCNormalHealthFactor()
function Console:Cmd_PCNORMALHEALTHFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.HealthCapacity = 100
end
--=======================================================================
-- PCNormalJumpFactor()
function Console:Cmd_PCNORMALJUMPFACTOR()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local speed, jump = GetPlayerSpeed()
	SetPlayerSpeed(speed, 1)
end
--=======================================================================
-- PCNormalReloadSpeedFactor()
function Console:Cmd_PCNORMALRELOADSPEEDFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.ReloadSpeedFactor = 1
end
--=======================================================================
-- PCNormalSoulDistanceFactor()
function Console:Cmd_PCNORMALSOULDISTANCEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulCatchDistance = 1
end
--=======================================================================
-- PCNormalSoulFactor()
function Console:Cmd_PCNORMALSOULFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulHealthFactor = 1
end
--=======================================================================
-- PCNormalSoulTimeFactor()
function Console:Cmd_PCNORMALSOULTIMEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulStayFactor = 1
end
--=======================================================================
-- PCNormalSpeedFactor()
function Console:Cmd_PCNORMALSPEEDFACTOR()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local speed, jump = GetPlayerSpeed()
	SetPlayerSpeed(Player.PlayerSpeed, jump)
end
--=======================================================================
-- PCNormalTreasureFactor()
function Console:Cmd_PCNORMALTREASUREFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.TreasureFoundFactor = 1
end
--=======================================================================
-- PCOpenSlabs()
function Console:Cmd_PCOPENSLABS()
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	CAction:Action_OpenAllSlabsOnly()
end
--=======================================================================
-- PCRebirth()
function Console:Cmd_PCREBIRTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.PlayerRegenerateWhenDying = true
end
--=======================================================================
-- PCRegenerateAmmo()
function Console:Cmd_PCREGENERATEAMMO()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Player.Ammo = Utils:Clone(Classes.CPlayer.s_SubClass.MaxAmmo)
	else
		Player.Ammo = Clone(CPlayer.s_SubClass.MaxAmmo)
	end
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKAmmo)
	end
end
--=======================================================================
-- PCRegenerateArmor() <toggle>
function Console:Cmd_PCREGENERATEARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.ArmorRegen then
		Game.ArmorRegen = false
	else
		Game.ArmorRegen = true
	end
end
--=======================================================================
-- PCRegenerateHealth() <toggle>
function Console:Cmd_PCREGENERATEHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.HealthRegen then
		Game.HealthRegen = false
	else
		Game.HealthRegen = true
	end
end
--=======================================================================
-- PCResetAmmo()
function Console:Cmd_PCRESETAMMO()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		for i, v in pairs(Player.Ammo) do
			Player.Ammo[i] = 0
		end
	else
		for i, v in Player.Ammo do
			Player.Ammo[i] = 0
		end
	end
end
--=======================================================================
-- PCResetAmmoFactor()
function Console:Cmd_PCRESETAMMOFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.AmmoFoundFactor = 0
end
--=======================================================================
-- PCResetAmmoScore()
function Console:Cmd_PCRESETAMMOSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.AmmoFound = 0
		Game.Statistics.AmmoFound = 0
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Ammo = 0
		end
	else
		Game.PlayerAmmoFound = 0
	end
end
--=======================================================================
-- PCResetArmor()
function Console:Cmd_PCRESETARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.Armor = 0
	Player.ArmorType = 0
	Player.ArmorRescueFactor = 0
end
--=======================================================================
-- PCResetArmorsScore()
function Console:Cmd_PCRESETARMORSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.ArmorFound = 0
		Game.Statistics.ArmorFound = 0
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Armor = 0
		end
	else
		Player.ArmorFound = 0
	end
end
--=======================================================================
-- PCResetDamageFactor()
function Console:Cmd_PCRESETDAMAGEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.DamageFactor = 0
end
--=======================================================================
-- PCResetGamePlayTimeScore()
function Console:Cmd_PCRESETGAMEPLAYTIMESCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.LevelTime = 0
end
--=======================================================================
-- PCResetGoldBonusScore()
function Console:Cmd_PCRESETGOLDBONUSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Game.PlayerMoneyFound = Game.PlayerMoneyFound - Player.BonusItems
	Player.BonusItems = 0
end
--=======================================================================
-- PCResetGoldScore()
function Console:Cmd_PCRESETGOLDSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Game.PlayerMoneyFound = Player.BonusItems
end
--=======================================================================
-- PCResetHealth()
function Console:Cmd_PCRESETHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.Health = 0
end
--=======================================================================
-- PCResetHealthFactor()
function Console:Cmd_PCRESETHEALTHFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.HealthCapacity = 0
end
--=======================================================================
-- PCResetHolyItemsScore()
function Console:Cmd_PCRESETHOLYITEMSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.HolyItemsFound = 0
		Game.Statistics.HolyItemsFound = 0
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].HolyItems = 0
		end
	else
		Player.HolyItems = 0
	end
end
--=======================================================================
-- PCResetMonstersScore()
function Console:Cmd_PCRESETMONSTERSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.BodyCountTotal = 0
end
--=======================================================================
-- PCResetObjectsScore()
function Console:Cmd_PCRESETOBJECTSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.DestroyedItems = 0
		Game.Statistics.DestroyedItems = 0
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Destroyed = 0
		end
	else
		Game.PlayerDestroyedItems = 0
	end
end
--=======================================================================
-- PCResetPlayerMoney()
function Console:Cmd_PCRESETPLAYERMONEY()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.PlayerMoney = 0
	MBOARD.SetCashCheat(0)
	PMENU.SwitchToMap()
	PMENU.SwitchToBoard()
end
--=======================================================================
-- PCResetScore()
function Console:Cmd_PCRESETSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Console:Cmd_PCRESETAMMOSCORE()
	Console:Cmd_PCRESETARMORSSCORE()
	Console:Cmd_PCRESETGOLDBONUSSCORE()
	Console:Cmd_PCRESETGOLDSCORE()
	Console:Cmd_PCRESETHOLYITEMSSCORE()
	Console:Cmd_PCRESETMONSTERSSCORE()
	Console:Cmd_PCRESETOBJECTSSCORE()
	Console:Cmd_PCRESETSECRETSSCORE()
	Console:Cmd_PCRESETSOULSSCORE()
end
--=======================================================================
-- PCResetSecretsScore()
function Console:Cmd_PCRESETSECRETSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.SecretsFound = 0
		Game.Statistics.SecretsFound = 0
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Secrets = 0
		end
	else
		Player.SecretsFound = 0
	end
end
--=======================================================================
-- PCResetSoulDistanceFactor()
function Console:Cmd_PCRESETSOULDISTANCEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulCatchDistance = 0
end
--=======================================================================
-- PCResetSoulFactor()
function Console:Cmd_PCRESETSOULFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulHealthFactor = 0
end
--=======================================================================
-- PCResetSoulTimeFactor()
function Console:Cmd_PCRESETSOULTIMEFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.SoulStayFactor = 0
end
--=======================================================================
-- PCResetSoulsScore()
function Console:Cmd_PCRESETSOULSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.TotalSoulsCount = 0
end
--=======================================================================
-- PCResetTreasureFactor()
function Console:Cmd_PCRESETTREASUREFACTOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.TreasureFoundFactor = 0
end
--=======================================================================
-- PCRestoreArmor()
function Console:Cmd_PCRESTOREARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local armorType = Player.ArmorType
	local temp = nil
	if armorType == ArmorTypes.Weak then
		temp = Templates["ArmorWeak.CItem"]
	end
	if armorType == ArmorTypes.Medium then
		temp = Templates["ArmorMedium.CItem"]
	end
	if armorType == ArmorTypes.Strong then
		temp = Templates["ArmorStrong.CItem"]
	end
	if temp then
		Player.Armor = temp.ArmorAdd
	end
end
--=======================================================================
-- PCRestoreHealth()
function Console:Cmd_PCRESTOREHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Player.Health < Game.HealthCapacity then
		Player.Health = Game.HealthCapacity
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKHealth)
		end
	end
end
--=======================================================================
-- PCSlowDownTime([amount], [time]) <toggle>
function Console:Cmd_PCSLOWDOWNTIME(amount, time)
	if Cheats.PlatformXBox then
		return
	end
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.IsDemon then
		return
	end
	if amount == nil or amount == "nil" then
		amount = 8
	end
	if time == nil then
		time = 9999999
	end
	amount = tonumber(amount)
	time = tonumber(time)
	if amount and amount > 0 and time and time > 0 then
		if Game.BulletTime then
			GObjects:ToKill(Game._BTimeProc)
			Game._BTimeProc = nil
			Game.BulletTime = false
			if Cheats.ConsoleMessages then
				CONSOLE.AddMessage(TXT.Cheats.PKHasteOff)
			end
		else
			local bulletTime = Tweak.BulletTime
			Game._BTimeProc = AddObject(Templates["PBulletTimeControler.CProcess"]:New(1 / amount, bulletTime.FadeInTime, time, bulletTime.FadeOutTime), nil, nil, nil, true)
			Game.BulletTime = true
			if Cheats.ConsoleMessages then
				CONSOLE.AddMessage(TXT.Cheats.PKHasteOn)
			end
		end
	end
end
--=======================================================================
-- PCStealHealth() <toggle>
function Console:Cmd_PCSTEALHEALTH()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.StealHealth then
		Game.StealHealth = false
	else
		Game.StealHealth = true
	end
end
--=======================================================================
-- PCStrongArmor()
function Console:Cmd_PCSTRONGARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local armorType = Templates["ArmorStrong.CItem"]
	Player.Armor = armorType.ArmorAdd
	Player.ArmorType = armorType.ArmorType
	Player.ArmorRescueFactor = armorType.RescueFactor
end
--=======================================================================
-- PCTotalAmmoScore()
function Console:Cmd_PCTOTALAMMOSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.AmmoFound = Game.SubLevelStats.TotalAmmo
		Game.Statistics.AmmoFound = Game.TotalAmmo
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Ammo = 1
		end
	else
		Game.PlayerAmmoFound = Game.TotalAmmo
	end
end
--=======================================================================
-- PCTotalArmorsScore()
function Console:Cmd_PCTOTALARMORSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.ArmorFound = Game.SubLevelStats.TotalArmors
		Game.Statistics.ArmorFound = Game.TotalAmmor
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Armor = 1
		end
	else
		Player.ArmorFound = Game.TotalArmor
	end
end
--=======================================================================
-- PCTotalGoldScore()
function Console:Cmd_PCTOTALGOLDSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Game.PlayerMoneyFound = Game.TotalMoney + Player.BonusItems
end
--=======================================================================
-- PCTotalHolyItemsScore()
function Console:Cmd_PCTOTALHOLYITEMSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.HolyItemsFound = Game.SubLevelStats.TotalHolyItems
		Game.Statistics.HolyItemsFound = Game.TotalHolyItems
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].HolyItems = 1
		end
	else
		Player.HolyItems = Game.TotalHolyItems
	end
end
--=======================================================================
-- PCTotalMonstersScore()
function Console:Cmd_PCTOTALMONSTERSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Game.BodyCountTotal = Game.TotalActors
end
--=======================================================================
-- PCTotalObjectsScore()
function Console:Cmd_PCTOTALOBJECTSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.DestroyedItems = Game.SubLevelStats.TotalDestroyed
		Game.Statistics.DestroyedItems = Game.TotalDestroyed
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Destroyed = 1
		end
	else
		Game.PlayerDestroyedItems = Game.TotalDestroyed
	end
end
--=======================================================================
-- PCTotalScore()
function Console:Cmd_PCTOTALSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	Console:Cmd_PCTOTALAMMOSCORE()
	Console:Cmd_PCTOTALARMORSSCORE()
	Console:Cmd_PCTOTALGOLDSCORE()
	Console:Cmd_PCTOTALHOLYITEMSSCORE()
	Console:Cmd_PCTOTALMONSTERSSCORE()
	Console:Cmd_PCTOTALOBJECTSSCORE()
	Console:Cmd_PCTOTALSECRETSSCORE()
	Console:Cmd_PCTOTALSOULSSCORE()
end
--=======================================================================
-- PCTotalSecretsScore()
function Console:Cmd_PCTOTALSECRETSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Game.SubLevelStats.SecretsFound = Game.SubLevelStats.TotalSecrets
		Game.Statistics.SecretsFound = Game.TotalSecrets
		for i = 1, Levels_GetSubLevelsCount(Level._Name) do
			if not Game.SilverStars[i] then
				Game.SilverStars[i] = {}
			end
			Game.SilverStars[i].Secrets = 1
		end
	else
		Player.SecretsFound = Game.TotalSecrets
	end
end
--=======================================================================
-- PCTotalSoulsScore()
function Console:Cmd_PCTOTALSOULSSCORE()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	Player.TotalSoulsCount = Game.TotalSouls
end
--=======================================================================
-- PCUnlimitedAmmo() <toggle>
function Console:Cmd_PCUNLIMITEDAMMO()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.NoAmmoLoss then
		Game.NoAmmoLoss = false
	else
		Game.NoAmmoLoss = true
	end
end
--=======================================================================
-- PCUnlimitedCards() <toggle>
function Console:Cmd_PCUNLIMITEDCARDS()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.GoldenCardsUseUnlimited then
		Game.GoldenCardsUseUnlimited = false
	else
		Game.GoldenCardsUseUnlimited = true
	end
end
--=======================================================================
-- PCUnlockCards()
function Console:Cmd_PCUNLOCKCARDS()
	for i = 1, table.getn(Game.CardsAvailable) do
		Game.CardsAvailable[i] = true
	end
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKAllCards)
	end
	PMENU.SwitchToMap()
	PMENU.SwitchToBoard()
end
--=======================================================================
-- PCUnlockLevels()
function Console:Cmd_PCUNLOCKLEVELS()
	for i = 1, table.getn(Levels) do
		for j = 1, table.getn(Levels[i]) do
			if Cheats.PlatformXBox then
				Game:MakeEmptyLevelStats(string.sub(Levels[i][j][1], 1, 6))
				Game.LevelsStats[string.sub(Levels[i][j][1], 1, 6)].Finished = true
			else
				Game:MakeEmptyLevelStats(Levels[i][j][1])
				Game.LevelsStats[Levels[i][j][1]].Finished = true
			end
		end
	end
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKAllLevels)
	end
	PMENU.SwitchToMenu()
	PMENU.SwitchToMap()
end
--=======================================================================
-- PCUnlockTrauma()
function Console:Cmd_PCUNLOCKTRAUMA()
	PMENU.EnableItem("Trauma")
	PMENU.SetItemDesc("Trauma", TXT.MenuDesc.Trauma)
end
--=======================================================================
-- PCUnlockWeapons()
function Console:Cmd_PCUNLOCKWEAPONS()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Cheats.PlatformXBox then
		Player.EnabledWeapons = Utils:Clone(Classes.CPlayerMP.EnabledWeapons)
	else
		Player.EnabledWeapons = Clone(CPlayer.EnabledWeapons)
	end
	if Cheats.ConsoleMessages then
		CONSOLE.AddMessage(TXT.Cheats.PKWeapons)
	end
end
--=======================================================================
-- PCWeakArmor()
function Console:Cmd_PCWEAKARMOR()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	local armorType = Templates["ArmorWeak.CItem"]
	Player.Armor = armorType.ArmorAdd
	Player.ArmorType = armorType.ArmorType
	Player.ArmorRescueFactor = armorType.RescueFactor
end
--=======================================================================
-- PCWeakEnemies() <toggle>
function Console:Cmd_PCWEAKENEMIES()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if Game.Cheat_WeakEnemies then
		Game.Cheat_WeakEnemies = false
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKWeakOff)
		end
	else
		Game.Cheat_WeakEnemies = true
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKWeakOn)
		end
	end
end
--=======================================================================
-- PCWeaponModifier() <toggle>
function Console:Cmd_PCWEAPONMODIFIER()
	if Game.GMode ~= GModes.SingleGame then
		return
	end
	if not Game.LevelStarted then
		return
	end
	if Player.HasWeaponModifier then
		Player.HasWeaponModifier = false
		Player._WeaponModifierCounter = 0
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKWeapModOff)
		end
	else
		Player.HasWeaponModifier = true
		Player._WeaponModifierCounter = 9999999
		if Cheats.ConsoleMessages then
			CONSOLE.AddMessage(TXT.Cheats.PKWeapModOn)
		end
	end
end
--=======================================================================
function Game:Cheats()

	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonY) == 1 then
		Console:Cmd_PCCHEATS()
	end
	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonB) == 1 then
		Console:Cmd_PCFLUORESCENTHALLUCINOGEN()
	end
	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonA) == 1 then
		Console:Cmd_PCUNLOCKLEVELS()
	end
	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonX) == 1 then
		Console:Cmd_PCUNLOCKCARDS()
	end

	if INP.GetKeyStatus(Keys.XButtonY) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCDISABLECHEATS()
	end
	if INP.GetKeyStatus(Keys.XButtonB) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCDISABLEFLUORESCENTHALLUCINOGEN()
	end
	if INP.GetKeyStatus(Keys.XButtonA) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCLOCKLEVELS()
	end
	if INP.GetKeyStatus(Keys.XButtonX) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCLOCKCARDS()
	end

	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonDPadUp) == 1 then
		Console:Cmd_PCMEGAPLAYERMONEY()
	end
	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonDPadRight) == 1 then
		Console:Cmd_PCMEGAAMMO()
	end
	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonDPadDown) == 1 then
		Console:Cmd_PCMEGAARMOR()
	end
	if INP.GetKeyStatus(Keys.XButtonWhite) == 2 and INP.GetKeyStatus(Keys.XButtonDPadLeft) == 1 then
		Console:Cmd_PCMEGADAMAGEFACTOR()
	end

	if INP.GetKeyStatus(Keys.XButtonDPadUp) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCRESETPLAYERMONEY()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadRight) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCRESETAMMO()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadDown) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCRESETARMOR()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadLeft) == 2 and INP.GetKeyStatus(Keys.XButtonWhite) == 1 then
		Console:Cmd_PCNORMALDAMAGEFACTOR()
	end

	if INP.GetKeyStatus(Keys.XButtonDPadUp) == 2 and INP.GetKeyStatus(Keys.XButtonY) == 1 then
		Console:Cmd_PCMEGADEMONFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadUp) == 2 and INP.GetKeyStatus(Keys.XButtonB) == 1 then
		Console:Cmd_PCMEGAHEALTH()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadUp) == 2 and INP.GetKeyStatus(Keys.XButtonA) == 1 then
		Console:Cmd_PCMEGARELOADSPEEDFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadUp) == 2 and INP.GetKeyStatus(Keys.XButtonX) == 1 then
		Console:Cmd_PCMEGASOULDISTANCEFACTOR()
	end

	if INP.GetKeyStatus(Keys.XButtonY) == 2 and INP.GetKeyStatus(Keys.XButtonDPadUp) == 1 then
		Console:Cmd_PCNORMALDEMONFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonB) == 2 and INP.GetKeyStatus(Keys.XButtonDPadUp) == 1 then
		Console:Cmd_PCNORMALHEALTH()
	end
	if INP.GetKeyStatus(Keys.XButtonA) == 2 and INP.GetKeyStatus(Keys.XButtonDPadUp) == 1 then
		Console:Cmd_PCNORMALRELOADSPEEDFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonX) == 2 and INP.GetKeyStatus(Keys.XButtonDPadUp) == 1 then
		Console:Cmd_PCRESETSOULDISTANCEFACTOR()
	end

	if INP.GetKeyStatus(Keys.XButtonDPadRight) == 2 and INP.GetKeyStatus(Keys.XButtonY) == 1 then
		Console:Cmd_PCMEGASOULTIMEFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadRight) == 2 and INP.GetKeyStatus(Keys.XButtonB) == 1 then
		Console:Cmd_PCTOTALSCORE()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadRight) == 2 and INP.GetKeyStatus(Keys.XButtonA) == 1 then
		Console:Cmd_PCUNLOCKWEAPONS()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadRight) == 2 and INP.GetKeyStatus(Keys.XButtonX) == 1 then
		Console:Cmd_PCCONFUSEENEMIES()
	end

	if INP.GetKeyStatus(Keys.XButtonY) == 2 and INP.GetKeyStatus(Keys.XButtonDPadRight) == 1 then
		Console:Cmd_PCNORMALSOULTIMEFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonB) == 2 and INP.GetKeyStatus(Keys.XButtonDPadRight) == 1 then
		Console:Cmd_PCRESETSCORE()
	end
	if INP.GetKeyStatus(Keys.XButtonA) == 2 and INP.GetKeyStatus(Keys.XButtonDPadRight) == 1 then
		Console:Cmd_PCLOCKWEAPONS()
	end
	if INP.GetKeyStatus(Keys.XButtonX) == 2 and INP.GetKeyStatus(Keys.XButtonDPadRight) == 1 then
		Console:Cmd_PCWEAPONMODIFIER()
	end

	if INP.GetKeyStatus(Keys.XButtonDPadDown) == 2 and INP.GetKeyStatus(Keys.XButtonY) == 1 then
		Console:Cmd_PCCONSOLEMESSAGES()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadDown) == 2 and INP.GetKeyStatus(Keys.XButtonB) == 1 then
		Console:Cmd_PCDEMON()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadDown) == 2 and INP.GetKeyStatus(Keys.XButtonA) == 1 then
		Console:Cmd_PCGIBBODIES()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadDown) == 2 and INP.GetKeyStatus(Keys.XButtonX) == 1 then
		Console:Cmd_PCGOD()
	end

	if INP.GetKeyStatus(Keys.XButtonY) == 2 and INP.GetKeyStatus(Keys.XButtonDPadDown) == 1 then
		Console:Cmd_PCRESETGAMEPLAYTIMESCORE()
	end
	if INP.GetKeyStatus(Keys.XButtonB) == 2 and INP.GetKeyStatus(Keys.XButtonDPadDown) == 1 then
		Console:Cmd_PCDOUBLEDEMONFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonA) == 2 and INP.GetKeyStatus(Keys.XButtonDPadDown) == 1 then
		Console:Cmd_PCDOUBLERELOADSPEEDFACTOR()
	end
	if INP.GetKeyStatus(Keys.XButtonX) == 2 and INP.GetKeyStatus(Keys.XButtonDPadDown) == 1 then
		Console:Cmd_PCDOUBLESOULTIMEFACTOR()
	end

	if INP.GetKeyStatus(Keys.XButtonDPadLeft) == 2 and INP.GetKeyStatus(Keys.XButtonY) == 1 then
		Console:Cmd_PCKEEPBODIES()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadLeft) == 2 and INP.GetKeyStatus(Keys.XButtonB) == 1 then
		Console:Cmd_PCUNLIMITEDAMMO()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadLeft) == 2 and INP.GetKeyStatus(Keys.XButtonA) == 1 then
		Console:Cmd_PCUNLIMITEDCARDS()
	end
	if INP.GetKeyStatus(Keys.XButtonDPadLeft) == 2 and INP.GetKeyStatus(Keys.XButtonX) == 1 then
		Console:Cmd_PCWEAKENEMIES()
	end

	if INP.GetKeyStatus(Keys.XButtonY) == 2 and INP.GetKeyStatus(Keys.XButtonDPadLeft) == 1 then
		Console:Cmd_PCDIFFICULTYDAYDREAM()
	end
	if INP.GetKeyStatus(Keys.XButtonB) == 2 and INP.GetKeyStatus(Keys.XButtonDPadLeft) == 1 then
		Console:Cmd_PCDIFFICULTYINSOMNIA()
	end
	if INP.GetKeyStatus(Keys.XButtonA) == 2 and INP.GetKeyStatus(Keys.XButtonDPadLeft) == 1 then
		Console:Cmd_PCDIFFICULTYNIGHTMARE()
	end
	if INP.GetKeyStatus(Keys.XButtonX) == 2 and INP.GetKeyStatus(Keys.XButtonDPadLeft) == 1 then
		Console:Cmd_PCDIFFICULTYTRAUMA()
	end

end