select * from tabs;
select * from userdata;
select * from placeinfo;
select * from result;
drop table placeinfo;
select count(*) from userdata;

select review, count(*) cnt from userdata group by review;

select prevletter, count(*) cnt from userdata where not prevletter is null group by prevletter;

select count(distinct prevletter) from userdata;

select nextletter, count(*) cnt from userdata where not nextletter is null group by nextletter;

drop table userdata cascade constraint;

create table userdata(
   nickname varchar2(100) primary key,
   age varchar2(10) not null,
   city varchar2(20),
   prevletter varchar2(50),
   nextletter varchar2(50),
   review varchar2(100),
   constraint age_ck check(age in ('10대','20대','30대','40대','50대','60대이상'))
);
drop table userdata cascade constraint;

--create table placeinfo(
--	placeid varchar2(100) primary key,
--	quiz varchar2(100),
--	explanation varchar2(1000),
--	latitude number(10,6),
--	longitude number(10,6),
--	path varchar2(100),
--	constraint quiz_fk foreign key(quiz) references quizinfo(quiz)
--);

create table placeinfo( 
	placeid varchar2(100) primary key,
	quiz varchar2(100),
	explanation varchar2(1000),
	latitude number(10,6), --위도
	longitude number(10,6), --경도
	path varchar2(100) -- 사진경로  
);

insert into placeinfo values('광주역 광장', 'Q2' , '이곳은 5·18민주화운동 당시 광주시민과 계엄군 사이에 치열한 공방전이 벌어졌던 곳이다.' , 35.165009 , 126.908978 , './518images/광주역광장.jpg');
insert into placeinfo values('구 시외버스 공용터미널 일대', 'Q3' , '여기는 5·18민주화운동 당시 시외버스 공용터미널이 있던 곳으로, 전남 일원을 잇는 교통 중심지였다. 5월 19일 오후 이곳에서 계엄군의 과잉진압을 규탄하는 대규모 시위가 있었다.' , 35.155125 , 126.913111 , './518images/구시외버스공용터미널일대.jpg');
insert into placeinfo values('금남로(구 카톨릭센터)', 'Q23' , '이곳 금남로는 광주시민들이 계엄군에 맞서 5·18민주화운동 기간 중 연일 격렬하게 저항했던 항쟁의 거리다.' , 35.149522 , 126.916765 , './518images/구가톨릭센터.jpg');
insert into placeinfo values('구 전남도청', 'Q24' , '이곳 전남도청은 5·18민주화운동 본부가 있던 곳이며, 최후의 항전을 벌이다 수많은 시민군이 이곳에서 산화했다.' , 35.146827 , 126.920255 , './518images/구전남도청.jpg');
insert into placeinfo values('구 광주적십자병원', 'Q6' , '이 병원은 5·18민주화운동 당시에는 광주적십자병원으로, 부상당한 시민과 시민군을 헌신적으로 치료하고 돌본 곳이다.' , 35.144647 , 126.914644 , './518images/구적십자병원.jpg');
insert into placeinfo values('전남대학교 정문', 'Q1' , '이곳은 한국 민주주의 역사에 찬연히 빛나는 5·18민주화운동이 시작된 곳이다.' , 35.172785 , 126.905227 , './518images/전남대학교.jpg');
insert into placeinfo values('518 민주 광장', 'Q4' , '이곳 5·18민주광장은 한국 민주주의의 상징적 장소다. 5·18민주화운동 당시 광주시민들이 여기 분수대를 연단으로 하여 각종 집회를 열어 항쟁 의지를 불태웠다.' , 35.14743 , 126.919358 , './518images/518민주광장.jpg');
insert into placeinfo values('상무관', 'Q5' , '이곳 상무관은 5·18민주화운동 당시 희생자들의 주검을 임시 안치했던 곳이다.' , 35.147992 , 126.920058 , './518images/상무관.jpg');
insert into placeinfo values('조선대학교', 'Q7' , '조선대학교 학생들은 전남대학교 학생들과 함께 5·18민주화운동 이전부터 이 지역 민주화운동에 앞장섰으며, 항쟁 기간에는 시민군 지도부에서 중요한 역할을 담당했다.' , 35.143256 , 126.926532 , './518images/조선대학교.jpg');
insert into placeinfo values('배고픈 다리 일대', 'Q8' , '여기 있던 배고픈다리(현 홍림교) 일대는 5·18민주화운동이 치열하던 5월 21일, 시민군이 시내 중심가에서 계엄군을 물리친 후 모범적으로 지역방위를 했던 곳이다.' , 35.132047 , 126.936359 , './518images/배고픈다리일대.jpg');
insert into placeinfo values('주남마을 인근 양민학살지', 'Q9' , '이곳은 5·18민주화운동 당시인 5월 21일 광주 시내에서 조선대학교 뒷산을 넘어 퇴각, 이곳 주남마을에 주둔하던 계엄군은 광주―화순간 도로를 오가는 차량들에게 무차별 총격을 자행하였다.' , 35.101714 , 126.940349 , './518images/주남마을인근양민학살지.jpg');
insert into placeinfo values('광목간 양민 학살지', 'Q10' , '이곳은 5·18민주화운동 당시인 1980년 5월 24일, 계엄군간의 오인 사격 여파로 무고한 양민이 무참히 희생당한 곳이다.' , 35.111374 , 126.894994 , './518images/광목간양민학살지.jpg');
insert into placeinfo values('농성광장 격전지', 'Q11' , '이곳은 5·18민주화운동 당시, 5월 22일 광주시내에서 쫓겨온 계엄군이 통제선을 설치하고 농성광장의 시민군 방어선과 대치하면서 인근 주택가에 무차별 총격을 가해 무고한 시민이 희생당한 곳이다.' , 35.152993 , 126.885549 , './518images/농성광장격전지.jpg');
insert into placeinfo values('광주YMCA', 'Q19' , '이곳은 5·18민주화운동 당시 항쟁지도부가 자주 옥내집회를 열었던 곳이다.' , 35.147903 , 126.918348 , './518images/YMCA.jpg');
insert into placeinfo values('광주YWCA 옛 터', 'Q20' , '이곳은 5월 27일 새벽 전남도청을 공략하던 계엄군의 주요 공격 목표가 되어, 이곳 최후의 항전에서도 많은 시민군이 희생되었다.' , 35.14868 , 126.918997 , './518images/광주YMCA옛터.jpg');
insert into placeinfo values('광주MBC 옛터', 'Q25' , '여기에는 5·18민주화운동 당시 광주문화방송국(MBC)이 있었다.' , 35.150514 , 126.920111 , './518images/광주MBC옛터.jpg');
insert into placeinfo values('녹두서점 옛터', 'Q26' , '이곳은 5·18민주화운동 산실 가운데 한곳인 녹두서점이 있던 자리다.' , 35.150159 , 126.92159 , './518images/녹두서점옛터.jpg');
insert into placeinfo values('전남대학교 병원', 'Q27' , '이 병원은 5·18민주화운동 당시 부상당한 시민과 시민군을 헌신적으로 치료하여 의료인의 참모습을 보인, 광주항쟁의 야전병원이었다.' , 35.141799 , 126.92188 , './518images/전남대학교병원.jpg');
insert into placeinfo values('광주기독병원', 'Q28' , '이 병원은 5·18민주화운동 당시 부상당한 시민들을 헌신적으로 치료한, 민주의료 현장이다.' , 35.136725 , 126.912243 , './518images/광주기독병원.jpg');
insert into placeinfo values('상무대 옛터', 'Q21' , '이곳은 상무대(육군 전투병과 교육사령부)가 있었던 자리로 5·18민주화운동 당시 여기에 계엄사령부 전남․북계엄분소가 설치되어 있었다.' , 35.148556 , 126.840194 , './518images/상무대옛터.jpg');
insert into placeinfo values('무등경기장 정문', 'Q12' , '이곳은 5·18민주화운동 당시인 5월 21일, 계엄군의 과잉진압에 격분한 운전기사들이 모여 항쟁 참가를 선언하고 차량시위를 시작한 곳이다.' , 35.168478 , 126.890794 , './518images/무등경기장정문.jpg');
insert into placeinfo values('양동시장', 'Q29' , '이곳 광주양동시장은 대인시장과 함께 5·18민주화운동 당시 상인들이 시민군들에게 주먹밥과 생필품을 제공하는 등, 모든 시민이 하나가 되는 대동정신을 앞장서 발휘했던 곳이다.' , 35.154089 , 126.902306 , './518images/양동시장.jpg');
insert into placeinfo values('광주공원광장-시민군 편성지', 'Q13' , '이곳은 5·18민주화운동이 치열하던 5월 21일 전남도청 앞에서 자행된 계엄군의 집단 발포로 많은 사상자가 나자, 자위수단으로 인근 시ㆍ군지역에서 총과 탄약을 가져와 시민군을 편성하고 사격술 훈련을 실시했던 곳이다.' , 35.147033 , 126.909975 , './518images/광주공원광장-시민군편성지.jpg');
insert into placeinfo values('5·18 최초발포지', 'Q30' , '이곳은 5·18민주화운동 때 계엄군이 비무장 시민을 향해 최초로 발포를 했던 곳이다.' , 35.156955 , 126.920733 , './518images/518최초발포지.jpg');
insert into placeinfo values('광주교도소', 'Q14' , '이곳은 5·18민주화운동 당시 계엄군이 주둔해 있으면서 담양, 순천방면으로 이동하던 차량과 시민들에게 총격을 가해 많은 양민이 희생당한 곳이다.' , 35.187643 , 126.930621 , './518images/광주교도소.jpg');
insert into placeinfo values('국군광주병원', 'Q15' , '이곳은 5·18민주화운동 당시 계엄사에 연행돼 심문 과정에서 고문과 폭행으로 부상을 당한 시민들이 끌려와 강제 치료를 받았던 곳이다.' , 35.150556 , 126.873602 , './518images/국군광주병원.jpg');
insert into placeinfo values('5·18 구묘지', 'Q16' , '이곳은 5·18민주화운동 당시 산화한 영령들이 묻혔던 곳으로 망월동 묘지라 불려왔다.' , 35.234638 , 126.933573 , './518images/518구묘지.jpg');
insert into placeinfo values('남동성당', 'Q31' , '당여기 남동성당은 1980년 5월 22일 당시의 주임신부를 비롯하여 광주의 민주인사들이 모여 시민들의 희생을 막기 위한 수습대책을 논의한 장소이다.' , 35.144373 , 126.920934 , './518images/남동성당.jpg');
insert into placeinfo values('505보안부대 옛터', 'Q22' , '이곳은 전남지역 군 정보부대였던 505보안부대가 자리 잡고 있었던 곳이다.' , 35.149805 , 126.866383 , './518images/505보안부대옛터.jpg');
insert into placeinfo values('들불야학 옛터', 'Q17' , '이곳은 ‘광천동성당’의 교리실이었으며, 1978년 들불야학이 설립되어 학교에 가지 못한 노동자들이 저녁에 공부하였던 곳이다.' , 35.166244 , 126.88102 , './518images/들불야학옛터.jpg');
insert into placeinfo values('전일빌딩', 'Q18' , '5․18당시 계엄군의 헬기발포 총탄흔적 발견 등의 역사적인 장소이다.' , 35.148278 , 126.918845 , './518images/전일빌딩.jpg');
insert into placeinfo values('고 홍남순 변호사 가옥', 'Q32' , '5․18당시 민주주의를 쟁취하기 위해 토론과 회의를 진행했던 장소이며 구속자 석방 논의, 관련문건 작성 등을 했던 역사적인 공간이다.' , 35.150957 , 126.919617 , './518images/고홍남순변호사가옥.jpg');

select * from placeinfo;
update placeinfo set quiz = 'Q1' where placeid='전남대학교 정문';

create table placeex (
	ex varchar2(1000)
);
select * from placeex;

update placeinfo set quiz = 'Q2' where placeid='광주역 광장';
update placeinfo set quiz = 'Q3' where placeid='구 시외버스 공용터미널 일대';
update placeinfo set quiz = 'Q4' where placeid='518 민주 광장';
update placeinfo set quiz = 'Q5' where placeid='상무관';
update placeinfo set quiz = 'Q6' where placeid='구 광주적십자병원';
update placeinfo set quiz = 'Q7' where placeid='조선대학교';
update placeinfo set quiz = 'Q8' where placeid='배고픈 다리 일대';
update placeinfo set quiz = 'Q9' where placeid='주남마을 인근 양민학살지';
update placeinfo set quiz = 'Q10' where placeid='광목간 양민 학살지';
update placeinfo set quiz = 'Q11' where placeid='농성광장 격전지';
update placeinfo set quiz = 'Q12' where placeid='무등경기장 정문';
update placeinfo set quiz = 'Q13' where placeid='광주공원광장-시민군 편성지';
update placeinfo set quiz = 'Q14' where placeid='광주교도소';
update placeinfo set quiz = 'Q15' where placeid='국군광주병원';
update placeinfo set quiz = 'Q16' where placeid='5·18 구묘지';
update placeinfo set quiz = 'Q17' where placeid='들불야학 옛터';
update placeinfo set quiz = 'Q18' where placeid='전일빌딩';
update placeinfo set quiz = 'Q19' where placeid='광주YMCA';
update placeinfo set quiz = 'Q20' where placeid='광주YWCA 옛 터';
update placeinfo set quiz = 'Q21' where placeid='상무대 옛터';
update placeinfo set quiz = 'Q22' where placeid='505보안부대 옛터';
update placeinfo set quiz = 'Q23' where placeid='금남로(구 카톨릭센터)';
update placeinfo set quiz = 'Q24' where placeid='구 전남도청';
update placeinfo set quiz = 'Q25' where placeid='광주MBC 옛터';
update placeinfo set quiz = 'Q26' where placeid='녹두서점 옛터';
update placeinfo set quiz = 'Q27' where placeid='전남대학교 병원';
update placeinfo set quiz = 'Q28' where placeid='광주기독병원';
update placeinfo set quiz = 'Q29' where placeid='양동시장';
update placeinfo set quiz = 'Q30' where placeid='5·18 최초발포지';
update placeinfo set quiz = 'Q31' where placeid='남동성당';
update placeinfo set quiz = 'Q32' where placeid='고 홍남순 변호사 가옥';


delete table USERDATA;
delete from placeinfo;

--create table quizinfo(
--	quiz varchar2(100) primary key,
--	quiz_ex varchar2(1000) not null,
--	quiz_type varchar2(10),
--	answer varchar2(100)
--);

create table quizinfo (
    quiz varchar2(10) primary key, 
    placeid varchar2(100),
    quiz_type varchar2(10),
    quiz_ex varchar2(4000), -- 퀴즈 설명
    answer varchar2(4000), -- 퀴즈 정답 
    quiz_path varchar2(100), -- 퀴즈파일 경로 
    constraint placeid_fk foreign key(placeid) references placeinfo(placeid)
);

drop table quizinfo cascade constraint;
select * from quizinfo;

insert into quizinfo values ('Q23','금남로(구 카톨릭센터)','puzzle','null','null','null');
insert into quizinfo values ('Q24','구 전남도청','puzzle','null','null','null');
insert into quizinfo values ('Q25','광주MBC 옛터','puzzle','null','null','null');
insert into quizinfo values ('Q26','녹두서점 옛터','puzzle','null','null','null');
insert into quizinfo values ('Q27','전남대학교 병원','puzzle','null','null','null');
insert into quizinfo values ('Q28','광주기독병원','puzzle','null','null','null');
insert into quizinfo values ('Q29','양동시장','puzzle','null','null','null');
insert into quizinfo values ('Q30','5·18 최초발포지','puzzle','null','null','null');
insert into quizinfo values ('Q31','남동성당','puzzle','null','null','null');
delete from quizinfo where quiz = 'Q12'; 

insert into quizinfo values ('Q2','광주역 광장','wordle','시위가 더욱 가열된 5월 20일 밤 광주역에 주둔해 있던 계엄군은 무자비한 유혈 진압에 항의하며 나아가는 비무장 시민들을 향해 발포,다수의 사상자를 내었으며, 21일 아침 이곳에서 주검 2구가 발견되었다.
이들 주검이 전남도청 앞 광장으로 옮겨지자 소식을 들은 시민 수십만명이 민주화운동에 적극 동참함으로써 항쟁은 절정으로 치닫았다.
 광주역 일대는 차량과 사람의 왕래가 많은 공간이며, 시위대의 중요한 이동로였다. 이는 전남대학교 학생들이 5월 14∼16일 도심으로 행진하고 귀교할 때 광주역 광장을 경유했다는 점에서도 알 수 있다. 5월 18일 전남대학교 정문에서 사건이 발생한 이후 에도 학생들은 광주역 광장을 경유해 금남로로 가서 시민들에게 비극을 전했다.
 광주역은 외부와 연결된 주요 관문이라는 점에서 전략적 요충지였다. 광주역은 계엄군의 만행이 다른 지역으로 전파될 수 있는 출구였고, 반대로 계엄군이 광주로 들어오는 입구들 가운데 하나였다. 계엄군이 광주로 이동했던 경로는 세 가지였다. 첫째 항공기를 이용해 광주 공항으로 들어오는 것, 둘째 기차를 이용해 광주역과 송정역으로 들어오는 것, 셋째 차량을 이용해 호남 고속도로로 들어오는 것이었다. 그러므로 계엄군에게 광주역은 반드시 점령해야 하는 장소였다.','ㅇㅗㅏㅇㄹㅐ,ㅇㅣㄷㅗㅇㄹㅗ,ㅇㅛㅊㅜㅇㅈㅣ,ㅊㅜㄹㄱㅜ','../wordle/wordle.jsp');
insert into quizinfo values ('Q3','구 시외버스 공용터미널 일대','wordle','계엄군은 대합실과 지하도에까지 난입, 총검을 휘둘러 이곳은 일시에 피비린내나는 아수라장으로 변했다. 이 소식은 시외버스를 통해 시외로 나간 사람들에 의해 곳곳으로 전파돼 항쟁이 전남 전역으로 확산되는 계기가 되었다.
 시외버스공용터미널은 광주역과 마찬가지로 사람과 차량의 왕래가 많은 곳이었다. 시외버스공용터미널은 각지에서 사람들이 모여들거나 흩어지는 주요 거점이었다. 그리고 시외버스공용터미널 일대의 도로망은 광주역, 금남로 등과 연결되어 시위대의 중요한 이동로였고, 시외버스공용터미널 광장은 집회를 열기에 좋았다. 시외버스공용터미널에서 금남로 4가는 지척이었기에 종종 이곳에서 시위 대열이 형성되곤 했다.','ㅈㅓㄴㅍㅏ,ㅈㅣㅂㅎㅗㅣ','../wordle/wordle.jsp');
insert into quizinfo values ('Q4','518 민주 광장','wordle','1980년 5월 14일부터 16일까지 5ㆍ18민주광장 분수대에서는 ‘민족ㆍ민주화성회’가 개최되었다. 성회를 주도한 것은 학생들이었으나, 시민들과 함께 한 행사였다. 5월 16일에는 분수대를 둘러싸고 횃불을 올려 영원히 잊을 수 없는 역사의 한 장면을 만들었다. 성회에서의 약속은 5·18민중항쟁이 전개되는 중요한 자양분이 되었다.
5·18민주화운동 당시 광주시민들이 여기 분수대를 연단으로 하여 각종 집회를 열어 항쟁 의지를 불태웠다. 5월 18일 이전 3일 동안 학생과 시민들은 이곳에 모여 대규모 민족·민주화대성회를 열고 시국선언문을 발표, 군사통치 종식과 민주화를 촉구하였다
이 집회에는 광주시내 고등학생들도 대거 참여하였다. 5월 21일 계엄군 철수 이후 끊임없이 민주화 투쟁 결의를 다지는 각종 궐기대회가 열렸던 이곳은 바로 5·18민주화운동 정신을 낳은 산실이다.
항쟁 후에도 전국에서 벌어진 민주화 투쟁과정에서 산화한 민주 열사들의 영혼이 이곳에 들러 시민들 분향을 받으며 전국민의 투쟁 의지를 일깨웠다.','ㅂㅜㄴㅅㅜㄷㅐ,ㅎㅗㅐㅅㅂㅜㄹ','../wordle/wordle.jsp');
insert into quizinfo values ('Q5','상무관','wordle','5·18민중항쟁에서 상무관이 의미를 갖게 된 것은 희생자들의 시신을 안치하는 장소로 사용되면서부터였다. 계엄군이 철수한 뒤 산개되어 있던 시신들이 5ㆍ18민주광장으로 집결되었다. 이것은 시신들을 효율적으로 관리하기 위함이었고, 가족들이 희생자의 시신을 빨리 찾을 수 있도록 돕기 위함이었다. 가족들은 시신을 찾아 도심 곳곳을 헤매고 다니느라 고생이 이만저만이 아니었고, 훼손된 시신들을 무수한 사람들이 들여다보는 등 문제가 심각했다.
 시신들은 22일부터 상무관에 안치되었는데, 23일 아침을 기준으로 약 30구 정도였다. 상무관에 안치하지 못한 시신들은 도청과 병원 등에 있었다. 시신들은 관이 부족하여 무명천으로 덮여 있기도 했는데, 부패 방지를 위해 방부제가 살포 되었다. 그리고 추모의 의미와 시신의 부패로 생겨난 냄새를 희석하고자 곳곳에 향이 피워졌다. 상무관은 가족들의 통곡과 오열로 넘쳤고, 탈진한 가족들도 있어 안타까움을 더했다. 상무관앞에는 분향소가 설치되었으며, 도청 민원실에서는 시신들을 촬영한 사진을 보고 혈육을 찾았다.
 집단 발포와 무자비한 진압에 희생된 주검이 이곳에 안치되자 시민들은 다시 한번 계엄군의 행위에 분노의 눈물을 삼켰다. 5·18민주화운동 기간 동안 광주시민들은 줄지어 분향하며 희생자들의 넋을 위로하면서 민주화 의지를 더욱 불태웠다.','ㄴㅜㄴㅁㅜㄹ','../wordle/wordle.jsp');
insert into quizinfo values ('Q6','구 광주적십자병원','wordle','당시 긴박했던 상황에서도 의료진은 부상자들의 생명을 돌보고 살리기 위해 헌신적이고 희생적인 활동을 폈다.
피가 부족하다는 것이 알려지자 시민뿐만이 아니라 인근 유흥업소 종업원들까지 헌혈에 참여, 뜨거운 시민정신을 발휘했다.
항쟁 후에도 계속 부상자들을 따뜻하게 치료해주는 등 적십자 정신을 빛낸 곳이다.','ㅎㅓㄴㅎㅕㄹ,ㅎㅡㅣㅅㅐㅇ','../wordle/wordle.jsp');
insert into quizinfo values ('Q7','조선대학교','wordle','5월 17일 자정 불법적인 비상계엄 확대조치에 따라서 이 대학에도 계엄군이 즉시 진주했으며, 5월 18일부터 21일까지 시내 곳곳에서 연행되어 온 수많은 시민과 학생들이 체육관, 야전막사 등에 수용되어 계엄군으로부터 잔혹한 폭행을 당한 현장이기도 하다.','ㅂㅜㄹㅂㅓㅂ,ㅍㅗㄱㅎㅐㅇ','../wordle/wordle.jsp');
insert into quizinfo values ('Q8','배고픈 다리 일대','wordle','조선대학교 뒷산으로 퇴각한 계엄군이 다시 시내로 진출할 것에 대비, 그날 해질 무렵부터 이 지역 예비군 등 젊은이들이 주축이 되어 시민군을 편성하고, 이 다리를 중심으로 방어망을 구축하여 물샐틈 없는 경계를 폈다. 22일 자정 무렵에는 인근 숙실 마을에서 내려오던 계엄군과 30여분간 총격전을 벌려 그들을 물리치기도 했다.
주민들은 밥을 지어 오고 담배와 음료수를 가져다주는 등 시민군과 한 덩어리가 되어 이곳을 지켰다.','ㅂㅏㅇㅇㅓㅁㅏㅇ,ㄷㅏㅁㅂㅐ,ㅇㅡㅁㄹㅛㅅㅜ,ㅊㅗㅇㄱㅕㄱㅈㅓㄴ','../wordle/wordle.jsp');
insert into quizinfo values ('Q9','주남마을 인근 양민학살지','wordle','5월 23일경에는 승객 18명을 실은 미니버스에 무차별 사격을 가해 승객 가운데 단 1명만이 살아남았다. 이때 계엄군은 부상을 당한 2명을 주남마을 뒷산으로 끌고가 살해하였으며, 그 후 이곳에 묻혀있던 시신은 5·18직후 주민의 신고로 발굴되었다.','ㅁㅣㄴㅣㅂㅓㅅㅡ','../wordle/wordle.jsp');
insert into quizinfo values ('Q10','광목간 양민 학살지','wordle','계엄군은 총소리에 놀라 몸을 피하던 이웃 원제. 진월부락 주민들에게, 심지어 저수지에서 목욕하던 어린이들에게 무차별 총격을 가해 많은 사상자가 발생했다.
또한, 계엄군은 오인사격 화풀이로 광목간 도로변 주택을 수색하여 무고한 주민들을 살상하였으며, 항쟁기간 중 이곳을 지나던 민간차량들에게 무차별 사격을 가해 이곳에서도 사상자가 발생했다.','ㅇㅓㄹㅣㄴㅇㅣ,ㅇㅗㅇㅣㄴㅅㅏㄱㅕㄱ','../wordle/wordle.jsp');
insert into quizinfo values ('Q11','농성광장 격전지','wordle','시민군과 계엄군이 이곳에서 대치하고 있을 때 시민수습대책위원들이 이곳 사선을 넘나들며 상무대에 있던 계엄사를 방문해 중재와 협상을 시도했고, 5월 26일 아침에는 계엄군이 시내로 다시 진입하려 하자 시민수습위원들이 이곳 농성광장에 맨몸으로 누워 저항하는, 죽음의 행진을 했던 현장이다.','ㅈㅜㅇㅈㅐ,ㅎㅕㅂㅅㅏㅇ,ㅈㅜㄱㅇㅡㅁㅇㅡㅣㅎㅐㅇㅈㅣㄴ','../wordle/wordle.jsp');
insert into quizinfo values ('Q12','무등경기장 정문','wordle','운전기사들은 중앙고속터미널 앞, 광주역 앞 등에서 소규모로 자신의 경험과 생각을 공유하다가 자신들이 운용하는 차량을 이용하여 항거하기로 의견을 모았다. 이들은 많은 차량이 일시에 모여들면 계엄군이 어찌하지 못할 것이며, 계엄군의 저지선을 돌파할 수 있을 것으로 보았다. 운전기사들이 무등경기장 앞을 집결지로 선택한 것은 계엄군의 시선을 피하기 좋았고, 다량의 차량이 집결하기 좋다고 판단했기 때문이었다.
 20일 오후 5시 무렵 무등경기장 정문 앞에는 200여 대의 차량이 모여들었다. 이것은 매우 보기 드문 광경이었고, 운전기사들은 한껏 고무되었다. 이들은 차량의 헤드라이트를 켜고, 본 대열은 임동을 관류하는 서림로를 따라 광남사거리로, 일부 차량은 광주역 방면으로 우회하여 광남사거리로 이동했다. 다시 하나가 된 차량 행렬은 금남로 5가까지 진출했다. 시민들은 대규모 차량 행렬과 운전기사들에게 뜨겁게 호응했으며, 계엄군의 저지선을 붕괴시킬 수 있다고 의지를 불태웠다.','ㅇㅜㄴㅈㅓㄴㄱㅣㅅㅏ,ㅈㅓㄴㅈㅗㄷㅡㅇ','../wordle/wordle.jsp');
insert into quizinfo values ('Q13','광주공원광장-시민군 편성지','wordle','5·18민중항쟁에서 광주공원 광장은 시민들의 집결지와 계엄군에 대한 항거를 준비하던 장소로 활용되었다. 5월 18일 오후 광주공원에 모인 시위대는 대열을 이루어 전남도청 방면으로 진출했는데, 태평극장 앞에서 경찰과 대치하다가 시외버스공용터미널로 향했다. 5월 19일 오후에도 광주공원 부근에서 계엄군과 시위대가 충돌했으며, 저녁에는 시위대가 수천 명에 이르렀다. 광주공원 광장에서 시위대가 형성되고, 충돌이 발생하자, 5월 20일 계엄군은 제11공수여단 제12지역대를 광주공원에 배치했다.
 5월 21일 오후부터는 광주공원 광장에 광주ㆍ전남지역에서 가져온 무기들이 속속 집결되었다. 수백 명의 청년들이 계엄군과 맞서겠다고 모여들었다. 처음에는 누구나 총을 받을 수 있었으나, 얼마 후부터는 예비역 장교나 하사관 등이 중심이 되어 일정한 선발 기준을 거쳐 무기가 지급되었고, 군대와 같은 편재로 조직되었다.','ㅅㅣㅁㅣㄴㄱㅜㄴ','../wordle/wordle.jsp');
insert into quizinfo values ('Q14','광주교도소','wordle','광주교도소 일대에서의 민간인 희생은 바로 제3공수여단이 주둔하던 시기에 주로 발생했다. 광주의 다른 외곽지대와 같이 인근 지역에 거주하던 주민들 혹은 다른 지역으로 이동하는 사람들은 광주교도소 앞을 지날 수밖에 없었고, 계엄군의 공격을 받았다.
 계엄군은 광주교도소보다 도심 안쪽에도 진지를 구축했는데, 이들도 오고 가는 차량과 시민을 공격했다. 계엄군은 광주교도소 일대에서 자행된 학살을 ‘교도소 습격’에 대한 반격이라고 호도했다. 이들 가운데 시민군이 포함되어 있었던 것은 맞지만, 교도소를 습격하기 위해 그곳에 왔다는 것은 입증할 수 없는 허구였다. 그들은 단지 다른 지역으로 진출하려던 시민군일 따름이었다. 제3공수여단이 주둔했던 며칠 동안에 희생자들이 집중적으로 발생했던 것은 현지 상황을 자의적으로 해석하여 맹목적인 군사작전을 전개했기 때문이었다. 제3공수여단의 이러한 행위들로 인해 광주교도소와 그 일대는 오랫동안 암매장지로 의심을 받았다. 실제로 5월 31일 광주교도소 울타리에서 8구의 시신이 발굴되었다. 광주교도소는 2015년 10월 북구 삼각동으로 이전했으며, 2017년에는 옛 광주교도소에서 암매장 시신을 발굴하는 작업이 이루어졌다.','ㅅㅣㅁㅣㄴ,ㅎㅏㄱㅅㅏㄹ,ㅇㅜㄹㅌㅏㄹㅣ','../wordle/wordle.jsp');
insert into quizinfo values ('Q15','국군광주병원','wordle','국군광주병원은 상무대로 연행되었던 사람들과 부상당한 군인의 치료가 이루어졌던 곳이다. 계엄군은 시민들을 연행ㆍ구금하면서 폭력과 고문을 가했는데, 자연스럽게 회복되지 않을 경우 국군광주병원으로 후송하여 엄중한 감시 하에 치료를 받게 했다.
 항쟁이 본격화되었던 기간에도 국군광주병원에서 민간인에 대한 치료가 이루어졌다. 광주에서 처음으로 사망자가 발생한 장소가 국군광주병원이었다는 점도 눈길을 끈다. 5월 18일 계엄군에게 구타를 당해 적십자병원으로 후송되었던 김경철이 국군광주병원으로 전원해서 치료를 받았지만, 19일 새벽 사망했던 것이다.
 국군광주병원에서의 민간인 치료는 5월 27일 이후에도 계속되었다. 5·18민중항쟁으로 연행된 대다수의 학생과 시민이 상무대 영창에 수용되었는데, 병세가 심각한 사람들에 대한 치료가 국군광주병원에서 이루어졌기 때문이다. 국군광주병원은 의료 공간이었으나, 계엄당국의 조사와 취조가 이루어지는 공간이기도 했다. 국군광주병원 인근에서도 다수의 희생자들이 발생했다. 5월 22일 오후 4시경부터 제20사단 제62연대 제2대대가 3대의 장갑차를 앞세우고 국군광주병원에서 돌고개까지를 확보하는 작전을 전개했다. 국군광주병원 주변에는 중앙정보부 전남지부와 505보안부대 등이 위치하고 있음에도 시민이 자유롭게 이동하자 이를 차단하는데 목적을 두었다. 제20사단은 일명 국군광주병원 확보작전을 수행하면서 인근 주민들에게 발포했다. 평소에 보기 힘든 광경을 호기심으로 쳐다보던 주민들이 공격을 받았다. 계엄군의 총탄은 주거지 곳곳으로 날아들었고, 부상자가 속출했다.','ㄱㅣㅁㄱㅕㅇㅊㅓㄹ','../wordle/wordle.jsp');
insert into quizinfo values ('Q16','5·18 구묘지','wordle',' 5월 27일 계엄군이 전남도청을 점령한 뒤, 희생자 시신을 어떻게 할 것인가가 현안이 되었다. 잠정적으로 파악된 시신은 상무관 61구, 도청 26구, 국군통합병원 16구, 교도소 앞 1구, 광주역 6구, 효덕동 4구, 광주고등학교 앞 2구 등 총 116구였다. 입관되지 않은 시신들의 상태는 처참하기 이를 데 없었다. 정부가 1985년에 공식 발표한 민간인 희생자 수가 164명이었음을 감안하면, 희생자 시신들 위치가 모두 파악되지 않았다고 할 수 있다. 이후 여기저기에서 시신이 발견되었고, 암매장된 시신도 확인되었다. 그래서 민간인 희생자의 규모에 대해 각종 소문이 있었고, 정부의 발표를 불신했으며, 이에 관한 의문은 현재에도 완전히 해소되지 않고 있다.
 계엄사령부는 5월 27일부터 6월 6일까지 검사와 군법무관 등으로 하여금 희생자의 시신을 검안하게 했다. 검안을 끝낸 시신들 가운데 가족이 찾아간 경우를 제외하고는 광주시립공원묘지 제3묘역에 일괄 매장했다. 시신들은 차량과 인원 등의 부족으로 전남 6913호 덤프 차량 등에 실려 이동하여 유가족과 시민의 분노를 샀다. 5월 29일 제3묘역에서 129구에 대한 장례가 있었으나, ‘폭도’의 시신으로 분류되었던 이들에 대한 장례가 제대로 이루어질리 없었다. 극도의 공포와 불안 속에서 이루어졌던 장례에 참가한 사람도 거의 없었다.','ㅎㅡㅣㅅㅐㅇㅈㅏ,ㅇㅏㅁㅁㅐㅈㅏㅇ,ㅈㅏㅇㄹㅖ','../wordle/wordle.jsp');
insert into quizinfo values ('Q17','들불야학 옛터','wordle',' 들불야학이 활동한 광천동 일대는 광주의 대표적인 공업단지였다. 윤상원은 광천동 시민아파트를 임대하여 사실상 이들과 함께 생활하며, 사회운동을 도모했다. 5·18민중항쟁이 발발하자 들불야학 강사와 학생은 조직적으로 항쟁에 참여했다. 이들은 수습대책위원회의 위원과 시민군 등으로 활동했으며, 당국에 통제된 언론과 방송을 대신했던 ｢투사회보｣를 비롯해 각종 유인물을 제작했다. 첫 유인물은 5월 19일 윤상원이 제안하고 강학과 학생이 방안을 협의하여 간행되었다. 이들은 “선언문”, “민주수호 전남도민 총 궐기문” 등의 유인물을 제작했다. ｢투사회보｣라는 제하의 유인물은 5월 21일부터 발간되었다. ｢투사회보｣는 24일까지 들불야학 팀이 발간을 주관하고, 이후는 보위를 위해 도청의 항쟁지도부에게 이관했다. 항쟁지도부는 광주YWCA에서 ｢투사회보｣를 이어서 발간했다. 그리하여 ｢투사회보｣8호가 제작되었고, 다음 호부터는 ｢민주시민회보｣로 개칭되었다. 비록 들불야학 전체로는 활동을 멈추었으나, (들불야학팀은) 25일 이후에도 자유의사로 항쟁에 참여하여 많은 이들이 끝까지 현장을 지켰다.','ㄷㅡㄹㅂㅜㄹ,ㅌㅜㅅㅏㅎㅗㅣㅂㅗ,ㅇㅠㅇㅣㄴㅁㅜㄹ,ㅅㅓㄴㅇㅓㄴㅁㅜㄴ','../wordle/wordle.jsp');
insert into quizinfo values ('Q18','전일빌딩','wordle','광주광역시는 2017년 2월 ｢5ㆍ18진실규명지원단｣을 발족하여 전일빌딩의 탄흔 발생 원인과 헬기 사격 등을 조사하도록 하고, 5월 15일 (다음과 같이 조사) 결과를 발표했다. ‘1980년 5월 27일 04:00∼05:30분경 제1항공여단 제61항공단 예 202, 203대대 소속 UH-1H 헬기 1대가 제11공수여단 제61대대 제2지역대 제4중대의 전일빌딩과 광주YWCA 진압작전을 지원ㆍ엄호하기 위해 호버링 상태에서 본 기종에 장착된 도어건 M60 기관총으로 전일빌딩 10층 등 건물 전면부에 수백 발의 공중 사격을 했다.
 광주광역시는 전일빌딩에 개축에 관한 일체의 계획 추진을 중지하고, 2017년 8월 11일 사적지 제28호로 지정ㆍ고시했다. 사적지로 지정됨에 따라 원형을 보존해야 하는 가장 우선시 되게 되었다. 전일빌딩은 감식 때 발견된 245발의 의미와 번지수 245번지임을 고려해 ‘전일빌딩245’로 2020년 5월 개칭하여 재개관하였다. 이후 25발의 총탄흔적이 추가로 발견되어 현재에는 270여발의 총탄흔적이 보존되어 있다.','ㅌㅏㄴㅎㅡㄴ,ㅎㅔㄹㄱㅣㅅㅏㄱㅕㄱ,ㄱㅗㅇㅈㅜㅇㅅㅏㄱㅕㄱ ','../wordle/wordle.jsp');

 insert into quizinfo values ('Q19','광주YMCA','taja','광주YMCA는 최흥종 목사의 주도로 1920년 7월 29일 창립되었다. 1928년에 충장로 5가에 최초의 회관을 건립했으며, 1954년에 금남로 1가 현 부지에 회관을 신축하여 이전했다. YMCA 회관의 특징은 원통형 지붕을 만들고, 내부에 매우 넓은 강당을 두었다는 점이다. 많은 사람들이 모일 수 있는 공간을 보유하고 있어서 일찍부터 이곳에서는 다양한 행사와 집회가 이루어졌다.
5월 26일에는 계엄군의 무력진압을 막기위해 자위적 수단으로 시민군에게 총기훈련을 실시했으며, 항쟁 이후에도 광주항쟁정신을 계승하기 위한 수많은 집회가 이곳에서 열렸다. 이곳은 60년대 이후 군사정권에 저항하는 반독재, 반유신운동의 거점이었다. 금남로에 인접한 YMCA 회관은 ‘민족ㆍ민주화성회’의 직접적인 영향을 받았다. 5·18민중항쟁의 초반 국면에는 경찰과 군인이 이 일대를 중심으로 경비를 서거나 폭력적으로 시위대를 진압했다. 어떤 시민들은 계엄군의 폭력을 피해 YMCA 내부로 도피하기도 했다. 
 5월 26일 오후 2시경 민주인사들이 YMCA에 집결했다. 이들은 김성용 신부를 김수환 추기경에게 보내 광주에서 전개되고 있는 실상을 전달하자는데 의견을 모았다. 이들은 추기경이 대통령을 면담하여 광주에서의 학살을 중단 시켜주기를 희망했다. 임무를 받은 김성용 신부는 오후 4시경 광주를 벗어나 상경했다','금남로,무력진압,광주항쟁정신,군사정권,반독재,반유신운동,민족,민주화성회,518민중항쟁,경찰,군인,김성용,김수환,창립,충장로,총기훈련,시위대,대통령,광주,최흥종,시민군,자위적 수단,집결','null');
 insert into quizinfo values ('Q20','광주YWCA 옛 터','taja','항쟁 기간인 5월 24일부터 그 건물 안에 있던 신용협동조합 관계자들과 들불야학 청년들은 민주시민회보를 제작, 광주항쟁 소식을 전국에 전했으며, 민주인사들은 이곳에서 시민의 희생을 막고 사태를 수습하기 위한 대책회의를 수시로 가졌다.
이곳은 5월 27일 새벽 전남도청을 공략하던 계엄군의 주요 공격 목표가 되어, 이곳 최후의 항전에서도 많은 시민군이 희생되었다.
1980년 5월 17일 YWCA 대강당에서 박현채 선생이 “한국경제의 오늘과 내일”이라는 주제로 강연을 했다. 비상계엄 확대 실시와 예비검속 그리고 계엄군의 진압 등과 관련하여 광주지역 어른들은 양서협동조합에서 대책을 협의했다. 계엄군이 YWCA에 진입한 것은 5월 19일이었다. 계엄군이 신용협동조합으로 들어와 박용준의 소지품을 검사하고, 2층의 양서협동조합으로 들어와 관련자를 끌고 가서 구타했다. 이를 지켜본 옆 건물 무등고시학원 수험생들이 야유를 보내자, 계엄군이 진입하여 진압봉으로 가격하고  그들을 트럭에 싣고 갔다.
 계엄군이 철수한 이후, YWCA 회관은 각종 유인물의 제작과 대책 회의 그리고 대학생들의 집결지로 사용되었다. 신용협동조합 관계자들과 들불야학 청년들은 5월 24일부터 ｢투사회보｣등을 제작했다. 민주인사들은 23일부터 이곳에서 수시로 수습대책회의를 열었다. 이로 인해 YWCA 회관은 계엄군의 진압작전에서 중요 목표가 되었다. 5월 27일 새벽 YWCA 회관에서는 박용준, 이연, 김효석, 김향득 등이 계엄군에 맞섰는데, 제11공수여단 제61대대에 의해 박용준 외 3명이 사망했고 29명이 체포되었다.
YWCA 회관 내ㆍ외부는 총탄 자국과 핏자국이 있었다. 양서협동조합 관계자들은 505보안대로 연행되었고, 지하실에서 조사를 받았다. 그들 가운데 일부는 모진 고초를 겪어 국군광주병원에 입원했다가 공군 보안대로 이송되었고, 제31사단 영창에 수용되기도 했다. YWCA 회관은 1984년에 북구 유동으로 신축 이전하면서 1983년 1월 해체되었고, 항쟁의 현장은 사라졌다.','신용협동조합,들불야학,민주시민회보,광주항쟁,민주인사,시민의 희생,대책회의,전남도청,계엄군,최후의 항전,시민군이 희생,박현채,비상계엄,광주지역,양서협동조합,박용준,무등고시학원,수험생,계엄군,진압봉,투사회보,수습대책회의,진압작전,박용준,이연,김효석,김향득,505보안대,국군광주병원','null');
  insert into quizinfo values ('Q21','상무대 옛터','taja','계엄군 주요 지휘관회의가 이곳에서 자주 열렸고, 시민수습위원들이 몇 차례 드나들며 군수뇌부와 협상을 벌이기도 했다.
항쟁 뒤에는 시민 3천여명이 붙잡혀와 이곳 헌병대 영창에서 상상을 뛰어 넘는 무자비한 고문과 구타를 당했으며, 이곳 군사법정에서는 시민들에게 내란죄를 씌워 사형과 무기 등 중형을 선고했다.
그 때의 영창과 군사법정 건물은 상무대지구 택지개발에 따라 인근에 옮겨져 복원되어 있다.
 계엄령이 확대 선포되면서 상무대 전교사 사령관이 전남북계엄분소장이 되었다. 2군사령관은 전교사를 통해 제31사단장에게 시위 진압을 지시했다. 이것이 공식 지휘계통이지만, 실제로는 정호용을 중심으로 한 신군부가 지휘했다. 상황이 심각하게 전개되던 5월 22일 전교사 사령관이 윤흥정에서 소준열로 교체되었고, 박종훈 신임 국무총리 서리가 전교사를 방문했다. 5월 25일 이희성 계엄사령관이 전교사에게 진압작전을 지시했는데, 부사령관 황영시 육군참모차장이 명령서를 직접 전교사에 전달했다. 이날 최규하 대통령도 전교사를 방문했다. ‘상무충정작전’ 계획이 수립되고, 관련 작전회의가 진행된 곳도 상무대의 전교사였다.
 전교사는 5월 19일 오후 3시 상무대에서 광주지역 기관장과 유지를 모아 회의를 개최했다. 이들은 계엄군의 무차별 진압에 항의했다. 20일 오전 10시에도 상무대에서 계엄분소장 주관 하에 기관장 회의가 열렸다. 기관장들은 공수부대 철수와 유혈진압 중단을 요구했다. 그래서 무혈진압 방침이 하달되기도 했으나, 계엄사 부사령관 황영시 육군참모차장은 보안사를 통해 더욱 강력한 진압을 하도록 지시했다.
 5월 22일 시민수습대책위원회 대표 8명이 상무대 계엄분소를 방문하여 7개안의 수습안을 전달하고, 도청 앞 시민궐기대회에서 방문 결과를 보고했으나 시민들은 격분했다. 5월 23일에는 수습위원회를 개편하여 전교사 측과 협상을 벌였으나, 별다른 소득이 없었다. 그리고 5월 26일 전교사는 김성용 신부 등 시민수습대책위원 11명과 마지막 면담을 했다. 계엄군은 입장을 조금도 바꾸지 않았고, 강경한 무력 진압을 예고했다.
상무대 영창은 학생과 시민으로 과포화 상태였다. 계엄당국은 폭력과 고문을 동반한 조사를 벌였고, 포로처럼 다루었다. 상무대는 이들의 사법처리를 위해 군사재판에 필요한 건물을 신축했다. 연행된 사람은 총 2,522명이었는데, 616명이 군법에 회부되었고 404명이 기소되었다. 이들에게 적용된 죄목은 계엄법 위반, 내란주요임무종사, 살인 등 이었다. 이곳에서 재판을 받았던 사람들은 1981년 12월까지 형 집행정지로 대부분 석방되었다. 상무대는 1994년 12월 전라남도 장성군으로 이전했고, 영창과 법정은 도시재개발 과정에서 훼손되어 위치를 이전해 재건립했다.','계엄군,지휘관회의,시민수습위원,군수뇌부,헌병대,군사법정,상무대지구,전남북계엄분소장,정호용,신군부,윤흥정,소준열,박종훈,국무총리,이희성,육군참모차장,최규하,상무충정작전,시민궐기대회,계엄당국,사법처리,집행정지','null');
  insert into quizinfo values ('Q22','505보안부대 옛터','taja','505보안부대는 1971년부터 광주 서구 쌍촌동에 주둔했다. 505보안부대는 1980년 5월의 처음과 끝을 기획ㆍ관리ㆍ통괄한 기관이라고 할 수 있다. 대학생이 도심으로 진출하기 이전인 5월 14일 오전 10시 45분부터 11시 20분까지 전라남도 도지사실에서는 민관합동의 “학원사태 수습대책협의회”가 열렸다. 참석자들은 전남대와 조선대 총장과 중앙정보부 전남지부장, 광주ㆍ전남 합수단장(505보안부대장), 전남도경찰국장 등 이었다. 같은 날 오후에 열린 ‘지역 계엄군 지휘관 작전회의’에는 505보안부대 대장과 제31사단장, 제7공수여단장 등이 참석했다.
 5월 17일 자정에 ‘포고령 제10호’가 발령되기 이전에 군ㆍ검ㆍ경 합동수사본부 수사관들은 예비검속 대상자 연행 작전을 시작했다. 505보안부대는 차량 22대와 86명을 동원하여 학생회 간부와 재야인사 등 22명을 추적했고, 정동년 등 12명을 연행했다. 505보안부대는 이들에 대한 강압적이고 고문을 병행한 조사를 통해 이른바 “김대중 내란음모사건”을 조작했다.
 5·18민중항쟁이 본격화되자, 505보안부대는 정보 수집을 위해 도심에 요원들을 파견했다. 요원들은 시위와 진압 상황들을 정리하여 수시로 보고했다. 이들이 작성한 보고서는 보안사령부로 전송되었고, 진압작전 수립의 기본 자료로 활용되었다. 5월 19일에는 광주 출신의 보안사령부 홍석률 대령이 내려와 505보안부대원들을 만나고, 정보를 수집했다. 한편 계엄군은 광주 도심에서 사복을 입고 첩보를 수집하는 편의대(便衣隊)를 운용했다.
 505보안부대의 활약은 여기에서 그치지 않았다. 5·18민중항쟁과 그 이후에 연행한 주요 인물들에 대한 조사를 주관했다. 조사 과정은 폭력과 고문 그 자체였다. 또 다른 주요 업무는 5·18민중항쟁 관련 사망자의 사인을 확정하는 것이었다. 시신 검안은 5월 29일까지 130구, 5월 30일 12구 등 총 142명에 대해 이루어졌다. 검안 의사들이 사망진단서를 작성했고, 이를 바탕으로 검찰은 검시보고서를 작성했다. 그런데 정부가 ‘폭도들에게는 보상하지 않는다’는 원칙을 세우면서 재분류가 요구되었다. 핵심은 ‘폭도’와 ‘비폭도’의 분류였다. 또한 505보안부대는 1983년에 추진되었던 5ㆍ18구묘지 이장, 이른바 ‘비둘기 시행계획’을 주관했다.
 505보안부대는 2005년 11월에 이전했다. 광주광역시는 505보안부대 옛터가 지닌 의미와 현장성을 보전하기 위해 2007년 6월 27일 사적지 26호로 지정ㆍ고시했다.','505보안부대,쌍촌동,기획,관리,통괄,전라남도,도지사실,민관합동,학원사태,수습대책협의회,전남대학교,조선대,중앙정보부,전남지부장,합수단장,전남도경찰국장,포고령 제10호,김대중,내란음모사건,518민중항쟁,보안사령부,진압작전,홍석률,편의대,518구묘지,광주광역시,사망진단서,제31사단장,제7공수여단장,합동수사본부','null');
 insert into quizinfo values ('Q32','고 홍남순 변호사 가옥','taja','홍남순은 1912년 6월 7일(음력) 전남 화순군 도곡면에서 출생했다. 1946년 광주지방법원 화순등기소장에 취임했고, 1948년 변호사 시험에 합격하여 활동하다 참전했으며, 1953년부터 광주지방법원과 고등법원에서 판사를 역임했다. 1958년 제4대 국회의원선거에서 광주 을구 선거관리위원장을 맡았으며, 1963년 10월 1일 광주시 궁동 15번지에서 변호사 사무실을 재 개업했다. 홍남순은 1960년대 중반 이후 민주화운동에 참여하고, 인권 변론을 맡아 광주ㆍ전남지역의 이른바 어른으로 큰 획을 그은 삶을 살았다. 그는 2001년 뇌출혈로 쓰러진 뒤 투병하다가 2006년 10월 14일에 사망했다. 
홍남순은 국립5ㆍ18민주묘지 제5묘역 76번에 안장되었다. 홍남순은 5ㆍ18민중항쟁 국면에서도 시대적 역할을 담당했다. 5월 17일 오후 광주 YWCA에서 개최된 광주지역 인사들의 긴급 모임에 다녀온 그는 18일의 상황을 지켜보았다. 그는 19일 가족의 권유로 검속을 피해 상경했으나, 21일 어렵사리 광주로 돌아왔다. 홍남순은 22일 남동성당에서 개최된 수습위원회 구성논의에 참가했으며, 26일에는 탱크를 앞세운 계엄군의 도심 진입을 막기 위해 수습대책위원 17명과 더불어 죽음의 행진을 벌였다. 홍남순은 계엄당국에 연행ㆍ구속되었고, 상무대 법정에서 재판을 받았다. 그는 조사와 재판에서도 굴함이 없이 당당했으며, 꾸짖었다. 무기징역을 선고받은 홍남순은 1981년 12월 형집행정지로 석방되었다.
 홍남순은 이후에도 민주화운동의 현장을 지켰다. 그는 5·18민중항쟁의 진상규명과 명예회복을 위해 노력했으며, 인권 변호사로서 큰 족적을 남겼다. 그의 생전 활동과 헌신을 기억하고 기념하기 위해 많은 분들이 2017년 12월 대인 홍남순 변호사 기념사업회를 결성했다. 기념사업회와 시민사회의 노력을 기반으로 광주광역시는 2017년 9월 8일 그의 생전 자택을 사적지 제29호로 지정ㆍ고시했다. 광주광역시는 사적지로 지정한 이유로 시민 다수의 집합적 행동이 이뤄진 곳, 장소성을 갖는 사람들이 다수이며 이를 기억하고 기념하기 위한 집단적 노력이 전개된 곳이라고 밝혔다. 이를 근거로 12월 8일 자택 앞 인도에 표지석을 설치했다.','홍남순,변호사,광주지방법원,고등법원,국회의원선거,민주화운동,인권 변론,전남지역,광주,518민주묘지,518민중항쟁,남동성당,수습위원회,구성논의,형집행정지,진상규명,명예회복,기념사업회,시민사회,광주광역시,화순군','null');
 insert into quizinfo values ('Q1','전남대학교 정문','wordle','1980년 5월 17일 자정 불법적인 비상계엄 전국 확대에 따라 전남대에 진주한 계엄군은 도서관 등에서 밤을 새워 학문에 몰두하고 있던 학생들을 무조건 구타하고 불법 구금하면서 항쟁의 불씨는 뿌려졌다. 이어 18일 오전 10시경, 교문앞에 모여든 학생들이 학교출입을 막는 계엄군에게 항의하면서 최초의 충돌이 있었으며, 학생들은 광주역과 금남로로 진출해 항의 시위를 벌렸다.
계엄군은 항쟁기간 중 시내에서 끌고 온 시민들을 여기 종합운동장과 이학부 건물에 수용, 집단 구타하는 과정에서 사망자가 발생하였고 주검은 학교 안에 매장되었다가 그 후 발굴되었다. 당시 정문 앞에는 용봉천이 흐르고 그 위에 다리가 놓여 있었으나 지금은 복개되었다. 학생과 시민들을 불법 감금했던 이학부 건물도 철거되었으며 교문도 모양이 바뀌었다.','ㅎㅏㄱㅅㅐㅇ,ㅊㅜㅇㄷㅗㄹ','../wordle/wordle.jsp');

delete from quizinfo;

update quizinfo set quiz_path = './taja/taja.jsp' where quiz_type = 'taja';
update quizinfo set quiz_path = './wordle/wordle.jsp' where quiz_type = 'wordle';
update quizinfo set quiz_path = './puzzle/puzzle.jsp' where quiz_type = 'puzzle';
update quizinfo set quiz = 'Q1' where quiz = 'Q33';

delete from quizinfo where quiz_type = 'taja';
create table result(
	nickname varchar2(100),
	placeid varchar2(100),
	quiz varchar2(100),
	quiz_set varchar2(10),
	score number(5) default 0,
	playtime date default sysdate,
	constraint nick_fk foreign key(nickname) references userdata(nickname),
	constraint result_placeid_fk foreign key(placeid) references placeinfo(placeid),
	constraint result_quiz_fk foreign key(quiz) references quizinfo(quiz),
	constraint quiz_set_ck check(quiz_set in('true','false'))
);

select * from result;
select quiz from result where nickname = 'user_64';
drop table result cascade constraint;

create table taja (
	word varchar2(4000)
);

