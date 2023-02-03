local status_ok, mason = pcall(require, "mason")
if not mason then
	return
end

mason.setup()
