var mysql = require('mysql');
var pool = mysql.createPool({
    host     : 'localhost',
    user     : '******',
    password : '******',
    database : '******'
});
/**
 * query语句
 * @param { string } sql 语句
 * @param { Function } sucCallback 成功的回调方法
 * @param { Function } errCallback 失败的回调方法
 */
function query(sql, sucCallback, errCallback) {
  pool.getConnection(function(err,connection){
    if(err){
      errCallback(err);
      return;
    }
    connection.query(sql, (error, results, fields)=> {
      connection.release();
        if (error) {
            errCallback(error);
            return;
        }
        sucCallback(results);
    });
  });
}
exports.query = query;
