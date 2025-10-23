function onLoad()
	MasterURL = "https://raw.githubusercontent.com/SonitekProg/Vanguard-TTS-Mod-Files/refs/heads/main/VTTSMasterFile.json"
	CustomDecksURL = "https://raw.githubusercontent.com/SonitekProg/Vanguard-TTS-Mod-Files/refs/heads/main/CustomDecks.json"
	MasterFile = {}
	CustomDecks = {}
	CurrentLoadList = {}
	LoadedFiles = ""
	--startLuaCoroutine(Global, "LoadJSON")
	WebRequest.get(MasterURL,	function(response)
								if (response.is_error)
								then
									broadcastToAll("Core JSON File failed to load. Contact Mod creator with error code: LIBFAILJ", {1,0,0})
									broadcastToAll("Mod will not funciton properly.", {1,0,0})
									return
								end
								MasterFile = JSON.decode(response.text)
								end)
	WebRequest.get(CustomDecksURL,	function(response)
									if (response.is_error)
									then
										broadcastToAll("Information for Custom Decks has failed to load. Contact Mod creator with error code: CUSTFAILJ", {1,0,0})
										broadcastToAll("Mod will not funciton properly.", {1,0,0})
										return
									end
									CustomDecks = JSON.decode(response.text)
									broadcastToAll("Mod fully loaded, and can now be used properly.")
									NewSearchList()
									end)
end

function LoadJSON()
	return 1
end

function NewSearchList()
	local ClanName = "Nubatama"
	local Grade = "Grade0"
	CurrentLoadList = {}
	
	--broadcastToAll("Value is: "..MasterFile.Clans["Nubatama"]["Grade0"])
	if (MasterFile.Clans[ClanName][Grade] ~= nil)
	then
		CurrentLoadList[ClanName] = {}
		CurrentLoadList[ClanName][Grade] = MasterFile.Clans[ClanName][Grade]
		broadcastToAll("Stored Value is: "..CurrentLoadList[ClanName][Grade])
	end
end

function LoadNext()
	
end