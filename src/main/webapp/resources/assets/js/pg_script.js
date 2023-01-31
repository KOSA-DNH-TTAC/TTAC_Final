function dateAddDel(sDate, nNum, type) {
    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(4, 2), 10);
    var dd = parseInt(sDate.substr(6), 10);
    
    if (type == "d") {
        d = new Date(yy, mm - 1, dd + nNum);
    }
    else if (type == "m") {
        d = new Date(yy, mm - 1, dd + (nNum * 31));
    }
    else if (type == "y") {
        d = new Date(yy + nNum, mm - 1, dd);
    }
 
    yy = d.getFullYear();
    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
 
    return '' + yy + mm  + dd;
}

function big_img(obj) {
    var imgInfo = new Image();
    imgInfo.src = obj.src;

	//货芒狼 农扁
	if(imgInfo.width <= 1100) {cw = imgInfo.width;}else {cw = 1100;}
	if(imgInfo.height <= 700) {ch = imgInfo.height;}else {ch = 700;}	
	
	//胶农赴狼 农扁
	sw=screen.availWidth;
	sh=screen.availHeight;
	cw = sw;
	ch = sh;
	//凯 芒狼 器瘤记
	px=(sw-cw)/2;
	py=(sh-ch)/2;

	result = window.open(obj.src, "big_img" , "width="+cw+" , height="+ch+",left="+px+",top="+py+",scrollbars=yes");
}

function autoHypenPhone(obj){
	var str = obj.value;

	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 4){
		tmp = str;
	}else if(str.length < 7){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
	}else if(str.length < 11){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
	}else{              
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
	}
	obj.value = tmp;
}