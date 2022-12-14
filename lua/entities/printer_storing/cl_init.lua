include("shared.lua")

surface.CreateFont("Printer_Font", {font = "HUDNumber5", size = 30 })

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
	
	if LocalPlayer():GetPos():Distance( self:GetPos() ) > 300 then return end
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	
    local owner = self:Getowning_ent()
	owner = ( IsValid( owner ) and owner:Nick() ) or "unknown"

	printername = "Money Printer"
	money = GAMEMODE.Config.currency .. self:GetNWInt( "PrintA" )
	hp = self:GetNWInt( "Health" )
	cool = self:GetNWInt( "Cooler" )
	
	local TextWidth = surface.GetTextSize( owner )
	local TextWidth2 = surface.GetTextSize( printername )
	local TextWidth3 = surface.GetTextSize( money )
	
	Ang:RotateAroundAxis( Ang:Up(), 90 )
	
	cam.Start3D2D( Pos + Ang:Up() * 11.5, Ang, 0.11 )
		draw.RoundedBox( 0, -135, -145, 275, 275, Color( 0, 0, 0, 255 ) ) -- Printer Background
		draw.RoundedBox( 0, -125, -135, 255, 50, Color( 255, 50, 50, 255 ) ) -- Owner Background
		draw.RoundedBox( 0, -125, -65, 255, 50, Color( 35, 35, 35, 255 ) ) -- Printer Name Background
		draw.RoundedBox( 0, -125, 5, 255, 50, Color( 35, 35, 35, 255 ) ) -- Storing Money Background
		
		draw.RoundedBox( 0, -125, 75, 120, 35, Color( 30, 30, 30, 255 ) )
		draw.RoundedBox( 0, -125, 75, 120 * (math.Clamp( hp, 0, 100 ) / 100), 35, Color( 255, 0, 0, 255 ) )
		
		draw.RoundedBox( 0, 10, 75, 120, 35, Color( 30, 30, 30, 255 ) )
		draw.RoundedBox( 0, 10, 75, 120 * (math.Clamp(cool, 0, 100) / 100), 35, Color( 0, 170, 255, 255 ) )
		
		draw.DrawText( owner, "Printer_Font", 0, -125, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.DrawText( printername, "Printer_Font", 0, -55, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.DrawText( money, "Printer_Font", 0, 15, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.DrawText( hp, "Printer_Font", -120, 77, Color( 255, 255, 255 ) )
		draw.DrawText( cool, "Printer_Font", 15, 77, Color( 255, 255, 255 ) )
	cam.End3D2D()
end

function ENT:Think()
end