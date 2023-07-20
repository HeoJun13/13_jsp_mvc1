[ 외부라이브러리 참조 메뉴얼 ]

1. CKEditor4

	1-1) https://ckeditor.com/ckeditor-4/download/ 사이트에 접속해서 에디터를 다운로드 받는다.
	1-2) 다운로드 받은 에디터를 웹 프로젝트안으로 이동한다.
	1-3) 화면레이어에서 다운받은 ckeidtor.js를 import한다.
	       예시) <script src="ckeditor/ckeditor.js"></script>
	1-4) <textarea>태그 아래에 CKEDITOR.replace()함수를 이용하여 textarea태그를 ckeditor로 전환한다.
	     <script>CKEDITOR.replace("textarea태그의 name명");</script>
	
	@)참고) validation check와 같은 js 작업들은 별도로 구현해야한다.     
	     
	     

2. Sweet Alert2

	1-1) 화면레이어에서 아래의 js CDN을 import한다.
	     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	1-2) 사용방법 참조 url 사이트
	     https://sweetalert2.github.io/
	     https://inpa.tistory.com/entry/SweetAlert2-%F0%9F%93%9A-%EC%84%A4%EC%B9%98-%EC%82%AC%EC%9A%A9