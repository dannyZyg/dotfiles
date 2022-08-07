-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	os.execute("/usr/bin/dunstify -a 'awesome' -u 'critical' " .. awesome.startup_errors)
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		os.execute("/usr/bin/dunstify -a 'awesome' -u 'critical' " .. tostring(err))
		in_error = false
	end)
end
