import MySQLdb
from janome.tokenizer import Tokenizer
import codecs
import sys
import datetime

input = sys.argv[1]

try:
    # データベースへの接続とカーソルの生成
    connection = MySQLdb.connect(
        host='localhost',
        user='root',
        passwd='',
        db='review',
        charset='utf8')
    cursor = connection.cursor()
    
    cursor.execute("SELECT users.birthday FROM reviews INNER JOIN users ON users.id = reviews.user_id WHERE gadget_id = %s" % input)
    rows = cursor.fetchall()
    txts = []
    for row in rows:
        txts += list(row)
    for txt in txts:
        print(txt) 

    dt_now = datetime.datetime.now()
    print(dt_now)
        
    # 保存を実行
    connection.commit()

    # 接続を閉じる
    connection.close()
except MySQLdb.Error as ex:
    print('MySQL Error: ', ex)



