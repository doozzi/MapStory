<%@page import="java.util.ArrayList"%>
<%@page import="Model.userDTO"%>
<%@page import="Model.quizDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>
#table_body {
	display: none;
}

#nickname {
	display: none;
}

#placeid {
	display: none;
}

#quiz {
	display: none;
}

body {
	/* background-color: white; */
	/* background: rgba(44, 62, 80,1.0); */
	/* display: flex; */
	
}

body {
	background-image: url("7.jpg");
	background-repeat: repeat;
	background-size: cover;
}

.card:hover {
	box-shadow: 0 5px 20px rgba(0, 0, 0, .8);
	transform: translateY(-10px) scale(1.02);
}

.card {
	width: 800px;
	padding: 10px;
	/* background: #1abc9c; */
	background: #BCFAE4;
	margin: auto;
	margin-top: 70px;
	transition: .3s ease;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .3);
}

a {
	color: black;
	text-decoration: none;
}

h3 {
	text-align: center;
	/* background-color:#1abc9c;  */
	display: inline;
	color: black;
	position: relative;
	margin-left: 25%;
}

#game-board {
	display: flex;
	align-items: center;
	flex-direction: column;
}

.letter-box {
	border: 2px solid gray;
	border-radius: 3px;
	margin: 2px;
	font-size: 2.5rem;
	font-weight: 700;
	height: 3rem;
	width: 3rem;
	display: flex;
	justify-content: center;
	align-items: center;
	text-transform: uppercase;
}

.filled-box {
	border: 2px solid black;
}

.letter-row {
	display: flex;
}

#keyboard-cont {
	margin: 1rem 0;
	display: flex;
	flex-direction: column;
	align-items: center;
}

#keyboard-cont div {
	display: flex;
}

.second-row {
	margin: 0.5rem 0;
}

.keyboard-button {
	font-size: 1rem;
	font-weight: 700;
	padding: 0.5rem;
	margin: 0 2px;
	cursor: pointer;
	text-transform: uppercase;
}

.modal_wrap {
	display: none;
	width: 400px;
	height: 400px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background-color: white;
	z-index: 2;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: #E5DFDF;
	top: 0;
	left: 0;
	opacity: 0.7;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

#modal_btn {
	position: relative;
	left: 57%;
}

.text {
	text-align: center;
}
</style>
</head>
<body>
	<%
	//ArrayList<wordDTO> word = (ArrayList<wordDTO>)session.getAttribute("word");
	//wordDAO dao = new wordDAO();
	//ArrayList<wordDTO> word = dao.wordquiz();
	userDTO info = (userDTO) session.getAttribute("info");

	quizDTO quizinfo = (quizDTO) session.getAttribute("quizinfo");

	String answer = quizinfo.getAnswer();
	%>

<div id = "table_body"><%=quizinfo.getAnswer()%></div>
<div id = "nickname"><%=info.getNickname()%></div>
<div id = "placeid"><%=quizinfo.getPlaceid()%></div>
<div id = "quiz"><%=quizinfo.getQuiz()%></div>

    <div class="card">
        <h3> <%=quizinfo.getQuiz() %> : 다음 지문을 보고 알맞은 단어를 입력하세요. </h3>
        <p class="entry-title"><%=quizinfo.getQuiz_ex()%></p>
    </div>
         <img src ="./icon.png" type="button" id="modal_btn">
    <div class="black_bg"></div>
    <div class="modal_wrap">
            <div class="modal_close"><img src="./x.png" ></div>
            <div>
                <div class="text"><h2>게임 방법</h2></div> 
                <div class="text">워들을 맞춰봅시다. 각 기회마다 글자 조각의 색깔이 문제를 맞추는데 도움을 줍니다.</div><br>
                <div class="text"><img src="./2.PNG"></div>
                <div class="text">글자'ㅊ','ㅜ'은 올바른 자리에 있습니다.</div>
                <div class="text"><img src="./2.PNG"></div>
                <div class="text">글자'ㄹ','ㅇ'은 잘못된 자리에 있습니다.</div>
                <div class="text"><img src="./2.PNG"></div>
                <div class="text">글자'ㅣ','ㅂ'은 어느 곳에도 맞지 않습니다.</div>
            </div>
    </div>
    
    <div id="game-board">

    </div>

    <div id="keyboard-cont">
        <div class="first-row">
            <button class="keyboard-button">ㅂ</button>
            <button class="keyboard-button">ㅈ</button>
            <button class="keyboard-button">ㄷ</button>
            <button class="keyboard-button">ㄱ</button>
            <button class="keyboard-button">ㅅ</button>
            <button class="keyboard-button">ㅛ</button>
            <button class="keyboard-button">ㅕ</button>
            <button class="keyboard-button">ㅑ</button>
            <button class="keyboard-button">ㅐ</button>
            <button class="keyboard-button">ㅔ</button>
        </div>
        <div class="second-row">
            <button class="keyboard-button">ㅁ</button>
            <button class="keyboard-button">ㄴ</button>
            <button class="keyboard-button">ㅇ</button>
            <button class="keyboard-button">ㄹ</button>
            <button class="keyboard-button">ㅎ</button>
            <button class="keyboard-button">ㅗ</button>
            <button class="keyboard-button">ㅓ</button>
            <button class="keyboard-button">ㅏ</button>
            <button class="keyboard-button">ㅣ</button>
        </div>
        <div class="third-row">
            <button class="keyboard-button">Del</button>
            <button class="keyboard-button">ㅋ</button>
            <button class="keyboard-button">ㅌ</button>
            <button class="keyboard-button">ㅊ</button>
            <button class="keyboard-button">ㅍ</button>
            <button class="keyboard-button">ㅠ</button>
            <button class="keyboard-button">ㅜ</button>
            <button class="keyboard-button">ㅡ</button>
            <button class="keyboard-button">Enter</button>
        </div>
    </div>

 <script>
       window.onload = function() {
 
 function onClick() {
     document.querySelector('.modal_wrap').style.display ='block';
     document.querySelector('.black_bg').style.display ='block';
 }   
 function offClick() {
     document.querySelector('.modal_wrap').style.display ='none';
     document.querySelector('.black_bg').style.display ='none';
 }

 document.getElementById('modal_btn').addEventListener('click', onClick);
 document.querySelector('.modal_close').addEventListener('click', offClick);

};
    </script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">

/* var rows = document.getElementById("table_body").getElementsByTagName("tr");
console.log(rows.length);	// tbody tr 개수 = 50 */

<%-- let word1 = "<%=word.get(1).getWord()%>";
word2 = [word1];
console.log(word2); --%>
var nickname = document.getElementById("nickname").innerText;
var placeid = document.getElementById("placeid").innerText;
var quiz = document.getElementById("quiz").innerText;

var rows = document.getElementById("table_body").innerText;
console.log(rows);
	
var words = rows.split(",");
console.log(words);
	
const NUMBER_OF_GUESSES = 6;
let guessesRemaining = NUMBER_OF_GUESSES;
let currentGuess = [];
let nextLetter = 0;
//let WORDS = word2;
let WORDS= words;
let rightGuessString = WORDS[Math.floor(Math.random() * WORDS.length)]
let result = true;
let score = 10;

//console.log(word);
console.log(rightGuessString);

function initBoard() {
    let board = document.getElementById("game-board");

    for (let i = 0; i < NUMBER_OF_GUESSES; i++) {
        let row = document.createElement("div")
        row.className = "letter-row"
        
        for (let j = 0; j < rightGuessString.length; j++) {
            let box = document.createElement("div")
            box.className = "letter-box"
            row.appendChild(box)
        }

        board.appendChild(row)
    }
}

function shadeKeyBoard(letter, color) {
    for (const elem of document.getElementsByClassName("keyboard-button")) {
        if (elem.textContent === letter) {
            let oldColor = elem.style.backgroundColor
            if (oldColor === 'greenyellow') {
                return
            } 

            if (oldColor === 'yellow' && color !== 'greenyellow') {
                return
            }

            elem.style.backgroundColor = color
            break
        }
    }
}

function deleteLetter () {
    let row = document.getElementsByClassName("letter-row")[6 - guessesRemaining]
    let box = row.children[nextLetter - 1]
    box.textContent = ""
    box.classList.remove("filled-box")
    currentGuess.pop()
    nextLetter -= 1
}

function checkGuess () {
    let row = document.getElementsByClassName("letter-row")[6 - guessesRemaining]
    let guessString = ''
    let rightGuess = Array.from(rightGuessString)

    for (const val of currentGuess) {
        guessString += val
    }

    if (guessString.length != rightGuessString.length) {
        toastr.error("Not enough letters!")
        return
    }

    /* if (!WORDS.includes(guessString)) {
        toastr.error("Word not in list!")
        guessesRemaining -= 1;
        currentGuess = [];
        nextLetter = 0;
        return
    } */
    
    for (let i = 0; i < rightGuessString.length; i++) {
        let letterColor = ''
        let box = row.children[i]
        let letter = currentGuess[i]
        
        let letterPosition = rightGuess.indexOf(currentGuess[i])
        // is letter in the correct guess
        if (letterPosition === -1) {
            letterColor = 'grey'
        } else {
            // now, letter is definitely in word
            // if letter index and right guess index are the same
            // letter is in the right position 
            if (currentGuess[i] === rightGuess[i]) {
                // shade green 
                letterColor = 'greenyellow'
            } else {
                // shade box yellow
                letterColor = 'yellow'
            }

            rightGuess[letterPosition] = "#"
        }

        let delay = 250 * i
        setTimeout(()=> {
            //flip box
            //animateCSS(box, 'flipInX')
            //shade box
            box.style.backgroundColor = letterColor
            shadeKeyBoard(letter, letterColor)
        }, delay)
    }

    if (guessString === rightGuessString) {
    	Swal.fire({icon: 'success',
    		title: '정답!',}).then(function(){
    			location.href = "../exitGameCon?nickname="+ nickname +"&placeid="+ placeid +"&quiz="+ quiz +"&result="+result+"&score="+score;
    		})
        guessesRemaining = 0
        result = true;
    } else {
        guessesRemaining -= 1;
        currentGuess = [];
        nextLetter = 0;

        if (guessesRemaining === 0) {
        	Swal.fire({icon: 'error',
        		title: '오답!',
        		text: '정답은 '+rightGuessString}).then(function(){
        			location.href = "../exitGameCon?result="+result+"&score="+score;
        		})
            result = false;        
        }
    }
}

function insertLetter (pressedKey) {
    if (nextLetter === rightGuessString.length) {
        return
    }
    pressedKey = pressedKey.toLowerCase()

    let row = document.getElementsByClassName("letter-row")[6 - guessesRemaining]
    let box = row.children[nextLetter]
    //animateCSS(box, "pulse")
    box.textContent = pressedKey
    box.classList.add("filled-box")
    currentGuess.push(pressedKey)
    nextLetter += 1
}

const animateCSS = (element, animation, prefix = 'animate__') =>
  // We create a Promise and return it
  new Promise((resolve, reject) => {
    const animationName = `${prefix}${animation}`;
    // const node = document.querySelector(element);
    const node = element.node.style.setProperty('--animate-duration', '0.3s');
    
    node.classList.add(`${prefix}animated`, animationName);

    // When the animation ends, we clean the classes and resolve the Promise
    function handleAnimationEnd(event) {
      event.stopPropagation();
      node.classList.remove(`${prefix}animated`, animationName);
      resolve('Animation ended');
    }

    node.addEventListener('animationend', handleAnimationEnd, {once: true});
});

document.addEventListener("keyup", (e) => {

    if (guessesRemaining === 0) {
        return
    }

    let pressedKey = String(e.key)
    if (pressedKey === "Backspace" && nextLetter !== 0) {
        deleteLetter()
        return
    }

    if (pressedKey === "Enter") {
        checkGuess()
        return
    }

    let found = pressedKey.match(/[ㄱ-힣]/g)
    if (!found || found.length > 1) {
        return
    } else {
        insertLetter(pressedKey)
    }
})

document.getElementById("keyboard-cont").addEventListener("click", (e) => {
    const target = e.target
    
    if (!target.classList.contains("keyboard-button")) {
        return
    }
    let key = target.textContent

    if (key === "Del") {
        key = "Backspace"
    } 

    document.dispatchEvent(new KeyboardEvent("keyup", {'key': key}))
})

initBoard();

</script>
</body>
</html>