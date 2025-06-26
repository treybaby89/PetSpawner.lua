-- PetSpawner.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local petModelName = "BunnyPet" -- Change this to your pet model's name
local spawnLocation = Workspace:WaitForChild("PetSpawnPoint")

local function spawnPet(player)
	local petTemplate = ReplicatedStorage:FindFirstChild(petModelName)
	if petTemplate then
		local newPet = petTemplate:Clone()
		newPet:SetPrimaryPartCFrame(spawnLocation.CFrame)
		newPet.Parent = Workspace
		print("Pet spawned for", player.Name)
	else
		warn("Pet model not found in ReplicatedStorage")
	end
end

game.Players.PlayerAdded:Connect(function(player)
	task.wait(2)
	spawnPet(player)
end)
