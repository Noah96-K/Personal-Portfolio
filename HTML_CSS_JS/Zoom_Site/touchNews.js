const box = document.querySelector(".instruction__box");
const instruction = document.querySelector(".instruction");
const random = document.querySelector(".random");
const home = document.querySelector(".home");
const randomBox = document.querySelector(".random__box");
const touch = document.querySelector(".touch");
const randomPart = document.querySelector(".random_part");
const randomPart1 = randomPart.querySelector(".random_part-1");
const randomPart2 = randomPart.querySelector(".random_part-2");
const randomPart3 = randomPart.querySelector(".random_part-3");

const NO = "invisible";

function handleClickedBox() {
  box.classList.add(NO);
  random.classList.remove(NO);
  home.classList.remove(NO);
  instruction.classList.remove(NO);
}

function handleClickedInstruction() {
  box.classList.remove(NO);
  random.classList.add(NO);
  home.classList.add(NO);
  instruction.classList.add(NO);
}

function handleClickedRandom() {
  random.classList.add(NO);
  home.classList.add(NO);
  instruction.classList.add(NO);
  randomBox.classList.remove(NO);
  touch.classList.remove(NO);
}

function handleClickedRandomBox() {
  randomBox.classList.add(NO);
  touch.classList.add(NO);
  random.classList.remove(NO);
  home.classList.remove(NO);
  instruction.classList.remove(NO);
}

function randomNum() {
  let ORDER = ["Noah", "TenTen", "Somi", "Rodrigo", "Vicky", "Yeshin", "Faye"];

  let LENGTH = ORDER.length;
  let num1 = LENGTH;
  const gernerated = [];
  for (let i = 0; i < LENGTH; i++) {
    let ran = Math.floor(Math.random() * num1);
    gernerated.push(ORDER[ran]);
    ORDER.splice(ran, 1);
    num1 -= 1;
  }
  return gernerated;
}
function printButton(list) {
  for (let j = 0; j < list.length; j++) {
    const div = document.createElement("div");

    if (j < 3) {
      randomPart1.appendChild(div);
    } else if (j < 6) {
      randomPart2.appendChild(div);
    } else {
      randomPart3.appendChild(div);
    }
    div.classList.add("made" + j);

    div.innerHTML = list[j];
  }
}
function handleClickedButton() {
  const lst = randomNum();
  printButton(lst);

  console.log(lst);

  // randomPart_news.appendChild()
}

box.addEventListener("click", handleClickedBox);
instruction.addEventListener("click", handleClickedInstruction);
random.addEventListener("click", handleClickedRandom);
randomBox.addEventListener("click", handleClickedRandomBox);

touch.addEventListener("click", handleClickedButton);

// function touchTouch() {
//   const ranNum = randomNum();

//   if (ranNum === 0) {
//     randomPart.innerHTML = "DEBATE!💪😈";
//     // console.log("a");
//   } elif {
//     // console.log("b");
//     randomPart.innerHTML = "OPINION!😎😸";
//   }
// }
// touch.addEventListener("click", touchTouch);
