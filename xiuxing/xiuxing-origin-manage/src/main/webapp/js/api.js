//--added by danffliu
function getRootPath(){
	var strFullPath=window.document.location.href;
	var strPath=window.document.location.pathname;
	var pos=strFullPath.indexOf(strPath);
	var prePath=strFullPath.substring(0,pos);
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	return(prePath+postPath);
} 
//form对象直接转换为json var myformdata = $(“#myForm”).serializeObject();
$.fn.serializeObject = function()
{
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};

//operamasks-ui插件显示时间
window.showTimeOptions = {  
    dateFormat : "yy-mm-dd H:i",  
    showTime : true  
}; 
//改变时间   早中晚餐时间段选择
function changeTime(beginTime,endTime,value){
	var d = new Date();
	if($(beginTime).val() != ""){
		d = new Date(Date.parse($(beginTime).val().replace(/-/g,"/")));
	}
	d.setMinutes(0);
	if(value == 0){
		d.setHours(2);
		$(endTime).val(d.format("yyyy-MM-dd hh:mm"));
		d = new Date(d.getTime()-24*60*60*1000);
		d.setHours(22);
		$(beginTime).val(d.format("yyyy-MM-dd hh:mm"));
	}else if(value == 1){
		d.setHours(9);
		$(endTime).val(d.format("yyyy-MM-dd hh:mm"));
		d.setHours(3);
		$(beginTime).val(d.format("yyyy-MM-dd hh:mm"));
	}else if(value == 2){
		d.setHours(14);
		$(endTime).val(d.format("yyyy-MM-dd hh:mm"));
		d.setHours(10);
		$(beginTime).val(d.format("yyyy-MM-dd hh:mm"));
	}else if(value == 3){
		d.setHours(20);
		$(endTime).val(d.format("yyyy-MM-dd hh:mm"));
		d.setHours(16);
		$(beginTime).val(d.format("yyyy-MM-dd hh:mm"));
	}else if(value == 4){
		d.setHours(22);
		$(beginTime).val(d.format("yyyy-MM-dd hh:mm"));
		d = new Date(d.getTime()+24*60*60*1000);
		d.setHours(2);
		$(endTime).val(d.format("yyyy-MM-dd hh:mm"));
	}
}

//拼接html
function addrhtml(addr){
	var html = "";
	for(var i=0; i<addr.length; i++){
		if(i == 0){
			html += '<li class="areatid">'+
    					'<div class="factoryarea" onclick="areaclick(this)" nameid="'+addr[i].areaId+'">'+addr[i].areaName+'</div>'+
    					'<ul class="tidpos">'+
    						'<li onclick="addrclick(this)" valueid="'+addr[i].addrId+'">'+addr[i].addrName+'</li>';
		}else if(i != 0 && addr[i].areaId != addr[i-1].areaId){
			html += '</ul></li><li class="areatid">'+
    					'<div class="factoryarea" onclick="areaclick(this)" nameid="'+addr[i].areaId+'">'+addr[i].areaName+'</div>'+
    					'<ul class="tidpos">'+
    						'<li onclick="addrclick(this)" valueid="'+addr[i].addrId+'">'+addr[i].addrName+'</li>';
		}else if(i != 0 && addr[i].areaId == addr[i-1].areaId){
			html += '<li onclick="addrclick(this)" valueid="'+addr[i].addrId+'">'+addr[i].addrName+'</li>';
		}
	}
	html += '</ul></li>';
	return html;
}

//保存地址
window.addrdata = [];

//装机地址
function tidAddress(obj,b) {
	var id = "selectaddress-dialog-div"+new Date().getTime();
	if(!$(obj).siblings(".dialog").length > 0){
		var idhtml = '<input type="hidden" class="dialog" divid="'+id+'" />';
		$(obj).parent().append(idhtml);
		var selectaddresshtml = '<div id="'+id+'" style="display: none"><div class="selectaddress-dialog-div"><ul id="selectaddressul"></ul> </div></div>';
		$(obj).parent().parent().parent().parent().parent("form").parent().append(selectaddresshtml);
		if(addrdata.length == 0){
			$.ajax({
				type:"post",
				async: false,
				url:"/op-web/terminal/tradeTidAddress.do",
				data:{b:b},
				success:function(data){
					var addr = eval(data);
					addrdata = addr;
					$("#"+id+" #selectaddressul").append(addrhtml(addr));
				},
				error:function(error){
					console.error(error);
				}
			});
		}else{
			$("#"+id+" #selectaddressul").append(addrhtml(addrdata));
		}
		$(obj).parent().parent().siblings("tr").find("input[type='reset']").bind("click",function(){
			$(obj).siblings("#cleartidaddress").click();
		});
		
	}else{
		id = $(obj).siblings("input.dialog").attr("divid");
	}
	//初始默认选中
	if($(obj).text() != "点击选择"){
		var $div = $(obj).closest("body").find("#"+id);
		if($(obj).siblings("#areaId").val() != '' && $div.find(".selectarea").length == 0){
			$div.find("div.factoryarea[nameid='"+$(obj).siblings("#areaId").val()+"']").addClass("selectarea");
			if($(obj).siblings("#addrId").val() != '' && $div.find(".selectaddress").length == 0){
				$div.find("li[valueid='"+$(obj).siblings("#addrId").val()+"']").addClass("selectaddress");
			}
		}
	}
    var dialog = $(obj).closest("body").find("#"+id).omDialog({
        width: 800,
        height:450,
        autoOpen : false,
        modal : true,
        resizable : false,
        buttons : {
            "取消" : function() {
            	$(obj).closest("body").find("#"+id).omDialog("close");//关闭dialog
            }
        }
    });
    dialog.omDialog("option", "title", "交易地址");
    dialog.omDialog("open");//显示dialog
}

$(function(){
	//点击选择食堂
	window.addrclick = function(obj){
		if($(obj).is(".selectaddress")){
			return;
		}
		var $div = $(obj).parent().parent().parent().parent(".selectaddress-dialog-div");
		$div.find(".tidpos").children("li").each(function(){
			$(this).removeClass("selectaddress");
		});
		$(obj).addClass("selectaddress");
		if(!$(obj).parent().siblings("div.factoryarea").is(".selectarea")){
			$div.find(".factoryarea").each(function(){
				$(this).removeClass("selectarea");
			});
			$(obj).parent().siblings("div.factoryarea").addClass("selectarea");
		}
		var a = $div.find("li.selectaddress").attr("valueid");
		var b = $div.find("div.selectarea").attr("nameid");
		var c = $div.find("li.selectaddress").text();
		var d = $div.find("div.selectarea").text();
		var id = $div.parent("div").attr("id");
		var $dialog = $(obj).closest("body").find("input.dialog[divid='"+id+"']");
		$dialog.siblings("#spanaddrselect").text(d+" - "+c);
		$dialog.siblings("#areaId").val(b);
		$dialog.siblings("#addrId").val(a);
		$div.parent("div").omDialog("close");//关闭dialog
	};
	//清除地址
	window.cleartidaddress = function(obj){
		$(obj).siblings("span#spanaddrselect").text("点击选择");
		$(obj).siblings("#areaId").val("");
		$(obj).siblings("#addrId").val("");
		var id = $(obj).siblings("input.dialog").attr("divid");
		$(obj).closest("body").find("#"+id).find(".selectarea").removeClass("selectarea");
		$(obj).closest("body").find("#"+id).find(".selectaddress").removeClass("selectaddress");
	};
	//点击选择区域
	window.areaclick = function(obj){
		var $div = $(obj).parent().parent().parent(".selectaddress-dialog-div");
		$div.find(".factoryarea").each(function(){
			$(this).removeClass("selectarea");
		});
		$div.find(".tidpos").children("li").each(function(){
			$(this).removeClass("selectaddress");
		});
		$(obj).addClass("selectarea");
		var b = $div.find("div.selectarea").attr("nameid");
		var d = $div.find("div.selectarea").text();
		var id = $div.parent("div").attr("id");
		var $dialog = $(obj).closest("body").find("input.dialog[divid='"+id+"']");
		$dialog.siblings("#spanaddrselect").text(d);
		$dialog.siblings("#areaId").val(b);
		$dialog.siblings("#addrId").val("");
		$div.parent("div").omDialog("close");//关闭dialog
	};
});