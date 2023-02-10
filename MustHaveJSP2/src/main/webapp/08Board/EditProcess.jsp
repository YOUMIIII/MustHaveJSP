<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
//수정 내용 얻기
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//DTO에 저장
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DB에 반영
BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

//성공/실패 처리
if(affected == 1){
	response.sendRedirect("View.jsp?num=" + dto.getNum());
}else{
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>