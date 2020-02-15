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

#良い点のみ
#cursor.execute("SELECT good_review FROM reviews WHERE gadget_id = %s" % input)
cursor.execute("SELECT good_review FROM reviews WHERE id = %s" % input)
# fetchall()で全件取り出し
rows = cursor.fetchall()

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

texts = read_review(rows)
bf = BayesianFilter()
#テキストを学習
for text in texts:
    bf.fit(text,"良い")

#悪い点のみ
#cursor.execute("SELECT bad_review FROM reviews WHERE gadget_id = %s" % input)
cursor.execute("SELECT bad_review FROM reviews WHERE id = %s" % input)
# fetchall()で全件取り出し
rows = cursor.fetchall()

texts = read_review(rows)
#テキストを学習
for text in texts:
    bf.fit(text,"悪い")

performance = "性能"
design = "デザイン"
cost = "コストパフォーマンス"
feel = "使用感"

#予測
p_pre, p_scorelist = bf.predict(performance)
d_pre, d_scorelist = bf.predict(design)
c_pre, c_scorelist = bf.predict(cost)
f_pre, f_scorelist = bf.predict(feel)

# print(performance,",", p_pre,",",p_scorelist[0][1],",",p_scorelist[1][1],
#         design,",", d_pre,",",d_scorelist[0][1],",",d_scorelist[1][1],
#         cost,",", c_pre,",",c_scorelist[0][1],",",c_scorelist[1][1],
#         feel,",", f_pre,",",f_scorelist[0][1],",",f_scorelist[1][1])
print(p_pre,(1.1 - p_scorelist[0][1]/(p_scorelist[0][1] + p_scorelist[1][1])),
        d_pre,(1.1 - d_scorelist[0][1]/(d_scorelist[0][1] + d_scorelist[1][1])),
        c_pre,(1.1 - c_scorelist[0][1]/(c_scorelist[0][1] + c_scorelist[1][1])),
        f_pre,(1.1 - f_scorelist[0][1]/(f_scorelist[0][1] + f_scorelist[1][1])))

# 接続を閉じる
connection.close()