function replaceModel() 
  txd = engineLoadTXD("lestnica.txd", 16154 )
  engineImportTXD(txd, 16154)
  dff = engineLoadDFF("lestnica.dff", 16154 )
  engineReplaceModel(dff, 16154)
  		itemCOL = engineLoadCOL (  "lestnica.col" )
		engineReplaceCOL ( itemCOL, 16154 )
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)