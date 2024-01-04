local SPEED_PADDLE = 5.5
local OM_EFFECT = 1

SCR_W, SCR_H = Good.GetWindowSize()

CHAR_SZ = 32
MAX_CHAR = 1000

local STR1000 = '天地玄黃宇宙洪荒日月盈昃辰宿列張寒來暑往秋收冬藏閏餘成歲律呂調陽雲騰致雨露結為霜金生麗水玉出崑崗劍號巨闕珠稱夜光果珍李柰菜重芥薑海鹹河淡鱗潛羽翔龍師火帝鳥官人皇始制文字乃服衣裳推位讓國有虞陶唐弔民伐罪周發殷湯坐朝問道垂拱平章愛育黎首臣伏戎羌遐邇壹體率賓歸王鳴鳳在樹白駒食場化被草木賴及萬方蓋此身髮四大五常恭惟鞠養豈敢毀傷女慕貞絜男效才良知過必改得能莫忘罔談彼短靡恃己長信使可覆器欲難量墨悲絲染詩讚羔羊景行維賢剋念作聖德建名立形端表正空谷傳聲虛堂習聽禍因惡積福緣善慶尺璧非寶寸陰是競資父事君曰嚴與敬孝當竭力忠則盡命臨深履薄夙興溫凊似蘭斯馨如松之盛川流不息淵澄取映容止若思言辭安定篤初誠美慎終宜令榮業所基藉甚無竟學優登仕攝職從政存以甘棠去而益詠樂殊貴賤禮別尊卑上和下睦夫唱婦隨外受傅訓入奉母儀諸姑伯叔猶子比兒孔懷兄弟同氣連枝交友投分切磨箴規仁慈隱惻造次弗離節義廉退顛沛匪虧性靜情逸心動神疲守真志滿逐物意移堅持雅操好爵自縻都邑華夏東西二京背邙面洛浮渭據涇宮殿盤鬱樓觀飛驚圖寫禽獸畫綵仙靈丙舍傍啟甲帳對楹肆筵設席鼓瑟吹笙升階納陛弁轉疑星右通廣內左達承明既集墳典亦聚群英杜稿鍾隸漆書壁經府羅將相路俠槐卿戶封八縣家給千兵高冠陪輦驅轂振纓世祿侈富車駕肥輕策功茂實勒碑刻銘磻溪伊尹佐時阿衡奄宅曲阜微旦孰營桓公匡合濟弱扶傾綺迴漢惠說感武丁俊乂密勿多士寔寧晉楚更霸趙魏困橫假途滅虢踐土會盟何遵約法韓弊煩刑起翦頗牧用軍最精宣威沙漠馳譽丹青九州禹跡百郡秦并嶽宗恒岱禪主云亭雁門紫塞雞田赤城昆池碣石鉅野洞庭曠遠綿邈巖岫杳冥治本於農務茲稼穡俶載南畝我藝黍稷稅熟貢新勸賞黜陟孟軻敦素史魚秉直庶幾中庸勞謙謹敕聆音察理鑒貌辨色貽厥嘉猷勉其祗植省躬譏誡寵增抗極殆辱近恥林皋幸即兩疏見機解組誰逼索居閒處沉默寂寥求古尋論散慮逍遙欣奏累遣慼謝歡招渠荷的歷園莽抽條枇杷晚翠梧桐早凋陳根委翳落葉飄颻遊鵾獨運凌摩絳霄耽讀翫市寓目囊箱易輶攸畏屬耳垣牆具膳餐飯適口充腸飽飫烹宰飢厭糟糠親戚故舊老少異糧妾御績紡侍巾帷房紈扇圓潔銀燭煒煌晝眠夕寐藍筍象床弦歌酒宴接杯舉觴矯手頓足悅豫且康嫡後嗣續祭祀烝嘗稽顙再拜悚懼恐惶牋牒簡要顧答審詳骸垢想浴執熱願涼驢騾犢特駭躍超驤誅斬賊盜捕獲叛亡布射遼丸嵇琴阮嘯恬筆倫紙鈞巧任釣釋紛利俗並皆佳妙毛施淑姿工顰妍笑年矢每催曦暉朗曜璇璣懸斡晦魄環照指薪修祜永綏吉劭矩步引領俯仰廊廟束帶矜莊徘徊瞻眺孤陋寡聞愚蒙等誚謂語助者焉哉乎也'
local STR1000_ZHUYIN = {
  [1]='ㄊㄧㄢ',[2]='ㄉㄧˋ',[3]='ㄒㄩㄢˊ',[4]='ㄏㄨㄤˊ',[5]='ㄩˇ',[6]='ㄓㄡˋ',[7]='ㄏㄨㄥˊ',[8]='ㄏㄨㄤ',[9]='ㄖˋ',[10]='ㄩㄝˋ',[11]='ㄧㄥˊ',[12]='ㄗㄜˋ',[13]='ㄔㄣˊ',[14]='ㄒㄧㄡˋ',[15]='ㄌㄧㄝˋ',[16]='ㄓㄤ',[17]='ㄏㄢˊ',[18]='ㄌㄞˊ',[19]='ㄕㄨˇ',[20]='ㄨㄤˇ',[21]='ㄑㄧㄡ',[22]='ㄕㄡ',[23]='ㄉㄨㄥ',[24]='ㄘㄤˊ',[25]='ㄖㄨㄣˋ',[26]='ㄩˊ',[27]='ㄔㄥˊ',[28]='ㄙㄨㄟˋ',[29]='ㄌㄩˋ',[30]='ㄌㄩˇ',[31]='ㄊㄧㄠˊ',[32]='ㄧㄤˊ',[33]='ㄩㄣˊ',[34]='ㄊㄥˊ',[35]='ㄓˋ',[36]='ㄩˇ',[37]='ㄌㄨˋ',[38]='ㄐㄧㄝˊ',[39]='ㄨㄟˊ',[40]='ㄕㄨㄤ',[41]='ㄐㄧㄣ',[42]='ㄕㄥ',[43]='ㄌㄧˋ',[44]='ㄕㄨㄟˇ',[45]='ㄩˋ',[46]='ㄔㄨ',[47]='ㄎㄨㄣ',[48]='ㄍㄤ',[49]='ㄐㄧㄢˋ',[50]='ㄏㄠˋ',[51]='ㄐㄩˋ',[52]='ㄑㄩㄝˋ',[53]='ㄓㄨ',[54]='ㄔㄥ',[55]='ㄧㄝˋ',[56]='ㄍㄨㄤ',[57]='ㄍㄨㄛˇ',[58]='ㄓㄣ',[59]='ㄌㄧˇ',[60]='ㄋㄞˋ',[61]='ㄘㄞˋ',[62]='ㄓㄨㄥˋ',[63]='ㄐㄧㄝˋ',[64]='ㄐㄧㄤ',[65]='ㄏㄞˇ',[66]='ㄒㄧㄢˊ',[67]='ㄏㄜˊ',[68]='ㄉㄢˋ',[69]='ㄌㄧㄣˊ',[70]='ㄑㄧㄢˊ',[71]='ㄩˇ',[72]='ㄒㄧㄤˊ',[73]='ㄌㄨㄥˊ',[74]='ㄕ',[75]='ㄏㄨㄛˇ',[76]='ㄉㄧˋ',[77]='ㄋㄧㄠˇ',[78]='ㄍㄨㄢ',[79]='ㄖㄣˊ',[80]='ㄏㄨㄤˊ',[81]='ㄕˇ',[82]='ㄓˋ',[83]='ㄨㄣˊ',[84]='ㄗˋ',[85]='ㄋㄞˇ',[86]='ㄈㄨˊ',[87]='ㄧ',[88]='ㄕㄤ˙',[89]='ㄊㄨㄟ',[90]='ㄨㄟˋ',[91]='ㄖㄤˋ',[92]='ㄍㄨㄛˊ',[93]='ㄧㄡˇ',[94]='ㄩˊ',[95]='ㄊㄠˊ',[96]='ㄊㄤˊ',[97]='ㄉㄧㄠˋ',[98]='ㄇㄧㄣˊ',[99]='ㄈㄚ',[100]='ㄗㄨㄟˋ',
  [101]='ㄓㄡ',[102]='ㄈㄚ',[103]='ㄧㄣ',[104]='ㄊㄤ',[105]='ㄗㄨㄛˋ',[106]='ㄔㄠˊ',[107]='ㄨㄣˋ',[108]='ㄉㄠˋ',[109]='ㄔㄨㄟˊ',[110]='ㄍㄨㄥˇ',[111]='ㄆㄧㄥˊ',[112]='ㄓㄤ',[113]='ㄞˋ',[114]='ㄩˋ',[115]='ㄌㄧˊ',[116]='ㄕㄡˇ',[117]='ㄔㄣˊ',[118]='ㄈㄨˊ',[119]='ㄖㄨㄥˊ',[120]='ㄑㄧㄤ',[121]='ㄒㄧㄚˊ',[122]='ㄦˇ',[123]='ㄧ',[124]='ㄊㄧˇ',[125]='ㄕㄨㄞˋ',[126]='ㄅㄧㄣ',[127]='ㄍㄨㄟ',[128]='ㄨㄤˋ',[129]='ㄇㄧㄥˊ',[130]='ㄈㄥˋ',[131]='ㄗㄞˋ',[132]='ㄕㄨˋ',[133]='ㄅㄞˊ',[134]='ㄐㄩ',[135]='ㄕˊ',[136]='ㄔㄤˇ',[137]='ㄏㄨㄚˋ',[138]='ㄆㄧ',[139]='ㄘㄠˇ',[140]='ㄇㄨˋ',[141]='ㄌㄞˋ',[142]='ㄐㄧˊ',[143]='ㄨㄢˋ',[144]='ㄈㄤ',[145]='ㄍㄞˋ',[146]='ㄘˇ',[147]='ㄕㄣ',[148]='ㄈㄚˇ',[149]='ㄙˋ',[150]='ㄉㄚˋ',[151]='ㄨˇ',[152]='ㄔㄤˊ',[153]='ㄍㄨㄥ',[154]='ㄨㄟˊ',[155]='ㄐㄩˊ',[156]='ㄧㄤˇ',[157]='ㄑㄧˇ',[158]='ㄍㄢˇ',[159]='ㄏㄨㄟˇ',[160]='ㄕㄤ',[161]='ㄋㄩˇ',[162]='ㄇㄨˋ',[163]='ㄓㄣ',[164]='ㄐㄧㄝˊ',[165]='ㄋㄢˊ',[166]='ㄒㄧㄠˋ',[167]='ㄘㄞˊ',[168]='ㄌㄧㄤˊ',[169]='ㄓ',[170]='ㄍㄨㄛˋ',[171]='ㄅㄧˋ',[172]='ㄍㄞˇ',[173]='ㄉㄜˊ',[174]='ㄋㄥˊ',[175]='ㄇㄛˋ',[176]='ㄨㄤˋ',[177]='ㄨㄤˇ',[178]='ㄊㄢˊ',[179]='ㄅㄧˇ',[180]='ㄉㄨㄢˇ',[181]='ㄇㄧˇ',[182]='ㄕˋ',[183]='ㄐㄧˇ',[184]='ㄔㄤˊ',[185]='ㄒㄧㄣˋ',[186]='ㄕˇ',[187]='ㄎㄜˇ',[188]='ㄈㄨˋ',[189]='ㄑㄧˋ',[190]='ㄩˋ',[191]='ㄋㄢˊ',[192]='ㄌㄧㄤˊ',[193]='ㄇㄛˋ',[194]='ㄅㄟ',[195]='ㄙ',[196]='ㄖㄢˇ',[197]='ㄕ',[198]='ㄗㄢˋ',[199]='ㄍㄠ',[200]='ㄧㄤˊ',
  [201]='ㄐㄧㄥˇ',[202]='ㄒㄧㄥˋ',[203]='ㄨㄟˊ',[204]='ㄒㄧㄢˊ',[205]='ㄎㄜˋ',[206]='ㄋㄧㄢˋ',[207]='ㄗㄨㄛˋ',[208]='ㄕㄥˋ',[209]='ㄉㄜˊ',[210]='ㄐㄧㄢˋ',[211]='ㄇㄧㄥˊ',[212]='ㄌㄧˋ',[213]='ㄒㄧㄥˊ',[214]='ㄉㄨㄢ',[215]='ㄅㄧㄠˇ',[216]='ㄓㄥˋ',[217]='ㄎㄨㄥ',[218]='ㄍㄨˇ',[219]='ㄔㄨㄢˊ',[220]='ㄕㄥ',[221]='ㄒㄩ',[222]='ㄊㄤˊ',[223]='ㄒㄧˊ',[224]='ㄊㄧㄥˋ',[225]='ㄏㄨㄛˋ',[226]='ㄧㄣ',[227]='ㄜˋ',[228]='ㄐㄧ',[229]='ㄈㄨˊ',[230]='ㄩㄢˊ',[231]='ㄕㄢˋ',[232]='ㄑㄧㄥˋ',[233]='ㄔˇ',[234]='ㄅㄧˋ',[235]='ㄈㄟ',[236]='ㄅㄠˇ',[237]='ㄘㄨㄣˋ',[238]='ㄧㄣ',[239]='ㄕˋ',[240]='ㄐㄧㄥˋ',[241]='ㄗ',[242]='ㄈㄨˋ',[243]='ㄕˋ',[244]='ㄐㄩㄣ',[245]='ㄩㄝ',[246]='ㄧㄢˊ',[247]='ㄩˇ',[248]='ㄐㄧㄥˋ',[249]='ㄒㄧㄠˋ',[250]='ㄉㄤ',[251]='ㄐㄧㄝˊ',[252]='ㄌㄧˋ',[253]='ㄓㄨㄥ',[254]='ㄗㄜˊ',[255]='ㄐㄧㄣˋ',[256]='ㄇㄧㄥˋ',[257]='ㄌㄧㄣˊ',[258]='ㄕㄣ',[259]='ㄌㄩˇ',[260]='ㄅㄛˊ',[261]='ㄙㄨˋ',[262]='ㄒㄧㄥ',[263]='ㄨㄣ',[264]='ㄐㄧㄥˋ',[265]='ㄙˋ',[266]='ㄌㄢˊ',[267]='ㄙ',[268]='ㄒㄧㄣ',[269]='ㄖㄨˊ',[270]='ㄙㄨㄥ',[271]='ㄓ',[272]='ㄕㄥˋ',[273]='ㄔㄨㄢ',[274]='ㄌㄧㄡˊ',[275]='ㄅㄨˋ',[276]='ㄒㄧˊ',[277]='ㄩㄢ',[278]='ㄔㄥˊ',[279]='ㄑㄩˇ',[280]='ㄧㄥˋ',[281]='ㄖㄨㄥˊ',[282]='ㄓˇ',[283]='ㄖㄨㄛˋ',[284]='ㄙ',[285]='ㄧㄢˊ',[286]='ㄘˊ',[287]='ㄢ',[288]='ㄉㄧㄥˋ',[289]='ㄉㄨˇ',[290]='ㄔㄨ',[291]='ㄔㄥˊ',[292]='ㄇㄟˇ',[293]='ㄕㄣˋ',[294]='ㄓㄨㄥ',[295]='ㄧˊ',[296]='ㄌㄧㄥˋ',[297]='ㄖㄨㄥˊ',[298]='ㄧㄝˋ',[299]='ㄙㄨㄛˇ',[300]='ㄐㄧ',
  [301]='ㄐㄧˊ',[302]='ㄕㄣˋ',[303]='ㄨˊ',[304]='ㄐㄧㄥˋ',[305]='ㄒㄩㄝˊ',[306]='ㄧㄡ',[307]='ㄉㄥ',[308]='ㄕˋ',[309]='ㄕㄜˋ',[310]='ㄓˊ',[311]='ㄘㄨㄥˊ',[312]='ㄓㄥˋ',[313]='ㄘㄨㄣˊ',[314]='ㄧˇ',[315]='ㄍㄢ',[316]='ㄊㄤˊ',[317]='ㄑㄩˋ',[318]='ㄦˊ',[319]='ㄧˋ',[320]='ㄩㄥˇ',[321]='ㄩㄝˋ',[322]='ㄕㄨ',[323]='ㄍㄨㄟˋ',[324]='ㄐㄧㄢˋ',[325]='ㄌㄧˇ',[326]='ㄅㄧㄝˊ',[327]='ㄗㄨㄣ',[328]='ㄅㄟ',[329]='ㄕㄤˇ',[330]='ㄏㄜˊ',[331]='ㄒㄧㄚˋ',[332]='ㄇㄨˋ',[333]='ㄈㄨ',[334]='ㄔㄤˋ',[335]='ㄈㄨˋ',[336]='ㄙㄨㄟˊ',[337]='ㄨㄞˋ',[338]='ㄕㄡˋ',[339]='ㄈㄨˋ',[340]='ㄒㄩㄣˋ',[341]='ㄖㄨˋ',[342]='ㄈㄥˋ',[343]='ㄇㄨˇ',[344]='ㄧˊ',[345]='ㄓㄨ',[346]='ㄍㄨ',[347]='ㄅㄛˊ',[348]='ㄕㄨˊ',[349]='ㄧㄡˊ',[350]='ㄗˇ',[351]='ㄅㄧˇ',[352]='ㄦˊ',[353]='ㄎㄨㄥˇ',[354]='ㄏㄨㄞˊ',[355]='ㄒㄩㄥ',[356]='ㄉㄧˋ',[357]='ㄊㄨㄥˊ',[358]='ㄑㄧˋ',[359]='ㄌㄧㄢˊ',[360]='ㄓ',[361]='ㄐㄧㄠ',[362]='ㄧㄡˇ',[363]='ㄊㄡˊ',[364]='ㄈㄣˋ',[365]='ㄑㄧㄝ',[366]='ㄇㄛˊ',[367]='ㄓㄣ',[368]='ㄍㄨㄟ',[369]='ㄖㄣˊ',[370]='ㄘˊ',[371]='ㄧㄣˇ',[372]='ㄘㄜˋ',[373]='ㄗㄠˋ',[374]='ㄘˋ',[375]='ㄈㄨˊ',[376]='ㄌㄧˊ',[377]='ㄐㄧㄝˊ',[378]='ㄧˋ',[379]='ㄌㄧㄢˊ',[380]='ㄊㄨㄟˋ',[381]='ㄉㄧㄢ',[382]='ㄆㄟˋ',[383]='ㄈㄟˇ',[384]='ㄎㄨㄟ',[385]='ㄒㄧㄥˋ',[386]='ㄐㄧㄥˋ',[387]='ㄑㄧㄥˊ',[388]='ㄧˋ',[389]='ㄒㄧㄣ',[390]='ㄉㄨㄥˋ',[391]='ㄕㄣˊ',[392]='ㄆㄧˊ',[393]='ㄕㄡˇ',[394]='ㄓㄣ',[395]='ㄓˋ',[396]='ㄇㄢˇ',[397]='ㄓㄨˊ',[398]='ㄨˋ',[399]='ㄧˋ',[400]='ㄧˊ',
  [401]='ㄐㄧㄢ',[402]='ㄔˊ',[403]='ㄧㄚˇ',[404]='ㄘㄠ',[405]='ㄏㄠˇ',[406]='ㄐㄩㄝˊ',[407]='ㄗˋ',[408]='ㄇㄧˊ',[409]='ㄉㄨ',[410]='ㄧˋ',[411]='ㄏㄨㄚˊ',[412]='ㄒㄧㄚˋ',[413]='ㄉㄨㄥ',[414]='ㄒㄧ',[415]='ㄦˋ',[416]='ㄐㄧㄥ',[417]='ㄅㄟˋ',[418]='ㄇㄤˊ',[419]='ㄇㄧㄢˋ',[420]='ㄌㄨㄛˋ',[421]='ㄈㄨˊ',[422]='ㄨㄟˋ',[423]='ㄐㄩˋ',[424]='ㄐㄧㄥ',[425]='ㄍㄨㄥ',[426]='ㄉㄧㄢˋ',[427]='ㄆㄢˊ',[428]='ㄩˋ',[429]='ㄌㄡˊ',[430]='ㄍㄨㄢˋ',[431]='ㄈㄟ',[432]='ㄐㄧㄥ',[433]='ㄊㄨˊ',[434]='ㄒㄧㄝˇ',[435]='ㄑㄧㄣˊ',[436]='ㄕㄡˋ',[437]='ㄏㄨㄚˋ',[438]='ㄘㄞˇ',[439]='ㄒㄧㄢ',[440]='ㄌㄧㄥˊ',[441]='ㄅㄧㄥˇ',[442]='ㄕㄜˋ',[443]='ㄆㄤˊ',[444]='ㄑㄧˇ',[445]='ㄐㄧㄚˇ',[446]='ㄓㄤˋ',[447]='ㄉㄨㄟˋ',[448]='ㄧㄥˊ',[449]='ㄙˋ',[450]='ㄧㄢˊ',[451]='ㄕㄜˋ',[452]='ㄒㄧˊ',[453]='ㄍㄨˇ',[454]='ㄙㄜˋ',[455]='ㄔㄨㄟ',[456]='ㄕㄥ',[457]='ㄕㄥ',[458]='ㄐㄧㄝ',[459]='ㄋㄚˋ',[460]='ㄅㄧˋ',[461]='ㄅㄧㄢˋ',[462]='ㄓㄨㄢˇ',[463]='ㄧˊ',[464]='ㄒㄧㄥ',[465]='ㄧㄡˋ',[466]='ㄊㄨㄥ',[467]='ㄍㄨㄤˇ',[468]='ㄋㄟˋ',[469]='ㄗㄨㄛˇ',[470]='ㄉㄚˊ',[471]='ㄔㄥˊ',[472]='ㄇㄧㄥˊ',[473]='ㄐㄧˋ',[474]='ㄐㄧˊ',[475]='ㄈㄣˊ',[476]='ㄉㄧㄢˇ',[477]='ㄧˋ',[478]='ㄐㄩˋ',[479]='ㄑㄩㄣˊ',[480]='ㄧㄥ',[481]='ㄉㄨˋ',[482]='ㄍㄠˇ',[483]='ㄓㄨㄥ',[484]='ㄌㄧˋ',[485]='ㄑㄧ',[486]='ㄕㄨ',[487]='ㄅㄧˋ',[488]='ㄐㄧㄥ',[489]='ㄈㄨˇ',[490]='ㄌㄨㄛˊ',[491]='ㄐㄧㄤˋ',[492]='ㄒㄧㄤ',[493]='ㄌㄨˋ',[494]='ㄒㄧㄚˊ',[495]='ㄏㄨㄞˊ',[496]='ㄑㄧㄥ',[497]='ㄏㄨˋ',[498]='ㄈㄥ',[499]='ㄅㄚ',[500]='ㄒㄧㄢˋ',
  [501]='ㄐㄧㄚ',[502]='ㄐㄧˇ',[503]='ㄑㄧㄢ',[504]='ㄅㄧㄥ',[505]='ㄍㄠ',[506]='ㄍㄨㄢ',[507]='ㄆㄟˊ',[508]='ㄋㄧㄢˇ',[509]='ㄑㄩ',[510]='ㄍㄨˇ',[511]='ㄓㄣˋ',[512]='ㄧㄥ',[513]='ㄕˋ',[514]='ㄌㄨˋ',[515]='ㄔˇ',[516]='ㄈㄨˋ',[517]='ㄐㄩ',[518]='ㄐㄧㄚˋ',[519]='ㄈㄟˊ',[520]='ㄑㄧㄥ',[521]='ㄘㄜˋ',[522]='ㄍㄨㄥ',[523]='ㄇㄠˋ',[524]='ㄕˊ',[525]='ㄌㄜˋ',[526]='ㄅㄟ',[527]='ㄎㄜˋ',[528]='ㄇㄧㄥˊ',[529]='ㄆㄢˊ',[530]='ㄒㄧ',[531]='ㄧ',[532]='ㄧㄣˇ',[533]='ㄗㄨㄛˇ',[534]='ㄕˊ',[535]='ㄜ',[536]='ㄏㄥˊ',[537]='ㄧㄢ',[538]='ㄓㄜˋ',[539]='ㄑㄩ',[540]='ㄈㄨˋ',[541]='ㄨㄟˊ',[542]='ㄉㄢˋ',[543]='ㄕㄨˊ',[544]='ㄧㄥˊ',[545]='ㄏㄨㄢˊ',[546]='ㄍㄨㄥ',[547]='ㄎㄨㄤ',[548]='ㄏㄜˊ',[549]='ㄐㄧˋ',[550]='ㄖㄨㄛˋ',[551]='ㄈㄨˊ',[552]='ㄑㄧㄥ',[553]='ㄑㄧˇ',[554]='ㄏㄨㄟˊ',[555]='ㄏㄢˋ',[556]='ㄏㄨㄟˋ',[557]='ㄩㄝˋ',[558]='ㄍㄢˇ',[559]='ㄨˇ',[560]='ㄉㄧㄥ',[561]='ㄐㄩㄣˋ',[562]='ㄧˋ',[563]='ㄇㄧˋ',[564]='ㄨˋ',[565]='ㄉㄨㄛ',[566]='ㄕˋ',[567]='ㄕˊ',[568]='ㄋㄧㄥˊ',[569]='ㄐㄧㄣˋ',[570]='ㄔㄨˇ',[571]='ㄍㄥ',[572]='ㄅㄚˋ',[573]='ㄓㄠˋ',[574]='ㄨㄟˋ',[575]='ㄎㄨㄣˋ',[576]='ㄏㄥˊ',[577]='ㄐㄧㄚˇ',[578]='ㄊㄨˊ',[579]='ㄇㄧㄝˋ',[580]='ㄍㄨㄛˊ',[581]='ㄐㄧㄢˋ',[582]='ㄊㄨˇ',[583]='ㄏㄨㄟˋ',[584]='ㄇㄥˊ',[585]='ㄏㄜˊ',[586]='ㄗㄨㄣ',[587]='ㄩㄝ',[588]='ㄈㄚˇ',[589]='ㄏㄢˊ',[590]='ㄅㄧˋ',[591]='ㄈㄢˊ',[592]='ㄒㄧㄥˊ',[593]='ㄑㄧˇ',[594]='ㄐㄧㄢˇ',[595]='ㄆㄛˇ',[596]='ㄇㄨˋ',[597]='ㄩㄥˋ',[598]='ㄐㄩㄣ',[599]='ㄗㄨㄟˋ',[600]='ㄐㄧㄥ',
  [601]='ㄒㄩㄢ',[602]='ㄨㄟ',[603]='ㄕㄚ',[604]='ㄇㄛˋ',[605]='ㄔˊ',[606]='ㄩˋ',[607]='ㄉㄢ',[608]='ㄑㄧㄥ',[609]='ㄐㄧㄡˇ',[610]='ㄓㄡ',[611]='ㄩˇ',[612]='ㄐㄧ',[613]='ㄅㄞˇ',[614]='ㄐㄩㄣˋ',[615]='ㄑㄧㄣˊ',[616]='ㄅㄧㄥˋ',[617]='ㄩㄝˋ',[618]='ㄗㄨㄥ',[619]='ㄏㄥˊ',[620]='ㄉㄞˋ',[621]='ㄕㄢˋ',[622]='ㄓㄨˇ',[623]='ㄩㄣˊ',[624]='ㄊㄧㄥˊ',[625]='ㄧㄢˋ',[626]='ㄇㄣˊ',[627]='ㄗˇ',[628]='ㄙㄞˋ',[629]='ㄐㄧ',[630]='ㄊㄧㄢˊ',[631]='ㄔˋ',[632]='ㄔㄥˊ',[633]='ㄎㄨㄣ',[634]='ㄔˊ',[635]='ㄐㄧㄝˊ',[636]='ㄕˊ',[637]='ㄐㄩˋ',[638]='ㄧㄝˇ',[639]='ㄉㄨㄥˋ',[640]='ㄊㄧㄥˊ',[641]='ㄎㄨㄤˋ',[642]='ㄩㄢˇ',[643]='ㄇㄧㄢˊ',[644]='ㄇㄧㄠˇ',[645]='ㄧㄢˊ',[646]='ㄒㄧㄡˋ',[647]='ㄧㄠˇ',[648]='ㄇㄧㄥˊ',[649]='ㄓˋ',[650]='ㄅㄣˇ',[651]='ㄩˊ',[652]='ㄋㄨㄥˊ',[653]='ㄨˋ',[654]='ㄗ',[655]='ㄐㄧㄚˋ',[656]='ㄙㄜˋ',[657]='ㄔㄨˋ',[658]='ㄗㄞˋ',[659]='ㄋㄢˊ',[660]='ㄇㄨˇ',[661]='ㄨㄛˇ',[662]='ㄧˋ',[663]='ㄕㄨˇ',[664]='ㄐㄧˋ',[665]='ㄕㄨㄟˋ',[666]='ㄕㄨˊ',[667]='ㄍㄨㄥˋ',[668]='ㄒㄧㄣ',[669]='ㄑㄩㄢˋ',[670]='ㄕㄤˇ',[671]='ㄔㄨˋ',[672]='ㄓˋ',[673]='ㄇㄥˋ',[674]='ㄎㄜ',[675]='ㄉㄨㄣ',[676]='ㄙㄨˋ',[677]='ㄕˇ',[678]='ㄩˊ',[679]='ㄅㄧㄥˇ',[680]='ㄓˊ',[681]='ㄕㄨˋ',[682]='ㄐㄧ',[683]='ㄓㄨㄥ',[684]='ㄩㄥ',[685]='ㄌㄠˊ',[686]='ㄑㄧㄢ',[687]='ㄐㄧㄣˇ',[688]='ㄔˋ',[689]='ㄌㄧㄥˊ',[690]='ㄧㄣ',[691]='ㄔㄚˊ',[692]='ㄌㄧˇ',[693]='ㄐㄧㄢˋ',[694]='ㄇㄠˋ',[695]='ㄅㄧㄢˋ',[696]='ㄙㄜˋ',[697]='ㄧˊ',[698]='ㄐㄩㄝˊ',[699]='ㄐㄧㄚ',[700]='ㄧㄡˊ',
  [701]='ㄇㄧㄢˇ',[702]='ㄑㄧˊ',[703]='ㄓ',[704]='ㄓˊ',[705]='ㄒㄧㄥˇ',[706]='ㄍㄨㄥ',[707]='ㄐㄧ',[708]='ㄐㄧㄝˋ',[709]='ㄔㄨㄥˇ',[710]='ㄗㄥ',[711]='ㄎㄤˋ',[712]='ㄐㄧˊ',[713]='ㄉㄞˋ',[714]='ㄖㄨˋ',[715]='ㄐㄧㄣˋ',[716]='ㄔˇ',[717]='ㄌㄧㄣˊ',[718]='ㄍㄠ',[719]='ㄒㄧㄥˋ',[720]='ㄐㄧˊ',[721]='ㄌㄧㄤˇ',[722]='ㄕㄨ',[723]='ㄐㄧㄢˋ',[724]='ㄐㄧ',[725]='ㄐㄧㄝˇ',[726]='ㄗㄨˇ',[727]='ㄕㄟˊ',[728]='ㄅㄧ',[729]='ㄙㄨㄛˇ',[730]='ㄐㄩ',[731]='ㄒㄧㄢˊ',[732]='ㄔㄨˇ',[733]='ㄔㄣˊ',[734]='ㄇㄛˋ',[735]='ㄐㄧˊ',[736]='ㄌㄧㄠˊ',[737]='ㄑㄧㄡˊ',[738]='ㄍㄨˇ',[739]='ㄒㄩㄣˊ',[740]='ㄌㄨㄣˋ',[741]='ㄙㄢˋ',[742]='ㄌㄩˋ',[743]='ㄒㄧㄠ',[744]='ㄧㄠˊ',[745]='ㄒㄧㄣ',[746]='ㄗㄡˋ',[747]='ㄌㄟˇ',[748]='ㄑㄧㄢˇ',[749]='ㄑㄧ',[750]='ㄒㄧㄝˋ',[751]='ㄏㄨㄢ',[752]='ㄓㄠ',[753]='ㄑㄩˊ',[754]='ㄏㄜˊ',[755]='ㄉㄧˋ',[756]='ㄌㄧˋ',[757]='ㄩㄢˊ',[758]='ㄇㄤˇ',[759]='ㄔㄡ',[760]='ㄊㄧㄠˊ',[761]='ㄆㄧˊ',[762]='ㄆㄚˊ',[763]='ㄨㄢˇ',[764]='ㄘㄨㄟˋ',[765]='ㄨˊ',[766]='ㄊㄨㄥˊ',[767]='ㄗㄠˇ',[768]='ㄉㄧㄠ',[769]='ㄔㄣˊ',[770]='ㄍㄣ',[771]='ㄨㄟˇ',[772]='ㄧˋ',[773]='ㄌㄨㄛˋ',[774]='ㄧㄝˋ',[775]='ㄆㄧㄠ',[776]='ㄧㄠˊ',[777]='ㄧㄡˊ',[778]='ㄎㄨㄣ',[779]='ㄉㄨˊ',[780]='ㄩㄣˋ',[781]='ㄌㄧㄥˊ',[782]='ㄇㄛˊ',[783]='ㄐㄧㄤˋ',[784]='ㄒㄧㄠ',[785]='ㄉㄢ',[786]='ㄉㄨˊ',[787]='ㄨㄢˋ',[788]='ㄕˋ',[789]='ㄩˋ',[790]='ㄇㄨˋ',[791]='ㄋㄤˊ',[792]='ㄒㄧㄤ',[793]='ㄧˋ',[794]='ㄧㄡˊ',[795]='ㄧㄡ',[796]='ㄨㄟˋ',[797]='ㄓㄨˇ',[798]='ㄦˇ',[799]='ㄩㄢˊ',[800]='ㄑㄧㄤˊ',
  [801]='ㄐㄩˋ',[802]='ㄕㄢˋ',[803]='ㄘㄢ',[804]='ㄈㄢˋ',[805]='ㄕˋ',[806]='ㄎㄡˇ',[807]='ㄔㄨㄥ',[808]='ㄔㄤˊ',[809]='ㄅㄠˇ',[810]='ㄩˋ',[811]='ㄆㄥ',[812]='ㄗㄞˇ',[813]='ㄐㄧ',[814]='ㄧㄢˋ',[815]='ㄗㄠ',[816]='ㄎㄤ',[817]='ㄑㄧㄣ',[818]='ㄑㄧ',[819]='ㄍㄨˋ',[820]='ㄐㄧㄡˋ',[821]='ㄌㄠˇ',[822]='ㄕㄠˋ',[823]='ㄧˋ',[824]='ㄌㄧㄤˊ',[825]='ㄑㄧㄝˋ',[826]='ㄩˋ',[827]='ㄐㄧ',[828]='ㄈㄤˇ',[829]='ㄕˋ',[830]='ㄐㄧㄣ',[831]='ㄨㄟˊ',[832]='ㄈㄤˊ',[833]='ㄨㄢˊ',[834]='ㄕㄢˋ',[835]='ㄩㄢˊ',[836]='ㄐㄧㄝˊ',[837]='ㄧㄣˊ',[838]='ㄓㄨˊ',[839]='ㄨㄟˇ',[840]='ㄏㄨㄤˊ',[841]='ㄓㄡˋ',[842]='ㄇㄧㄢˊ',[843]='ㄒㄧˋ',[844]='ㄇㄟˋ',[845]='ㄌㄢˊ',[846]='ㄙㄨㄣˇ',[847]='ㄒㄧㄤˋ',[848]='ㄔㄨㄤˊ',[849]='ㄒㄧㄢˊ',[850]='ㄍㄜ',[851]='ㄐㄧㄡˇ',[852]='ㄧㄢˋ',[853]='ㄐㄧㄝ',[854]='ㄅㄟ',[855]='ㄐㄩˇ',[856]='ㄕㄤ',[857]='ㄐㄧㄠˇ',[858]='ㄕㄡˇ',[859]='ㄉㄨㄣˋ',[860]='ㄗㄨˊ',[861]='ㄩㄝˋ',[862]='ㄩˋ',[863]='ㄑㄧㄝˇ',[864]='ㄎㄤ',[865]='ㄉㄧˊ',[866]='ㄏㄡˋ',[867]='ㄙˋ',[868]='ㄒㄩˋ',[869]='ㄐㄧˋ',[870]='ㄙˋ',[871]='ㄓㄥ',[872]='ㄔㄤˊ',[873]='ㄑㄧˇ',[874]='ㄙㄤˇ',[875]='ㄗㄞˋ',[876]='ㄅㄞˋ',[877]='ㄙㄨㄥˇ',[878]='ㄐㄩˋ',[879]='ㄎㄨㄥˇ',[880]='ㄏㄨㄤˊ',[881]='ㄐㄧㄢ',[882]='ㄉㄧㄝˊ',[883]='ㄐㄧㄢˇ',[884]='ㄧㄠˋ',[885]='ㄍㄨˋ',[886]='ㄉㄚˊ',[887]='ㄕㄣˇ',[888]='ㄒㄧㄤˊ',[889]='ㄏㄞˊ',[890]='ㄍㄡˋ',[891]='ㄒㄧㄤˇ',[892]='ㄩˋ',[893]='ㄓˊ',[894]='ㄖㄜˋ',[895]='ㄩㄢˋ',[896]='ㄌㄧㄤˊ',[897]='ㄌㄩˊ',[898]='ㄌㄨㄛˊ',[899]='ㄉㄨˊ',[900]='ㄊㄜˋ',
  [901]='ㄏㄞˋ',[902]='ㄩㄝˋ',[903]='ㄔㄠ',[904]='ㄒㄧㄤ',[905]='ㄓㄨ',[906]='ㄓㄢˇ',[907]='ㄗㄟˊ',[908]='ㄉㄠˋ',[909]='ㄅㄨˇ',[910]='ㄏㄨㄛˋ',[911]='ㄆㄢˋ',[912]='ㄨㄤˊ',[913]='ㄅㄨˋ',[914]='ㄕㄜˋ',[915]='ㄌㄧㄠˊ',[916]='ㄨㄢˊ',[917]='ㄐㄧ',[918]='ㄑㄧㄣˊ',[919]='ㄖㄨㄢˇ',[920]='ㄒㄧㄠˋ',[921]='ㄊㄧㄢˊ',[922]='ㄅㄧˇ',[923]='ㄌㄨㄣˊ',[924]='ㄓˇ',[925]='ㄐㄩㄣ',[926]='ㄑㄧㄠˇ',[927]='ㄖㄣˊ',[928]='ㄉㄧㄠˋ',[929]='ㄕˋ',[930]='ㄈㄣ',[931]='ㄌㄧˋ',[932]='ㄙㄨˊ',[933]='ㄅㄧㄥˋ',[934]='ㄐㄧㄝ',[935]='ㄐㄧㄚ',[936]='ㄇㄧㄠˋ',[937]='ㄇㄠˊ',[938]='ㄕ',[939]='ㄕㄨˊ',[940]='ㄗ',[941]='ㄍㄨㄥ',[942]='ㄆㄧㄣˊ',[943]='ㄧㄢˊ',[944]='ㄒㄧㄠˋ',[945]='ㄋㄧㄢˊ',[946]='ㄕˇ',[947]='ㄇㄟˇ',[948]='ㄘㄨㄟ',[949]='ㄒㄧ',[950]='ㄏㄨㄟ',[951]='ㄌㄤˇ',[952]='ㄧㄠˋ',[953]='ㄒㄩㄢˊ',[954]='ㄐㄧ',[955]='ㄒㄩㄢˊ',[956]='ㄨㄛˋ',[957]='ㄏㄨㄟˋ',[958]='ㄆㄛˋ',[959]='ㄏㄨㄢˊ',[960]='ㄓㄠˋ',[961]='ㄓˇ',[962]='ㄒㄧㄣ',[963]='ㄒㄧㄡ',[964]='ㄏㄨˋ',[965]='ㄩㄥˇ',[966]='ㄙㄨㄟ',[967]='ㄐㄧˊ',[968]='ㄕㄠˋ',[969]='ㄐㄩˇ',[970]='ㄅㄨˋ',[971]='ㄧㄣˇ',[972]='ㄌㄧㄥˇ',[973]='ㄈㄨˇ',[974]='ㄧㄤˇ',[975]='ㄌㄤˊ',[976]='ㄇㄧㄠˋ',[977]='ㄕㄨˋ',[978]='ㄉㄞˋ',[979]='ㄐㄧㄣ',[980]='ㄓㄨㄤ',[981]='ㄆㄞˊ',[982]='ㄏㄨㄞˊ',[983]='ㄓㄢ',[984]='ㄊㄧㄠˋ',[985]='ㄍㄨ',[986]='ㄌㄡˋ',[987]='ㄍㄨㄚˇ',[988]='ㄨㄣˊ',[989]='ㄩˊ',[990]='ㄇㄥˊ',[991]='ㄉㄥˇ',[992]='ㄑㄧㄠˋ',[993]='ㄨㄟˋ',[994]='ㄩˇ',[995]='ㄓㄨˋ',[996]='ㄓㄜˇ',[997]='ㄧㄢ',[998]='ㄗㄞ',[999]='ㄏㄨ',[1000]='ㄧㄝˇ'}

function DefaultBouncingBlockOnStep(param)
  local id = param._id
  local x, y = Good.GetPos(id)
  x = x + param.dirx
  y = y + param.diry
  Good.SetPos(id, x, y)
  local l,t,w,h = Good.GetDim(id)
  if (SCR_W <= x + w or 0 >= x) then
    param.dirx = -1 * param.dirx
  end
  if (SCR_H <= y or 0 >= y) then
    Good.KillObj(id)
    return true
  else
    return false
  end
end

function FindTouchAreaObj(id)
  local left_area = Good.FindChild(id, 'left area', 1)
  local right_area = Good.FindChild(id, 'right area', 1)
  return left_area, right_area
end

function GenCharObj(n)
  if (MAX_CHAR < n) then
    return -1
  end
  local a,b,c = string.byte(STR1000, (n-1)*3+1, (n-1)*3+4)
  Graphics.SetFont(Graphics.SYSTEM_FONT)
  local o = Good.GenTextObj(-1, string.char(a,b,c), CHAR_SZ)
  return o
end

function GetCharZhuyin(n)
  if (MAX_CHAR < n) then
    return ''
  else
    return STR1000_ZHUYIN[n]
  end
end

function GenScaleCharObj(n, sz)
  local o = GenCharObj(n)
  local no = Good.GetChild(o, 0)
  if (CHAR_SZ ~= sz) then
    ScaleToSize(no, sz, sz)
    Good.SetPos(no, -sz/2, -sz/2)
  else
    Good.SetPos(no, -16, -16)
  end
  return o
end

function GenBkgndStars()
  local stars = {Good.GenDummy(-1), Good.GenDummy(-1), Good.GenDummy(-1)}
  local p = Stge.GetFirstParticle()
  while (-1 ~= p) do
    local nextp = Stge.GetNextParticle(p)
    local d = Stge.GetUserData(p, 0)
    local c = 255 * Stge.GetUserData(p, 1)
    local o = GenColorObj(stars[d], 2, 2, GetColorFromARgb(255, c, c, c))
    Good.SetPos(o, Stge.GetPos(p))
    p = nextp
  end
  Stge.KillAllParticle()                -- Stars are generated so we can kill all particles now.
  return stars
end

function GenBounceObj(top_param, x, y, dir, BouncingBlockName)
  local o = GenColorObj(-1, 10, 10, 0xffff0000, BouncingBlockName)
  Good.SetPos(o, x, y)
  local param = Good.GetParam(o)
  param.dirx = top_param.deltax + 100/60 * math.cos(dir * math.pi / 180)
  param.diry = 100/60 * math.sin(dir * math.pi / 180)
  return o
end

function GenHitFxByPos(x, y)
  Stge.RunScript('fx_hit', x,y, OM_EFFECT)
end

function GenHitFxByParticle(p)
  GenHitFxByPos(Good.GetPos(Stge.GetParticleBind(p)))
end

function IsEffect(p)
  return 200 == Stge.GetUserData(p, 0, OM_EFFECT)
end

function MovePaddle(param, obj_paddle, obj_left, obj_right)
  local IsLeftTouch = false
  local IsRightTouch = false
  if (Input.IsKeyDown(Input.LBUTTON)) then
    local x,y = Input.GetMousePos()
    if (PtInObj(x, y, obj_left)) then
      IsLeftTouch = true
    elseif (PtInObj(x, y, obj_right)) then
      IsRightTouch = true
    end
  end
  if (IsLeftTouch or Input.IsKeyDown(Input.LEFT)) then
    local x,y = Good.GetPos(obj_paddle)
    x = x - SPEED_PADDLE
    if (0 > x) then
      x = 0
    end
    Good.SetPos(obj_paddle, x, y)
    param.deltax = param.deltax - 0.25
    if (-1 > param.deltax) then
      param.deltax = -1
    end
    MoveStars(param.stars, x)
  elseif (IsRightTouch or Input.IsKeyDown(Input.RIGHT)) then
    local x,y = Good.GetPos(obj_paddle)
    local l,t,w,h = Good.GetDim(obj_paddle)
    x = x + SPEED_PADDLE
    if (x + w > SCR_W) then
      x = SCR_W - w
    end
    Good.SetPos(obj_paddle, x, y)
    param.deltax = param.deltax + 0.25
    if (1 < param.deltax) then
      param.deltax = 1
    end
    MoveStars(param.stars, x)
  else
    param.deltax = 0
  end
end

function MoveStars(stars, x)
  local offset = (x - SCR_W/2) / SCR_W
  for i = 1, #stars do
    Good.SetPos(stars[i], 8 * i * offset, 0)
  end
end

function MyIncrementor()
  local a = AutoIncrementor()
  return function()
    local i = a()
    if (i > MAX_CHAR) then
      a = AutoIncrementor()
      return a()
    else
      return i
    end
  end
end

function HittestParticleByPaddle(param, p, obj_paddle, BouncingBlockName)
  local o = Stge.GetParticleBind(p)
  local x, y = Good.GetPos(o)
  if (PtInObj(x, y, obj_paddle)) then
    -- Create new bouncing obj to replace the particle that hits obj_paddle.
    local bo = GenBounceObj(param, x, y, 360 - Stge.GetDirection(p), BouncingBlockName)
    Stge.RunScript('fx_hit', x,y, OM_EFFECT)
    -- Kill original particle and binding obj.
    Stge.KillParticle(p)
    Good.KillObj(o)
    return bo
  end
  return -1
end