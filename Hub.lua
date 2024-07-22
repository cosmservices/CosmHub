-- LOADER
local ArrayField = require(game.ReplicatedStorage.CosmHub.Interface)

-- KEY SYSTEM
local Window = ArrayField:CreateWindow({
	Name = "CosmHub",
	LoadingTitle = "CosmHub V1",
	LoadingSubtitle = "by CosmoSystems",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "CosmHubConfiguration"
	},
	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = true
	},
	KeySystem = true,
	KeySettings = {
		Title = "Guardsman",
		Subtitle = "CosmHub Key System",
		Note = "Please do not attempt to bypass the key system!",
		FileName = "&*JHYHU&YI76546GHJ1&^*!*&^!@#KjhdKASUY76iWHUIIAWHUDIA&S^DFÂS8976567AS7865567ASD675ASf786ASFAFS&^*SAHJID7ÂSD8^&ASD%$ASF",
		SaveKey = false,
		GrabKeyFromSite = false,
		Actions = {
			[1] = {
				Text = 'Powered by CosmServices',
				OnPress = function()
					print("Yes.")
				end,
			}
		},
		Key = {"ProtectedByGuardsman"}
	}
})

-- COSMHUB
local Info = Window:CreateTab("Information", 4483362458)
local Games = Window:CreateTab("Launcher", 4483362458)

local Paragraph = Info:CreateParagraph({Title = "CosmoSystems", Content = "Head Developer"})

local Paragraph = Games:CreateParagraph({Title = "Unable to search!", Content = "We are working on this ATM!"})