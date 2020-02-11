import MySQLdb
from janome.tokenizer import Tokenizer
import codecs
import sys

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
    cursor.execute("SELECT AVG(review_point) FROM reviews WHERE gadget_id = %s" % input)
    rows = cursor.fetchone()
    f_num = rows[0]
    print(f_num)
    
    cursor.execute('UPDATE gadgets SET review_point = %f WHERE id = %s' % (f_num,input))
        
    # 保存を実行
    connection.commit()

    # 接続を閉じる
    connection.close()
except MySQLdb.Error as ex:
    print('MySQL Error: ', ex)



