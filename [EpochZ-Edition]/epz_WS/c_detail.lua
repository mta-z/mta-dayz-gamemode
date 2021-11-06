




local worldTextureQ = "normal"


addEventHandler( "onClientResourceStart", resourceRoot,
	function()
	worldTextureQ = exports.EpochZ:getSettingsValue("worldTextureQ")
	if worldTextureQ ~="noShow" then
		enableDetail()
	end
	
	end)


	
function enableDetail()


	local cloudTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/35.png', "dxt3")
	local sandGrass = 						dxCreateTexture('shaders/'..worldTextureQ..'/62.png', "dxt3")
	local sandGrass2 = 						dxCreateTexture('shaders/'..worldTextureQ..'/72.png', "dxt3")
	local grassTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/1.png', "dxt3")	
	local grgrass = 						dxCreateTexture('shaders/'..worldTextureQ..'/46.png', "dxt3")
	local grgrass2grass = 					dxCreateTexture('shaders/'..worldTextureQ..'/57.png', "dxt3")
	local rock2Road = 						dxCreateTexture('shaders/'..worldTextureQ..'/22.png', "dxt3")
	local dirtRoadTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/2.png', "dxt3")
	local dirtRoadRTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/18.png', "dxt3")
	local dirtRoadLTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/6.png', "dxt3")
	local dirtRoadXTexture =				dxCreateTexture('shaders/'..worldTextureQ..'/19.png', "dxt3")
	local dirtRoadUTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/32.png', "dxt3")
	local dirtRoadEndTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/33.png', "dxt3")
	local rockUTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/3.png', "dxt3")
	local rockMTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/7.png', "dxt3")
	local rockDTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/4.png', "dxt3")
	local dirtTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/12.png', "dxt3")
	local dirt2GrassTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/52.png', "dxt3")
	local dirt2GrassTextureU = 				dxCreateTexture('shaders/'..worldTextureQ..'/65.png', "dxt3")
	local rockHole = 						dxCreateTexture('shaders/'..worldTextureQ..'/27.png', "dxt3")	
	local bigRock = 						dxCreateTexture('shaders/'..worldTextureQ..'/29.png', "dxt3")	
	local bigRockToRock = 					dxCreateTexture('shaders/'..worldTextureQ..'/44.png', "dxt3")	
	local grassToRock = 					dxCreateTexture('shaders/'..worldTextureQ..'/51.png', "dxt3")
	local mediumRock = 						dxCreateTexture('shaders/'..worldTextureQ..'/45.png', "dxt3")
	local mediumRock2Grass = 				dxCreateTexture('shaders/'..worldTextureQ..'/25.png', "dxt3")
	local lsCliff2 = 						dxCreateTexture('shaders/'..worldTextureQ..'/24.png', "dxt3")
	local palm_bark = 						dxCreateTexture('shaders/'..worldTextureQ..'/40.png', "dxt3")
	local palm_leaf = 						dxCreateTexture('shaders/'..worldTextureQ..'/39.png', "dxt3")
	local grassDeadTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/9.png', "dxt3")
	local grassToDeadTexture = 				dxCreateTexture('shaders/'..worldTextureQ..'/8.png', "dxt3")
	local grassToDeadTextureU = 			grassToDeadTexture
	local deadGrassRoad = 					dxCreateTexture('shaders/'..worldTextureQ..'/55.png', "dxt3")
	local deadFieldTexture = 			  	dxCreateTexture('shaders/'..worldTextureQ..'/53.png', "dxt3")
	local deadFieldTextureToDeadGrass = 	dxCreateTexture('shaders/'..worldTextureQ..'/54.png', "dxt3")
	local gravelToRoadM = 					dxCreateTexture('shaders/'..worldTextureQ..'/22.png', "dxt3")
	local gravelToRoadL = 					dxCreateTexture('shaders/'..worldTextureQ..'/23.png', "dxt3")
	local gravel = 							dxCreateTexture('shaders/'..worldTextureQ..'/20.png', "dxt3")
	local gravelToRoadU = 					dxCreateTexture('shaders/'..worldTextureQ..'/21.png', "dxt3")
	local gravelToRoadD = 					dxCreateTexture('shaders/'..worldTextureQ..'/79.png', "dxt3")
	local vegRockBot = 						dxCreateTexture('shaders/'..worldTextureQ..'/30.png', "dxt3")
	local vegRockMid =						dxCreateTexture('shaders/'..worldTextureQ..'/29.png', "dxt3")
	local vegRockLeft = 					dxCreateTexture('shaders/'..worldTextureQ..'/31.png', "dxt3")
	local vegRockCorn = 					dxCreateTexture('shaders/'..worldTextureQ..'/80.png', "dxt3")
    local con = 							dxCreateTexture('shaders/'..worldTextureQ..'/83.png', "dxt3")
	 local con2 = 							dxCreateTexture('shaders/'..worldTextureQ..'/84.png', "dxt3")
	local block = 							dxCreateTexture('shaders/'..worldTextureQ..'/block.png', "dxt3")
	local wallTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/36.png', "dxt3")
	local bush0 = 							dxCreateTexture('shaders/'..worldTextureQ..'/41.png', "dxt3")
	local bush1 = 							dxCreateTexture('shaders/'..worldTextureQ..'/42.png', "dxt3")
	local bush2 = 							bush1
	local train = 							dxCreateTexture('shaders/'..worldTextureQ..'/14.png', "dxt3")
	local trainGravel =						dxCreateTexture('shaders/'..worldTextureQ..'/15.png', "dxt3")
	local dirtGravel = 						dxCreateTexture('shaders/'..worldTextureQ..'/16.png', "dxt3")
	local blockTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/78.png', "dxt3")
	local greyTexture = 					dxCreateTexture('shaders/'..worldTextureQ..'/38.png', "dxt3")
	local single = 						dxCreateTexture('shaders/low/single.png', "argb")
	local roadEdge = 						dxCreateTexture('shaders/'..worldTextureQ..'/26.png', "argb")
	local treeR1 = 							dxCreateTexture('shaders/'..worldTextureQ..'/newtreeleavesb128.png', "argb") -- newtreeleavesb128
	local treeR2 = 							dxCreateTexture('shaders/'..worldTextureQ..'/newtreeleaves128.png', "argb") -- newtreeleaves128
	
	local genLog = 							palm_bark
	local bark04S64  = 						dxCreateTexture('shaders/'..worldTextureQ..'/bark04S64.png', "argb") -- gen_log
	local glaw42  = 						dxCreateTexture('shaders/'..worldTextureQ..'/42.png', "argb") -- gen_log
	local grassaa  = 						dxCreateTexture('shaders/'..worldTextureQ..'/34.png', "argb") -- gen_log
	
	
		local keyToTextureReplace = {
			["bycobain*"]					= bycobain,
			["txgrass*"]					= grassaa,
			["gras07si"]					= grassaa,
			["oak2b"] 	 					= bush0,
			["oakb"]						= bush0,
			["veg_bush2"]					= grassaa,
			["veg_largefurs06"]				= single,
			["blackshadow4"]  				= single,
			["des_warewin"]					= single,
			["veg_largefurs05"]				= single,
			["lod_largefurs07"]				= single,
			["coronastar*"]					= single,
			["neonwin1"]					= single,
			["mp_torenoshada"]				= single,
			["ws_boxhouse_wins6nite"]		= single,
			["sfnitewindow_alfa"]			= single,
			["unnamed"]						= single,
			["sl_dtwinlights*"]				= single,
			["averysigneon*"]				= single,
			["vgsn_nl_strip"]				= single,
			["monlith_win_tex"]				= single,
			["starfish_static_lits"]		= single,
			["vgnbarb1_256na"]				= single,
			["circirctex4_neon"]			= single,
			["sfnitewindow*"]				= single,
			["shad_exp*"]					= single,
			["neon*"]						= single,
			["nitwin01_la"]					= single,
			["sl_dtwinlights1"]				= single,
			["eldneolawn"]					= single,
			["sunneon01"]					= single,
			["kb_ivy2_256*"]				= glaw42,
			["bzelka1*"]					= bark04S64,
			["gen_log*"]					= palm_bark,
			["newtreeleavesb128*"]			= glaw42,
			["newtreeleaves128*"]			= glaw42,
			["elm_treegrn*"]				= glaw42,
			["cloud*"]						= cloudTexture,
			["des_dirt2grgrass"]			= grassTexture,
			["*_dirt1*"] 					= grassTexture,
			["grass10forest"]				= grassTexture,
			["*grassdead*"]					= grassTexture,
			["*scrub1*"]					= grassTexture,
			["*oldrun*"] 					= grassTexture,
			["*panelconc*"]					= grassTexture,
			["*ripplsand*"] 				= grassTexture,
			["*dirtgrassmix*"] 				= grassTexture,
			["grassdeadbrn256"] 			= grassTexture,
			["*grasstype5*"] 				= grassTexture,
			["*heavygrass*"] 				= grassTexture,
			["*grassbrn"] 					= grassTexture,
			["*grassbrn_lod"] 				= grassTexture,
			["*grass2scrub*"] 				= grassTexture,
			["*grass2dirt*"] 				= grassTexture,		
			["*desgrasand*"] 				= grassTexture,			
			["*grass_gen*"] 				= grassTexture,
			["*grass_lod*"] 				= grassTexture,
			["*dirt64b2*"] 					= grassTexture,
			["Grass"] 						= grassTexture,
			["Grass_128*"] 					= grassTexture,
			["Grass_lod"] 					= grassTexture,
			["*sandgrnd*"] 					= grassTexture,
			["*grass_dry*"] 				= grassTexture,
			["*yardgras*"] 					= grassTexture,
			["*vegasgolflod*"] 				= grassTexture,
			["newcrop3"] 					= grassTexture,
			["desgreengrassmix*"] 			= grassTexture,
			["*con2sand*"] 					= grassTexture,
			["*grassdry*"] 					= grassTexture,
			["*vgn_ground*"] 				= grassTexture,
			["*drvin_ground*"] 				= grassTexture,
			["*grasslod*"] 					= grassTexture,
			["*brngrass*"] 					= grassTexture,
			["*desgrassbrnLOD*"] 			= grassTexture,
			["*vgsEcoast*"] 				= grassTexture,
			["*vgwestbildlod*"] 			= grassTexture,
			["*sfn_grass1*"] 				= grassTexture,
			["*asfnsjm6*"] 					= grassTexture,
			["*asfnsjm94*"] 				= grassTexture,
			["*frate_doors128red*"] 		= con2,
			["*frate64_red*"] 				= con,
			
			["*asfnsjm93*"] 				= grassTexture,
			["*asfnsjm9i*"] 				= grassTexture,
			["*asfnsjm9h*"] 				= grassTexture,
			["*grass4dirty*"] 				= grassTexture,
			["*grasstype4"] 				= grassTexture,
			["*oldflowerb*"]				= grassTexture,
			["*grassbrn_grn*"] 				= grassTexture,
			["*desertgryard*"] 				= grassTexture,
			["*desertgryard*"] 				= grassTexture,
			["desertstones256forestm"]	 	= grassTexture,
			["*dirt2gygras*"] 				= grassTexture,
			["*sl_sfn*"] 					= grassTexture,
			["florestfloor256_blenddirt"] 	= grassTexture,
			["grassdead1"]			    	= grassTexture,
			["forestfloor_sones256"]		= grassTexture,
			["forestfloor3_forest"]	    	= grassTexture,
            ["forestfloorblendded"]	    	= grassTexture,
			["*grasstype10*"]				= grassTexture,
			["*grasstype4_10*"]				= grassTexture,
			["*grasstype4_forest*"]			= grassTexture,
			["*florestfloor3*"]		    	= grassTexture,
			["*florestfloor3_florest*"]		= grassTexture,
			["grasstype4_forestblend"]  	= grassTexture,
			["*desertgravelgrass*"]			= grassTexture,
			["*dirtKB_64*"]					= grassTexture,
			["*grassdeep1*"]				= grassTexture,
			["*desmudgrass*"]				= grassTexture,
			["*grasspatch*"]				= grassTexture,
			["*Grass_path*"]				= grassTexture,
			["desertstones256"] 			= grassTexture,
			["des_dirt2stones*"] 			= grassTexture,
			["des_dirt2grass*"] 			= grassTexture,
			["desgreengrass"]				= grassTexture,
			["grasstype7*"]					= grassTexture,
			["grassdirtblend"]				= grassTexture,
			["compurch_lod"]				= grassTexture,
			["*church_dirt*"]				= grassTexture,
			["*grasstype3*"]				= grassTexture,
			["*grasstype4-3*"]				= grassTexture,			
			["sw_grass01a*"]				= grassToDeadTexture,			
			["sw_grassB01*"]				= deadFieldTextureToDeadGrass,			
			["sw_grass01"]					= grassDeadTexture,
			["sw_grass01LOD"]				= grassDeadTexture,
			["sw_dirt01*"]					= grassDeadTexture,
			["sw_crops*"]					= deadFieldTexture,
			["grassgrnbrnx*"]				= deadFieldTexture,
			["sw_farmroad*"]				= deadGrassRoad,
			["*desertgryard*"] 				= grassDeadTexture,
			["*forestfloorblend*"]			= grassToDeadTextureU,
			["*forestfloorblendb*"]			= grassToDeadTextureU,
			["*forestfloorbranch*"]			= grgrass,
			["*forestfloorbranch256*"]		= grgrass,
			["*forestfloor256*"]			= grassTexture,
			["forestfloor256_blenddirt"]	= grassTexture,
			["*forestfloor256L*"]			= grassTexture,
			["*forestfloorgrass*"]			= grassTexture,
			["*mounttrail*"]				= dirtTexture,	
			["*forest_rocks*"] 				= dirt2GrassTextureU,
			["*stonesgrass*"] 				= dirt2GrassTexture,
			["*sw_stones*"] 				= dirtTexture,
			["*mountainskree*"]				= dirtTexture,
			["stones256"] 					= dirtTexture,
			["grass10_stones256"] 			= dirt2GrassTexture,
			["*grass10dir*"] 				= dirt2GrassTexture,
			["*grasstype4blnd*"] 			= dirt2GrassTextureU,
			["*mountdirt2grass"]			= dirt2GrassTexture,	
			["*mountdirt"]					= dirtTexture,	
			["*rock2grgrass*"] 				= vegRockBot,
			["*mountrock*"] 				= vegRockMid,
			["*rockhole*"] 					= rockHole,
			["*sfn_rocktbrn*"] 				= vegRockLeft,
			["*golf_grassrock*"] 			= vegRockMid,
			["*asfnsjm9zb*"] 				= vegRockMid,
			["*sw_rockgrass1*"] 			= vegRockMid,
			["*sw_rockgrassB*"] 			= vegRockBot,
			["*rockdetail2*"] 				= bigRock,
			["*grassbrn2rock*"] 			= grassToRock,
			["*mountdirt2forest*"]			= grgrass2grass,
			["*mountroad*"]					= rock2Road,		
			["*sfncn_rockgrass3*"] 			= vegRockCorn,
			["*sfncn_rockgrass4*"] 			= vegRockNoCorn,
			["*rock_country*"] 				= vegRockMid,
			["sw_sandgrass"]				= sandGrass,
			["sw_sandgrass4"]				= sandGrass2,
			["*grasstype4_mudblend*"] 		= gravelToRoadU,			
			["desmud"] 						= gravel,
			["desertstones256for*"] 		= gravelToRoadD,
			["forestfloor_sones*"] 			= gravelToRoadU,
			["dirtblendlit*"] 				= grassTexture,
			["brngrss2stones*"] 			= gravelToRoadU,		
			["*hiway2sand*"] 				= grassTexture,
			["*patchygravel*"] 				= alpha,
			["*_dirt2 t*"] 					= gravelToRoadL,
			["*_dirt2track"] 				= gravelToRoadM,
			["*_dirt2trackr*"] 				= gravelToRoadM,
			["*crackeddirt1*"] 				= dirtTexture,
			["*forestfloor3"] 				= grassTexture,
			["*dirt2ded*"] 					= grassToDeadTexture,
			["*dirtgravel*"] 				= gravel,
			["*_dirt2"] 					= gravel,
			["*_dirt2lod"] 					= gravel,
			["desmudtrail"]					= dirtRoadUTexture,
			["*weeroad*"]					= dirtRoadUTexture,
			["*dirttracksgrass*"]			= dirtRoadUTexture,
			["*dirttrack1*"] 				= dirtRoadTexture,
			["*dirttrack1r*"] 				= dirtRoadRTexture,
			["*dirttrackl*"] 				= dirtRoadLTexture,
			["*dirttrackx*"] 				= dirtRoadXTexture,
			["*roadblendcu*"] 				= dirtRoadTexture,
			["*grasstrckend*"] 				= dirtRoadEndTexture,
			["*dirttracksfor*"]				= dirtRoadUTexture,
			["BLOCK*"] 						= blockTexture,
			["brick*"] 						= blockTexture,
			["*railwy*"] 					= wallTexture,
			["rocktbrn128*"] 				= bigRock,
			["rocktbrn_*"] 					= bigRockToRock,
			["des_dirt2blend*"] 			= gravelToRoadU,
			["*rocktq128"] 					= mediumRock,					
			["*rocktq128_dirt"] 			= mediumRock2Grass,					
			["*rocktq128ble*"] 				= mediumRock,
			["*yelrock*"] 					= mediumRock,
			["cw2_mountdirtscree"] 			= mediumRock,
			["*rocktq128_forest*"] 			= mediumRock2Grass,
			["*rocktq128_grass*"] 			= mediumRock2Grass,
			["*descliff*"] 					= grassToRock,
			["*cuntbrncliff*"] 				= lsCliff2,
			["*lasclif*"] 					= lsCliff2,
			["*redrockmid*"] 				= rockUTexture,
			["*redrockbot*"] 				= rockDTexture,
			["*vgs_rockbot*"] 				= vegRockBot,
			["*vgs_rockmid*"] 				= vegRockMid,
			["*redrock1*"] 					= rockMTexture,
			["*redrock2*"] 					= rockMTexture,
			["*sm_rock2*"] 					= rockMTexture,
			["*rocky*"] 					= rockMTexture,
			["*des_bush1*"] 				= bush0,
			["*des_bush2*"] 				= bush1,
			["*des_bush3*"] 				= bush2,
			["*josh_bark*"] 				= palm_bark,
			["*josh_leaf*"] 				= palm_leaf,
			["*traintrax*"] 				= train,
			["*traingrav*"] 				= trainGravel,
			["rail_stones256"] 				= trainGravel,
			["*dirtgravel*"] 				= dirtGravel,
			["*roadedge*"] 					= gravelToRoadU,
			["*bonyrd_skin*"] 				= greyTexture,
			["*sam_camo*"] 					= blockTexture,
			--["sf_road5"]					= blockTexture,
			--["sf_junction5"]				= blockTexture,


		}
		
		
		local keyToTextureOverlay ={
		--[[
			["*sl_laefreeway*"] =				roadShader,
			["*freewaylae*"] =					roadShader,
			["*lawroad*"] =						roadShader,
			["*lawhiway*"] =					roadShader,	
			["*sjmloda991*"] =					roadShader,
			["*dualroad*"] =					roadShader,
			["*snpedtest*"] =					roadShader,
			["*_1lineX*"] =						roadShader,
			["*roadverge*"] =					roadShader,
			["*laneverge*"] =					roadShader,
			["*hroadlod*"] =					roadShader,
			["*townroad*"] =					roadShader,
			["*roadgrassbl*"] =					roadShader,
			["*roadwide*"] =					roadShader,
			["*LODfreeway*"] =					roadShader,
			["*MelroadL*"] =					roadShader,
			["*roadLOD*"] =						roadShader,
			["*bridgroad*"] =					roadShader,
			["*freewayroads*"] =				roadShader,
			["*lastroadbug*"] =					roadShader,
			["*free2road*"] =					roadShader,
			["*lanLODroad*"] =					roadShader,
			["*sjmlaelodf995*"] =				roadShader,
			["*sjmlaelodf5"] =					roadShader,	
			["*craproad1*"] =					roadShader,
			["*lae2roadiv*"] =					roadShader,
			["*roadcoast5*"] =					roadShader,
			["*roadcoast6*"] =					roadShader,
			["*freewayfae*"] =					roadShader,
			["*lae2rdcst*"] =					roadShader,
			["*ws_freeway3*"] =					roadShader,
			["*lanefreeway*"] =					roadShader,
			["*road5*"] =						roadShader,
			["*sfroad2*"] =						roadShader,
			["*roadnew*"] =						roadShader,
			["*greypavroad*"] =					roadShader,			
			["*hiwayout*"] =					roadShader,
			["*hiwaymid*"] =					roadShader,
			["*hiwayend*"] =					roadShader,
			["*vegasroad*"] =					roadShader,
			["*dirtyroad*"] =					roadShader,		
			["*roadirt*"] =						roadShader,
			["*road01_lod*"] =					roadShader,
			["*road02_lod*"] =					roadShader,
			["*road02c_lod*"] =					roadShader,
			["*road02b_lod*"] =					roadShader,
			["*road02d_lod*"] =					roadShader,
			["*roadjunc*"] =					roadShader,
			["*junction*"] =					roadShader,
			["*dt_road*"] =						roadShader,
			["*gasroad*"] =						roadShader,
			["*striproad*"] =					roadShader,
			["*roadgas*"] =						roadShader,	
			["*lae2rdfuk*"] =					roadShader,
			["*freewaylaw2*"] =					roadShader,
			["*hiwaygras_lod*"] =				roadShader,
			["*roads_sfnLOD*"] =				roadShader,
			["*LOD_mountainroad*"] =			roadShader,
			["*_1line*"] =						roadShader,
			["*des_road1*"] =					roadShader,
			["*_2line*"] =						roadShader,
			["*_lines*"] =						roadShader,
			["*dt_road*"] =						roadShader,
			["*Tar_vent*"] =					roadShader,
			["*Tar_free*"] =					roadShader,
			["*Tar_LeftR*"] =					roadShader,
			["*cn2_troad*"] =					roadShader,
			["*countryroads*"] =				roadShader,
			["*sjmlas2lod5n"] =					roadShader,
			["*snpdwargrn*"] =					roadShader,	
			["*1linefree*"] =					roadShader,	
			["*lawnroad*"] =					roadShader,
			["*asphalt*"] =						roadShader,
			["*carpark*"]  =					roadShader,
			["*junction*"]  =					roadShader,
			["*dirtyroad*"]  =					roadShader,
			["*vegasroad*"]  =					roadShader,
			["*roadirt*"]  =					roadShader,
			["*tar*"] =							roadShader,
			
			]]
			["*pave*"] 							= roadEdge,
			["*hiwayin*"] 						= roadEdge,	
			["*sidewalk*"] 						= roadEdge,	
			["*hoodlawn*"] 						= roadEdge,	
			["*sidewgrass*"] 					= roadEdge,	
			["*backalley*"] 					= roadEdge,	
			["*craproad5*"] 					= roadEdge,
			["*mannblok*"] 						= roadEdge,
			["sidelatino1_lae"] 				= roadEdge,
			}
		
		-- шо тут за хуйта
	
		
		for tex, shad in pairs ( keyToTextureOverlay ) do
		--outputChatBox(1)
			engineApplyShaderToWorldTexture ( overlayShader(shad), tex,nil,false )
		end
		
	for tex, shad in pairs(keyToTextureReplace) do
		--outputChatBox(0)
			engineApplyShaderToWorldTexture ( replaceShader(shad), tex,nil,false )
		end

		
		
	

end




function replaceShader(image)
	
local replaceSH,replaceTEC = dxCreateShader ( "fx/world.fx",1,1000 )	
	if replaceSH then
		dxSetShaderValue( replaceSH, "t", image );
	return replaceSH,replaceTEC
	end
	
end



function overlayShader(image)
local overlaySH,tec = dxCreateShader ( "fx/shader.fx", 1, 1000 )	
	if overlaySH then
			dxSetShaderValue ( overlaySH, "TexMsk", image )
			dxSetShaderValue ( overlaySH, "topVector",1, 1, 1 )
			dxSetShaderValue ( overlaySH, "DiffuseColor",  1)
			dxSetShaderValue ( overlaySH, "progress", 0.3)
			--outputChatBox(2)
	return overlaySH,overlayTEC
	end
	
end




