var express = require('express');
var expressWs = require('express-ws');
var router = express.Router();
expressWs(router);
var sqltool = require('../Mini/sqltool.js');
var mini = require('../Mini/Operation.js');
var miniws = require('../Mini/OperationWs.js');
/*  websocket  */
router.ws('/socketTest', function (ws, req){
    ws.on('message', function (msg) {
    	let json;
    	try{
    		json=JSON.parse(msg);
    	}catch(e){
    		ws.send(JSON.stringify({status:0,action:'error',msg:'System error!'}));
    	}
    	if(typeof(json) == 'undefined'){
    	  ws.send(JSON.stringify({status:0,action:'error',msg:'Request UnStandard error!'}));
    	}else{
    	if(!json.action){
    		ws.send(JSON.stringify({status:0,action:'error',msg:'Request UnStandard error!'}));
    	}else{
    		if(json.action=='network-test'){
    		  try{
    			      ws.send(JSON.stringify({status:1,action:json.action,data:{body:json.data.body}}));
    			  }catch(e){
    			      ws.send(JSON.stringify({status:0,action:'error',msg:'System error!'}));
    			  }
    		}else if(json.action=='get-search-suggestions'){
    			miniws.getSearchSuggestions(ws,req,json,sqltool);
    		}else if(json.action=='get-publicwelfares'){
    			miniws.getPublicWelfares(ws,req,json,sqltool);
    		}else{
    			ws.send(JSON.stringify({status:0,action:'error',msg:'Unkown Request error!'}));
    		}
    	}
     }
    });
});
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'notice' });
});
router.get('/QrC', function(req, res, next) {
  res.render('qrc', { title: '提示' });
});
router.post('/updateUser',function(req,res,next){
  mini.updateUser(req,res,next,sqltool);
});
router.post('/postComment',function(req,res,next){
  mini.postComment(req,res,next,sqltool);
});
router.get('/getUserOpenId',function(req,res,next){
  mini.getUserOpenId(req,res,next);
});
router.get('/getComments',function(req,res,next){
  mini.getComments(req,res,next,sqltool);
});
router.get('/getPublicWelfares',function(req,res,next){
  mini.getPublicWelfares(req,res,next,sqltool);
});
router.get('/getSearchSuggestions',function(req,res,next){
  mini.getSearchSuggestions(req,res,next,sqltool);
});
module.exports = router;
