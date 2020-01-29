import MySQLdb
from janome.tokenizer import Tokenizer
import codecs
import sys

moji = sys.argv[1]

flag = False
#テキストを一行ずつ処理
texts = moji.split("\r\n")
for text in texts:
    if text == '':
        flag = True

if flag == True:
    texts.remove('')
print(texts)

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
            # 各行は"良い:よい:形容詞:0.999995"
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
for element in sorted(naive_corpus, key=lambda e: sum(e.pn_scores)/len(e.pn_scores), reverse=True):
    sum_average += sum(element.pn_scores)/len(element.pn_scores)
    num += 1

# SQLクエリ実行（データ更新）
f_num = 5 * (1 + sum_average/num)
print(f_num)
        


