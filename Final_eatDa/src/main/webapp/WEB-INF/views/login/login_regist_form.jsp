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

    .user_email_chk{
        width: 75px;
        height: 18px;
    }
    
    .user_eamil{
    	margin-top: 5px;
    }
    
    .user_email_injeong{
    	width: 20px;
    	margin-top: 5px;
    	
    }
    
    #user_email_injeong_false{
    	background-color:#ebebe4;
	}
	 
	#user_email_injeong_true{
	    background-color:white;
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
    
    #id_chk_available, #pw_chk_available, #email_chk_available{
    	display: none;
    	color: blue;
    }
    
    #id_chk_unavailable, #id_chk_blank, #pw_chk_unavailable, #email_chk_blank, #email_chk_unavailable{
   		display: none;
    	color: red;
    }

</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	//���̵� �ߺ�üũ
	function idCheck(){
		$("#id_chk_unavailable").hide();
		$("#id_chk_available").hide();
		$("#id_chk_blank").hide();
		
		$.ajax({
			url:"idCheck.do",
			type:"post",
			dataType:"json",
			data:{"user_id" : $('#id').val()},
			success: function(data){
				if($("#id").val() != ''){
					if(data == 1){					
						$("#id_chk_unavailable").show();
					}else if(data == 0){
						$("#id").attr("title", "y");
						$("#id_chk_available").show();
						$("#user_name").focus();
					}
				}else{
					$("#id_chk_blank").show();
				}
			}
		})
	}
	
	//���̵� �ߺ�üũ Ȯ��
	function idChkConfirm(){
		var chk = document.getElementsByName("id")[0].title;
		if(chk=="n"){
			alert("���̵� �ߺ�üũ�� ���ּ���");
			document.getElementsByName("id")[0].focus();
		}
	}
	
	//��й�ȣ ��ġ Ȯ��
	$(function(){
		$("#pw_chk_available").hide();
		$("#pw_chk_unavailable").hide();
		
		$("#pw_chk").keyup(function(){
			var pw = $("#pw").val();
			var pw_chk = $("#pw_chk").val();
			
			if(pw != "" || pw_chk != ""){
				if(pw == pw_chk){
					$("#pw_chk_available").show();
					$("#pw_chk_unavailable").hide();
				}else{
					$("#pw_chk_available").hide();
					$("#pw_chk_unavailable").show();
				}
			}
		});
	});
	
	var code = "";	//�̸������� ������ȣ �����ϱ� ���� �ڵ�
	
	//�̸��� ����
	function emailCheck(){
		
		 var user_email = $(".user_email").val();        // �Է��� �̸���
		 var checkBox = $(".user_email_injeong");		 // ������ȣ �Է¶�

		 $.ajax({
		 	type:"GET",
		 	url:"emailCheck.do?user_email=" + user_email,
		 	success:function(data){
		 		//console.log("data: " + data);
		 		
		 		if(user_email != ''){
		 			$("#email_chk_blank").hide();
			 		checkBox.attr("disabled", false);
			 		checkBox.attr("id","user_email_injeong_true");
			 		$(".user_email_injeong").focus();
			 		code = data;
		 		}else{
		 			$("#email_chk_blank").show();
		 		}
		 	}
		                
		 });
	}
	
	//������ȣ ��
	$(function(){
		
		$(".user_email_injeong").keyup(function(){
			var inputCode = $(".user_email_injeong").val();		//�Է��ڵ�
			
			$("#email_chk_available").hide();
			$("#email_chk_unavailable").hide();
			
			if(inputCode == code){
				$("#email_chk_available").show();
				$("#email_chk_unavailable").hide();
			}else{
				$("#email_chk_unavailable").show();
				$("#email_chk_available").hide();
			}
		});
	});
	
</script>

<!-- īī�� �ּ� api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addr_search() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("user_addr1").value = extraAddr;
                
                } else {
                    document.getElementById("user_addr1").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("user_addr1").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("user_addr2").focus();
            }
        }).open();
    }
</script>
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
            <form action="regist.do" method="post">
                <table width="550px">
                    <tr>
                        <col width="150px"> <col width="300px">
                    </tr>
                    <tr>
                        <th>���̵�</th>
                        <td>
                            <input type="text" class="user_id" name="id" id="id" title="n" required="required" placeholder="���̵� �Է��ϼ���." autofocus>
                            <input type="button" class="user_id_chk" value="�ߺ� Ȯ��" onclick="idCheck();"><br>
                            <span id="id_chk_available">��밡���� ���̵��Դϴ�.</span>
                            <span id="id_chk_unavailable">�ߺ��� ���̵��Դϴ�.</span>
                            <span id="id_chk_blank">���̵� �Է��ϼ���.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>�̸�</th>
                        <td><input type="text" class="user_name" name="user_name" id="user_name" required="required" placeholder="�̸��� �Է��ϼ���." onclick="idChkConfirm();"></td>
                    </tr>
                    <tr>
                        <th>��й�ȣ</th>
                        <td><input type="password" class="user_pw" name="pw" id="pw" required="required" placeholder="��й�ȣ�� �Է��ϼ���." onclick="idChkConfirm();"></td>
                    </tr>
                    <tr>
                        <th>��й�ȣ Ȯ��</th>
                        <td>
                        	<input type="password" class="user_pw_chk" name="pw_chk" id="pw_chk" required="required" onclick="idChkConfirm();"><br>
                        	<span id="pw_chk_available">��й�ȣ�� ��ġ�մϴ�.</span>
                            <span id="pw_chk_unavailable">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>�̸���</th>
                        <td>
                        	<input type="text" class="user_email" name="user_email" required="required" placeholder="�̸����� �Է��ϼ���.">
                        	<input type="button" class="user_email_chk" value="������ȣ �߱�" onclick="emailCheck();">
                        	<input type="text" class="user_email_injeong" name="user_email_injeong" id="user_email_injeong_false" required="required" disabled="disabled"><br>
                        	<span id="email_chk_blank">�̸����� �Է��ϼ���.</span>
                        	<span id="email_chk_available">������ȣ�� ��ġ�մϴ�.</span>
                            <span id="email_chk_unavailable">������ȣ�� ��ġ���� �ʽ��ϴ�.</span>
                        </td>
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
                            <input type="text" class="user_addr1" name="user_addr1" id="user_addr1" required="required" placeholder="�����ȣ�� �Է��ϼ���." readonly="readonly">
                            <input type="button" class="user_addr_chk" value="�ּ� �˻�" onclick="addr_search();"><br>
                            <input type="text" class="user_addr2" name="user_addr2" id="user_addr2" required="required" placeholder="���ּҸ� �Է��ϼ���." onclick="idChkConfirm();">
                        </td>
                    </tr>
                    <tr>
                        <th>�ڵ��� ��ȣ</th>
                        <td>
                            <input type="text" class="user_phone" name="user_phone" required="required" placeholder="'-' ��ȣ ���� ���ڸ� �Է��ϼ���." onclick="idChkConfirm();">
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
                        <input type="button" class="back_btn" value="�� ��" onclick="location.href='index.do'">
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