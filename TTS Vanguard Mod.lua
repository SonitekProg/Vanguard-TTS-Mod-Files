function onLoad()
	MasterURL = "https://raw.githubusercontent.com/SonitekProg/Vanguard-TTS-Mod-Files/refs/heads/main/VTTSMasterFile.json"
	MasterFile = {}
	Wait.time(LoadJSON, 0.1)
end

function LoadJSON()
	WebRequest.get(MasterURL,	function(response)
								broadcastToAll("Initiating WebRequest.")
								if (response.is_error)
								then
									broadcastToAll("Core JSON File failed to load. Contact Mod creator with error code: LIBFAIL.", {1,0,0})
									broadcastToAll("Mod will not funciton properly.", {1,0,0})
									return
								end
								broadcastToAll("JSON File accessed properly.")
								local success, result = pcall(JSON.decode, response.text)
								
								if not success then
									broadcastToAll("JSON Decoding has failed. Error in JSON format or decoder.", {1,0,0})
									return
								end
								
								MasterFile = result
								broadcastToAll("Mod fully loaded, and can now be used properly.")
								end)
	return 1
end