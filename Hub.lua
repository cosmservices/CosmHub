-- DOCUMENTATION
--[[
NOTIFICATION SYSTEM

*Command Usage*
SendNotify(title, content, duration, image)

*Options*
For title u can type *def* or your own text! The default option aka "def" just makes the title: Notification.
The default duration is 6.5 seconds. If u say "def" at the duration it will just hold it as 6.5.
For the image u can type *def* or your own image link!

*Required*
Content is required since it basically why you are sending a notification. There are no options and u are required to run content or else it doesn't let you.

--]]

-- LOADER
local ArrayField = require(game.ReplicatedStorage.CosmHub.Interface)
local User = game.Players.LocalPlayer
local UserNick = User.DisplayName
local Username = User.Name
local CurrentGame = nil
local notify = "notify"
local bootup = "bootup"

-- FUNCTIONS
function SendNotify(Title, Content, Duration, Image)
	local title = nil
	local content = nil
	local duration = nil
	local image = nil

	if title == "def" then
		title = "Notification"
	else
		title = Title
	end

	if Content == "" then
		warn("[CosmHub v1] A error has occured at SendNotify! ERROR: You cannot sent a notification if the *content* is blank.")
	else
		content = Content
	end

	if Duration == "def" then
		duration = 6.5
	else
		duration = Duration
	end

	if Image == "def" then
		image = "4483362458"
	else
		image = Image
	end
	
	ArrayField.PlaySound(notify)
	ArrayField:Notify({
		Title = title,
		Content = content,
		Duration = duration,
		Image = image,
		Actions = { -- Notification Buttons
			Ignore = {
				Name = "Understood",
				Callback = function()
					print("[CosmHub v1 Debug] Successfully ran the *Understood* button in the notification: "..title)
				end
			},
		},
	})
end

local function LoadDex()
	SendNotify("DexExplorer v3", "We're currently launching Dex! Please wait until it is complety inserted!")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua", true))()
end

local function GameSearch(option)
	-- Check if the option is an empty string
	if option == "" then
		SendNotify("GameSearch", "No option or data was selected for searching game type! CODE: 404", "def", "def")
		return "OptError"

		-- Check if the option is "checksupport"
	elseif option == "checksupport" then
		local GameID = game.GameId
		SendNotify("GameSearch", "Please, wait! We are checking if this game is supported.", "def", "def")
		SendNotify("GameSearch", "Connected to ID: " .. GameID, "def", "def")

		-- Check if the game is supported
		if GameID == 6216155424 then
			SendNotify(game.Name .. " Supported", "This game is supported. Please select the option in games to open the Hub for this game!", "def", "def")
			CurrentGame = game.Name
			return game.Name

			-- Handle a specific error case
		elseif GameID == 0 then
			SendNotify("GameSearch", "An unexpected error happened? Got no response!", "def", "def")
			return "Error"
		else
			-- Handle case when GameID is neither 18336517671 nor 0
			SendNotify("GameSearch", "This game is not supported.", "def", "def")
			return "NotSupported"
		end
	else
		-- Handle unexpected option cases
		SendNotify("GameSearch", "Unknown option provided: " .. option, "def", "def")
		return "UnknownOption"
	end
end

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
		Key = {"ProtectedByGuardsman"},
		AutomaticKeyBypass = "ylo2403"
	}
})

-- TABS
local Info = Window:CreateTab("Information", 4483362458)
local Games = Window:CreateTab("Launcher", 4483362458)
local DevTools = Window:CreateTab("DevTools", 4483362458)
local Premium = Window:CreateTab("CosmPremium", 4483362458)

-- INFO TAB
local About = Info:CreateParagraph({Title = "CosmHub", Content = "A development-tool! Mod, Debug and test! All in one hub. Just go check out the tabs and u will see! Check down below for the credits."})
local CreditCos = Info:CreateParagraph({Title = "CosmoSystems", Content = "Head Developer"})

-- GAMES TAB
local WelcomeText = UserNick.." (@"..Username..")"

local WelcomeMsg = Games:CreateParagraph({Title = "Welcome, back!", Content = WelcomeText})
local Paragraph = Games:CreateParagraph({Title = "Launcher", Content = "Welcome, to the launcher! Here you will see supported games that CosmHub supports."})

local SysTestPlaceHub = Games:CreateButton({
	Name = "SysTestPlace's Hub",
	Interact = "Launch SysTestPlace's hub",
	Callback = function()
		ArrayField:Destroy()
	end,
})

-- DetectGameBtn:Lock("Successfully searched for the games.")

local DetectGameBtn = Games:CreateAutoLockButton({
	Name = "Game Detection",
	Interact = "",
	Callback = function()
		GameSearch("checksupport")
		task.wait(0.2)
		if CurrentGame == "SysTestPlace" then
			SysTestPlaceHub:Visible(true)
			ArrayField.NotePromptHub("Game Detection", "We have detected you are inside a supported game! You now have access to this hub.")
			ArrayField.PlaySound(notify)
		end
	end,
})

SysTestPlaceHub:Visible(false)

-- DEV TOOLS TAB
local ExperimentalWrn = DevTools:CreateParagraph({Title = "[WRN] Experimental", Content = "This system is currently experimental and is not stable! Proceed at your own risk."})
local ToolsSection = DevTools:CreateSection("Tools", false)

local Button = DevTools:CreateButton({
	Name = "Dex v3 [B]",
	Interact = 'Launch Dex',
	SectionParent = ToolsSection,
	Callback = function()
		LoadDex()
	end,
})

-- FUN TAB
local PremiumParagraph = Premium:CreateParagraph({Title = "CosmPremium", Content = "Get early access to features, get special perms! And much more. Only for 650 R$."})
