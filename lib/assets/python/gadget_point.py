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
    
    cursor.execute("SELECT good_review,bad_review FROM reviews WHERE gadget_id = %s" % input)
    # fetchall()で全件取り出し
    rows = cursor.fetchall()
    #print(rows)
    txt = []
    for row in rows:
        txt += list(row)
    moji = ''.join(txt)

    flag = False
    #テキストを一行ずつ処理
    texts = moji.split()
    for text in texts:
        if text == '':
            flag = True

    if flag == True:
        texts.remove('')
    #print(texts)

    class CorpusElement:
        def __init__(self, text='', tokens=[], pn_scores=[]):
            self.text = text # テキスト本文
            self.tokens = tokens # 構文木解析されたトークンのリスト
            self.pn_scores = pn_scores # 感情極性値(後述)

    # CorpusElementのリスト
    naive_corpus = []

    naive_tokenizer = Tokenizer()

    for text in texts:
        tokens = naive_tokenizer.tokenize(text)
        element = CorpusElement(text, tokens)
        naive_corpus.append(element)
        
    def load_pn_dict():
        dic = {}
        
        with codecs.open('lib/assets/python/pn_ja.dic', 'r', 'shift_jis') as f:
            lines = f.readlines()
            
            for line in lines:
                columns = line.split(':')
                dic[columns[0]] = float(columns[3])      
        return dic

    # トークンリストから極性値リストを得る
    def get_pn_scores(tokens, pn_dic):
        scores = []
        
        for surface in [t.surface for t in tokens if t.part_of_speech.split(',')[0] in ['動詞','名詞', '形容詞', '副詞']]:
            if surface in pn_dic:
                scores.append(pn_dic[surface])
            
        return scores

    # 感情極性対応表のロード
    pn_dic = load_pn_dict()

    # 各文章の極性値リストを得る
    for element in naive_corpus:
        element.pn_scores = get_pn_scores(element.tokens, pn_dic)

    sum_average = 0
    num = 0
    print("平均値が最も高い順に表示")
    for element in sorted(naive_corpus, key=lambda e: sum(e.pn_scores)/len(e.pn_scores), reverse=True):
        sum_average += sum(element.pn_scores)/len(element.pn_scores)
        num += 1

    # SQLクエリ実行（データ更新）
    f_num = 5 * (1 + sum_average/num)
    print(f_num)
    cursor.execute('UPDATE gadgets SET review_point = %f WHERE id = %s' % (f_num, input))
        
    # 保存を実行
    connection.commit()

    # 接続を閉じる
    connection.close()
except MySQLdb.Error as ex:
    print('MySQL Error: ', ex)



