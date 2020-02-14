from janome.tokenizer import Tokenizer
from gensim.models import word2vec
import re
import sys
import MySQLdb

input = sys.argv[1]

# データベースへの接続とカーソルの生成
connection = MySQLdb.connect(
    host='localhost',
    user='root',
    passwd='',
    db='review',
    charset='utf8')
cursor = connection.cursor()

cursor.execute("SELECT good_review,bad_review FROM reviews WHERE gadget_id = %s" % input)
# fetchall()で全件取り出し
rows = cursor.fetchall()
# 接続を閉じる
connection.close()

txt = []
for row in rows:
    txt += list(row)
document = ''.join(txt)

texts = document.split("\r\n")

flag = False
for text in texts:
    print(text)
    if text == '':
        flag = True

if flag == True:
    texts.remove('') 
#print(texts)

#形態素解析
t = Tokenizer()
results = []
#テキストを一行ずつ処理する
lines = texts
for line in lines:
    s = line
    s = re.sub(r' ', '',s)
    s = re.sub(r'[# .+?]', '',s)#入力注を削除
    tokens = t.tokenize(s)#形態素解析
    #必要な語句だけを対象とする
    r = []
    for tok in tokens:
        if tok.base_form == "*": #単語の基本形を採用
            w = tok.surface
        else:
            w = tok.base_form
            ps = tok.part_of_speech#品詞情報
            hinsi = ps.split(',')[0]
            if hinsi in ['名詞', '形容詞', '動詞']:
                r.append(w)
        rl = (" ".join(r)).strip()
        results.append(rl)

# 書き込み先テキストを開く
wakati_file = 'lib/assets/python/model/' + input + '.wakati'
with open(wakati_file, 'w', encoding="utf-8") as fp:
    fp.write("\n".join(results))

#Word2Vecでモデルを作成
data = word2vec.LineSentence(wakati_file) 
model = word2vec.Word2Vec(data, size=200, window=10, hs=1 , min_count=2, sg=1)
model.save('lib/assets/python/model/' + input + '.model')







