
local modelsR = {
--[[
{402,"1hu1j1","lfkgjh2"},
{470,"if93gu1hu","uj1hyg3u1"},
{601,"1g0i93u","g381hiu"},
{424,"1ghiuHju1h","1g93h89u"},
{490,"i9u1gih1bgGY","1g839t5uhi1g1jh"}, 
{422,"1g38uhi1GB","1ig856hy78iu1b2"}, -- +
{433,"f1g31g1hUjw","13ghu81ihkj"},
{461,"1g3ihiu1uiijHB","1g83yhiui1gy"},
{463,"1g83uih1","1g38id1ujk"},
{487,"k921089g3uhu","90u2gih1ujb1"},
{488,"o20i1g90jJI","12jghiuhk1kjJ"},
{497,"g39i1ouj1u","fg32h4f111"},
{417,"18g5iuugi1ib","1j2huig1bkj"},
{403,"1u3gjinuIH","1gh3unjUBIY"},
{416,"1g3i90ujuo1juh","34ghi1byutfYGH"},
{528,"gih2iu13gfwwh","jhg3iuk1u7g7ugjf"}, -- +
{504,"qkog2jt531r678","1g39iu81hg"},
{536,"ji3ghui1g11yg","gu81hy187iu1"},
{542,"g93ujy8hig1","h38g1ui31"},
{468,"gk3j18y7huig1","g31u18y7g"},
{471,"u8y1g9t1u1h1h","g31hygb1ygf"},
{500,"g3h281ug1fyu1","g31h1igu1y1bhj"}, -- +
{469,"g18hui1g2gui","g1812u1b2igy"},
{447,"g31o1jh1u1gj1yhg2","g311ghi1u3u1y"},
{453,"3223y223tgrgf","4terf345"}, 
{563,"g1318hi3iuh3ijk","g181ui1ug12"}, 
{428,"3g81ji1iu1h22j2","g13h1u1gi21j"},
{519,"89gh2i3hg2hg","23g82h3joi23g"}, 
{541,"ehh43h34rfef","445h4454g5rgfr"},
{596,"g3hyhjbg1jy12bh","g3gh2ug33uh3guh"},
{602,"wje89iojiegh","gu4h3ig34gh"}, 
{603,"823g2jg3g7283h2oijg","32g7h98gj327g8hu23g"},
{411,"7ghy34ujih2gu","3287yhji88g273gh"},
{516,"234y98h23g","1i28r27t1ht"}, -- забрать
{560,"3g23g23gt23g2g","adawdawda1212f12"}, -- забрать добавить
{434,"274ghuji332f3","g723huji2hgji3g3h3i"}, -- забрать добавить
]]
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

