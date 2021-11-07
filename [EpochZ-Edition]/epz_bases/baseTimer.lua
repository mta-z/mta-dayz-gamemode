local allowed = { { 48, 57 }, { 65, 90 }, { 97, 122 } } -- numbers/lowercase chars/uppercase chars

function generateString ( len )
    
    if tonumber ( len ) then
        math.randomseed ( getTickCount () )

        local str = ""
        for i = 1, len do
            local charlist = allowed[math.random ( 1, 3 )]
            str = str .. string.char ( math.random ( charlist[1], charlist[2] ) )
        end

        return str
    end
    
    return false
    
end

function getDate()

local time = getRealTime()


 time.month=time.month+1
 if time.month < 9 then
time.month= "0"..time.month
end
if time.monthday < 9 then
time.monthday= "0"..time.monthday
end
	return (time.year+1900).."-"..time.month.."-"..time.monthday
	
	
end




function checkBaseTimer()
	local time = getRealTime()
	if time.hour>3 and time.hour<5 then
		local date = getDate()

		for i = 0, 24 do
		local base = xmlFindChild( config,"base"..i,0) or false
		local dateNode = xmlFindChild( base,"DATE",0)
		local dateValue = xmlNodeGetValue ( dateNode )  
		--outputChatBox(dateValue)
			if dateValue ==date then
			local newPass = generateString ( 10 )
			
			
				local bases = xmlNodeGetChildren(base)
				for theKey,baseNode in ipairs(bases) do
				
				local txmlTag = xmlNodeGetName(baseNode);
				local xmlValue = xmlNodeGetValue(baseNode);
					if txmlTag =="DATE" then
					setValues("DATE","base"..i," vazio limpo")
					elseif txmlTag =="GANG" then
					setValues("GANG","base"..i,"ADMIN")
					elseif txmlTag =="OP" then
					setValues("OP","base"..i,newPass.."OP")
					elseif txmlTag =="CL" then
					setValues("CL","base"..i,newPass.."CL")
					elseif txmlTag =="vOP" then
					setValues("vOP","base"..i,newPass.."vOP")
					elseif txmlTag =="vCL" then
					setValues("vCL","base"..i,newPass.."vCL")
					end

				end
			local carsRemoved = destroyAllCar("base"..i)
			local removedTents = removeTentsWeb ("base"..i)
			local debud = "Base №"..(i+1).." terminou e foi substituído na data: "..date.." "..removedTents.." carros explodidos : "..carsRemoved.."\r\n"
			outputDebugString(debud)
			exports.epz_logs:setLog(debud,"bases")
			end


		end

	end
end
setTimer(checkBaseTimer,3600000,0) --3600000