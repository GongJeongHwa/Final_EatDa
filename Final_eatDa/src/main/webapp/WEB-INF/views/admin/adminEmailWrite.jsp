<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Email Write</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/admin/css/admin_styles.css" rel="stylesheet" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function chk(){
		 if(confirm('�ۼ��Ͻ� ������ �����Ͻðڽ��ϱ�?')==true){
			 return true;
		 }else{
			 return false;
		 }
	}
</script>
<style>
	h1{
		width:90%;
		height:80px;
		margin:auto;
		margin-top: 30px;
		font-size: 30px;
		text-align:center;
		font-weigth:bold;
	}
	textarea {
	   width: 100%;
	   height: 6.25em;
	   resize: none;
	}
	table {
	  border-collapse: separate;
	  border-spacing: 0 10px;
	  width:60%;
	  height:100px;
	  margin:auto;
	}
	#btn{
		align:center;
		background-color:#faeed2;
		font-weight:bold;
	}
	
</style>
</head>
<body>
	<div style="background-color:#faeed2; align:center;">
		<h1>�̸��� ������</h1>
	</div>
	<hr>
	<form action="send.do" method="post" onsubmit="return chk();">
		<table>
			<tr>
				<th>�߽��� �̸�</th>
				<td><input type="text" name="senderName" value="EatDa" readonly></td>
			</tr>
			<tr>
				<th>�߽��� �̸���</th>
				<td><input type="text" name="senderMail" value="TeamEatDa@eatDa.com" readonly></td>
			</tr>
			<tr>
				<th>������ �̸���</th>
				<td><input type="text" name="receiveMail" autofocus></td>
			</tr>
			<tr>
				<th>�� ��</th>
				<td><input type="text" name="subject" style="width:300px;" value="�ȳ��ϼ���  ${member.user_name}��, EatDa�Դϴ� :)"></td>
			</tr>
			<tr>
				<th>�� ��</th>
				<td><textarea cols="80" name="message" placeholder="������ �Է��ϼ���"></textarea></td>
			</tr>
			<tr style="margin:0 auto;">
				<td colspan="5">
					<input type="submit" id="btn" value="�� ��" >
					<input type="button" id="btn" onclick="location.href='adminUser.do'" value="�� ��">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>