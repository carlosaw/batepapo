<?php
class ajaxController extends controller {

	private $user;

	public function __construct() {

		$this->user = new Users();

		if(!$this->user->verifyLogin()) {
			$array = array(
				'status' => '0'
			);

			echo json_encode($array);
			exit;
		}
	}

	public function index() {}

	public function get_groups() {
		$array = array(
			'status' => '1'
		);
		$groups = new Groups();

		$array['list'] = $groups->getList();

		echo json_encode($array);
		exit;

	}
	// WebService Função para criar novo grupo
	public function add_group() {
		$array = array('status' => '1', 'error' => '0');
		$groups = new Groups();

		if(!empty($_POST['name'])) {
			$name = $_POST['name'];

			$groups->add($name);
		} else {
			$array['error'] = '1';
			$array['errorMsg'] = 'Falta o NOME do grupo.';
		}

		echo json_encode($array);
		exit;
	}

	//Webservice de enviar e receber mensagens
	public function add_message() {
		$array = array('status' => '1', 'error' => '0');
		$messages = new Messages();
		
		if(!empty($_POST['msg']) && !empty($_POST['id_group'])) {
			$msg = $_POST['msg'];
			$id_group = $_POST['id_group'];
			$uid = $this->user->getUid();

			$messages->add($uid, $id_group, $msg);
		} else {
			$array['error'] = '1';
			$array['errorMsg'] = 'Mensagem vazia';
		}

		echo json_encode($array);
		exit;
	}

	// WebService para receber mensagens
	public function get_messages() {
		$array = array(
			'status' => '1',
			'msgs' => array(),
			'last_time' => date('Y-m-d H:i:s')
		);
		$messages = new Messages();

		set_time_limit(60);//Estipula o tempo para requisições

		$ult_msg = date('Y-m-d H:i:s');// Ultima msg é a atual
		if(!empty($_GET['last_time'])) {
			$ult_msg = $_GET['last_time'];// Qual a ultima vez que recebeu mensagem
		}

		$groups = array();
		if(!empty($_GET['groups']) && is_array($_GET['groups'])) {// Grupos abertos
			$groups = $_GET['groups'];
		}

		while(true) {// Dá um loop infinito
			session_write_close();// Roda no final da execução do php
			$msgs = $messages->get($ult_msg, $groups);// Verifica se tem mensagens novas

			if(count($msgs) > 0) {//Se tiver mensagens
				$array['msgs'] = $msgs;//Preenche o array de resposta
				$array['last_time'] = date('Y-m-d H:i:s');

				break;// Pára o loop
			} else {// Senão...
				sleep(2);// dá um tempo de 2 segundos
				continue;// e continua o loop
			}

		}

		echo json_encode($array);
		exit;
	}

}