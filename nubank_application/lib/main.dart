import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(), // HomeScreen como tela inicial do app. isso que da a cara de "aplicativo."
    );
  }
}

//tela principal do aplicativo
class HomeScreen extends StatelessWidget { 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8A05BE), //cor roxa de fundo da appbar
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility_outlined, color: Color(0xFFF5F5F5)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.question_mark_rounded, color: Color(0xFFF5F5F5)),
            onPressed: () {}, 
          ),
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined, color: Color(0xFFF5F5F5)),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          //essa é a ação quando o botão for pressionado.
          icon: const Icon(Icons.person_outline, color: Color(0xFFF5F5F5)),
          onPressed: () {}, 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //espaçamento padrão 16 pixels
        child: ListView(
          children: [
            _buildSaldoConta(), //essa seção exibe o saldo que tem na conta
            const SizedBox(height: 30),
            _buildAcoesPrincipais(), //e essa seção aqui tem os botões do inicio que são o pix, pagamentos, qrcode e transferencia
            const SizedBox(height: 30),
            _buildCardSections(),  //cartões e outras informações
            const SizedBox(height: 30),
            _buildCartaoCredito(),//informações do cartão de crédito
            const Divider(height: 1, thickness: 1),
            const SizedBox(height: 30),
            _buildEmprestimo(),
            const Divider(height: 1, thickness: 1),
            const SizedBox(height: 30),
            _buildDescubraMais(),
          ],
        ),
      ),
    );
  }

  // contrução seção de saldo da conta
  Widget _buildSaldoConta() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start, //
      children: [
        Text("Conta", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), // título da seção
        SizedBox(height: 10),
        Text("R\$1000,00", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), 
      ],
    );
  }

// construção de pix, pagamento, qrcode e transferencia. aqui defino cor, os icones
Widget _buildAcoesPrincipais() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround, // Espaçamento igual entre os botões
    children: [
      _buildIconButton("Área Pix", Icons.pix, color: Colors.black), // Botão para "Área Pix" com ícone preto
      _buildIconButton("Pagamentos", Icons.money, color: Colors.black), // Botão para "Pagamentos" com ícone preto
      _buildIconButton("QRCode", Icons.qr_code, color: Colors.black), // Botão para "QRCode" com ícone preto
      _buildIconButton("Transferir", Icons.attach_money, color: Colors.black), // Botão para "Transferir" com ícone preto
    ],
  );
}

// e aqui estou botando o circulo cinza no fundo
Widget _buildIconButton(String text, IconData icon, {required Color color}) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 30, //tamanho
        child: IconButton(
          icon: Icon(icon, color: Colors.black), // ícone ficam DENTRO dentro do círculo
          onPressed: () {},//nada acontece quando o botão é pressionado (aqui eu poderia definir uma ação)
        ),
      ),
      const SizedBox(height: 8), // espaçamento entre o ícone e o texto
      Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Texto abaixo do ícone
    ],
  );
}


  //método: construção seção cartões
  Widget _buildCardSections() {
    return const Column(
      children: [
        Card(
          color: Color(0xFFF5F5F5),
          child: ListTile(
            leading: Icon(Icons.credit_card, color: Color.fromARGB(255, 5, 5, 5)), //aqui estou criando o icone do cartão
            title: Text(
              "Meus Cartões", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
            ),
          ),
        ),
        SizedBox(height: 10),
        Card(
          color: Color(0xFFF5F5F5),
          child: ListTile(
            title: Text(
              "Guarde seu dinheiro em caixinhas",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8A05BE)),
            ),
            subtitle: Text("Acessando a área de planejamento"), 
          ),
        ),
      ],
    );
  }

  //seção de cartão de crédito
  Widget _buildCartaoCredito() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Cartão de Crédito", style: TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        const Text("Fatura Fechada", style: TextStyle(fontSize: 18, color: Colors.black54)),
        const SizedBox(height: 10),
        const Text("R\$2.123,39", style: TextStyle(fontSize: 24)),
        const SizedBox(height: 15),
        const Text("Vencimento dia 15", style: TextStyle(fontSize: 18, color: Colors.black54)),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {}, // ação quando o botão renegociar é pressionado. nesse caso novamente nada acontece
          child: const Text("Renegociar", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0))),
        ),
      ],
    );
  }

  // construção: seção de empréstimo
  Widget _buildEmprestimo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Empréstimo", style: TextStyle(fontSize: 24)),
        SizedBox(height: 10),
        Text("Tudo certo! Você está em dia", style: TextStyle(fontSize: 18)),
      ],
    );
  }

  //construindo a seção descubra mais
  Widget _buildDescubraMais() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Descubra Mais", style: TextStyle(fontSize: 24)), 
        const SizedBox(height: 10),
        _buildSeguroVidaCard(), // chamada do método que constrói o cartão de seguro de vida
      ],
    );
  }

  //método construção cartão de seguro de vida
  Widget _buildSeguroVidaCard() {
    return Card(
      child: Column(
        children: [
          //e aqui é onde finalmente estou definindo a imagem que foi dada no teams, ou seja, seguroVida.png
          Image.asset(
            'assets/images/seguroVida.png',
            width: 500,
            height: 220,
            fit: BoxFit.cover,//ajuste da cobertura da imagem
          ),
          Padding( 
            padding: const EdgeInsets.all(10.0),  // Espaçamento interno no cartão
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Seguro de Vida", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // Título do cartão
                const SizedBox(height: 5),
                const Text("Cuide bem de quem você ama de um jeito simples", style: TextStyle(fontSize: 18, color: Colors.black54)), 
                const SizedBox(height: 10),
        ElevatedButton(
  onPressed: () {}, // ação quando o botão conhecer é pressionado (nada acontece)
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF8A05BE), //cor roxa do botão como solicitado
  ),
  child: const Text(
    "Conhecer",
    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
  ),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
