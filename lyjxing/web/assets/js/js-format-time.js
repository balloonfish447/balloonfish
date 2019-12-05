function timeStamp2String(time) {
    var datetime = new Date(time);
    //datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
}

$(function () {

    setInterval(function () {
        var datetime=new Date();
        var getime=timeStamp2String(datetime)
        $("#times").html(getime);
    },1000)

})


var neirong="找到你想要的#房屋设计方案"
var i=0;
/*换行判断*/
var temp=-1;
setInterval(function () {
    /*遇到换行标记清空内容*/
    if(neirong[i]=="#"){
        $("#dazi").html()
        temp=i;
    }
    /*没有遇到换行继续进行*/
    if(temp==-1){
        $("#dazi").html(neirong.slice(0,i+1)+"|")
    }
    /*遇到换行后进行如下*/
    if(temp!=-1){
        $("#dazi").html(neirong.slice(temp+1,i+1)+"|")
    }
    i++;
    /*写完以后重洗开始*/
    if(i>neirong.length){
        i=0
        temp=-1
    }
},200)