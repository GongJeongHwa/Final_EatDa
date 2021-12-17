<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}

.regist_wrap{
	flex-direction: column;
	width: 800px;
    magin-top: 40px;
}

.regist_form{
    display: flex;
	position: absolute;
	flex-direction: column;
    width: 800px;
    align-items: center;
    
}

.headline{
	margin-top: 50px;
}

.headline a{
	font-size: 22pt;
    font-weight: bold;
}

table{
    margin-top: 30px;
    align-items: center;
}

table tr td a{
	text-decoration: none;
	font-size: 0.7rem;
}

div span{
    text-decoration: none;
	font-size: 0.6rem;
    color: grey;
}

.login_regist_wrap{
	width: 100%;
	height: 700px;
	display: flex;
	justify-content: center;
}
     table tr th{
        text-align: left;
        width: 100px;
        height: 40px;
        font-size: 0.8rem;
   		font-weight: bold;
    }

    td input[type="text"], input[type="password"] {
    	width: 230px; height: 30px;
    	font-size: 0.7rem;
    	border: 1px solid #d1d1d1;
        padding-left: 7px;
	}

    td input[type="button"]{
        border: none;
        border-radius: 2px;
        background-color: #FAEED2;
        font-size: 0.5rem;
        color: rgb(95, 95, 95);
    }

    .user_id_chk, .user_addr_chk{
        width: 55px;
        height: 18px;
    }

    .user_phone_chk{
        width: 75px;
        height: 18px;
    }
    
    .user_phone{
    	margin-top: 5px;
    }

    .regist_btn{
        text-align: center;
        margin: 30px;
    }

    .user_addr2{
        margin-top: 5px;
    }

    .submit_btn{
        border: none;
        border-radius: 4px;
        width: 75px;
        height: 30px;
        background-color: #ffe084;
        color: white;
        font-weight: bold;
    }

    .back_btn{
        border: none;
        border-radius: 4px;
        width: 60px;
        height: 30px;
        background-color: rgb(134, 134, 132);
        color: white;
        font-weight: bold;
    }
</style>
</head>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	
    <div class="login_regist_wrap">
        <div class="regist_wrap">
            <div class="headline">
                <a>ȸ������</a>
                <hr>
            </div>
            <div class="regist_form">
            <form action="" method="post">
                <table width="550px">
                    <tr>
                        <col width="150px"> <col width="300px">
                    </tr>
                    <tr>
                        <th>���̵�</th>
                        <td>
                            <input type="text" class="user_id" name="" required="required" placeholder="���̵� �Է��ϼ���." autofocus>
                            <input type="button" class="user_id_chk" value="�ߺ� Ȯ��" onclick="">
                        </td>
                    </tr>
                    <tr>
                        <th>�̸�</th>
                        <td><input type="text" class="user_name" name="" required="required" placeholder="�̸��� �Է��ϼ���."></td>
                    </tr>
                    <tr>
                        <th>��й�ȣ</th>
                        <td><input type="password" class="user_pw" name="" required="required" placeholder="��й�ȣ�� �Է��ϼ���."></td>
                    </tr>
                    <tr>
                        <th>��й�ȣ Ȯ��</th>
                        <td><input type="password" class="user_pw_chk" name="" required="required"></td>
                    </tr>
                    <tr>
                        <th>�̸���</th>
                        <td><input type="text" class="user_email" name="" required="required" placeholder="�̸����� �Է��ϼ���."></td>
                    </tr>
                    <tr>
                        <th>���� ����</th>
                        <td>
                            <input type="radio" name="user_mailing" class="user_mailing" value="Y" checked="checked"><a> ������</a>&nbsp;&nbsp;
                            <input type="radio" name="user_mailing" class="user_mailing" value="N"><a> �������� ����</a>
                        </td>
                    </tr>
                    <tr>
                        <th>�ּ�</th>
                        <td>
                            <input type="text" class="user_addr1" name="" required="required" placeholder="�����ȣ�� �Է��ϼ���.">
                            <input type="button" class="user_addr_chk" value="�ּ� �˻�" onclick=""><br>
                            <input type="text" class="user_addr2" name="" required="required" placeholder="���ּҸ� �Է��ϼ���.">
                        </td>
                    </tr>
                    <tr>
                        <th>�ڵ��� ��ȣ</th>
                        <td>
                            <input type="text" class="user_phone" name="" required="required" placeholder="'-' ��ȣ ���� ���ڸ� �Է��ϼ���.">
                            <input type="button" class="user_phone_chk" value="������ȣ �߱�" onclick="">
                        </td>
                    </tr>
                    <tr>
                        <th>��ȣ�ϴ� ����</th>
                        <td>
                            <input type="checkbox" class="prefer" name="prefer" value="k_food"><a> �ѽ�</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="j_food"><a> �Ͻ�</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="c_food"><a> �߽�</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="w_food"><a> ���</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="v_food"><a> ���</a><br>
                            <div class="prefer_txt"><span>�ߺ����� ����</span></div>
                        </td>
                    </tr>         
                </table>
                    <div class="regist_btn">
                        <input type="submit" class="submit_btn" value="�����ϱ�">
                        <input type="button" class="back_btn" value="�� ��" onclick="">
                    </div>
            </form>
          </div>
        </div>
    </div>
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>