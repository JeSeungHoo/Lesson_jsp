# Lesson_jsp

## 01_first
  * 첫 jsp 프로젝트 생성
## 02_servlet
  * doGet(), doPost() 재정의 및 호출 확인
  * web.xml 파일을 이용한 servlet-mapping
  * \<servlet\> <br />
    * \<servlet-name\>서블릿변수명\</servlet-name\> <br />
    * \<servlet-class\>서블릿클래스경로(패키지.클래스)\</servlet-class\> <br />
  * \</servlet\>
  * \<servlet-mapping\> <br />
    * \<servlet-name\>서블릿변수명\</servlet-name\> <br />
    * \<url-pattern\>/action\</url-pattern\> <br />
  * \</servlet\>
## 03_servlet mulit_param
  * @WebServlet("/action") 어노테이션을 이용한 servlet-mapping
  * servlet의 lifeCycle 확인
    * 생성자() : 첫 서블릿 요청 시 최초 1회 객체 생성
    * init() : 객체 생성되면서 최초 1회 호출
    * service() : 서블릿 요청 시마다 호출, 전송 방식에 따라 doGet(), doPost() 호출
    * destroy() : 서버 종료 전, reload 전 실행되면서 서블릿 제거
## 04_script_tag
  * <%! 선언문 - 클래스 블럭에 정의되는 변수 및 메소드 %>
  * <% 스크립틀릿 - service()에 정의되는 변수 및 실행문 %>
  * <%= 표현문 - service()에 out.print(내용)으로 삽입됨 %>
