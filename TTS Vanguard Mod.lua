function onLoad()
	MasterURL = 
end

function LoadJSON()
	WebRequest.get(MasterURL,	function(response)
								if (response.is_error
								then
									broadcastToAll("Core JSON File failed to load. Contact Mod creator with error code: LIBFAIL.", {1,0,0})
									broadcastToAll("Mod will not funciton properly.", {1,0,0})
									return
								end
								MasterFile = JSON.decode(response.text)
								broadcastToAll("Mod fully loaded, and can now be used properly.")
	return 1
end