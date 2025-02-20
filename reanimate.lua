-- free and open source
-- don't steal pls
-- i know someone is going to eventually but pls man
local VER = '1.22' -- leanreanimate > any reanimate for jab
game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync("-gh 62724852,48474294,63690008,451220849,48474313,62234425")
local p = game:GetService('Players').LocalPlayer
local c = p.Character
c.Archivable = true
local kat = c:WaitForChild('Kate Hair').Handle
local lav = c:WaitForChild('LavanderHair').Handle
local pal = c:WaitForChild('Pal Hair').Handle
local pin = c:WaitForChild('Pink Hair').Handle
local red = c:WaitForChild('Robloxclassicred').Handle
local hat = c:WaitForChild('Hat1').Handle
local fakelimbs = {kat,lav,pal,pin,red,hat}
for _, v in pairs(fakelimbs) do
	v:BreakJoints()
	v.Massless = true
	for _, j in pairs(v:GetDescendants()) do
		if j:IsA('SpecialMesh') or j:IsA('Weld') then j:Destroy() end
	end
end
local cl = c:Clone()
local realchar = Instance.new('Model', c)
for _, v in pairs(c:GetChildren()) do
	if v ~= realchar and not v:IsA('LocalScript') and not v:IsA('Script') then
		v.Parent = realchar
	elseif v:IsA('LocalScript') or v:IsA('Script') then
		v:Destroy()
	end
end
local ra
local la
local rl
local ll
local t
local hrp
local Humanoid
for _, v in pairs(cl:GetChildren()) do
	v.Parent = c
	if v.Name == 'Right Arm' and v:IsA('BasePart') then ra = v end
	if v.Name == 'Left Arm' and v:IsA('BasePart') then la = v end
	if v.Name == 'Right Leg' and v:IsA('BasePart') then rl = v end
	if v.Name == 'Left Leg' and v:IsA('BasePart') then ll = v end
	if v.Name == 'Torso' and v:IsA('BasePart') then t = v end
	if v.Name == 'HumanoidRootPart' and v:IsA('BasePart') then hrp = v end
	if v:IsA('Humanoid') then Humanoid = v end
end
local hr
local realhum
for _, v in pairs(realchar:GetDescendants()) do
	if v.Name == 'HumanoidRootPart' then hr = v end
	if v:IsA('Humanoid') then realhum = v end
	if not v:IsA('BasePart') then continue end
	if string.find(v.Name, 'Arm') or string.find(v.Name, 'Leg') then continue end
	pcall(function()
		game:GetService('RunService').Heartbeat:Connect(function()v.CanCollide = false;v.Massless = true;end)
	end)
end
workspace.FallenPartsDestroyHeight = 0/0
settings().Physics.AllowSleep = false
p.MaximumSimulationRadius = math.pow(math.huge, math.huge);
p.SimulationRadius = math.pow(math.huge, 2);
local Jumping = false
p:GetMouse().KeyDown:Connect(function(Key)
	coroutine.wrap(function()
		local State = Humanoid:GetState()
    	Humanoid.UseJumpPower = true
    	if Key == " " and State ~= Enum.HumanoidStateType.Jumping and State ~= Enum.HumanoidStateType.Freefall then
     	   Jumping = true
    	    while Jumping and task.wait(1/60) do
    	        local State = Humanoid:GetState()
   	   			if State ~= Enum.HumanoidStateType.Jumping and State ~= Enum.HumanoidStateType.Freefall then
                	Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
               		hrp.Velocity = hrp.Velocity + Vector3.new(0, Humanoid.JumpPower, 0)
            	end
        	end
    	end
	end)()
end)
p:GetMouse().KeyUp:Connect(function(Key)
    if Key == " " then
        Jumping = false
    end
end)
local flinging = false
fling = function(target, last)
	flinging = true
	local t = tick()
	last = last or 0.5
	while tick() - t < last do
		if target and typeof(target) == 'Instance' and target:IsA('BasePart') then
			hr.CFrame = target.CFrame
		elseif target and typeof(target) == 'Vector3' then
			hr.Position = target
		elseif target and typeof(target) == 'CFrame' then
			hr.CFrame = target
		elseif target == nil then
			hr.CFrame = p:GetMouse().Hit
		elseif target and typeof(target) == 'Instance' and target:IsA('Attachment') then
			hr.CFrame = target.WorldCFrame
		end
		hr.AssemblyAngularVelocity = Vector3.new(6000,6000,6000)
		if math.random(-5,5) == 0 then task.wait() end
	end
	hr.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	flinging = false
end
p:GetMouse().Button1Down:Connect(function()
	fling()
end)
local support = {}
function findout(sprt, handle)
    for _, tbl in ipairs(sprt) do
        if tbl[1] == handle or tbl[2] == handle then
            return true
        end
    end
    return false
end
for _, v in pairs(realchar:GetChildren()) do
	if v:IsA('Accessory') and v.Handle and not table.find(fakelimbs, v.Handle) and not findout(support,v.Handle) then
		table.insert(support, {v.Handle, c[v.Name].Handle})
		v.Handle.Massless = true
		v.Handle:BreakJoints()
	end
end
for _, v in pairs(c:GetDescendants()) do
	if v:IsDescendantOf(realchar) or v == realchar then
		pcall(function()
			v.CanCollide = false
		end)
		pcall(function()
			v.Massless = true
		end)
		continue
	end
	pcall(function()
		v.Transparency = 1
	end)
end
coroutine.wrap(function()
	local msg = Instance.new('Message', workspace)
	msg.Text = 'Loaded LeanReanimate v'..VER..'! Made by ca3r.'
	msg.Name = 'LeanNotify'
	msg.Parent = workspace
	local lolwtf = msg.Changed:Connect(function()
		msg.Parent = workspace
		msg.Text = 'Loaded LeanReanimate v'..VER..'! Made by ca3r.'
		msg.Name = 'LeanNotify'
	end)
	task.wait(1)
	lolwtf:Disconnect()
	msg:Destroy()
end)()
while c:IsDescendantOf(workspace) do
	task.wait()
	if not c:IsDescendantOf(workspace) then return end
	local funny = Vector3.new(0,0,math.sin(os.clock()*30)*0.01)
	if not flinging then
		hr.CFrame = hrp.CFrame * CFrame.new(0,-30,0)
	end
	coroutine.wrap(function()
		for _, v in pairs(realchar:GetDescendants()) do
			if v:IsA('BasePart') and v.CanCollide then
				v.CanCollide = false
			end
		end
	end)()
	kat.Velocity = Vector3.new(0,110,0)
	lav.Velocity = Vector3.new(0,110,0)
	pal.Velocity = Vector3.new(0,110,0)
	pin.Velocity = Vector3.new(0,110,0)
	red.Velocity = Vector3.new(0,110,0)
	hat.Velocity = Vector3.new(0,110,0)
	kat.CFrame = (ra.CFrame+funny)*CFrame.Angles(math.rad(90),0,0)
	lav.CFrame = (la.CFrame+funny)*CFrame.Angles(math.rad(90),0,0)
	pal.CFrame = (rl.CFrame+funny)*CFrame.Angles(math.rad(90),0,0)
	pin.CFrame = (ll.CFrame+funny)*CFrame.Angles(math.rad(90),0,0)

	red.CFrame = (t.CFrame+funny)*(CFrame.new(0.5,0,0)*CFrame.Angles(math.rad(90),0,0))
	hat.CFrame = (t.CFrame+funny)*(CFrame.new(-0.5,0,0)*CFrame.Angles(math.rad(90),0,0))
	
	for _, v in pairs(support) do
		v[1].Velocity = Vector3.new(0,110,0)
		v[1].CFrame = v[2].CFrame+funny
	end
end
