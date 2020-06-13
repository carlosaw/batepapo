var chat = {// Cria um Objeto para manipular

	groups:[],//Armazenamento dos grupos
	activeGroup:0,
	lastTime:'',

	// Função para abrir um novo grupo se não existir
	setGroup:function(id, name) {
		var found = false;

		for(var i in this.groups) {
			if(this.groups[i].id == id) {
				found = true;
			}
		}

		// Se não achou o grupo adiciona o grupo
		if(found == false) {
			this.groups.push({
				id:id,
				name:name,
				messages:[
					{id:1, sender_id:1, sender_name:'Carlos', sender_date:'10:00', msg:'Oi, tudo bem?'},
					{id:2, sender_id:1, sender_name:'Carlos', sender_date:'10:02', msg:'Alguma mensagem no grupo '+name+'?'}
				]
			});
		}
		if(this.groups.length == 1) {//Se for o primeiro grupo que entrou
			this.setActiveGroup(id);//Ele será o grupo ativo
		}
		//Atualiza o view
		this.updateGroupView();
	},

	// Função p/ pegar os grupos que tem
	getGroups:function() {
		return this.groups;
	},

	loadGroupList:function(ajaxCallback){
		//alert("Carregar a lista e mostrar em: "+id);		
		$.ajax({
			url:BASE_URL+'ajax/get_groups',
			type:'GET',
			dataType:'json',
			success:function(json) {
				if(json.status == '1') {
					ajaxCallback(json);
				} else {// se não estiver logado
					window.location.href = BASE_URL+'login';
				}						 				
			}
		});
	},

	addNewGroup:function(groupName, ajaxCallback) {
		$.ajax({
			url:BASE_URL+'ajax/add_group',
			type:'POST',
			data:{name:groupName},
			dataType:'json',
			success:function(json) {
				if(json.status == '1') {
					ajaxCallback(json);
				} else {// se não estiver logado
					window.location.href = BASE_URL+'login';
				}						 
				
			}
		});
	},

	updateGroupView:function() {
		var html = '';
		for(var i in this.groups) {//Pega os nomes dos grupos ao add
			html += '<li data-id="'+this.groups[i].id+'">'+this.groups[i].name+'</li>';
		}
		$('nav ul').html(html);

		this.loadConversation();//Marca grupo como ativo
	},

	setActiveGroup:function(id){
		this.activeGroup = id;//Seta o grupo pelo id
		this.loadConversation();//Atualiza o layout da tela
	},

	getActiveGroup:function(){
		return this.activeGroup;
	},

	loadConversation:function(){

		if(this.activeGroup != 0){
			$('nav ul').find('.active_group').removeClass('active_group');//Remove a classe
			$('nav ul').find('li[data-id='+this.activeGroup+']').addClass('active_group');//Muda a cor do grupo ativo
		}
		// Pegar conversa daquele grupo

		this.showMessages();
	},

	showMessages:function() {
		$('.messages').html('');//Zera as mensagens

		if(this.activeGroup != 0) {

			var msgs = [];

			for(var i in this.groups) {//Se id do grupo for igual grupo ativo
				if(this.groups[i].id == this.activeGroup) {
					msgs = this.groups[i].messages;
				}
			}

			for(var i in msgs) {

				var html = '<div class="message">';
				html += '<div class="m_info">';
				html += '<span class="m_sender">'+msgs[i].sender_name+'</span>';
				html += '<span class="m_date">'+msgs[i].sender_date+'</span>';	
				html += '</div>';	
				html += '<div class="m_body">';
				html += msgs[i].msg;
				html += '</div>';	
				html += '</div>';

				$('.messages').append(html);
			
			}
		}
	},

	sendMessage:function(msg){
		if(msg.length > 0 && this.activeGroup != 0) {//Se tem conteudo e grupo ativo

			$.ajax({
				url:BASE_URL+'ajax/add_message',
				type:'POST',
				data:{id_group:this.activeGroup, msg:msg},
				dataType:'json',
				success:function(json) {
					if(json.status == '1') {
						if(json.error == '1') {
							alert(json.errorMsg);
						}
					} else {// se não estiver logado
						window.location.href = BASE_URL+'login';
					}						 					
				}
			});
		}
	},

	chatActivity:function() {

		var gs = this.getGroups();
		var groups = [];

		for(var i in gs) {//Pega apenas os ids dos grupos
			groups.push( gs[i].id );
		}
		//console.log("rodou: "+groups.length);
		if(groups.length > 0) {// Se tiver algum grupo aberto faz a req
			$.ajax({
				url:BASE_URL+'ajax/get_messages',
				type:'GET',
				data:{last_time:this.lastTime, groups:groups},
				dataType:'json',
				success:function(json) {
					if(json.status == '1') {
						//chat.updateLastTime( json.last_time );

						/*for(var i in json.msgs) {//Insere msg no respectivo lugar
							chat.insertMessage(json.msgs[i]);
						}

						chat.showMessages();*/
					} else {
						window.location.href = BASE_URL+'login';
					}
				},
				complete:function(){
					chat.chatActivity();
				}
			});
		} else {// Senão Roda a cada 1 segundo
			setTimeout(function(){
				chat.chatActivity();
			}, 5000);			
		}
	}

};