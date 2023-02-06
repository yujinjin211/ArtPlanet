/**
 * 
 */

const joinForm = document.joinForm;

function join() {
	
	const id = joinForm.id;
	const name = joinForm.name;
	const password = joinForm.password;
	const passwordChk = joinForm.passwordChk;
	const email1 = joinForm.email1;
	const email2 = joinForm.email2;
	const phoneNumber = joinForm.phoneNumber;
	const agree = joinForm.agree;
	
	//아이디
	//const result = joinForm.getElementById("result"); //결과가 나타나는 부분에 해당하는 id

	if(id.value == "") {
	    alert("아이디를 입력해주세요.");
	    id.focus();
	    return false;
	}
	if(id.value.length < 4 || id.value.length > 12) {
	    alert("아이디는 4자 이상 12자 이하로 입력해주세요.");
	    id.focus();
	    return false;
	}
//	if(result.innerHTML == "") {
//	    alert("아이디 중복체크를 해주세요.");
//	    return;
//	}
//	if(result.innerHTML == "이미 가입된 아이디입니다.") {
//	    id.focus();
//	    return;
//	}

	//비밀번호
	// (?=.*?[A-Z]) : A부터 Z까지 있는지 보는 정규식
	// .{8,16} : 8자 이상 16자 이하
	// ^ : 이걸로 시작해서  $ : 로 끝남

	// A-Z, a-z, 0-9 특수문자가 포함되어 있는지, 8자 이상
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,16}$/

	// 같은 문자 연속 4번 있는지
	let reg2 = /(\w)\1\1\1/

	// 정규식.test() : 정규식이 맞는지 아닌지 true나 false로 반환
	reg.test("값");

	if(password.value == "") {
	    alert("비밀번호를 입력해주세요.");
	    password.focus();
	    return false;
	}
	if(password.value.length < 8 || password.value.length > 16) {
	    alert("비밀번호는 8자 이상 16자 이하로 입력해주세요.");
	    password.focus();
	    return false;
	}
	if(!reg.test(password.value)) {
	    alert("비밀번호는 8자 이상 16자 이하, 알파벳 대문자·소문자, 특수 기호, 숫자를 모두 포함해야 합니다.");
	    password.focus();
	    return false;
	} 
	if(reg2.test(password.value)) {
	    alert("같은 문자가 4번 이상 연속 포함되어있습니다.");
	    password.focus();
	    return false;
	}
	if(password.value.search(" ") != -1) {
	    alert("비밀번호는 공백을 포함할 수 없습니다.");
	    password.focus();
	    return false;
	}
	if(passwordChk.value == "") {
	    alert("비밀번호를 입력해주세요.");
	    passwordChk.focus();
	    return false;
	}
	if(password.value != passwordChk.value) {
	    alert("비밀번호가 일치하지 않습니다.");
	    passwordChk.focus();
	    return false;
	}
	
	//이메일
	
	if(email1.value == "") {
		alert("이메일을 입력해주세요.");
		email1.focus();
		return false;
	}
	if(email2.value == "") {
		alert("도메인을 선택해주세요.");
		email2.focus();
		return false;
	}
	if(email1.value.search(" ") != -1) {
		alert("이메일은 공백을 포함할 수 없습니다.");
		email1.focus();
		return false;
	}
	
	//이메일 중복체크 확인 버튼 유효성 검사 코드 작성하기
	
	//이름
	// A-Z, a-z, 0-9 특수문자가 포함되어 있는지
	let reg3 = /^^[가-힣]{2,15}$/
	
	if(name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	if(!reg3.test(name.value)) {
		alert("이름은 특수 기호와 숫자를 포함하지 않은 한글로 입력해주세요.");
		name.focus();
		return false;
	}
	
	//휴대전화번호
	if(phoneNumber.value == "") {
		alert("휴대전화 번호를 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	if(phoneNumber.value.search(" ") != -1) {
		alert("휴대전화 번호는 공백 없이 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	if(!reg4.test(phoneNumber.value)) {
		alert("휴대전화 번호는 특수 기호 없이 숫자로만 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	
	//휴대전화 번호 인증 관련 유효성 검사 코드 작성하기
	
	
}

const updateProfile = document.updateProfile;

function update() {
	
	const id = joinForm.id;
	const name = joinForm.name;
	const password = joinForm.password;
	const passwordChk = joinForm.passwordChk;
	const email1 = joinForm.email1;
	const email2 = joinForm.email2;
	const phoneNumber = joinForm.phoneNumber;
	const agree = joinForm.agree;
	
	//아이디
	//const result = joinForm.getElementById("result"); //결과가 나타나는 부분에 해당하는 id

	if(id.value == "") {
	    alert("아이디를 입력해주세요.");
	    id.focus();
	    return false;
	}
	if(id.value.length < 4 || id.value.length > 12) {
	    alert("아이디는 4자 이상 12자 이하로 입력해주세요.");
	    id.focus();
	    return false;
	}
//	if(result.innerHTML == "") {
//	    alert("아이디 중복체크를 해주세요.");
//	    return;
//	}
//	if(result.innerHTML == "이미 가입된 아이디입니다.") {
//	    id.focus();
//	    return;
//	}

	//비밀번호
	// (?=.*?[A-Z]) : A부터 Z까지 있는지 보는 정규식
	// .{8,16} : 8자 이상 16자 이하
	// ^ : 이걸로 시작해서  $ : 로 끝남

	// A-Z, a-z, 0-9 특수문자가 포함되어 있는지, 8자 이상
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,16}$/

	// 같은 문자 연속 4번 있는지
	let reg2 = /(\w)\1\1\1/

	// 정규식.test() : 정규식이 맞는지 아닌지 true나 false로 반환
	reg.test("값");

	if(password.value == "") {
	    alert("비밀번호를 입력해주세요.");
	    password.focus();
	    return false;
	}
	if(password.value.length < 8 || password.value.length > 16) {
	    alert("비밀번호는 8자 이상 16자 이하로 입력해주세요.");
	    password.focus();
	    return false;
	}
	if(!reg.test(password.value)) {
	    alert("비밀번호는 8자 이상 16자 이하, 알파벳 대문자·소문자, 특수 기호, 숫자를 모두 포함해야 합니다.");
	    password.focus();
	    return false;
	} 
	if(reg2.test(password.value)) {
	    alert("같은 문자가 4번 이상 연속 포함되어있습니다.");
	    password.focus();
	    return false;
	}
	if(password.value.search(" ") != -1) {
	    alert("비밀번호는 공백을 포함할 수 없습니다.");
	    password.focus();
	    return false;
	}
	if(passwordChk.value == "") {
	    alert("비밀번호를 입력해주세요.");
	    passwordChk.focus();
	    return false;
	}
	if(password.value != passwordChk.value) {
	    alert("비밀번호가 일치하지 않습니다.");
	    passwordChk.focus();
	    return false;
	}
	
	//이메일
	
	if(email1.value == "") {
		alert("이메일을 입력해주세요.");
		email1.focus();
		return false;
	}
	if(email2.value == "") {
		alert("도메인을 선택해주세요.");
		email2.focus();
		return false;
	}
	if(email1.value.search(" ") != -1) {
		alert("이메일은 공백을 포함할 수 없습니다.");
		email1.focus();
		return false;
	}
	
	//이메일 중복체크 확인 버튼 유효성 검사 코드 작성하기
	
	//이름
	// A-Z, a-z, 0-9 특수문자가 포함되어 있는지
	let reg3 = /^^[가-힣]{2,15}$/
	
	if(name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	if(!reg3.test(name.value)) {
		alert("이름은 특수 기호와 숫자를 포함하지 않은 한글로 입력해주세요.");
		name.focus();
		return false;
	}
	
	//휴대전화번호
	if(phoneNumber.value == "") {
		alert("휴대전화 번호를 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	if(phoneNumber.value.search(" ") != -1) {
		alert("휴대전화 번호는 공백 없이 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	if(!reg4.test(phoneNumber.value)) {
		alert("휴대전화 번호는 특수 기호 없이 숫자로만 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	
	//휴대전화 번호 인증 관련 유효성 검사 코드 작성하기
}

//function confirmDelete() {
//	result = confirm("정말로 탈퇴 하시겠습니까?");
//	if(result) {
//		updateProfile.action = "delete.do";
//		updateProfile.submit();
//	} else {
//		return;
//	}
//}


//자동 하이픈 입력
const autoHyphen = (target) => {
	target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}

//이메일 선택입력 직접입력
function checkEmail() {
    if(joinForm.selectEmail.value == "1") {
    	joinForm.email2.readOnly = false;
    	joinForm.email2.value = '';
    	joinForm.email2.focus();
    } else {
    	joinForm.email2.readOnly = true;
    	joinForm.email2.value = joinForm.selectEmail.value;
    }
}