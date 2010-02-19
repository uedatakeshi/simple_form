$(document).ready(function(){
	var mess = $('div#messages');
	$('div#messages').append('<ul></ul>');
	
	$('form').validate({
		errorContainer: mess,
		onkeyup: false,
		onfocusout: false,
		onclick: false,
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
			tel: {
				required: true
			},
			"clue[]": {
				required: true,
				minlength: 2
			},
			contact: "required",
			comment: "required"
		},
		messages: {
			name: {
				required: "「お名前」を入力してください。 "
			},
			email: {
				required: "「メールアドレス」を入力してください。",
				email: "「メールアドレス」を正しく入力してください。 "
			},
			tel: {
				required: "「電話番号」を入力してください。"
			},
			"clue[]": {
				required: "「お問い合せのきっかけ」を選択してください。",
				minlength: "「お問い合せのきっかけ」は２つ以上選択してください。" 
			},
			contact: {
				required: "「ご希望の連絡方法」を選択してください。"
			},
			comment: {
				required: "「お問い合せ内容」を入力してください。"
			}
		}
	});
});

