
local happyRANDOM = {
{"Полная Фляга"},
{"Банка Макарон"},
{"Банка Бобов"},
{"Бургер"},
{"Пицца"},
{"Газированная Вода"},
{"Кола"},
{"Жареное Мясо"},
{"Жареная рыба"},
{"Большой сухой паёк"},
{"Маленький сухой паёк"},
{"Удочка"},
{"Снасти"},
{"Наживка"},
{"Аптечка"},
{"Мешок с частями зомби"},
{"Палатка"},
{"Большая палатка"},
{"Военный шлем 50%"},
{"Бронешлем 70%"},
{"Бронешлем 80%"},
{"Бронежилет 20%"},
{"Бронежилет 30%"},
{"Рюкзак КОММАНДЕР 80"},
{"Рюкзак СЛЕДОПЫТ 100"},
{"Рюкзак КОЛОРАДО 120"},
{"Рюкзак РУССКИЙ 140"},
{"Рюкзак САМУРАЙ 160"},
{"Сейф"},
{"Прибор Ночного Виденья"},
{"Инфракрасное Виденье"},
{"Карта"},
{"Навигатор"},
{"Инструменты"},
{"Отмычка"},

}
local gifts={
{"Mk 48 Mod 0",1},
{"KSVK",1},
{"G36C-SD",1},
{"M4A1 SD",1},
{"Деньги",500000},
{"M4A1 mag",400},
{"KSVK mag",200},
{"G36 mag",400},
{"M240 Belt",1000},
{"MAX_Slots",500},
}

function setGift(player)

for id, item in ipairs(happyRANDOM) do
local rgift = math.random(1,3)
if rgift ==2 then
local rvalue = math.random(1,5)
local elementsInPlayer= getElementData(player,item[1]) or 0
setElementData(player,item[1],elementsInPlayer+rvalue)
outputChatBox("Happy New Year! Gift: "..rvalue.."шт "..item[1],player)
end

end

for id, item in ipairs(gifts) do
local elementsInPlayer= getElementData(player,item[1]) or 0
setElementData(player,item[1],elementsInPlayer+item[2])
outputChatBox("Happy New Year! Gift: "..item[2].."шт "..item[1],player)
end
local sanki = exports.CarSpawner:CarSpawner ( player, "spawnCar", 571 )

setElementData(sanki,"owner",getAccountName(getPlayerAccount ( player )))
setElementData(sanki,"ownerNick",getPlayerName(player))
setElementData(sanki,"ownerSerial",getPlayerSerial(player))

setTimer( function() warpPedIntoVehicle(player,sanki) end,100,1)

end




addEventHandler("onResourceStart", resourceRoot, function()

executeSQLQuery("CREATE TABLE IF NOT EXISTS `happySerials` (`serial` TEXT)")

end)




function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function checkSerial()
local serial = getPlayerSerial(source)
local serialOK = executeSQLQuery("SELECT * FROM `happySerials` WHERE `serial` =?",tostring(serial))
if table.size(serialOK) >0 then -- такой сериал уже есть в базе
outputChatBox("You have already received your gift!",source,255,0,0)
else
setGift(source)
executeSQLQuery("INSERT INTO `happySerials`(`serial`) VALUES(?)", tostring(serial) )
end
end

addEvent("checkSerial", true)
addEventHandler("checkSerial", getRootElement(), checkSerial)