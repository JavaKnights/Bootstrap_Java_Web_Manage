Date.prototype.format = function(format) //author: meizz
{ 
  var o = {
    "M+" : this.getMonth()+1, //month
    "d+" : this.getDate(),    //day
    "h+" : this.getHours(),   //hour
    "m+" : this.getMinutes(), //minute
    "s+" : this.getSeconds(), //second
    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
    "S" : this.getMilliseconds() //millisecond
  }
  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
    (this.getFullYear()+"").substr(4 - RegExp.$1.length));
  for(var k in o)if(new RegExp("("+ k +")").test(format))
    format = format.replace(RegExp.$1,
      RegExp.$1.length==1 ? o[k] :
        ("00"+ o[k]).substr((""+ o[k]).length));
  return format;
} 

Date.prototype.dateAdd = function(strInterval, Number) {  
    var dtTmp = this;   
    switch (strInterval) {    
        case 's' :return new Date(Date.parse(dtTmp) + (1000 * Number));  
        case 'n' :return new Date(Date.parse(dtTmp) + (60000 * Number));   
        case 'h' :return new Date(Date.parse(dtTmp) + (3600000 * Number));  
        case 'd' :return new Date(Date.parse(dtTmp) + (86400000 * Number));   
        case 'w' :return new Date(Date.parse(dtTmp) + ((86400000 * 7) * Number)); 
        case 'q' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number*3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());  
        case 'm' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());   
        case 'y' :return new Date((dtTmp.getFullYear() + Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());   
    }   
}  
//字符串转日期格式yyyy/MM/dd yyyy-MM-dd
function StringToDate(DateStr){    
    var converted = Date.parse(DateStr);  
    var myDate = new Date(converted);   
    if (isNaN(myDate)) {    
        var arys= DateStr.split('-');   
        myDate = new Date(arys[0],--arys[1],arys[2]);   
    }   
    return myDate;   
}  

//银行卡号格式化
var cardNO = function(value,obj,row){
	return value.replace(/(?=(?:\d{4})+(?!\d))/g,' ');
}
//格式化金额
var fmoney = function(s,obj,row){
   s = s/100;
   n = 2;  
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
   var l = s.split(".")[0].split("").reverse(),  
   r = s.split(".")[1];  
   t = "";  
   for(var i = 0; i < l.length; i ++ )  
   {  
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
   }  
   return "￥"+t.split("").reverse().join("") + "." + r;  
}  
//格式化金额
var money = function(s,obj,row){ 
   s = s/100;
   n = 2;  
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
   var l = s.split(".")[0].split("").reverse(),  
   r = s.split(".")[1];  
   t = "";  
   for(var i = 0; i < l.length; i ++ )  
   {  
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
   }  
   var forma = t.split("").reverse().join("") + "." + r;
   var formb;
   if(forma.substring(0,1)=="-"){
	   if(forma.substring(1,2)==","){
		   formb = forma.substring(2, forma.length);
		   return "-"+formb;
	   }else{
		   return forma; 
	   }
	   
   }else{
	   return forma;  
   } 
}
//格式化金额
var fmoney_1 = function (cellvalue,p,row){
    if(cellvalue != null && cellvalue != ""){
   	   return fmoney(cellvalue,p,row);
    }else{
 	   return "";
    }
 }
 
var to_date_hms = function (s,obj,row){
	if(s==null){
		return "";
	}
	return new Date(s).format("yyyy-MM-dd hh:mm:ss");
}

var to_hms = function (s,obj,row){
	if(s==null){
		return "";
	}
	return new Date(s).format("hh:mm:ss");
}

var to_format = function (s,obj,row){
	if(s==null){
		return "";
	}
	return s;
}

var to_date = function (s,obj,row){
	if(s==null){
		return "";
	}
	return new Date(s).format("yyyy-MM-dd");
}

function digit_uppercase(n) {
    var fraction = ['角', '分'];
    var digit = [
        '零', '壹', '贰', '叁', '肆',
        '伍', '陆', '柒', '捌', '玖'
    ];
    var unit = [
        ['元', '万', '亿'],
        ['', '拾', '佰', '仟']
    ];
    var head = n < 0? '负': '';
    n = Math.abs(n);

    var s = '';

    for (var i = 0; i < fraction.length; i++) {
        s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
    }
    s = s || '整';
    n = Math.floor(n);

    for (var i = 0; i < unit[0].length && n > 0; i++) {
        var p = '';
        for (var j = 0; j < unit[1].length && n > 0; j++) {
            p = digit[n % 10] + unit[1][j] + p;
            n = Math.floor(n / 10);
        }
        s = p.replace(/(零.)*零$/, '')
             .replace(/^$/, '零')
          + unit[0][i] + s;
    }
    return head + s.replace(/(零.)*零元/, '元').replace(/(零.)+/g, '零').replace(/^整$/, '零元整');
};

/**
 * 卡号格式化
 */
var cardFormat = function(cardNo){
	if(!cardNo) {
		return '';
	}
	var no = [], start = 0, len = cardNo.length-4;
	while(start <= len) {
		no.push(cardNo.substring(start, start+4));
		no.push('&nbsp;');
		start += 4;
	}
	return no.join('');
};

var checkIdCard = function(idcard){
		var area = {11 : "北京", 12 : "天津", 13 : "河北", 14 : "山西", 15 : "内蒙古", 21 : "辽宁", 22 : "吉林",  
	            23 : "黑龙江", 31 : "上海", 32 : "江苏", 33 : "浙江", 34 : "安徽", 35 : "福建", 36 : "江西",   
	            37 : "山东", 41 : "河南", 42 : "湖北", 43 : "湖南", 44 : "广东", 45 : "广西", 46 : "海南",  
	            50 : "重庆", 51 : "四川", 52 : "贵州", 53 : "云南", 54 : "西藏", 61 : "陕西", 62 : "甘肃",  
	            63 : "青海", 64 : "宁夏", 65 : "新疆", 71 : "台湾", 81 : "香港", 82 : "澳门", 91 : "国外" };
		var result = new Array("0", "身份证长度必须为15或18位!", "身份证出生日期超出范围或含有非法字符!",  
		    "身份证校验位错误!", "身份证地区非法!");  
		var  Y, JYM;  
		var S, M;  
		var idcard_array = new Array();  
		idcard_array = idcard.split("");  
		// 地区检验  
		if (area[parseInt(idcard.substr(0, 2))] == null)  
		return result[4];  
		// 身份号码位数及格式检验  
		switch (idcard.length) {  
		case 15 :  
		    if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0  
		            || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900)% 4 == 0)) {  
		        ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;  
		        // 测试出生日期的合法性  
		    } else {  
		        ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;  
		        // 测试出生日期的合法性  
		    }  
		    if (ereg.test(idcard))  
		        return result[0];  
		    else {  
		        return result[2];  
		    }  
		    break;  
		case 18 :  
		    // 18位身份号码检测  
		    // 出生日期的合法性检查  
		    // 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))  
		    // 平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))  
		    if (parseInt(idcard.substr(6, 4)) % 4 == 0  
		            || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4))% 4 == 0)) {  
		        ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式  
		    } else {  
		        ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式  
		    }  
		    if (ereg.test(idcard)) {// 测试出生日期的合法性  
		    // 计算校验位  
		        S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10]))* 7  
		            + (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))* 9  
		            + (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))* 10  
		            + (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))* 5  
		            + (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))* 8  
		            + (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))* 4  
		            + (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))* 2  
		            + parseInt(idcard_array[7]) * 1  
		            + parseInt(idcard_array[8]) * 6  
		            + parseInt(idcard_array[9]) * 3;  
		        Y = S % 11;  
		        M = "F";  
		        JYM = "10X98765432";  
		        M = JYM.substr(Y, 1);// 判断校验位  
		        if (M == idcard_array[17].toUpperCase())  
		            return result[0]; // 检测ID的校验位  
		        else  
		            return result[3];  
		    } else  
		        return result[2];  
		    break;  
		default :  
		    return result[1];  
		    break;  
		}  
};

/*
 * MAP对象，实现MAP功能
 *
 * 接口：
 * size()     获取MAP元素个数
 * isEmpty()    判断MAP是否为空
 * clear()     删除MAP所有元素
 * put(key, value)   向MAP中增加元素（key, value) 
 * remove(key)    删除指定KEY的元素，成功返回True，失败返回False
 * get(key)    获取指定KEY的元素值VALUE，失败返回NULL
 * element(index)   获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
 * containsKey(key)  判断MAP中是否含有指定KEY的元素
 * containsValue(value) 判断MAP中是否含有指定VALUE的元素
 * values()    获取MAP中所有VALUE的数组（ARRAY）
 * keys()     获取MAP中所有KEY的数组（ARRAY）
 *
 * 例子：
 * var map = new Map();
 *
 * map.put("key", "value");
 * var val = map.get("key")
 * ……
 *
 */
function Map() {
	this.elements = new Array();

	//获取MAP元素个数
	this.size = function() {
		return this.elements.length;
	}

	//判断MAP是否为空
	this.isEmpty = function() {
		return (this.elements.length < 1);
	}

	//删除MAP所有元素
	this.clear = function() {
		this.elements = new Array();
	}

	//向MAP中增加元素（key, value) 
	this.put = function(_key, _value) {
		this.elements.push( {
			key : _key,
			value : _value
		});
	}

	//删除指定KEY的元素，成功返回True，失败返回False
	this.remove = function(_key) {
		var bln = false;
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].key == _key) {
					this.elements.splice(i, 1);
					return true;
				}
			}
		} catch (e) {
			bln = false;
		}
		return bln;
	}

	//获取指定KEY的元素值VALUE，失败返回NULL
	this.get = function(_key) {
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].key == _key) {
					return this.elements[i].value;
				}
			}
		} catch (e) {
			return null;
		}
	}

	//获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
	this.element = function(_index) {
		if (_index < 0 || _index >= this.elements.length) {
			return null;
		}
		return this.elements[_index];
	}

	//判断MAP中是否含有指定KEY的元素
	this.containsKey = function(_key) {
		var bln = false;
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].key == _key) {
					bln = true;
				}
			}
		} catch (e) {
			bln = false;
		}
		return bln;
	}

	//判断MAP中是否含有指定VALUE的元素
	this.containsValue = function(_value) {
		var bln = false;
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].value == _value) {
					bln = true;
				}
			}
		} catch (e) {
			bln = false;
		}
		return bln;
	}

	//获取MAP中所有VALUE的数组（ARRAY）
	this.values = function() {
		var arr = new Array();
		for (i = 0; i < this.elements.length; i++) {
			arr.push(this.elements[i].value);
		}
		return arr;
	}

	//获取MAP中所有KEY的数组（ARRAY）
	this.keys = function() {
		var arr = new Array();
		for (i = 0; i < this.elements.length; i++) {
			arr.push(this.elements[i].key);
		}
		return arr;
	}
}
//-----------------------------------------------------
var statusMap = new Map();
//---------交易状态--------------------------------------
statusMap.put("BusinessStatus_INIT", "交易创建");
statusMap.put("BusinessStatus_TRADING", "交易处理中");
statusMap.put("BusinessStatus_AUDITING", "已受理");
statusMap.put("BusinessStatus_TRADE_SUCCESS", "交易成功");
statusMap.put("BusinessStatus_TRADE_FAILURE", "交易失败");
statusMap.put("BusinessStatus_TRADE_CLOSED", "交易关闭");
//---------交易类型--------------------------------------
statusMap.put("BusinessType_CSE_PAY", "消费");
statusMap.put("BusinessType_CSE_CANCEL", "消费撤销");
statusMap.put("BusinessType_RGE_CASH", "现金充值");
statusMap.put("BusinessType_RGE_CASHCEL", "现金充值撤销");
statusMap.put("BusinessType_RGE_MOBILE", "快捷充值");
statusMap.put("BusinessType_RGE_POSBANK", "POS银行卡充值");
statusMap.put("BusinessType_TRS_ACCT", "转账");
statusMap.put("BusinessType_ST_SETTLE", "结算金额");
statusMap.put("BusinessType_ST_FEE", "手续费"); 
//---------卡类型--------------------------------------
statusMap.put("CardType_10", "通用型个人卡");
statusMap.put("CardType_20", "充值卡");
statusMap.put("CardType_40", "通用型公务卡");
statusMap.put("CardType_96", "富通卡");
statusMap.put("CardType_98", "富钱包");
statusMap.put("CardType_99", "富通卡/富钱包");
//---------活动类型--------------------------------------
statusMap.put("ActivityType_LIMIT_DISCOUNT", "限时折扣");
statusMap.put("ActivityType_REACH_REDUCTION", "满就减");
statusMap.put("ActivityType_PLACES_DISCOUNT", "名次折");
//---------活动状态--------------------------------------
statusMap.put("ActivityStatus_AUDITING", "审核中");
statusMap.put("ActivityStatus_EFFECTIVE", "生效中");
statusMap.put("ActivityStatus_SUSPEND", "暂停");
statusMap.put("ActivityStatus_EXPIRED", "过期");
statusMap.put("ActivityStatus_CANCEL", "取消");
//---------活动申请状态--------------------------------------
statusMap.put("ApplyStatus_CREATE", "新建");
statusMap.put("ApplyStatus_SUSPEND", "暂停");
statusMap.put("ApplyStatus_RESUME", "恢复");
statusMap.put("ApplyStatus_CANCEL", "取消");
//---------区域--------------------------------------
statusMap.put("CardArea_01", "龙华厂区");
statusMap.put("CardArea_02", "观澜厂区");
statusMap.put("CardArea_03", "富葵厂区");
statusMap.put("CardArea_04", "大浪厂区");
statusMap.put("CardArea_05", "宝科厂区");
statusMap.put("CardArea_06", "鸿观厂区");
statusMap.put("CardArea_07", "松岗厂区");
statusMap.put("CardArea_08", "石岩厂区");
statusMap.put("CardArea_09", "黄田厂区");
statusMap.put("CardArea_10", "佛山厂区");
statusMap.put("CardArea_11", "惠州厂区");
statusMap.put("CardArea_12", "中山厂区");
statusMap.put("CardArea_13", "南宁厂区");
statusMap.put("CardArea_14", "长沙厂区");
statusMap.put("CardArea_15", "衡阳厂区");
statusMap.put("CardArea_16", "武汉厂区");
statusMap.put("CardArea_17", "丰城厂区");
statusMap.put("CardArea_18", "郑州厂区");
statusMap.put("CardArea_19", "南阳厂区");
statusMap.put("CardArea_20", "济源厂区");
statusMap.put("CardArea_21", "松江厂区");
statusMap.put("CardArea_22", "昆山厂区");
statusMap.put("CardArea_23", "吴淞江厂区");
statusMap.put("CardArea_24", "南京厂区");
statusMap.put("CardArea_25", "常熟厂区");
statusMap.put("CardArea_26", "淮安厂区");
statusMap.put("CardArea_27", "杭州厂区");
statusMap.put("CardArea_28", "嘉善厂区");
statusMap.put("CardArea_29", "厦门厂区");
statusMap.put("CardArea_30", "北富厂区");
statusMap.put("CardArea_31", "天津厂区");
statusMap.put("CardArea_32", "廊坊厂区");
statusMap.put("CardArea_33", "秦皇岛厂区");
statusMap.put("CardArea_34", "太原厂区");
statusMap.put("CardArea_35", "晋城厂区");
statusMap.put("CardArea_36", "烟台厂区");
statusMap.put("CardArea_37", "营口厂区");
statusMap.put("CardArea_38", "良田厂区");
statusMap.put("CardArea_39", "沈阳厂区");
statusMap.put("CardArea_40", "成都厂区");
statusMap.put("CardArea_41", "重庆厂区");
statusMap.put("CardArea_42", "贵阳厂区");
//系统类型
statusMap.put("sysType_ALL", "全部"); 
statusMap.put("sysType_ANDROID", "安卓"); 
statusMap.put("sysType_IOS", "IOS"); 
//发送类型
statusMap.put("sendType_ALL", "所有人"); 
statusMap.put("sendType_SINGLE", "单人"); 
//APP类型
statusMap.put("appType_FZF", "富支付"); 
statusMap.put("appType_SST", "随手淘"); 

//运营用户状态
statusMap.put("operator_0", "禁用");
statusMap.put("operator_1", "启用");
statusMap.put("operator_2", "条件启用");

//预充值状态
statusMap.put("PreStatus_INIT", "初始化");
statusMap.put("PreStatus_SUCCESS", "成功");
statusMap.put("PreStatus_FAIL", "驳回");


//话费充值状态
statusMap.put("RechargeStatus_INITIAL", "创建");
statusMap.put("RechargeStatus_PAYED", "支付成功");
statusMap.put("RechargeStatus_RECHARGING", "充值中");
statusMap.put("RechargeStatus_SUCCESS", "充值成功");
statusMap.put("RechargeStatus_FAILED", "充值失败");
statusMap.put("RechargeStatus_MANUALRECHARGE", "人工充值");
statusMap.put("RechargeStatus_CLOSE", "已关闭"); 
statusMap.put("RechargeStatus_ERROR", "异常"); 
statusMap.put("RechargeStatus_PART_SUCCESS", "部分充值成功"); 
statusMap.put("RechargeStatus_RECHARG_HANDLE", "充值处理中");
// 支付状态
statusMap.put("PayStatus_PROCESSING", "交易处理中"); 
statusMap.put("PayStatus_SUCCESS", "交易成功"); 
statusMap.put("PayStatus_FAILURE", "交易失败"); 
statusMap.put("PayStatus_CLOSED", "交易关闭"); 

//团购交易状态
statusMap.put("GroupTradeStatus_INITIAL", "初始化");
statusMap.put("GroupTradeStatus_PAYED", "已消费");
statusMap.put("GroupTradeStatus_SUCCESS", "支付成功");
statusMap.put("GroupTradeStatus_FAILED", "支付失败");
statusMap.put("GroupTradeStatus_CLOSE", "交易关闭"); 

//团购商品状态
statusMap.put("GroupGoodsStatus_INIT", "未上架");
statusMap.put("GroupGoodsStatus_PUTAWAY", "上架");
statusMap.put("GroupGoodsStatus_SOLD_OUT", "已下架");

//二手商品状态
statusMap.put("ShGoodsStatus_PUTAWAY", "上架");
statusMap.put("ShGoodsStatus_SOLD_OUT", "已下架");
statusMap.put("ShGoodsStatus_UNVALID", "已失效");

//彩种
statusMap.put("LotteryType_ssq", "双色球");
statusMap.put("LotteryType_cjdlt", "大乐透");
statusMap.put("LotteryType_fc3d", "福3D");
statusMap.put("LotteryType_pl3", "排列三");
statusMap.put("LotteryType_pl5", "排列五");
statusMap.put("LotteryType_qxc", "七星彩");
statusMap.put("LotteryType_qlc", "七乐彩");

// 证件类型
statusMap.put("CertType_I_CARD", "身份证");
statusMap.put("CertType_O_CERT", "军官证");
statusMap.put("CertType_PASSPORT", "护照");
statusMap.put("CertType_TW_CEP", "台胞证");
statusMap.put("CertType_HK_M_RMP", "港澳居民来往内地通行证");
statusMap.put("CertType_HK_M_PASS", "港澳通行证");

// 结算状态
statusMap.put("SettleStatus_INSETTLE", "结算中");
statusMap.put("SettleStatus_COMPLETED", "已完成");

// 结算周期
statusMap.put("SettlePeriodType_DAYS", "按日结");
statusMap.put("SettlePeriodType_HMONTH", "半月结");
statusMap.put("SettlePeriodType_WEEK", "周结");
statusMap.put("SettlePeriodType_MONTH", "月结");

// 离线交易类型
statusMap.put("OfflineTradeType_CSE_PAY", "消费");
statusMap.put("OfflineTradeType_CSE_REFUND", "退款");
statusMap.put("OfflineTradeType_RGE_POS", "银行卡充值");
statusMap.put("OfflineTradeType_RGE_ACCOUNT", "余额充值");
statusMap.put("OfflineTradeType_RGE_MOBILE", "快捷充值");
statusMap.put("OfflineTradeType_RTN_CARD", "退卡");

// 系统名称
statusMap.put("SystemAliasName_cc", "配置中心");
statusMap.put("SystemAliasName_account", "账户系统");
statusMap.put("SystemAliasName_ms", "会员系统");
statusMap.put("SystemAliasName_msg", "沟通中心");
statusMap.put("SystemAliasName_op", "运营管理平台");
statusMap.put("SystemAliasName_pc", "预付卡系统");
statusMap.put("SystemAliasName_ord", "订单系统");
statusMap.put("SystemAliasName_mkt", "营销系统");
statusMap.put("SystemAliasName_pp", "前置服务系统");
statusMap.put("SystemAliasName_st", "结算系统");
statusMap.put("SystemAliasName_rs", "实时统计中心");
statusMap.put("SystemAliasName_bg", "银行网关系统");
statusMap.put("SystemAliasName_fpay", "商户平台");
statusMap.put("SystemAliasName_fl", "富生活");
statusMap.put("SystemAliasName_wt", "钱包交易系统");

//---------银行渠道--------------------------------------
statusMap.put("BankChannel_B2C", "网银");
statusMap.put("BankChannel_B2E", "银企直联");
statusMap.put("BankChannel_QPAY", "快捷支付");
//---------来源渠道--------------------------------------
statusMap.put("SourceChannel_WEB", "浏览器");
statusMap.put("SourceChannel_WAP", "移动终端");
//---------收单状态--------------------------------------
statusMap.put("CollectStatus_INIT", "新建");
statusMap.put("CollectStatus_RECEIVED", "已受理");
statusMap.put("CollectStatus_REJECT", "受理被拒");
statusMap.put("CollectStatus_SUCCESS", "交易成功");
statusMap.put("CollectStatus_FAILURE", "交易失败");
statusMap.put("CollectStatus_UNKOWN", "未知异常");
statusMap.put("CollectStatus_SIGNFAIL", "签名失败");
statusMap.put("CollectStatus_CLOSED", "已关闭");
//---------银行编码--------------------------------------
statusMap.put("BankCode_ICBC", "工商银行");
statusMap.put("BankCode_CMB", "招商银行");
statusMap.put("BankCode_CMBC", "民生银行");
statusMap.put("BankCode_CCB", "建设银行");
statusMap.put("BankCode_BOC", "中国银行");
statusMap.put("BankCode_PBC", "中国人民银行");
statusMap.put("BankCode_ABC", "农业银行");
statusMap.put("BankCode_PAB", "平安银行");
statusMap.put("BankCode_PAPAY", "平安付");
statusMap.put("BankCode_BOCM", "交通银行");
statusMap.put("BankCode_CEB", "光大银行");
statusMap.put("BankCode_CITIC", "中信银行");
statusMap.put("BankCode_CGB", "广发银行");
statusMap.put("BankCode_BOB", "北京银行");
statusMap.put("BankCode_SPDB", "浦发银行");
statusMap.put("BankCode_PSBC", "邮政银行");
statusMap.put("BankCode_CIB", "兴业银行");
statusMap.put("BankCode_SDB", "深圳发展银行");
statusMap.put("BankCode_CDB", "国家开发银行");
statusMap.put("BankCode_HSBC", "汇丰银行");
statusMap.put("BankCode_HXB", "华夏银行");
statusMap.put("BankCode_EIBC", "中国进出口银行");
statusMap.put("BankCode_ADBC", "中国农业发展银行");
statusMap.put("BankCode_ALIPAY", "支付宝");
statusMap.put("BankCode_YEEPAY", "易宝支付");
statusMap.put("BankCode_TFTPAY", "腾付通");
statusMap.put("BankCode_YSEPAY", "银盛支付");
statusMap.put("BankCode_UPOP", "银联在线");
statusMap.put("BankCode_UNIONPAY", "银联");
statusMap.put("BankCode_EBCL", "恒丰银行");
statusMap.put("BankCode_LYCB", "临沂商业银行");
statusMap.put("BankCode_CZSB", "浙商银行");
statusMap.put("BankCode_BOHC", "渤海银行");
statusMap.put("BankCode_CTSH", "花旗银行(中国)有限公司");
statusMap.put("BankCode_BEAI", "东亚银行中国有限公司");
statusMap.put("BankCode_SCB", "渣打银行中国有限公司");
statusMap.put("BankCode_DBSC", "星展银行");
statusMap.put("BankCode_HSSH", "恒生银行");
statusMap.put("BankCode_WB", "友利银行(中国)有限公司");
statusMap.put("BankCode_SHBC", "新韩银行");
statusMap.put("BankCode_HNBK", "韩亚银行（中国）");
statusMap.put("BankCode_OCBS", "华侨银行（中国）"); 
statusMap.put("BankCode_WHBC", "永亨银行（中国）有限公司");
statusMap.put("BankCode_NCBC", "南洋商业银行（中国）");
statusMap.put("BankCode_SG", "法国兴业银行（中国）");
statusMap.put("BankCode_UOBS", "大华银行（中国）"); 
statusMap.put("BankCode_DSSZ", "大新银行（中国）"); 
statusMap.put("BankCode_IBK", "企业银行（中国）");
statusMap.put("BankCode_BKSH", "上海银行");
statusMap.put("BankCode_XMB", "厦门银行股份有限公司");
statusMap.put("BankCode_FJHXB", "福建海峡银行股份有限公司");
statusMap.put("BankCode_JLB", "吉林银行");
statusMap.put("BankCode_ZJCB", "镇江市商业银行");
statusMap.put("BankCode_BONB", "宁波银行");
statusMap.put("BankCode_JZCB", "焦作市商业银行");
statusMap.put("BankCode_WZB", "温州银行");
statusMap.put("BankCode_BOGZ", "广州银行股份有限公司");
statusMap.put("BankCode_HKB", "汉口银行");
statusMap.put("BankCode_LJB", "龙江银行股份有限公司");
statusMap.put("BankCode_SJB", "盛京银行");
statusMap.put("BankCode_BOLY", "洛阳银行");
statusMap.put("BankCode_LYB", "辽阳银行股份有限公司");
statusMap.put("BankCode_DLB", "大连银行");
statusMap.put("BankCode_SZCB", "苏州市商业银行");
statusMap.put("BankCode_BOHB", "河北银行股份有限公司");
statusMap.put("BankCode_HZCCB", "杭州商业银行");
statusMap.put("BankCode_NJB", "南京银行");
statusMap.put("BankCode_DGCB", "东莞市商业银行");
statusMap.put("BankCode_JHB", "金华银行股份有限公司");
statusMap.put("BankCode_UQCB", "乌鲁木齐市商业银行");
statusMap.put("BankCode_SXB", "绍兴银行股份有限公司");
statusMap.put("BankCode_CDCCB", "成都商业银行");
statusMap.put("BankCode_FSB", "抚顺银行股份有限公司");
statusMap.put("BankCode_YCCCB", "宜昌市商业银行");
statusMap.put("BankCode_HLDCB", "葫芦岛市商业银行");
statusMap.put("BankCode_TJCB", "天津市商业银行");
statusMap.put("BankCode_ZZB", "郑州银行股份有限公司");
statusMap.put("BankCode_NXB", "宁夏银行");
statusMap.put("BankCode_ZHHRB", "珠海华润银行股份有限公司");
statusMap.put("BankCode_QSB", "齐商银行");
statusMap.put("BankCode_BOJZ", "锦州银行股份有限公司");
statusMap.put("BankCode_HSHB", "徽商银行");
statusMap.put("BankCode_CQB", "重庆银行");
statusMap.put("BankCode_HRBB", "哈尔滨银行");
statusMap.put("BankCode_GYB", "贵阳银行股份有限公司");
statusMap.put("BankCode_XAB", "西安银行股份有限公司");
statusMap.put("BankCode_WXCB", "无锡市商业银行");
statusMap.put("BankCode_DDB", "丹东银行股份有限公司");
statusMap.put("BankCode_BOLZ", "兰州银行");
statusMap.put("BankCode_BONC", "南昌银行");
statusMap.put("BankCode_JSB", "晋商银行");
statusMap.put("BankCode_QDB", "青岛银行");
statusMap.put("BankCode_JLCB", "吉林市商业银行");
statusMap.put("BankCode_NTCB", "南通商业银行");
statusMap.put("BankCode_JJB", "九江银行股份有限公司");
statusMap.put("BankCode_ASB", "鞍山银行");
statusMap.put("BankCode_QHDCB", "秦皇岛市商业银行");
statusMap.put("BankCode_QHB", "青海银行");
statusMap.put("BankCode_TZB", "台州银行");
statusMap.put("BankCode_YCCB", "盐城商行");
statusMap.put("BankCode_CSB", "长沙银行股份有限公司");
statusMap.put("BankCode_GZB", "赣州银行股份有限公司");
statusMap.put("BankCode_QZB", "泉州银行");
statusMap.put("BankCode_YKCB", "营口市商业银行");
statusMap.put("BankCode_KMCB", "昆明商业银行");
statusMap.put("BankCode_FXB", "阜新银行股份有限公司");
statusMap.put("BankCode_JXCB", "嘉兴市商业银行");
statusMap.put("BankCode_LFB", "廊坊银行");
statusMap.put("BankCode_TLCB", "泰隆城市信用社");
statusMap.put("BankCode_IMB", "内蒙古银行");
statusMap.put("BankCode_HZCB", "湖州市商业银行");
statusMap.put("BankCode_CZB", "沧州银行");
statusMap.put("BankCode_NNCB", "南宁市商业银行");
statusMap.put("BankCode_BSB", "包商银行");
statusMap.put("BankCode_LYGCB", "连云港市商业银行");
statusMap.put("BankCode_WHCB", "威海商业银行");
statusMap.put("BankCode_PZHCB", "攀枝花市商业银行");
statusMap.put("BankCode_MYCB", "绵阳市商业银行");
statusMap.put("BankCode_LZCB", "泸州市商业银行");
statusMap.put("BankCode_DTCB", "大同市商业银行");
statusMap.put("BankCode_SMXB", "三门峡银行");
statusMap.put("BankCode_GDNYB", "广东南粤银行");
statusMap.put("BankCode_ZJKCB", "张家口市商业银行");
statusMap.put("BankCode_GLCB", "桂林市商业银行");
statusMap.put("BankCode_JSCJCB", "江苏长江商业银行");
statusMap.put("BankCode_XZCB", "徐州市商业银行");
statusMap.put("BankCode_LZB", "柳州银行股份有限公司");
statusMap.put("BankCode_NCCB", "南充市商业银行");
statusMap.put("BankCode_LWB", "莱芜银行");
statusMap.put("BankCode_BODY", "德阳银行");
statusMap.put("BankCode_TSCB", "唐山市商业银行");
statusMap.put("BankCode_LPSCB", "六盘水商行");
statusMap.put("BankCode_QJCB", "曲靖市商业银行");
statusMap.put("BankCode_JCB", "晋城银行股份有限公司");
statusMap.put("BankCode_BOJS", "江苏银行");
statusMap.put("BankCode_CZCB", "长治市商业银行");
statusMap.put("BankCode_CDCB", "承德市商业银行");
statusMap.put("BankCode_DZB", "德州银行");
statusMap.put("BankCode_ZYCB", "遵义市商业银行");
statusMap.put("BankCode_HDCB", "邯郸市商业银行");
statusMap.put("BankCode_ASCB", "安顺市商业银行");
statusMap.put("BankCode_PLCB", "平凉市商业银行");
statusMap.put("BankCode_YXCB", "玉溪市商业银行");
statusMap.put("BankCode_ZJMTCB", "浙江民泰商业银行");
statusMap.put("BankCode_SRCCB", "上饶市商业银行");
statusMap.put("BankCode_DYB", "东营银行");
statusMap.put("BankCode_TACB", "泰安市商业银行");
statusMap.put("BankCode_ZJCZCB", "浙江稠州商业银行");
statusMap.put("BankCode_BOWH", "乌海银行股份有限公司");
statusMap.put("BankCode_ZGCB", "自贡市商业银行");
statusMap.put("BankCode_EEDSB", "鄂尔多斯银行");
statusMap.put("BankCode_HBB", "鹤壁银行");
statusMap.put("BankCode_XCCB", "许昌市商业银行");
statusMap.put("BankCode_JNB", "济宁银行股份有限公司");
statusMap.put("BankCode_TLB", "铁岭银行");
statusMap.put("BankCode_LSCB", "乐山市商业银行");
statusMap.put("BankCode_CAB", "长安银行");
statusMap.put("BankCode_CQSXB", "重庆三峡银行");
statusMap.put("BankCode_SZSB", "石嘴山银行");
statusMap.put("BankCode_PJCB", "盘锦市商业银行");
statusMap.put("BankCode_KLB", "昆仑银行股份有限公司");
statusMap.put("BankCode_PDSB", "平顶山银行股份有限公司");
statusMap.put("BankCode_CYB", "朝阳银行");
statusMap.put("BankCode_NBDHB", "宁波东海银行");
statusMap.put("BankCode_SNCB", "遂宁市商业银行");
statusMap.put("BankCode_BDB", "保定银行");
statusMap.put("BankCode_XTB", "邢台银行股份有限公司");
statusMap.put("BankCode_LSZCB", "凉山州商业银行");
statusMap.put("BankCode_LHCB", "漯河商行");
statusMap.put("BankCode_DZCB", "达州市商业银行");
statusMap.put("BankCode_XXCB", "新乡市商业银行");
statusMap.put("BankCode_JZB", "晋中市商业银行");
statusMap.put("BankCode_ZMDCB", "驻马店市商业银行");
statusMap.put("BankCode_HSCB", "衡水市商业银行");
statusMap.put("BankCode_ZKB", "周口银行");
statusMap.put("BankCode_YQCB", "阳泉市商业银行");
statusMap.put("BankCode_YBCB", "宜宾市商业银行");
statusMap.put("BankCode_KELCB", "库尔勒市商业银行");
statusMap.put("BankCode_YACB", "雅安市商业银行");
statusMap.put("BankCode_SQCB", "商丘商行");
statusMap.put("BankCode_AYB", "安阳银行");
statusMap.put("BankCode_XYB", "信阳银行");
statusMap.put("BankCode_HRXJB", "华融湘江银行");
statusMap.put("BankCode_YKYHB", "营口沿海银行");
statusMap.put("BankCode_JDZCB", "景德镇商业银行");
statusMap.put("BankCode_HBBCL", "湖北银行");
statusMap.put("BankCode_XJHHB", "新疆汇和银行");
statusMap.put("BankCode_GDHXB", "广东华兴银行");
statusMap.put("BankCode_PYB", "濮阳银行");
statusMap.put("BankCode_SHRCC", "上海农信");
statusMap.put("BankCode_KSRCC", "昆山农信社");
statusMap.put("BankCode_CSRCB", "常熟市农村商业银行");
statusMap.put("BankCode_SZRCB", "深圳农村商业银行");
statusMap.put("BankCode_GZRCB", "广州农村商业银行");
statusMap.put("BankCode_NHRCB", "广东南海农村商业银行");
statusMap.put("BankCode_SDRCB", "佛山顺德农村商业银行");
statusMap.put("BankCode_KMRCC", "昆明农联社");
statusMap.put("BankCode_HBRCC", "湖北农信");
statusMap.put("BankCode_XZRCC", "徐州市郊农村信用合作联社");
statusMap.put("BankCode_JYRCB", "江阴市农村商业银行");
statusMap.put("BankCode_CQRCB", "重庆农村商业银行");
statusMap.put("BankCode_SDRCC", "山东省农村信用社联合社");
statusMap.put("BankCode_DGRCB", "东莞农村商业银行");
statusMap.put("BankCode_ZJGRCB", "张家港农村商业银行");
statusMap.put("BankCode_FJRCC", "福建省农村信用社联合社");
statusMap.put("BankCode_BJRCB", "北京农村商业银行");
statusMap.put("BankCode_TJRCB", "天津农村商业银行");
statusMap.put("BankCode_YZRCB", "宁波鄞州农村合作银行");
statusMap.put("BankCode_SSRCC", "佛山市三水区农村信用合作社");
statusMap.put("BankCode_CDRCB", "成都农村商业银行");
statusMap.put("BankCode_JSRCC", "江苏省农村信用社联合社");
statusMap.put("BankCode_XHRCC", "江门新会农村商业银行");
statusMap.put("BankCode_WJRCB", "吴江农商行");
statusMap.put("BankCode_ZJRCC", "浙江省农村信用社联合社");
statusMap.put("BankCode_SZB", "苏州银行股份有限公司");
statusMap.put("BankCode_ZHRCB", "珠海农村商业银行");
statusMap.put("BankCode_TCRCB", "太仓农村商业银行");
statusMap.put("BankCode_YDRCC", "尧都区农村信用合作社联社");
statusMap.put("BankCode_GZRCC", "贵州省农村信用社联合社");
statusMap.put("BankCode_WXRCB", "无锡农村商业银行");
statusMap.put("BankCode_HNRCC", "湖南省农村信用社联合社");
statusMap.put("BankCode_JXRCC", "江西省农村信用社联合社");
statusMap.put("BankCode_HNRCU", "河南省农村信用社联合社");
statusMap.put("BankCode_RCCOHB", "河北省农村信用社联合社");
statusMap.put("BankCode_SXRCCU", "陕西省农村信用社联合社");
statusMap.put("BankCode_GXRCC", "广西农村信用社联合社");
statusMap.put("BankCode_WWERCC", "新疆维吾尔自治区农村信用社联合");
statusMap.put("BankCode_JLRCC", "吉林农信联合社");
statusMap.put("BankCode_HHRCB", "黄河农村商业银行");
statusMap.put("BankCode_AHRCC", "安徽省农村信用社联合社");
statusMap.put("BankCode_HNB", "海南省农村信用社联合社");
statusMap.put("BankCode_QHRCC", "青海省农村信用社联合社");
statusMap.put("BankCode_GDRCC", "广东省农村信用社联合社");
statusMap.put("BankCode_IMLRCC", "内蒙古自治区农村信用社联合式");
statusMap.put("BankCode_SCRCC", "四川省农村信用社联合社");
statusMap.put("BankCode_GSRCC", "甘肃省农村信用社联合社");
statusMap.put("BankCode_LNRCC", "辽宁省农村信用社联合社");
statusMap.put("BankCode_SXRCU", "山西省农村信用社联合社");
statusMap.put("BankCode_BHRCB", "天津滨海农村商业银行");
statusMap.put("BankCode_HLJRCC", "黑龙江省农村信用社联合社");
statusMap.put("BankCode_WHRCB", "武汉农村商业银行");
statusMap.put("BankCode_JNRCB", "江南农村商业银行");
statusMap.put("BankCode_DYJYXMRB", "大邑交银兴民村镇银行");
statusMap.put("BankCode_JYWJRB", "湖北嘉鱼吴江村镇银行");
statusMap.put("BankCode_XTBNSRB", "湖北仙桃北农商村镇银行");
statusMap.put("BankCode_SNRB", "海口苏南村镇银行");
statusMap.put("BankCode_JOSSRB", "福建建瓯石狮村镇银行");
statusMap.put("BankCode_ESCNSRB", "恩施常农商村镇银行");
statusMap.put("BankCode_CXURB", "浙江长兴联合村镇银行");
statusMap.put("BankCode_PHGYRB", "浙江平湖工银村镇银行");
statusMap.put("BankCode_MYHFRB", "北京密云汇丰村镇银行");
statusMap.put("BankCode_SYDWRB", "江苏沭阳东吴村镇银行");
statusMap.put("BankCode_DSMYRB", "鄂尔多斯市东胜蒙银村镇银行");
statusMap.put("BankCode_ZSXLRB", "中山小榄村镇银行");
statusMap.put("BankCode_HJMTRB", "江苏邗江民泰村镇银行");
statusMap.put("BankCode_DTXHRB", "安徽当涂新华村镇银行");
statusMap.put("BankCode_GCZYDFRB", "谷城中银富登村镇银行");
statusMap.put("BankCode_SYYZRB", "北京顺义银座村镇银行");
statusMap.put("BankCode_BQRXRB", "拜泉融兴村镇银行");
statusMap.put("BankCode_NYRB", "南阳村镇银行");
statusMap.put("BankCode_SJMSRB", "上海松江民生村镇银行");
statusMap.put("BankCode_HSRB", "浙江建德湖商村镇银行");
statusMap.put("BankCode_YCRXCB", "晋中市榆次融信村镇银行");
statusMap.put("BankCode_BSCB", "宝生村镇银行");
statusMap.put("BankCode_GZHDCZRB", "广州花都稠州村镇银行");
statusMap.put("BankCode_QHGMRB", "琼海国民村镇银行");
statusMap.put("BankCode_HSZJRB", "鹤山珠江村镇银行");
statusMap.put("BankCode_DWKSYRB", "大武口石银村镇银行");
statusMap.put("BankCode_KSLCCB", "昆山鹿城村镇银行");
statusMap.put("BankCode_DYLSCB", "东营莱商村镇银行");
statusMap.put("BankCode_GZZCCJRB", "广州增城长江村镇银行");
statusMap.put("BankCode_CSXSRB", "长沙星沙沪农商村镇银行");
statusMap.put("BankCode_BEA", "东亚银行有限公司");
statusMap.put("BankCode_CB", "花旗银行有限公司");
statusMap.put("BankCode_DSB", "大新银行有限公司");
statusMap.put("BankCode_WHB", "永亨银行");
statusMap.put("BankCode_CCBA", "中国建设银行亚洲股份有限公司");
statusMap.put("BankCode_DBS", "星展银行香港有限公司");
statusMap.put("BankCode_SHCB", "上海商业银行");
statusMap.put("BankCode_WLB", "永隆银行有限公司");
statusMap.put("BankCode_HSB", "恒生银行有限公司");
statusMap.put("BankCode_CITICI", "中信嘉华银行有限公司");
statusMap.put("BankCode_CHB", "创兴银行有限公司");
statusMap.put("BankCode_BOCCC", "中银信用卡(国际)有限公司");
statusMap.put("BankCode_BOCHK", "中国银行（香港）");
statusMap.put("BankCode_NCB", "南洋商业银行");
statusMap.put("BankCode_CBCL", "集友银行");
statusMap.put("BankCode_AEON", "AEON信贷财务亚洲有限公司");
statusMap.put("BankCode_BTF", "澳门大丰银行");
statusMap.put("BankCode_CCBMC", "中国建设银行澳门股份有限公司");
statusMap.put("BankCode_SCBHK", "渣打银行香港有限公司");
statusMap.put("BankCode_CYS", "中国银盛");
statusMap.put("BankCode_LIBL", "澳门国际银行");
statusMap.put("BankCode_BNU", "大西洋银行股份有限公司");
statusMap.put("BankCode_BCM", "澳门商业银行");
statusMap.put("BankCode_ICBCM", "中国工商银行（澳门）");
statusMap.put("BankCode_EPC", "中银通商务支付有限公司");
statusMap.put("BankCode_PSBCCC", "中国邮政储蓄银行信用卡中心");
statusMap.put("BankCode_CITICCC", "中信银行信用卡中心");
statusMap.put("BankCode_SPDBCC", "浦发银行信用卡中心");
statusMap.put("BankCode_QLB", "齐鲁银行股份有限公司");
statusMap.put("BankCode_LSB", "临商银行");
statusMap.put("BankCode_HRBCB", "哈尔滨商行");
statusMap.put("BankCode_RZB", "日照银行");
statusMap.put("BankCode_WFB", "潍坊银行");
statusMap.put("BankCode_FDB", "富滇银行");
statusMap.put("BankCode_ZJTLCB", "浙江泰隆商业银行");
statusMap.put("BankCode_HZB", "湖州银行");
statusMap.put("BankCode_GXBBGB", "广西北部湾银行");
statusMap.put("BankCode_GLB", "桂林银行");
statusMap.put("BankCode_SRCB", "上海农村商业银行");
statusMap.put("BankCode_YNRCC", "云南省农村信用社");
statusMap.put("BankCode_BOCD", "承德银行");
statusMap.put("BankCode_SRB", "上饶银行");


//交易状态翻译为汉字
function translateStatus(business,key){
	return statusMap.get(business+"_"+key);
}
//added by liudengfu
//javascript显示手机号、身份证信息和卡号
//显示末四位
function showCard(card){
	return card.substring(12,16);
}
//显示末四位
function showId(id){
	return id.substring(0,1)+"****************"+id.substring(17,18);
}
//显示133****5678
function showMobileNo(mobileNo){
	return mobileNo.substring(0,3)+'****'+mobileNo.substring(8,11);
} 