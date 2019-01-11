local basePos ={
{-2065.2829589844,375.4189453125,67.169212341309},
{-1190.9768066406,-923.76300048828,129.21875},
{1441.0616455078,668.79766845703,10.8203125},
{-2370.4028320313,887.06652832031,93.6328125},
{2374.3002929688,1090.6282958984,34.2578125},
{2511.3713378906,1031.8317871094,57.501625061035},
{-1658.7254638672,1044.0225830078,69.828125},
{2484.0551757813,2327.4675292969,91.630043029785},
{1782.7408447266,-1746.4244384766,52.46875},
{-2066.5942382813,549.64495849609,79.171875},
{2441.2387695313,2495.2294921875,69.465728759766},
{-1880.4233398438,676.26831054688,81.3984375},
{-1565.6463623047,300.49801635742,53.4609375},
{2222.2248535156,1982.5275878906,39.322105407715},
{-2205.267578125,1195.1209716797,87.2109375},
{-70.640815734863,-358.66000366211,1.2773131132126},
{1540.5729980469,1778.0631103516,10.8203125},
{1348.7215576172,1778.2775878906,10.8203125},
{1333.1365966797,1653.5921630859,10.8203125},
{1584.4162597656,733.8115234375,10.8203125},
{81.670280456543,2465.0051269531,16.484375},
{2819.2421875,2663.8466796875,10.8203125},
{1416.7822265625,2845.130859375,10.8203125},
{-2753.3447265625,1255.2919921875,11.765625},
{2326.62109375,-1982.9013671875,13.549360275269}
}
function tpToBase ( player, command, params )
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin"))
if isAdmin then


params = tonumber(params)
if command == "btp" and isAdmin and params then
		for i, _ in ipairs(basePos) do
			if  i == params then
			local model = getElementModel(player)
			spawnPlayer (player,_[1],_[2],_[3], 0,model) 
				break
			end
		end
end
end
end
addCommandHandler ( "btp", tpToBase )



function getRacia( player, command, params1,... )
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin"))
if isAdmin then
local params2 = table.concat({...}," ")
outputConsole ( command..":"..params2..":   "..params1, player )
local colshape = getElementsByType ( "colshape" ) 
for theKey,col in ipairs(colshape) do 
  local racia= getElementData(col,tostring(params2)) or false
  if racia then
  if racia>tonumber(params1) then 
    local x,y,z= getElementPosition(col)
      outputConsole ( params1..":"..params2..":   "..x..","..y..","..z, player )
   end
   end
end
end
end
addCommandHandler ( "dupPos", getRacia )
