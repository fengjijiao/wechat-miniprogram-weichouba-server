function updateUser(req,res,next,sqltool) { 
    if(req.body.openId){
        sqltool.query("SELECT * FROM `users` WHERE `openid` = '"+req.body.openId+"'",(suc) => {
    		if(req.body.nickName && req.body.avatarUrl){
    			if(suc.length<1){
    				sqltool.query("INSERT INTO `users` (`openid`, `nickName`, `gender`, `language`, `city`, `province`, `country`, `avatarUrl`, `creatTime`) VALUES ('"+req.body.openId+"', '"+req.body.nickName+"', '"+req.body.gender+"', '"+req.body.language+"', '"+req.body.city+"', '"+req.body.province+"', '"+req.body.country+"', '"+req.body.avatarUrl+"', CURRENT_TIMESTAMP);",(suc) => {
                        res.end(JSON.stringify({status:1,msg:"Add Success!"}));
                    }, (err) => {
                        res.end(JSON.stringify({status:0,msg:"System Error!"}));
                    });
                }else{
                	sqltool.query("UPDATE `users` SET `nickName` = '"+req.body.nickName+"',`gender`= '"+req.body.gender+"',`language`= '"+req.body.language+"',`city`= '"+req.body.city+"',`province`= '"+req.body.province+"',`country`= '"+req.body.country+"',`avatarUrl`= '"+req.body.avatarUrl+"' WHERE `users`.`openId` = '"+req.body.openId+"';",(suc) => {
                        res.end(JSON.stringify({status:1,msg:"Update Success!"}));
                    }, (err) => {
                        res.end(JSON.stringify({status:0,msg:"System Error!"}));
                    });
                }
    			
    		}else{
    			res.end('{"status":0,"msg":"Incomplete parameters!"}');
    		}
        }, (err) => {
            res.end(JSON.stringify({status:0,msg:"System Error!"}));
        });
    }else{
    	res.end('{"status":0,"msg":"UnKown Request!"}');
    }
}
function postComment(req,res,next,sqltool) {
	if(req.body.openId && req.body.id && !isNaN(req.body.id) && req.body.evaluation && !isNaN(req.body.evaluation) && req.body.comment && (req.body.openId.length>0) && (req.body.comment.length>0)){
	    sqltool.query("SELECT * FROM `users` WHERE `openid` = '"+req.body.openId+"'",(suc) => {
    			if(suc.length<1){
    				//非法访问
                	res.end(JSON.stringify({status:0,msg:"Request Error!"}));
                }else{
                	sqltool.query("INSERT INTO `comments` (`mid`, `uid`, `comment`, `evaluation`, `reward`, `publictime`, `timestamp`) VALUES ('"+req.body.id+"', '"+suc[0].uid+"', '"+req.body.comment+"', '"+req.body.evaluation+"', '0', CURRENT_TIMESTAMP, unix_timestamp(now()));",(suc) => {
                        res.end(JSON.stringify({status:1,msg:"Add Success!"}));
                    }, (err) => {
                        res.end(JSON.stringify({status:0,msg:"System Error!"}));
                    });
                }
        }, (err) => {
            res.end(JSON.stringify({status:0,msg:"System Error!"}));
        });
    }else{
    	res.end('{"status":0,"msg":"UnKown Request!"}');
    }
}
function getSearchSuggestions(ws,req,json,sqltool) {
	var result={};
	var location="0,6";
	if(json.data.prev && !isNaN(json.data.prev) && json.data.last && !isNaN(json.data.last)){
       location=json.data.prev+","+json.data.last;
    }
    if(json.data.key){
    	sqltool.query("SELECT * FROM `publicwelfares` WHERE `wName` LIKE '"+json.data.key+"%' OR `wName` LIKE '%"+json.data.key+"%' OR `wName` LIKE '%"+json.data.key+"' ORDER BY `timestamp` DESC LIMIT "+location+";",(publicwelfares) => {
    		result.inpuTips=[];
            result.inpuTips_length=publicwelfares.length;
    		if(publicwelfares.length<1){
                ws.send(JSON.stringify({status:1,action:json.action,msg:"No More PublicWelfare!",data:result}));
            }
		    for(var i=0;i<publicwelfares.length;i++){
			    let part={};
			    part.id=publicwelfares[i].wid;
			    part.Name=publicwelfares[i].wName;
			    part.Describe=publicwelfares[i].wDescribe;
			    result.inpuTips.push(part);
		    }
		    ws.send(JSON.stringify({status:1,action:json.action,msg:"get Search Suggestions success!",data:result}));
    	},(err) => {
		    ws.send(JSON.stringify({status:0,action:json.action,msg:"System Error!"}));
	    });
    }
}
function getPublicWelfares(ws,req,json,sqltool) {
	var result={};
	var location="0,10";
	if(json.data.prev && !isNaN(json.data.prev) && json.data.last && !isNaN(json.data.last)){
       location=json.data.prev+","+json.data.last;
    }
	sqltool.query("SELECT * FROM `publicwelfares`ORDER BY `timestamp` DESC LIMIT "+location+";",(publicwelfares) => {
		result.publicwelfares=[];
        result.publicwelfares_length=publicwelfares.length;
        if(publicwelfares.length<1){
            ws.send(JSON.stringify({status:1,action:json.action,msg:"No More PublicWelfare!",data:result}));
        }
		for(var i=0;i<publicwelfares.length;i++){
			let part={};
			part.Name=publicwelfares[i].wName;
			part.Describe=publicwelfares[i].wDescribe;
			part.heart=publicwelfares[i].heart;
			part.OrgName=publicwelfares[i].wOrgName;
			part.Image=publicwelfares[i].wImage;
			part.Avatar=publicwelfares[i].wAvatar;
			result.publicwelfares.push(part);
		}
		ws.send(JSON.stringify({status:1,action:json.action,data:result}));
	},(err) => {
		ws.send(JSON.stringify({status:0,action:json.action,msg:"System Error!"}));
	});
}
function getComments(req,res,next,sqltool) {
    if(req.query.id && !isNaN(req.query.id)){
    	var result={};
    	var location="0,10";
        sqltool.query("SELECT mName,mDescribe,mImage,creatTime FROM `mainparts` WHERE `mid` = "+req.query.id+" LIMIT 1;",(mainpart) => {
            result.mainpart=mainpart[0];
            if(req.query.prev && !isNaN(req.query.prev) && req.query.last && !isNaN(req.query.last)){
            	location=req.query.prev+","+req.query.last;
            }
            sqltool.query("SELECT * FROM `comments` WHERE `mid` =  "+req.query.id+" ORDER BY `timestamp` DESC LIMIT "+location+";",(comments) => {
            	result.comments=[];
            	result.comments_length=comments.length;
            	if(comments.length<1){
            		res.end(JSON.stringify({status:1,msg:"No More Comment!",data:result}));
            	}
            	for(var i=0;i<comments.length;i++){
            		var promise = new Promise(function (resolve, reject) {
            			let j=i;
            		    sqltool.query("SELECT * FROM `users` WHERE `uid` = "+comments[i].uid+" LIMIT 1;",(user) => {
            		    	let part={};
            			    part.nickName=user[0].nickName;
            			    part.avatarUrl=user[0].avatarUrl;
            			    part.gender=user[0].gender;
            			    let resolveobj={part:part,j:j};
            			    resolve(resolveobj);
            		    },(err) => {
            		    	reject(err);
            		    });
            		});
            		promise.then(function (resolveobj) {
            			resolveobj.part.comment=comments[resolveobj.j].comment;
            		    resolveobj.part.evaluation=comments[resolveobj.j].evaluation;
            		    resolveobj.part.reward=comments[resolveobj.j].reward;
            		    resolveobj.part.timestamp=getDateDiff(comments[resolveobj.j].timestamp*1000);
            		    result.comments.push(resolveobj.part);
            		    if(resolveobj.j==(comments.length-1)){
            		    	res.end(JSON.stringify({status:1,data:result}));
            		    }
                    }, function (err) {
                    	res.end(JSON.stringify({status:0,msg:"System Error!"}));
                    });
            	}
            }, (err) => {
                res.end(JSON.stringify({status:0,msg:"System Error!"}));
            });
        }, (err) => {
            res.end(JSON.stringify({status:0,msg:"MainPart No Found!"}));
        });
    }else{
        res.end('{"status":0,"msg":"UnKown Request!"}');
    }
}
//通过code换取openid
function getUserOpenId(req,res,next) {
	//var request = require('request'); //异步
	var request = require('urllib-sync').request;//同步
	var appId = 'wx45192651a61cc9a8';
    var secret = 'bd156162041bb5cc12293d68fcc9decc';
    if(req.query.code){
	    /*request({
                     url: 'https://api.weixin.qq.com/sns/jscode2session?appid=' + appId + '&secret=' + secret + '&js_code=' + params.code + '&grant_type=authorization_code',
                     method: "GET",
                     headers: {
                         "content-type": "json",
                     }
                }, function (error, response, body) {
                    if (!error && response.statusCode == 200) {
                        return body.toString();
                    }else{
                    	return "getUserOpenId Error!";
                    }
        });*/
        var apires=request('https://api.weixin.qq.com/sns/jscode2session?appid=' + appId + '&secret=' + secret + '&js_code=' + req.query.code + '&grant_type=authorization_code', {
            method: 'GET',
            headers: {
            'content-type': 'json'
            },
          data: {}
        });
        if(apires.status == 200){
        	//res.send
        	if(JSON.parse(apires.data).openid){
        		res.end('{"status":1,"msg":"getUserOpenId Success!","openId":"'+JSON.parse(apires.data).openid+'"}');
        	}else{
        		res.end('{"status":0,"msg":"Code invaild!"}');
        	}
        }else{
        	res.end('{"status":0,"msg":"getUserOpenId Error!"}');
        }
    }else{
    	res.end('{"status":0,"msg":"UnKown Request!"}');
    }
}
//时间差计算
function getDateDiff(dateTimeStamp) {
    var minute = 1000 * 60;
    var hour = minute * 60;
    var day = hour * 24;
    var halfamonth = day * 15;
    var month = day * 30;
    var now = new Date().getTime();
    var diffValue = now - dateTimeStamp;
    if (diffValue < 0) {
        //非法操作
        //alert("结束日期不能小于开始日期！");
        result = "非法操作";
    }
    var monthC = diffValue / month;
    var weekC = diffValue / (7 * day);
    var dayC = diffValue / day;
    var hourC = diffValue / hour;
    var minC = diffValue / minute;
    if (monthC >= 1) {
        result = "发表于" + parseInt(monthC) + "个月前";
    } else if (weekC >= 1) {
        result = "发表于" + parseInt(weekC) + "个星期前";
    } else if (dayC >= 1) {
        result = "发表于" + parseInt(dayC) + "天前";
    } else if (hourC >= 1) {
        result = "发表于" + parseInt(hourC) + "小时前";
    } else if (minC >= 1) {
        result = "发表于" + parseInt(minC) + "分钟前";
    } else {
        result = "刚刚发表";
    }
    return result;
}
exports.updateUser = updateUser;
exports.getPublicWelfares = getPublicWelfares;
exports.getComments = getComments;
exports.postComment = postComment;
exports.getUserOpenId = getUserOpenId;
exports.getSearchSuggestions = getSearchSuggestions;