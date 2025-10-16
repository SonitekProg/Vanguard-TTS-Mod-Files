function onLoad()
	MasterURL = "https://raw.githubusercontent.com/SonitekProg/Vanguard-TTS-Mod-Files/refs/heads/main/VTTSMasterFile.json"
	CustomDecksURL = "https://raw.githubusercontent.com/SonitekProg/Vanguard-TTS-Mod-Files/refs/heads/main/CustomDecks.json"
	MasterFile = {}
	CustomDecks = {}
	CurrentLoadList = {}
	Wait.time(LoadJSON, 0.1)
end

function LoadJSON()
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
									end)
	broadcastToAll("Mod fully loaded, and can now be used properly.")
	return 1
end

function LoadNext()
	
end