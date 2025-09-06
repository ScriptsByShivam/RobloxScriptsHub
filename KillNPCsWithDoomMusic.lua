local Players = game:GetService("Players")
local Size = 15
--local lagReduce = 0.005
local setTransparency = 0.7
local setCollidable = false
local setMassless = true

local function resizeHead(model)
	if model:IsA("Model") and not Players:FindFirstChild(model.Name) then
		local head = model:FindFirstChild("Head") or model:WaitForChild("Head", 3)
		if head and head:IsA("BasePart") then
			head.Size = Vector3.new(Size, Size, Size)
			head.Transparency = setTransparency
			head.CanCollide = setCollidable
			head.Massless = setMassless
			head.Material = Enum.Material.Neon
		end
	end
end

for _, v in ipairs(workspace:GetChildren()) do
	
	resizeHead(v)
end

workspace.ChildAdded:Connect(function(child)

	resizeHead(child)
	setclipboard("Made By Shivam")

	child.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("BasePart") and descendant.Name == "Head" then
			resizeHead(child)
		end
	end)
end)
