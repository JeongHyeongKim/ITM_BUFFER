<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div id="layout">
			<div id="overMenu">
				<tiles:insertAttribute name="header" />
				<tiles:insertAttribute name="nav" />
			</div>
			<div id="section">
				<tiles:insertAttribute name="section"/>
			</div>
		</div>
		
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
</body>
</html>

