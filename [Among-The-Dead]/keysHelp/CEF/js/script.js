
function spoiler(elem){
    $(elem).parent().children('.spoiler-body').slideToggle();
}



function setSetting(eventName,elem){
	mta.triggerEvent(eventName,elem.value);
	if (eventName=="selectTextureQ"){
		$("#warn")[0].style.display="block";
	}
}


function selectPrcl(aim, element){
	var aims  = $("#prcl img").get();
	for(var i =0;i<aims.length;i++){
		if (aims[i].name==aim){
			aims[i].className="aim selected";
		}else{
			aims[i].className="aim";
			
		}
	}
	if (element){
	mta.triggerEvent("selectAIM",aim);
	}
}

function loadSettings(){

	mta.triggerEvent("loadSettings");	
	
}

function onLoadSettings(json){
var settings = JSON.parse(json)

for (var k in settings){
	//console.log(k)
	var setting = $("."+k);
	for (var i=0;i<setting.length;i++){
		if (k =="aim"){
		setting[i].className="aim";
		var name = setting[i].name;
		if (name == settings[k] ){
			setting[i].className="aim selected";
			break
		}
		}else{
		
			var value = setting[i].value;
			//if(value =="noShow" && setting[i].checked ){break}
			
			if (value == settings[k] ){
				setting[i].checked=true;
				break
			}else{
				setting[i].checked=false;
			}
		}
	}
}

}