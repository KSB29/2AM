 /* 옵션창 오픈클로즈 */
   <!-- Scripts -->
   function optionOpen() {
        var x = document.getElementById("optionField");
        var y = document.getElementById("locationField");
        var z = document.getElementById("typeField");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
        y.style.display = "none";
        z.style.display = "none";
//        $("#locationField").toggleClass("buttonToggleOpen");
//        $("#typeField").toggleClass("buttonToggleOpen");
      }
    /* 지역창 오픈 클로즈 */
    function locationOpen() {
    	var x = document.getElementById("optionField");
        var y = document.getElementById("locationField");
        var z = document.getElementById("typeField");
       if (y.style.display === "none") {
         y.style.display = "block";
       } else {
         y.style.display = "none";
       }
       x.style.display = "none";
       z.style.display = "none";
//       $("#optionField").toggleClass("buttonToggleOpen");
//       $("#typeField").toggleClass("buttonToggleOpen");
     } 
   /* 유형창 오픈클로즈 */
   function typeOpen() {
	   var x = document.getElementById("optionField");
       var y = document.getElementById("locationField");
       var z = document.getElementById("typeField");
       if (z.style.display === "none") {
         z.style.display = "block";
       } else {
         z.style.display = "none";
       }
       x.style.display = "none";
       y.style.display = "none";
       console.log($("#locationField").hasClass("buttonToggleOpen"));
       $("#locationField").toggleClass("buttonToggleOpen");
       console.log($("#locationField").hasClass("buttonToggleOpen"));
       $("#locationField").toggleClass("buttonToggleOpen");
       $("#optionField").toggleClass("buttonToggleOpen");
     }  
