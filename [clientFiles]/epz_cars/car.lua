
local modelsR = {
{519,"519.txd","519.dff"}, 
{453,"453.txd","453.dff"}, 
{402,"402.txd","402.dff"},
{411,"411.txd","411.dff"},
{422,"422.txd","422.dff"},
{428,"428.txd","428.dff"},
{434,"434.txd","434.dff"},
{461,"461.txd","461.dff"},
{463,"463.txd","463.dff"},
{469,"469.txd","469.dff"},
{470,"470.txd","470.dff"},
{471,"471.txd","471.dff"},
{487,"487.txd","487.dff"},
{497,"497.txd","497.dff"},
{500,"500.txd","500.dff"},
{516,"516.txd","516.dff"},
{528,"528.txd","528.dff"},
{536,"536.txd","536.dff"},
{560,"560.txd","560.dff"},
{563,"563.txd","563.dff"},
{541,"541.txd","541.dff"},
{542,"542.txd","542.dff"},
{504,"504.txd","504.dff"},
{490,"490.txd","490.dff"}, 
{488,"488.txd","488.dff"},
{468,"468.txd","468.dff"},
{447,"447.txd","447.dff"},
{433,"433.txd","433.dff"},
{424,"424.txd","424.dff"},
{417,"417.txd","417.dff"},
{416,"416.txd","416.dff"},
{403,"403.txd","403.dff"},
{596,"596.txd","596.dff"},
{601,"601.txd","601.dff"},
{602,"602.txd","602.dff"}, 
{603,"603.txd","603.dff"},
}


function replaceModel()
for _, id in ipairs ( modelsR ) do
		txd = engineLoadTXD ( id[2])
        engineImportTXD ( txd, id[1] )
        
        dff = engineLoadDFF ( id[3], id[1] )
        engineReplaceModel ( dff, id[1] )


	end 
end
addEventHandler ( 'onClientResourceStart', getResourceRootElement(getThisResource()), replaceModel)

