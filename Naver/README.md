## 타입별 메모리 크기 문제
BOOL 1바이트
SHORT 2바이트
FLOAT 4바이트
INT 8바이트
LONG 16바이트
매개변수 paramo에 타입들을 입력한 순서대로 메모리를 할당한 결과를 8바이트 단위로 구분해서 return해주는
solution 함수를 작성하세요.
단, BOOL을 제외한 8바이트보다 작은 타입들이 연속될 경우에는 사이에 패딩()을 붙여야 합니다. SHORT는 2배수, FLOAT는 4배수가 되도록 메모리를 할당해야 합니다.
예를 들어 BOOL 타입 이후에 BOOL 타입은 바로 붙어서 할당할 수 있습니다.
“BOOL”,“BOOL” - "*#.
"
그렇지만 BOOL 타입 이후에 SHORT, FLOAT를 할당하기 위해서는 각각1개, 3개 패딩을 붙여야 합니다.
"BOOL", "SHORT" - "#.##.
"BOOL", "FLOAT" -"#…. ####"
“BOOL, "SHORT", "FLOAT" - “#.######”
문항
BOOL 타입 이후에 크기가 8바이트 이상인 타입은 7개 패딩을 붙여야 합니다.
“BOOL", “INT"- "#.
..########”
BOOL과 마찬가지로 8바이트보한 작은 SHORT, FLOAT도 뒤에 패딩을 붙여야 합니다.
"SHORT". "BOOL" - "###.
"FLOAT", "SHORT" - "######.
