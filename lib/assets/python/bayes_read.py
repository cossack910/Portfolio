from bayes import BayesianFilter
import sys,io
import MySQLdb

input = sys.argv[1]

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8') # UTF-8に
# データベースへの接続とカーソルの生成
connection = MySQLdb.connect(
    host='localhost',
    user='root',
    passwd='',
    db='review',
    charset='utf8')
cursor = connection.cursor()

#良い点のみ読み込む
cursor.execute("SELECT good_review FROM reviews WHERE gadget_id = %s" % input)
# fetchall()で全件取り出し
rows = cursor.fetchall()

#ＤＢから読み込んだ文章を１行ごとに区切り、空白を排除する。
def read_review(rows):
    txt = []
    for row in rows:
        txt += list(row)
    document = ''.join(txt)

    texts = document.split("\r\n")

    flag = False
    for text in texts:
        #print(text)
        if text == '':
            flag = True

    if flag == True:
        texts.remove('') 
    return texts

def score(point):
    if point > 5:
      point = 5.00
    if point < 0:
      point < 0.00
    return point

texts = read_review(rows)
bf = BayesianFilter()
#テキストを学習
for text in texts:
    bf.fit(text,"良い")

#悪い点のみ読み込む
cursor.execute("SELECT bad_review FROM reviews WHERE gadget_id = %s" % input)
# fetchall()で全件取り出し
rows = cursor.fetchall()

texts = read_review(rows)
#テキストを学習
for text in texts:
    bf.fit(text,"悪い")

performance = "性能機能動スペック"
design = "デザイン形見た目外見"
cost = "コストパフォーマンスコスパ"
feel = "使用感"

#予測
p_pre, p_scorelist = bf.predict(performance)
d_pre, d_scorelist = bf.predict(design)
c_pre, c_scorelist = bf.predict(cost)
f_pre, f_scorelist = bf.predict(feel)

p_score = 3 + (p_scorelist[0][1] - p_scorelist[1][1])
d_score = 3 + (d_scorelist[0][1] - d_scorelist[1][1])
c_score = 3 + (c_scorelist[0][1] - c_scorelist[1][1])
f_score = 3 + (f_scorelist[0][1] - f_scorelist[1][1])

p_score = score(p_score)
d_score = score(d_score)
c_score = score(c_score)
f_score = score(f_score)

#rails側に値を渡す。
print(round(p_score,2))
print(round(d_score,2))
print(round(c_score,2))
print(round(f_score,2))

# 接続を閉じる
connection.close()