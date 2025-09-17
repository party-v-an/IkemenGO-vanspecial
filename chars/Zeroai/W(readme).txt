  悪の科学者の最高傑作といえばかっこいいが、実際は全自動土下座博士という。いやワイリー好きですけども。
　ダウンロードありがとうございます。
　本パッチはRanzaneko氏、Mr.Karate氏製作、ゼロ(2016/6/19)のAIパッチとなっております。
　例によっていろいろ未完成ですがご容赦願います。また、このAIに関する問い合わせは両氏にしないようにお願いします。
　AIを使用する際はフォルダとファイルをゼロのフォルダ内に入れ、ZERO WIPz/ZEROAI.defで登録すればOKです。
  ついでにキャラ本体を検索するときはzero wipsで検索したほうが見つかりやすいかもしれません。


また本キャラ新mugen対応ですがdefとファイル名のスペース(空白)をのければwinmugenでも普通に使用可能です。
具体的にはdefを以下のように修正し、実際のファイル名もそれに合わせて修正すればOKです。

[Files]
sprite = Zero.sff
anim = zeroAI/Zero.air
sound = Zero.snd
cmd = zeroAI/Zero.cmd
cns = zeroAI/System.cns
stcommon = common1.cns
st = zeroAI/System.cns
st1 = zeroAI/Normal.cns
st2 = Coding\Specials.cns
st3 = Coding\EX Specials.cns
st4 = zeroAI/Supers.cns
st5 = zeroAI/Helpers.cns
pal1 = Colors\default.act
pal2 = Colors\Black Zero 2.act
pal3 = Colors\Tatsunoko vs Capcom.act
pal4 = Colors\Default.act
pal5 = Colors\Megaman Zero.act
pal6 = Colors\Megaman X armor.act
pal7 = Colors\Axl.act
pal8 = Colors\Protoman.act
pal9 = Colors\Bass.act
pal10 = Colors\Vile.act
pal11 = Colors\Omega Zero.act
pal12 = Colors\Nightmare Genmurei.act

    ↓

[Files]
sprite = Zero.sff
anim = zeroAI/Zero.air
sound = Zero.snd
cmd = zeroAI/Zero.cmd
cns = zeroAI/System.cns
stcommon = common1.cns
st = zeroAI/System.cns
st1 = zeroAI/Normal.cns
st2 = Coding\Specials.cns
st3 = Coding\EXSpecials.cns
st4 = zeroAI/Supers.cns
st5 = zeroAI/Helpers.cns
pal1 = Colors\default.act
pal2 = Colors\BlackZero2.act
pal3 = Colors\TatsunokovsCapcom.act
pal4 = Colors\Default.act
pal5 = Colors\MegamanZero.act
pal6 = Colors\MegamanXarmor.act
pal7 = Colors\Axl.act
pal8 = Colors\Protoman.act
pal9 = Colors\Bass.act
pal10 = Colors\Vile.act
pal11 = Colors\OmegaZero.act
pal12 = Colors\NightmareGenmurei.act


　
１．AI設定
　cmdファイルの真ん中あたりでいろいろ設定できます。


①コンボ設定
　ここを1以上にするとAIが入ります。AIは常時起動(P操作不可)なので注意。
　レベルは1～3で基本上げるほど痛い。
　デフォは1。


②立ち回り設定
　ＡＩの立ち回り。
　レベルは1～3で基本上げるほど強い…はず。レベルを上げると動きは慎重になるので注意。
　デフォは1。


③反応レベル
　相手の攻撃に対し超反応で反撃する頻度(0~10)。
　デフォは7。


④ガードレベル
　ガードの固さ(0~11)。10と11はガード精度自体は変わらず、11にすると投げに超反応で対応するようになります。
　デフォは9。


⑤ブロッキング頻度
　ブロッキングの頻度(0~10)。
　デフォは1。




2．その他

・動画での使用、AI改変等について
　自己責任でご自由にどうぞ。許可申請も報告も必要ありません。
　ただし、キャラ本体に関してはRanzaneko氏、Mr.Karate氏の希望に沿ってください。



・今後の更新について
　気分とやる気次第。




・更新履歴

2016年8月24日
公開。そりゃエックスも作るならゼロも作らんとなというわけで作成。
ちなみにX4以降はゼロ使いな私です。プレイ順は3→6→5→4→7→8。謎い。
というわけでゼロです。諸々の人気っぷりを見るにエックス君が不憫でなりません。

一応wipとのことですが通常技、必殺技、システムは一通りそろっており全く問題ない出来。
ただし勝利セリフが一部不自然だったのでそこだけ修正してます。海外勢故致し方なし。
性能的にはMVC中心にカプコン格ゲーをいろいろ組み合わせた感じ、移動起き上がりやアドガがない代わりに
ブロッキングや前転、後転、避けがあったり。
全体的に技性能は高めで遠近切り返しを安定してこなせる万能タイプ。バスターなんかもたぶん無印ロックマ
ンやエックスより強いんじゃないかと。
火力はやや控えめで地上技は補正がきつく空中はジャグルの制限があるのでほどほどでゲージ技につないで
ダメージを伸ばしていきます。まあ普通に永久余裕だったりしますが減らんしAIは自重してます。
なお乱舞系のゲージ技は最後まで決まらないのがほとんどなので基本封印した方がいいです。

手書きながら出来が良く、原作を再現した技も豊富なのでこの機会に利用していただければ。

2016年9月24日
微更新。



















製作者：ホルン　