function onLoad()
	MasterURL = "https://raw.githubusercontent.com/SonitekProg/Vanguard-TTS-Mod-Files/refs/heads/main/VTTSMasterFile.json"
	CustomDecksURL = ""
	MasterFile = {}
	Wait.time(LoadJSON, 0.1)
end

function LoadJSON()
	WebRequest.get(MasterURL,	function(response)
								if (response.is_error)
								then
									broadcastToAll("Core JSON File failed to load. Contact Mod creator with error code: LIBFAIL.", {1,0,0})
									broadcastToAll("Mod will not funciton properly.", {1,0,0})
									return
								end
								JSON.decode(response.text)
								
								MasterFile = result
								broadcastToAll("Mod fully loaded, and can now be used properly.")
								end)
	return 1
end