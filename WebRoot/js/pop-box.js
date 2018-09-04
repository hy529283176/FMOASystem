function popupDiv(div_id) { 
    // 获取传入的DIV 
    var $div_obj = $("#" + div_id); 
    // 计算机屏幕高度 
    var windowWidth = $(window).width(); 
    // 计算机屏幕长度 
    var windowHeight = $(window).height(); 
    // 取得传入DIV的高度 
    var popupHeight = $div_obj.height(); 
    // 取得传入DIV的长度 
    var popupWidth = $div_obj.width(); 
     
    // // 添加并显示遮罩层 
    $("<div id='bg'></div>").width(windowWidth * 0.99) 
        .height(windowHeight * 0.99).click(function() { 
          //hideDiv(div_id); 
        }).appendTo("body").fadeIn(200); 
     
    // 显示弹出的DIV 
    $div_obj.css({ 
      "position" : "absloute" 
    }).animate({ 
      left : windowWidth / 2 - popupWidth / 2, 
      top : windowHeight / 2 - popupHeight / 2, 
      opacity : "show" 
    }, "slow"); 
     
  } 
  /*隐藏弹出DIV*/ 
  function hideDiv(div_id) {
    $("#bg").remove(); 
    $("#" + div_id).animate({ 
      left : 0, 
      top : 0, 
      opacity : "hide" 
    }, "slow"); 
  } 