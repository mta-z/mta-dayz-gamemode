
function dxGetTextHeight(sText)	 
	 sLength = 0 
for k, v in string.gmatch  (sText, "(\r?\n)") do
           sLength =sLength+1
         end
		 
return sLength
		
end
