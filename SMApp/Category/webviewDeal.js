//  by raoshihong


var autoSizeFit = function(screenWidth){
    //1.设置所有字体
    var body = document.getElementsByTagName("body")[0];
    //设置body的宽度
    body.style.width = screenWidth;
    //设置body的字体
    var bodyStyleFontSize = body.style.fontSize;
    //设置整个body的宽度
    var bodyStyleWidth = body
    if(bodyStyleFontSize.length<=0){
        document.getElementsByTagName("body")[0].style.fontSize = 14;
    }
    
    //2获取table的宽度
    var tables = document.getElementsByTagName("table");
    for(var i=0;i<tables.length;i++){
        //2.1.设置所有表格的字体
        //判断是否有style属性的fontSize是否有值
        var table = tables[i];
        
        var tableStyleFontSize = table.style.fontSize;
        if(tableStyleFontSize.length<=0){//没有设置了table的fontSize
            table.style.fontSize = 14;
        }
        
        //2.2.设置表格的宽度
        var tableStyleWidth = table.style.width;
        table.style.width = screenWidth;
    }
    
    //3.设置图片
    var images = document.getElementsByTagName("img");
    for(var i=0;i<images.length;i++){
        var image = images[i];
        //设置图片的宽高比例
        
        var imgWidth = image.width;
        var imgHeight = image.height;
        var scale = imgHeight/imgWidth;
        
        //再通过比例来设置图片的宽高
        image.width = screenWidth;
        image.height = screenWidth*scale;
    }
    
    //4.设置所有div的宽度
    var divs = document.getElementsByTagName("div");
    for(var i=0;i<divs.length;i++){
        var div = divs[i];
        div.style.width = screenWidth;
    }
    
    //5.设置ul
    var uls = document.getElementsByTagName("ul");
    for(var i=0;i<uls.length;i++){
        var ul = uls[i];
        ul.style.width = screenWidth;
    }
}