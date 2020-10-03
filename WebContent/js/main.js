
console.log("1");
// new image: image객체를 생성하여 속성(src, width, name)들을 추가할수 있다
// 아래에선 image객체에 src(이미지 주소)를 추가했다
// 사용할 때) document.images.속성; document.images.length
var image1 = new Image();
image1.src = "images/main/main1.jpg";
var image2 = new Image();
image2.src = "images/main/main2.jpg";
var image3 = new Image();
image3.src = "images/main/main3.jpg";
var image4 = new Image();
image4.src = "images/main/main4.jpg";
var image5 = new Image();
image5.src = "images/main/main5.jpg";
var image6 = new Image();
image6.src = "images/main/main6.jpg";

var step = 1;

// mainSlide함수: 메인화면에 1.5초 간격으로 이미지를 바꿔준다

function mainSlide() {

	// document(이 페이지에서).images(이미지객체를 사용한다).slide(name=slide인 객체의).src(이미지주소를)
	// (eval(): 괄호안의 내용을 스크립트로 인식) image1.src로 바꾼다
	document.images.slide.src = eval("image" + step + ".src");
	if (step < 6) {
		step++;
	} else {
		step = 1;
	}
	setTimeout(mainSlide, 1500); // setTimeout(함수명, 시간);  mainSlide함수를 1.5초 뒤에 실행시킨다
	console.log("2");
}

// window.addEventListener('load', mainSlide);
