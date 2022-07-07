local RarityColours = {
    ["Common"] = Color3.fromRGB(99, 99, 99), -- Gray
    ["Uncommon"] = Color3.fromRGB(83, 137, 53), -- Green
    ["Rare"] = Color3.fromRGB(56, 65, 137), -- Blue
    ["Epic"] = Color3.fromRGB(137, 34, 123), -- Purple
    ["Legendary"] = Color3.fromRGB(234, 134, 35), -- Orange
};

local function AddBillboard(Part)
    local Colour = RarityColours[Part.Parent.Rarity.Value];

    local BillboardGui = Instance.new("BillboardGui", Part);
    BillboardGui.Size = UDim2.new(15, 0, 15, 0);
    BillboardGui.LightInfluence = 1;
    BillboardGui.AlwaysOnTop = true;

    local Frame = Instance.new("Frame", BillboardGui);
    Frame.Size = UDim2.new(1, 0, 1, 0);
    Frame.BorderSizePixel = 0;
    Frame.BackgroundColor3 = Colour;
end

while getgenv().enabled do
    for _, Bag in pairs(game.Workspace:GetChildren()) do
        -- Making sure we're only looking at the bags
        if Bag.ClassName ~= "Model" then continue; end
        if not Bag:FindFirstChild("BagTouchScript") then continue; end

        -- Deleting the old BillboardGui if it exists
        if Bag.Main:FindFirstChild("BillboardGui") then 
            Bag.Main:FindFirstChild("BillboardGui"):Destroy(); 
            print("Deleted");
        end

        AddBillboard(Bag.Main);
        print("Added");
    end

    wait(2);
end

