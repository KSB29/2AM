$(document).ready(function(){
	var headerHtml = $("#material-header-holder .ui-datepicker-material-header");
	var disabledDays = ["2019-10-23"];
	var changeMaterialHeader = function(header, date) {
		var year   = date.format('YYYY');
		var month  = date.format('MM');
		var dayNum = date.format('DD');
		var isoDay = date.isoWeekday();
		
		var weekday = new Array(7);
		weekday[1] = "Monday";
		weekday[2] = "Tuesday";
		weekday[3] = "Wednesday";
		weekday[4] = "Thursday";
		weekday[5] = "Friday";
		weekday[6] = "Saturday";
		weekday[7]=  "Sunday";

		$('.ui-datepicker-material-day', header).text(weekday[isoDay]);
		$('.ui-datepicker-material-year', header).text(year);
		$('.ui-datepicker-material-month', header).text(month);
		$('.ui-datepicker-material-day-num', header).text(dayNum);
	};

	$.datepicker._selectDateOverload = $.datepicker._selectDate;
	$.datepicker._selectDate = function(id, dateStr) {
		var target = $(id);
		var inst = this._getInst(target[0]);
		inst.inline = true;
		$.datepicker._selectDateOverload(id, dateStr);
		inst.inline = false;
		this._updateDatepicker(inst);

		headerHtml.remove();
		$(".ui-datepicker").prepend(headerHtml);
	};

	$("input[data-type='date']").on("focus", function() {
		//var date;
		//if (this.value == "") {
		//  date = moment();
		//} else {
		//  date = moment(this.value, 'YYYY/MM/DD');
		//}

		$(".ui-datepicker").prepend(headerHtml);
		//$(this).datepicker._selectDate(this, date);
	});

	$("input[data-type='date']").datepicker({
		
		minDate: 1,
		closeText: 'OK',
		beforeShowDay: disableAllTheseDays,
		onSelect: function(date, inst) {
			changeMaterialHeader(headerHtml, moment(date, 'YYYY/MM/DD'));
		}
	});
	
	changeMaterialHeader(headerHtml, moment());
	$('input').datepicker('show');
	
	// 특정일 선택막기 
	function disableAllTheseDays(date) { 
	   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
	   for (i = 0; i < disabledDays.length; i++) { 
	       if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) { 
	           return [false]; 
	       } 
	   } 
	   return [true]; 
	}
});