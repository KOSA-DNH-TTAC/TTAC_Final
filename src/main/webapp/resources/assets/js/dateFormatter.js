console.log("데이터포매터!!!!!!!!!!!!!!")
let dateFormatterFun = (function(){
    function dateFormatter(date){
        var wantDate = new Date(date);
        // 년도 getFullYear()
        var year = wantDate.getFullYear();
        // 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)
        var month = wantDate.getMonth() + 1
        // 일 getDate()
        var date = wantDate.getDate(); // 일
        if (month < 10) {
          month = "0" + month;
        }
        if (date < 10) {
          date = "0" + date;
        }
        var wantDateFormat = year + "-" + month + "-" + date;
        return wantDateFormat;
    }
    return{dateFormatter:dateFormatter}
})();