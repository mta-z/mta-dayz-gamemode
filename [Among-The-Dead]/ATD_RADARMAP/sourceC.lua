Display = {};
Display.Width, Display.Height = guiGetScreenSize();

Minimap = {};
Minimap.Width = 300;
Minimap.Height = 200;
Minimap.PosX = 20;
Minimap.PosY = (Display.Height - 20) - Minimap.Height;

Minimap.IsVisible = false;
Minimap.TextureSize = radarSettings['mapTextureSize'];
Minimap.NormalTargetSize, Minimap.BiggerTargetSize = Minimap.Width, Minimap.Width * 2;
Minimap.MapTarget = dxCreateRenderTarget(Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, true);
Minimap.RenderTarget = dxCreateRenderTarget(Minimap.NormalTargetSize * 3, Minimap.NormalTargetSize * 3, true);
Minimap.MapTexture = dxCreateTexture(radarSettings['mapTexture']);

Minimap.CurrentZoom = 5;
Minimap.MaximumZoom = 10;
Minimap.MinimumZoom = 2;

Minimap.WaterColor = radarSettings['mapWaterColor'];
Minimap.Alpha = radarSettings['alpha'];
Minimap.PlayerInVehicle = false;
Minimap.LostRotation = 0;
Minimap.MapUnit = Minimap.TextureSize / 6000;


Bigmap = {};
Bigmap.Width, Bigmap.Height = Display.Width - 40, Display.Height - 40;
Bigmap.PosX, Bigmap.PosY = 20, 20;
Bigmap.IsVisible = false;
Bigmap.CurrentZoom = 5.6*(600/Display.Height);

Bigmap.MinimumZoom = 1.5;
Bigmap.MaximumZoom = 6;

Fonts = {};
Fonts.Roboto = "default-bold" -- dxCreateFont('files/fonts/roboto.ttf', 25, false, 'antialiased');
Fonts.Icons = dxCreateFont('files/fonts/icons.ttf', 25, false, 'antialiased');

Stats = {};
Stats.Bar = {};
Stats.Bar.Width = Minimap.Width;
Stats.Bar.Height = 10;

local radarShowState = false
local mapShowState = false

local blipsSize = 20
local radarSize = "standart"

local radarResolutions ={
{"tiny",150,100},
{"small",250,150},
{"standart",300,200},
{"big",400,300},
}

local spawnTimer = false
function setPlayerPosition(x, y, z)
	if isPedDead(localPlayer) or getPedOccupiedVehicle(localPlayer) then return end
	
	local grav = getGravity()
	--setGravity(0.001)
	spawnTimer = setTimer(function() 
	setElementPosition(localPlayer,x,y,z)
	local hit, hitX, hitY, hitZ = processLineOfSight(x, y, 3000, x, y, -3000)
	--outputDebugString(tostring(hit))
	if hit then 
	setElementPosition(localPlayer,x,y,hitZ+1)
	killTimer(spawnTimer)
	--setGravity(grav)
	end 
	
	end,500,10)
	

end







function setRadarSize(size)
for index, radSize in ipairs(radarResolutions) do
			if size== radSize[1] then
			radarSize =  size
				Minimap.Width = radSize[2];
				Minimap.Height = radSize[3];
				Minimap.PosX = 20;
				Minimap.PosY = (Display.Height - 20) - Minimap.Height;

				Minimap.NormalTargetSize, Minimap.BiggerTargetSize = Minimap.Width, Minimap.Width * 2;
				Minimap.MapTarget = dxCreateRenderTarget(Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, true);
				Minimap.RenderTarget = dxCreateRenderTarget(Minimap.NormalTargetSize * 3, Minimap.NormalTargetSize * 3, true);

				return
			end
		end
end




local zoneNameMiniMap = "Loading..."
local playerX, playerY, playerZ = 0, 0, 0;
local mapOffsetX, mapOffsetY, mapIsMoving = 0, 0, false;

addEventHandler('onClientResourceStart', resourceRoot,
	function()
		--showPlayerHudComponent('radar', false);
		
		if (Minimap.MapTexture) then
			dxSetTextureEdge(Minimap.MapTexture, 'border', tocolor(Minimap.WaterColor[1], Minimap.WaterColor[2], Minimap.WaterColor[3], 255));
		end
	end
);

addEventHandler('onClientKey', root,
	function(key, state) 
		if (state) then
			if (key == 'F11') then
			
			local maps = getElementData(localPlayer,"Карта") or 0 
			if maps<=0 or getElementData(localPlayer,"isDead") then
			if getBigmapState() then 
			setState("hide","map")
			showChat(true);
					playSoundFrontEnd(2);
					Minimap.IsVisible = true;
					mapOffsetX, mapOffsetY, mapIsMoving = 0, 0, false;
			end
			outputChatBox("You have no card!");
			return end
				cancelEvent();
				Bigmap.IsVisible = not Bigmap.IsVisible;
				showCursor(false);
				
				if (Bigmap.IsVisible) then
				--	showPlayerHudComponent('all', false);
					showChat(false);
					playSoundFrontEnd(1);
					Minimap.IsVisible = false;
					setState("show","map")
				else
					--showPlayerHudComponent('all', true);
					--showPlayerHudComponent('radar', false);
					setState("hide","map")
					showChat(true);
					playSoundFrontEnd(2);
					Minimap.IsVisible = true;
					mapOffsetX, mapOffsetY, mapIsMoving = 0, 0, false;
				end
			elseif (key == 'mouse_wheel_down' and Bigmap.IsVisible) then
				Bigmap.CurrentZoom = math.min(Bigmap.CurrentZoom + 0.5, Bigmap.MaximumZoom);
			elseif (key == 'mouse_wheel_up' and Bigmap.IsVisible) then
				Bigmap.CurrentZoom = math.max(Bigmap.CurrentZoom - 0.5, Bigmap.MinimumZoom);
			elseif (key == 'mouse2' and Bigmap.IsVisible) then
				showCursor(not isCursorShowing());
			end
		end
	end
);




					
			
				
addEventHandler('onClientClick', root,
	function(button, state, cursorX, cursorY)
		if (not Minimap.IsVisible and Bigmap.IsVisible) then
			if (button == 'left' and state == 'down') then
				if (cursorX >= Bigmap.PosX and cursorX <= Bigmap.PosX + Bigmap.Width) then
					if (cursorY >= Bigmap.PosY and cursorY <= Bigmap.PosY + Bigmap.Height) then
						mapOffsetX = cursorX * Bigmap.CurrentZoom  +  playerX;
						mapOffsetY = cursorY * Bigmap.CurrentZoom  -  playerY;
						--outputDebugString("mapOffsetX: "..mapOffsetX.." mapOffsetY: "..mapOffsetY) --- !!!
						mapIsMoving = true;
					end
				end
			elseif (button == 'left' and state == 'up') then
				mapIsMoving = false;
				if getKeyState ( "lctrl" ) and getKeyState ( "lalt" ) then
					if getElementData(localPlayer,"adminMap") then
						local cursorX, cursorY = getCursorPosition();
						local mapX, mapY = getWorldFromMapPosition(cursorX, cursorY);
						setPlayerPosition(mapX, mapY, 0);
					end
				end
			end
		end
	end
);

function renderMap()
if not mapShowState then return end
if getElementData(localPlayer, "isDead") then 

setState("hide","map")
Minimap.IsVisible = true;
mapOffsetX, mapOffsetY, mapIsMoving = 0, 0, false;
 return end
if (not Minimap.IsVisible and Bigmap.IsVisible) then
			dxDrawBorder(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, 2, tocolor(0, 0, 0, 200));
			
			local absoluteX, absoluteY = 0, 0;
			local zoneName = 'Unknown';
			
			if (getElementInterior(localPlayer) == 0) then
				if (isCursorShowing()) then
					local cursorX, cursorY = getCursorPosition();
					local mapX, mapY = getWorldFromMapPosition(cursorX, cursorY);
					
					absoluteX = cursorX * Display.Width;
					absoluteY = cursorY * Display.Height;
					
					if (getKeyState('mouse1') and mapIsMoving) then
						playerX = -(absoluteX * Bigmap.CurrentZoom - mapOffsetX);
						playerY = absoluteY * Bigmap.CurrentZoom - mapOffsetY;
						
						playerX = math.max(-3000, math.min(3000, playerX));
						playerY = math.max(-3000, math.min(3000, playerY));
					end
					
					if (not mapIsMoving) then
						if (Bigmap.PosX <= absoluteX and Bigmap.PosY <= absoluteY and Bigmap.PosX + Bigmap.Width >= absoluteX and Bigmap.PosY + Bigmap.Height >= absoluteY) then
							zoneName = getZoneName(mapX, mapY, 0)..""..getSquareFromMapPosition(mapX, mapY);
						else
							zoneName = 'Unknown';
						end
					else
						zoneName = 'Unknown';
					end
				else
					playerX, playerY, playerZ = getElementPosition(localPlayer);
					zoneName = getZoneName(playerX, playerY, playerZ)..""..getSquareFromMapPosition(playerX, playerY);
					
					mapOffsetX = 0 * Bigmap.CurrentZoom -- +  playerX;
						mapOffsetY = 0 * Bigmap.CurrentZoom -- -  playerY;
						
						absoluteX = 0 * Display.Width;
						absoluteY = 0 * Display.Height;
					
						playerX = -(absoluteX * Bigmap.CurrentZoom - mapOffsetX);
						playerY = absoluteY * Bigmap.CurrentZoom - mapOffsetY;
						
						playerX = math.max(-3000, math.min(3000, playerX));
						playerY = math.max(-3000, math.min(3000, playerY));
				end
				
				
				
					
						
						
				
				local playerRotation = getPedRotation(localPlayer);
				local mapX = (((3000 + playerX) * Minimap.MapUnit) - (Bigmap.Width / 2) * Bigmap.CurrentZoom);
				local mapY = (((3000 - playerY) * Minimap.MapUnit) - (Bigmap.Height / 2) * Bigmap.CurrentZoom);
				local mapWidth, mapHeight = Bigmap.Width * Bigmap.CurrentZoom, Bigmap.Height * Bigmap.CurrentZoom;
				--outputDebugString("mapHeight: "..mapHeight) --!!!
				dxDrawImageSection(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, mapX, mapY, mapWidth, mapHeight, Minimap.MapTexture, 0, 0, 0, tocolor(255, 255, 255, Minimap.Alpha));
				
				--> Radar area
				for _, area in ipairs(getElementsByType('radararea')) do
					local areaX, areaY = getElementPosition(area);
					local areaWidth, areaHeight = getRadarAreaSize(area);
					local areaR, areaG, areaB, areaA = getRadarAreaColor(area);
						
					if (isRadarAreaFlashing(area)) then
						areaA = areaA * math.abs(getTickCount() % 1000 - 500) / 500;
					end
					
					local areaX, areaY = getMapFromWorldPosition(areaX, areaY + areaHeight);
					local areaWidth, areaHeight = areaWidth / Bigmap.CurrentZoom * Minimap.MapUnit, areaHeight / Bigmap.CurrentZoom * Minimap.MapUnit;

					--** Width
					if (areaX < Bigmap.PosX) then
						areaWidth = areaWidth - math.abs((Bigmap.PosX) - (areaX));
						areaX = areaX + math.abs((Bigmap.PosX) - (areaX));
					end
					
					if (areaX + areaWidth > Bigmap.PosX + Bigmap.Width) then
						areaWidth = areaWidth - math.abs((Bigmap.PosX + Bigmap.Width) - (areaX + areaWidth));
					end
					
					if (areaX > Bigmap.PosX + Bigmap.Width) then
						areaWidth = areaWidth + math.abs((Bigmap.PosX + Bigmap.Width) - (areaX));
						areaX = areaX - math.abs((Bigmap.PosX + Bigmap.Width) - (areaX));
					end
					
					if (areaX + areaWidth < Bigmap.PosX) then
						areaWidth = areaWidth + math.abs((Bigmap.PosX) - (areaX + areaWidth));
						areaX = areaX - math.abs((Bigmap.PosX) - (areaX + areaWidth));
					end
					
					--** Height
					if (areaY < Bigmap.PosY) then
						areaHeight = areaHeight - math.abs((Bigmap.PosY) - (areaY));
						areaY = areaY + math.abs((Bigmap.PosY) - (areaY));
					end
					
					if (areaY + areaHeight > Bigmap.PosY + Bigmap.Height) then
						areaHeight = areaHeight - math.abs((Bigmap.PosY + Bigmap.Height) - (areaY + areaHeight));
					end
					
					if (areaY + areaHeight < Bigmap.PosY) then
						areaHeight = areaHeight + math.abs((Bigmap.PosY) - (areaY + areaHeight));
						areaY = areaY - math.abs((Bigmap.PosY) - (areaY + areaHeight));
					end
					
					if (areaY > Bigmap.PosY + Bigmap.Height) then
						areaHeight = areaHeight + math.abs((Bigmap.PosY + Bigmap.Height) - (areaY));
						areaY = areaY - math.abs((Bigmap.PosY + Bigmap.Height) - (areaY));
					end
					
					--** Draw
					dxDrawRectangle(areaX, areaY, areaWidth, areaHeight, tocolor(areaR, areaG, areaB, areaA), false);
				end
				
				--> Blips
				for _, blip in ipairs(getElementsByType('blip')) do
					local blipX, blipY, blipZ = getElementPosition(blip);

					--if (localPlayer ~= getElementAttachedTo(blip)) then
						local blipSettings = {
							['color'] = {getBlipColor(blip)},
							['size'] = blipsSize,
							['icon'] = getBlipIcon(blip) or 0,
							--['exclusive'] = getElementData(blip, 'exclusiveBlip') or false
						};
						
						if (blipSettings['icon'] == 'target' or blipSettings['icon'] == 'waypoint') then
							blipSettings['color'] = {getBlipColor(blip)};
						end
						
						local centerX, centerY = (Bigmap.PosX + (Bigmap.Width / 2)), (Bigmap.PosY + (Bigmap.Height / 2));
						local leftFrame = (centerX - Bigmap.Width / 2) + (blipSettings['size'] / 2);
						local rightFrame = (centerX + Bigmap.Width / 2) - (blipSettings['size'] / 2);
						local topFrame = (centerY - Bigmap.Height / 2) + (blipSettings['size'] / 2);
						local bottomFrame = (centerY + Bigmap.Height / 2) - (blipSettings['size'] / 2);
						local blipX, blipY = getMapFromWorldPosition(blipX, blipY);
						
						centerX = math.max(leftFrame, math.min(rightFrame, blipX));
						centerY = math.max(topFrame, math.min(bottomFrame, blipY));

						dxDrawImage(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size'], 'files/images/blips/' .. blipSettings['icon'] .. '.png', 0, 0, 0, tocolor(blipSettings['color'][1], blipSettings['color'][2], blipSettings['color'][3], blipSettings['color'][4]));
					--end
				end
				
				
				
				--> Local player
				local localX, localY, localZ = getElementPosition(localPlayer);
				local blipX, blipY = getMapFromWorldPosition(localX, localY);
						
				if (blipX >= Bigmap.PosX and blipX <= Bigmap.PosX + Bigmap.Width) then
					if (blipY >= Bigmap.PosY and blipY <= Bigmap.PosY + Bigmap.Height) then
						dxDrawImage(blipX - 10, blipY - 10, 20, 20, 'files/images/arrow.png', 360 - playerRotation);
					end
				end
				
				--> GPS Location
				dxDrawRectangle(Bigmap.PosX, (Bigmap.PosY + Bigmap.Height) - 25, Bigmap.Width, 25, tocolor(0, 0, 0, 200));
				dxDrawText(zoneName, Bigmap.PosX + 10, (Bigmap.PosY + Bigmap.Height) - 25, Bigmap.PosX + 10 + Bigmap.Width - 20, (Bigmap.PosY + Bigmap.Height), tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'center');
				
				--> Map History 
				if mapIsMoving then
				dxDrawRectangle( (Bigmap.PosX+ Bigmap.Width)-210, (Bigmap.PosY+10), 200, 225, tocolor(0, 0, 0, 150));
				
				
				dxDrawRectangle( (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20), 20, 20, tocolor(255, 0, 0, 150));
				dxDrawText("—   Red zone", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				
				dxDrawRectangle( (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20+30), 20, 20, tocolor(0, 255, 0, 150));
				dxDrawText("—   Green Zone", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22+(30)), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				
		
				dxDrawRectangle( (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20+(30*2)), 20, 20, tocolor(0, 0, 255, 150));
				dxDrawText("—   Fishing area", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22+(30*2)), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				
				dxDrawImage(	 (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20+(30*3)), 20,20, 'files/images/arrow.png', 0, 0, 0, tocolor(255, 255, 255, 255));
				dxDrawText("—   Player", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22+(30*3)), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				
				dxDrawImage(	 (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20+(30*4)), 20,20, 'files/images/blips/0.png', 0, 0, 0, tocolor(255, 255, 0, 255));
				dxDrawText("—   Group member", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22+(30*4)), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				
				dxDrawImage(	 (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20+(30*5)), 20,20, 'files/images/blips/19.png', 0, 0, 0, tocolor(255, 0, 0, 255));
				dxDrawText("—   GPS beacon", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22+(30*5)), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				
				dxDrawImage(	 (Bigmap.PosX+ Bigmap.Width)-190, (Bigmap.PosY+20+(30*6)), 20,20, 'files/images/blips/20.png', 0, 0, 0, tocolor(255, 255, 255, 255));
				dxDrawText("—   Arena", (Bigmap.PosX+ Bigmap.Width)-160, (Bigmap.PosY+22+(30*6)), 110, 30, tocolor(255, 255, 255, 255),1, Fonts.Roboto, 'left', 'top');
				end
			else
				dxDrawRectangle(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, tocolor(0, 0, 0, 150));
				dxDrawText('GPS lost connection...', Bigmap.PosX, Bigmap.PosY + 20, Bigmap.PosX + Bigmap.Width, Bigmap.PosY + 20 + Bigmap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 1, Fonts.Roboto, 'center', 'center', false, false, false, true, true);
				dxDrawText('', Bigmap.PosX, Bigmap.PosY - 20, Bigmap.PosX + Bigmap.Width, Bigmap.PosY - 20 + Bigmap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 1.00, Fonts.Icons, 'center', 'center', false, false, false, true, true);
				
				if (Minimap.LostRotation > 360) then
					Minimap.LostRotation = 0;
				end
				
				dxDrawText('', (Bigmap.PosX + Bigmap.Width - 25), Bigmap.PosY, (Bigmap.PosX + Bigmap.Width - 25) + 25, Bigmap.PosY + 25, tocolor(255, 255, 255, 100), 0.50, Fonts.Icons, 'center', 'center', false, false, false, true, true, Minimap.LostRotation);
				Minimap.LostRotation = Minimap.LostRotation + 1;
			end
	end
end

function renderRadar()
	if getElementData(localPlayer, "isDead") then setState("hide","radar") return end
		if not radarShowState then return end 
		if (Minimap.IsVisible and not Bigmap.IsVisible) then
			if (radarSettings['showStats']) then
				Minimap.PosY = ((Display.Height - 20) - Stats.Bar.Height) - Minimap.Height;
			else
				Minimap.PosY = (Display.Height - 20) - Minimap.Height;
			end
			
			dxDrawBorder(Minimap.PosX, Minimap.PosY, Minimap.Width, Minimap.Height, 5, tocolor(0, 0, 0, 200));
			
			if (getElementInterior(localPlayer) == 0) then
				Minimap.PlayerInVehicle = getPedOccupiedVehicle(localPlayer);
				playerX, playerY, playerZ = getElementPosition(localPlayer);
				
				--> Calculate positions
				local playerRotation = getPedRotation(localPlayer);
				local playerMapX, playerMapY = (3000 + playerX) / 6000 * Minimap.TextureSize, (3000 - playerY) / 6000 * Minimap.TextureSize;
				local streamDistance, pRotation = getRadarRadius(), getRotation();
				local mapRadius = streamDistance / 6000 * Minimap.TextureSize * Minimap.CurrentZoom;
				local mapX, mapY, mapWidth, mapHeight = playerMapX - mapRadius, playerMapY - mapRadius, mapRadius * 2, mapRadius * 2;
				
				--> Set world
				dxSetRenderTarget(Minimap.MapTarget, true);
				dxDrawRectangle(0, 0, Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, tocolor(Minimap.WaterColor[1], Minimap.WaterColor[2], Minimap.WaterColor[3], Minimap.Alpha), false);
				dxDrawImageSection(0, 0, Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, mapX, mapY, mapWidth, mapHeight, Minimap.MapTexture, 0, 0, 0, tocolor(255, 255, 255, Minimap.Alpha), false);
				
				--> Draw radar areas
				for _, area in ipairs(getElementsByType('radararea')) do
					local areaX, areaY = getElementPosition(area);
					local areaWidth, areaHeight = getRadarAreaSize(area);
					local areaMapX, areaMapY, areaMapWidth, areaMapHeight = (3000 + areaX) / 6000 * Minimap.TextureSize, (3000 - areaY) / 6000 * Minimap.TextureSize, areaWidth / 6000 * Minimap.TextureSize, -(areaHeight / 6000 * Minimap.TextureSize);
					
					if (doesCollide(playerMapX - mapRadius, playerMapY - mapRadius, mapRadius * 2, mapRadius * 2, areaMapX, areaMapY, areaMapWidth, areaMapHeight)) then
						local areaR, areaG, areaB, areaA = getRadarAreaColor(area);
						
						if (isRadarAreaFlashing(area)) then
							areaA = areaA * math.abs(getTickCount() % 1000 - 500) / 500;
						end
						
						local mapRatio = Minimap.BiggerTargetSize / (mapRadius * 2);
						local areaMapX, areaMapY, areaMapWidth, areaMapHeight = (areaMapX - (playerMapX - mapRadius)) * mapRatio, (areaMapY - (playerMapY - mapRadius)) * mapRatio, areaMapWidth * mapRatio, areaMapHeight * mapRatio;
						
						dxSetBlendMode('modulate_add');
						dxDrawRectangle(areaMapX, areaMapY, areaMapWidth, areaMapHeight, tocolor(areaR, areaG, areaB, areaA), false);
						dxSetBlendMode('blend');
					end
				end
				
				--> Draw blip
				dxSetRenderTarget(Minimap.RenderTarget, true);
				dxDrawImage(Minimap.NormalTargetSize / 2, Minimap.NormalTargetSize / 2, Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, Minimap.MapTarget, math.deg(-pRotation), 0, 0, tocolor(255, 255, 255, 255), false);
				
				local serverBlips = getElementsByType('blip');
				
				table.sort(serverBlips,
					function(b1, b2)
						return getBlipOrdering(b1) < getBlipOrdering(b2);
					end
				);
				
				for _, blip in ipairs(serverBlips) do
					local blipX, blipY, blipZ = getElementPosition(blip);
					
					if (  getElementInterior(localPlayer) == getElementInterior(blip) and getElementDimension(localPlayer) == getElementDimension(blip)) then
						local blipDistance = getDistanceBetweenPoints2D(blipX, blipY, playerX, playerY);
						local blipRotation = math.deg(-getVectorRotation(playerX, playerY, blipX, blipY) - (-pRotation)) - 180;
						local blipRadius = math.min((blipDistance / (streamDistance * Minimap.CurrentZoom)) * Minimap.NormalTargetSize, Minimap.NormalTargetSize);
						local distanceX, distanceY = getPointFromDistanceRotation(0, 0, blipRadius, blipRotation);
						
						local blipSettings = {
							['color'] = {getBlipColor(blip)},
							['size'] = blipsSize,
							--['exclusive'] = getElementData(blip, 'exclusiveBlip') or false,
							['icon'] = getBlipIcon(blip) or 0
						};
						
						local blipX, blipY = Minimap.NormalTargetSize * 1.5 + (distanceX - (blipSettings['size'] / 2)), Minimap.NormalTargetSize * 1.5 + (distanceY - (blipSettings['size'] / 2));
						local calculatedX, calculatedY = ((Minimap.PosX + (Minimap.Width / 2)) - (blipSettings['size'] / 2)) + (blipX - (Minimap.NormalTargetSize * 1.5) + (blipSettings['size'] / 2)), (((Minimap.PosY + (Minimap.Height / 2)) - (blipSettings['size'] / 2)) + (blipY - (Minimap.NormalTargetSize * 1.5) + (blipSettings['size'] / 2)));
						
						if (blipSettings['icon'] == 'target' or blipSettings['icon'] == 'waypoint') then
							blipSettings['color'] = {getBlipColor(blip)};
						end
						
						--if (blipSettings['exclusive'] == true) then
							blipX = math.max(blipX + (Minimap.PosX - (blipSettings['size']/2.5) - calculatedX), math.min(blipX + (Minimap.PosX + Minimap.Width - blipSettings['size']  + (blipSettings['size']/2.5)  - calculatedX), blipX));
							blipY = math.max(blipY + (Minimap.PosY - (blipSettings['size']/2.5) - calculatedY), math.min(blipY + (Minimap.PosY + Minimap.Height - blipSettings['size'] + (blipSettings['size']/2.5)  - calculatedY), blipY));
						--end
						
						dxSetBlendMode('modulate_add');
						dxDrawImage(blipX, blipY, blipSettings['size'], blipSettings['size'], 'files/images/blips/' .. blipSettings['icon'] .. '.png', 0, 0, 0, tocolor(blipSettings['color'][1], blipSettings['color'][2], blipSettings['color'][3], blipSettings['color'][4]), false);
						--dxDrawText('CFFFFFFF', blipX+blipSettings['size'], blipY, 1, 10, tocolor(255, 255, 255, 100), 0.20, Fonts.Icons, 'left', 'center');
						dxSetBlendMode('blend');
					end
				end
				
			
				
				--> Draw fully minimap
				dxSetRenderTarget();
				dxDrawImageSection(Minimap.PosX, Minimap.PosY, Minimap.Width, Minimap.Height, Minimap.NormalTargetSize / 2 + (Minimap.BiggerTargetSize / 2) - (Minimap.Width / 2), Minimap.NormalTargetSize / 2 + (Minimap.BiggerTargetSize / 2) - (Minimap.Height / 2), Minimap.Width, Minimap.Height, Minimap.RenderTarget, 0, -90, 0, tocolor(255, 255, 255, 255));
				
				--> Local player
				dxDrawImage((Minimap.PosX + (Minimap.Width / 2)) - 10, (Minimap.PosY + (Minimap.Height / 2)) - 10, 20, 20, 'files/images/arrow.png', math.deg(-pRotation) - playerRotation);
			
				--> GPS
				dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height - 25, Minimap.Width, 25, tocolor(0, 0, 0, 150));
				dxDrawText(zoneNameMiniMap, Minimap.PosX + 5, (Minimap.PosY + Minimap.Height - 25), Minimap.PosX + 5 + Minimap.Width - 10, Minimap.PosY + Minimap.Height, tocolor(255, 255, 255, 255), 1, Fonts.Roboto, 'right', 'center', true, false, false, true, true);
				
				--> Zoom
				if (getKeyState('num_add') or getKeyState('num_sub')) then
					Minimap.CurrentZoom = math.max(Minimap.MinimumZoom, math.min(Minimap.MaximumZoom, Minimap.CurrentZoom + ((getKeyState('num_sub') and -1 or 1) * (getTickCount() - (getTickCount() + 50)) / 100)));
				end
			else
				dxDrawRectangle(Minimap.PosX, Minimap.PosY, Minimap.Width, Minimap.Height, tocolor(0, 0, 0, 150));
				dxDrawText('GPS lost connection...', Minimap.PosX, Minimap.PosY + 20, Minimap.PosX + Minimap.Width, Minimap.PosY + 20 + Minimap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 1, Fonts.Roboto, 'center', 'center', false, false, false, true, true);
				dxDrawText('', Minimap.PosX, Minimap.PosY - 20, Minimap.PosX + Minimap.Width, Minimap.PosY - 20 + Minimap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 1.00, Fonts.Icons, 'center', 'center', false, false, false, true, true);
				
				if (Minimap.LostRotation > 360) then
					Minimap.LostRotation = 0;
				end
				
				dxDrawText('', (Minimap.PosX + Minimap.Width - 25), Minimap.PosY, (Minimap.PosX + Minimap.Width - 25) + 25, Minimap.PosY + 25, tocolor(255, 255, 255, 100), 0.50, Fonts.Icons, 'center', 'center', false, false, false, true, true, Minimap.LostRotation);
				Minimap.LostRotation = Minimap.LostRotation + 1;
			end
			
			--[[ Stats
			if (radarSettings['showStats']) then
				if (isElementInWater(localPlayer)) then
					Stats.Bar.Width = (Minimap.Width / 3);
				else
					Stats.Bar.Width = (Minimap.Width / 2);
				end
				
				local healthColor;
		
				if (getElementHealth(localPlayer) <= 20) then
					local healthPulseTick = getTickCount() % 600;
					healthColor = {healthPulseTick <= 300 and 255 or 200, healthPulseTick <= 300 and 100 or 100, healthPulseTick <= 300 and 100 or 100};
				end
				
				dxDrawBorder(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200));
				dxDrawBorder(Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200));
				dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width, Stats.Bar.Height, tocolor(0, 0, 0, 140));
				dxDrawRectangle(Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, tocolor(0, 0, 0, 140));
			
				dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width / 100 * getElementHealth(localPlayer), Stats.Bar.Height, healthColor and tocolor(healthColor[1], healthColor[2], healthColor[3], 200) or tocolor(110, 200, 140, 200));
				dxDrawRectangle(Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, (Stats.Bar.Width - 2) / 100 * getPedArmor(localPlayer), Stats.Bar.Height, tocolor(75, 170, 210, 200));
			
				if (isElementInWater(localPlayer)) then
					dxDrawBorder(Minimap.PosX + (Stats.Bar.Width * 2) + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200));
					dxDrawRectangle(Minimap.PosX + (Stats.Bar.Width * 2) + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, tocolor(0, 0, 0, 140));
					dxDrawRectangle(Minimap.PosX + (Stats.Bar.Width * 2) + 2, Minimap.PosY + Minimap.Height + 2, (Stats.Bar.Width - 2) / 1000 * getPedOxygenLevel(localPlayer), Stats.Bar.Height, tocolor(230, 230, 30, 200));
				end
			end
			]]
		end
end


function setZoneName()
local playerX, playerY, playerZ = getElementPosition(localPlayer);
if radarSize =="tiny" then
zoneNameMiniMap = getSquareFromMapPosition(playerX, playerY)
else
zoneNameMiniMap = getZoneName(playerX, playerY, playerZ)..""..getSquareFromMapPosition(playerX, playerY)
end
end
--setZoneName()
setTimer(setZoneName,50,0) --10000


function doesCollide(x1, y1, w1, h1, x2, y2, w2, h2)
	local horizontal = (x1 < x2) ~= (x1 + w1 < x2) or (x1 > x2) ~= (x1 > x2 + w2);
	local vertical = (y1 < y2) ~= (y1 + h1 < y2) or (y1 > y2) ~= (y1 > y2 + h2);
	
	return (horizontal and vertical);
end

function getRadarRadius()
	if (not Minimap.PlayerInVehicle) then
		return 180;
	else
		local vehicleX, vehicleY, vehicleZ = getElementVelocity(Minimap.PlayerInVehicle);
		local currentSpeed = (1 + (vehicleX ^ 2 + vehicleY ^ 2 + vehicleZ ^ 2) ^ (0.5)) / 2;
	
		if (currentSpeed <= 0.5) then
			return 180;
		elseif (currentSpeed >= 1) then
			return 360;
		end
		
		local distance = currentSpeed - 0.5;
		local ratio = 180 / 0.5;
		
		return math.ceil((distance * ratio) + 180);
	end
end

function getPointFromDistanceRotation(x, y, dist, angle)
	local a = math.rad(90 - angle);
	local dx = math.cos(a) * dist;
	local dy = math.sin(a) * dist;
	
	return x + dx, y + dy;
end

function getRotation()
	local cameraX, cameraY, _, rotateX, rotateY = getCameraMatrix();
	local camRotation = getVectorRotation(cameraX, cameraY, rotateX, rotateY);
	
	return camRotation;
end

function getVectorRotation(X, Y, X2, Y2)
	local rotation = 6.2831853071796 - math.atan2(X2 - X, Y2 - Y) % 6.2831853071796;
	
	return -rotation;
end

function dxDrawBorder(x, y, w, h, size, color, postGUI)
	size = size or 2;
	
	dxDrawRectangle(x - size, y, size, h, color or tocolor(0, 0, 0, 180), postGUI);
	dxDrawRectangle(x + w, y, size, h, color or tocolor(0, 0, 0, 180), postGUI);
	dxDrawRectangle(x - size, y - size, w + (size * 2), size, color or tocolor(0, 0, 0, 180), postGUI);
	dxDrawRectangle(x - size, y + h, w + (size * 2), size, color or tocolor(0, 0, 0, 180), postGUI);
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
 
	return false
end

function getMinimapState()
	return Minimap.IsVisible;
end

function getBigmapState()
	return Bigmap.IsVisible;
end

function getMapFromWorldPosition(worldX, worldY)
	local centerX, centerY = (Bigmap.PosX + (Bigmap.Width / 2)), (Bigmap.PosY + (Bigmap.Height / 2));
	local mapLeftFrame = centerX - ((playerX - worldX) / Bigmap.CurrentZoom * Minimap.MapUnit);
	local mapRightFrame = centerX + ((worldX - playerX) / Bigmap.CurrentZoom * Minimap.MapUnit);
	local mapTopFrame = centerY - ((worldY - playerY) / Bigmap.CurrentZoom * Minimap.MapUnit);
	local mapBottomFrame = centerY + ((playerY - worldY) / Bigmap.CurrentZoom * Minimap.MapUnit);
	
	centerX = math.max(mapLeftFrame, math.min(mapRightFrame, centerX));
	centerY = math.max(mapTopFrame, math.min(mapBottomFrame, centerY));
	
	return centerX, centerY;
end

function getWorldFromMapPosition(mapX, mapY)
	local worldX = playerX + ((mapX * ((Bigmap.Width * Bigmap.CurrentZoom) * 2)) - (Bigmap.Width * Bigmap.CurrentZoom));
	local worldY = playerY + ((mapY * ((Bigmap.Height * Bigmap.CurrentZoom) * 2)) - (Bigmap.Height * Bigmap.CurrentZoom)) * -1;
	
	return worldX, worldY;
end

local squareSize = 250
local ySqChars  = {'А','Б','В','Г','Д','Ж','З','И','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х',"Ц",'Ч','Ш','Я'}
function getSquareFromMapPosition(worldX,worldY)
local topLeftWorldX,topLeftWorldY       = -3000,3000
	local xSq = tonumber(math.floor((worldX-(topLeftWorldX))/squareSize)+1)
	local ySq = tonumber(math.floor((topLeftWorldY-(worldY))/squareSize)+1)
	if xSq>24 or xSq<1 or ySq >24 or ySq< 1 then return "" end
	return "("..ySqChars[ySq].."-"..xSq..")"
end



function resizeRadar(comm , size)
size = tonumber(size)
if size == 0 then
setRadarSize("tiny")
elseif size == 1 then
setRadarSize("small")
elseif size == 2 then
setRadarSize("standart")
elseif size == 3 then
setRadarSize("big")
else
outputChatBox("Unknown minimap size")
end
end
addCommandHandler ( "radSize", resizeRadar )


function radarSiz(size)
resizeRadar(false,tonumber(size))
end


function setState(state,typeMap,hide)
local radars = getElementData(localPlayer,"Навигатор") or 0 
local maps = getElementData(localPlayer,"Карта") or 0 
--outputChatBox("'ATD_RADARMAP:setState "..state.." "..typeMap)
if state=="show"  then
	if typeMap=="map" and maps>= 1 then
		mapShowState= true
		Bigmap.IsVisible = true;
		if not isEventHandlerAdded("onClientRender", root, renderMap) then
		addEventHandler( "onClientRender", root, renderMap)
		end
	elseif typeMap=="radar" and radars>=1 and not getBigmapState() then 
		radarShowState= true
		Minimap.IsVisible = true;
		if not isEventHandlerAdded("onClientRender", root, renderRadar) then
		addEventHandler( "onClientRender", root, renderRadar)
		end
	end
elseif state=="hide" then
	if typeMap=="map" then
		mapShowState= false
		Bigmap.IsVisible = false;
		if not isEventHandlerAdded("onClientRender", root, renderMap) then
		removeEventHandler( "onClientRender", root, renderMap)
		end
	elseif typeMap=="radar" then 
		radarShowState= false
		Minimap.IsVisible = false;
		if not isEventHandlerAdded("onClientRender", root, renderRadar) then
		removeEventHandler( "onClientRender", root, renderRadar)
		end
	end

end
end