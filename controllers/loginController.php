<?php
class loginController extends controller {

	public function index() {
		$data = array(
			'msg' => ''
		);

		if(!empty($_GET['error'])) {
			if($_GET['error'] == '1') {
				$data['msg'] = 'Usuário e/ou senha inválidos!';
			}
		}

		$this->loadView('login', $data);
		

	}

	public function signin() {

		if(!empty($_POST['username'])) {
			$username = strtolower($_POST['username']);
			$pass = $_POST['pass'];

			$users = new Users();
			if($users->validateUser($username, $pass)) {
				header("Location: ".BASE_URL);
				exit;
			} else {
				header("Location: ".BASE_URL."login?error=1");
				exit;
			}

		} else {
			header("Location: ".BASE_URL."login");
			exit;
		}
	}

	public function signup() {
		$data = array(
			'msg' => ''
		);
			
		if(!empty($_POST['username'])) {
			$username = strtolower($_POST['username']);
			$pass = $_POST['pass'];

			$users = new Users();

			if($users->validateUsername($username)) {
				if(!$users->userExists($username)) {//Verifica se usuario existe
					$users->registerUser($username, $pass);//Se não existir manda user e pass

					header("Location: ".BASE_URL."login");
				} else {
					$data['msg'] = 'Usuário já existe!';
				}
			} else {
				$data['msg'] = 'Usuário não válido! (Digite apenas letras e números)';
			}
		}

		$this->loadView('signup', $data);
	}

}