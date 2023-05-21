local status,icons = pcall(require,"nvim-web-devicons")
if  not status then
  return
end

icons.setup({
	override = {
		txt = {
			icon = ' ',
			color = '#15D864',
			name = 'Text'
		},
		dockerfile  = {
			icon = ' ',
			color = '#29B6F6',
			name = 'Dockerfile'
		}
	},
	color_icons  = true,
	default = true
})
