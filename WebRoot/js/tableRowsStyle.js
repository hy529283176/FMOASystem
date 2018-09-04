function trColor(){
				var tb = document.getElementById("tUser");
				var rs = tb.rows.length;
				for(var i=0;i<rs;i++){
					if(i%2!=0){
						tb.rows.item(i).style.backgroundColor = "#EDEDB2";
					}
				}
				
			}

