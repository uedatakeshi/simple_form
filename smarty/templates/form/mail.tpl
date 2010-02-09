{$list.name}  様

この度は、お問い合わせいただきまして、誠にありがとうございます。 
以下の内容で、お問い合わせを承りました。

--- ここから ---
                    
お名前            ：{$list.name} 
会社名            ：{$list.company}
メールアドレス    ：{$list.email}
電話番号          ：{$list.tel}
お問合せのきっかけ：
	{foreach from=$list.clue key=key item=item}                    {$item|escape}
{/foreach}
ご希望の連絡方法  ：{$list.contact}
お問い合せの種類  ：{$list.type}
お問い合わせ内容  ：
{$list.comment}

