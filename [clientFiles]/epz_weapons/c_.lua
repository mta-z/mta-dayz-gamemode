models = {
{"guns/AK-107",1515},
{"guns/AK-107 PSO",1832},
{"guns/AK-74",1833},
{"guns/AKM",1835},
{"guns/AKS",1836},
{"guns/AKS (gold)",1837},
{"guns/AKS-74 Kobra",1838},
{"guns/AKS-74 PSO",1851},
{"guns/AKS-74U",1852},
{"guns/FN SCAR",1854},
{"guns/G36",1856},
{"guns/G36-C SD (camo)",1861},
{"guns/G36K (Camo)",1863},
{"guns/Gauss",1869},
{"guns/M240",1870},
{"guns/M249 Saw",1871},
{"guns/MG36",1872},
{"guns/Mk 48 Mod 0",1873},
{"guns/PKM",1874},
{"guns/PKP",1877},
{"guns/G17",346},
{"guns/M1911",1879},
{"guns/M9",1880},
{"guns/M9 SD",1881},
{"guns/Makarov PM",1882},
{"guns/Revolver",1900},
{"guns/M1014",1905},
{"guns/Remington 870",1909},
{"guns/Remington 870 (Com Lanterna)",1910},
{"guns/Saiga 12K",1911},
{"guns/AS50",1915},
{"guns/CZ550",1916},
{"guns/DMR",1918},
{"guns/KSVK",1919},
{"guns/M107",1920},
{"guns/M24",1923},
{"guns/M24 (desert)",1924},
{"guns/M40A3",1925},
{"guns/SVD Camo",1926},
{"guns/VSS",1922},
{"guns/M4A1",2785},
{"guns/M4A1SD",2481},
{"guns/341",341},

{"origgun/desert_eagle",348},
{"origgun/m4",356},
{"origgun/sniper",358},
{"origgun/silenced",347},
{"origgun/ak47",355},
{"origgun/mp5",353},
{"origgun/chromegun",349},
{"origgun/cuntgun",357},
{"origgun/shotgspa",351},
{"origgun/micro_uzi",352},
{"origgun/sawnoff",350},
{"origgun/m4",371},

}

function replaceModel() 


			for i, model in ipairs(models) do
			
					txd = engineLoadTXD ( model[1]..".txd" )
					engineImportTXD ( txd, model[2] )
					dff = engineLoadDFF ( model[1]..".dff", model[2] )
					engineReplaceModel ( dff, model[2] )
				engineSetModelLODDistance(model[2], 70)
			end
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)