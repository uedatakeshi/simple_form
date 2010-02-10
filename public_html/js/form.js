$(document).ready(function(){
	var mess = $('div#messages');
	$('form').validate({
		errorContainer: mess,
		errorLabelContainer: $("ul", mess),
		wrapper: 'li',
		rules: {
			name: {
				required: true,
				minlength: 2
			},
			email: {
				required: true,
				email: true
			},
			"clue[]": {
				required: true,
				minlength: 2
			},
			contact: "required",
			comment: "required"
		},
		messages: {
			email: {
				required: "メールアドレスを入力してください",
				email: "メールアドレスの形式が正しくありません"
			}
		}
	});
});

