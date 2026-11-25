import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AgroServiceApp());
}

class AgroServiceApp extends StatelessWidget {
  const AgroServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroService - Planalto Norte & Sul PR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFFF9A825),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7F5),
      ),
      home: const DiretorioHomePage(),
    );
  }
}

// ==========================================
// LISTA COMPLETA DE CIDADES (PLANALTO NORTE SC & SUL PR)
// ==========================================
final List<String> cidadesDisponiveis = [
  'Bela Vista do Toldo - SC',
  'Campo Alegre - SC',
  'Canoinhas - SC',
  'Irineópolis - SC',
  'Itaiópolis - SC',
  'Mafra - SC',
  'Major Vieira - SC',
  'Monte Castelo - SC',
  'Papanduva - SC',
  'Porto União - SC',
  'Rio Negrinho - SC',
  'Santa Terezinha - SC',
  'São Bento do Sul - SC',
  'Três Barras - SC',
  'Antônio Olinto - PR',
  'Bituruna - PR',
  'Cruz Machado - PR',
  'General Carneiro - PR',
  'Paula Freitas - PR',
  'Paulo Frontin - PR',
  'Porto Vitória - PR',
  'São Mateus do Sul - PR',
  'União da Vitória - PR',
];

// ==========================================
// MODELOS DE DADOS E AUTENTICAÇÃO (12 USUÁRIOS)
// ==========================================
class UsuarioAgro {
  final String id;
  final String nome;
  final String email;
  final String whatsapp;
  final String senha;

  UsuarioAgro({
    required this.id,
    required this.nome,
    required this.email,
    required this.whatsapp,
    required this.senha,
  });
}

final List<UsuarioAgro> usuariosCadastrados = [
  UsuarioAgro(
    id: 'user_agrimao',
    nome: 'Carlos (AgriMão Colheitas)',
    email: 'carlos@agrimao.com',
    whatsapp: '(47) 99912-3456',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_safralimpa',
    nome: 'Marcos (Safra Limpa)',
    email: 'marcos@safralimpa.com',
    whatsapp: '(47) 99845-7890',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_aeroagro',
    nome: 'Ana (AeroAgro Planalto)',
    email: 'ana@aeroagro.com',
    whatsapp: '(47) 99701-2233',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_colheitaforte',
    nome: 'Roberto (Colheita Forte)',
    email: 'roberto@colheitaforte.com',
    whatsapp: '(42) 99934-1122',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_geocampo',
    nome: 'Fernanda (GeoCampo)',
    email: 'fernanda@geocampo.com',
    whatsapp: '(47) 99655-8899',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_solofertil',
    nome: 'Lucas (SoloFértil)',
    email: 'lucas@solofertil.com',
    whatsapp: '(42) 99811-4455',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_fumoouro',
    nome: 'Juliana (Fumo Ouro Classificação)',
    email: 'juliana@fumoouro.com',
    whatsapp: '(47) 99923-6611',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_tratornorte',
    nome: 'Edson (TratorNorte Preparo)',
    email: 'edson@tratornorte.com',
    whatsapp: '(47) 99876-5432',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_plantiosul',
    nome: 'Tiago (PlantioSul Precisão)',
    email: 'tiago@plantiosul.com',
    whatsapp: '(42) 99945-3321',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_silagempr',
    nome: 'Valdir (Silagem & Forragem PR)',
    email: 'valdir@silagempr.com',
    whatsapp: '(42) 99867-1209',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_transagro',
    nome: 'Marcelo (TransAgro Cargas Rurais)',
    email: 'marcelo@transagro.com',
    whatsapp: '(47) 99788-9012',
    senha: '123',
  ),
  UsuarioAgro(
    id: 'user_terraviva',
    nome: 'Patrícia (TerraViva Corretivos)',
    email: 'patricia@terraviva.com',
    whatsapp: '(47) 99612-7744',
    senha: '123',
  ),
];

UsuarioAgro? usuarioLogado;

enum TipoMedida { hectare, metroQuadradoEstufa, hora }

class AvaliacaoItem {
  final String autor;
  final double nota;
  final String comentario;
  final DateTime data;

  AvaliacaoItem({
    required this.autor,
    required this.nota,
    required this.comentario,
    required this.data,
  });
}

class ServicoAgro {
  final String id;
  final String criadorId;
  final String titulo;
  final String prestador;
  final String whatsappPrestador;
  final String categoria;
  final TipoMedida tipoMedida;
  final double precoBase;
  final String? infoComplementar;
  final List<AvaliacaoItem> avaliacoes;
  final String cidade;
  final String equipamento;
  final String descricao;
  final IconData icone;

  ServicoAgro({
    required this.id,
    required this.criadorId,
    required this.titulo,
    required this.prestador,
    required this.whatsappPrestador,
    required this.categoria,
    required this.tipoMedida,
    required this.precoBase,
    this.infoComplementar,
    List<AvaliacaoItem>? avaliacoes,
    required this.cidade,
    required this.equipamento,
    required this.descricao,
    required this.icone,
  }) : avaliacoes = avaliacoes ?? [];

  double get avaliacao {
    if (avaliacoes.isEmpty) return 0.0;
    final soma = avaliacoes.fold<double>(0.0, (acc, item) => acc + item.nota);
    return soma / avaliacoes.length;
  }

  int get totalAvaliacoes => avaliacoes.length;

  void adicionarAvaliacao(double nota, {String comentario = ''}) {
    avaliacoes.insert(
      0,
      AvaliacaoItem(
        autor: usuarioLogado?.nome ?? 'Produtor Rural',
        nota: nota,
        comentario: comentario.trim(),
        data: DateTime.now(),
      ),
    );
  }

  String get sufixoPreco {
    switch (tipoMedida) {
      case TipoMedida.metroQuadradoEstufa:
        return '/ m² estufa';
      case TipoMedida.hora:
        return '/ hora';
      case TipoMedida.hectare:
        return '/ ha';
    }
  }
}

class AgendamentoHistorico {
  final String id;
  final ServicoAgro servico;
  final String contratanteNome;
  final String contratanteWhatsapp;
  double quantidade;
  String pesFumoReferencia;
  DateTime dataDesejada;
  double valorTotal;
  final DateTime dataSolicitacao;
  String status;
  bool jaAvaliado;

  AgendamentoHistorico({
    required this.id,
    required this.servico,
    required this.contratanteNome,
    required this.contratanteWhatsapp,
    required this.quantidade,
    required this.pesFumoReferencia,
    required this.dataDesejada,
    required this.valorTotal,
    required this.dataSolicitacao,
    this.status = 'Pendente',
    this.jaAvaliado = false,
  });

  String get dimensionamentoFormatado {
    if (servico.tipoMedida == TipoMedida.metroQuadradoEstufa) {
      return '${quantidade.toStringAsFixed(1)} m² de estufa ($pesFumoReferencia pés de fumo)';
    } else if (servico.tipoMedida == TipoMedida.hora) {
      return '${quantidade.toStringAsFixed(1)} horas de serviço ($pesFumoReferencia pés de fumo)';
    } else {
      return '${quantidade.toStringAsFixed(1)} hectares';
    }
  }
}

// ==========================================
// LISTA INICIAL DE SERVIÇOS (14 SERVIÇOS)
// ==========================================
final List<ServicoAgro> listaServicosInicial = [
  ServicoAgro(
    id: '1',
    criadorId: 'user_agrimao',
    titulo: 'Equipe para Colheita de Tabaco',
    prestador: 'AgriMão Colheitas & Safra',
    whatsappPrestador: '(47) 99912-3456',
    categoria: 'Tabaco',
    tipoMedida: TipoMedida.metroQuadradoEstufa,
    precoBase: 38.00,
    infoComplementar: 'Medição feita pela área total (m²) da estufa carregada',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'José Kowalski',
        nota: 5.0,
        comentario: 'Equipe muito rápida e caprichosa no carregamento da estufa.',
        data: DateTime.now().subtract(const Duration(days: 5)),
      ),
      AvaliacaoItem(
        autor: 'Antônio Silva',
        nota: 4.8,
        comentario: 'Pontuais e organizados.',
        data: DateTime.now().subtract(const Duration(days: 12)),
      ),
    ],
    cidade: 'Irineópolis - SC',
    equipamento: 'Equipe de 10 safristas + Carreta agrícola',
    descricao:
        'Apanha especializada por baixeiro, meeiro e ponteiro, com transporte interno até a estufa e organização completa para carregamento.',
    icone: Icons.groups,
  ),
  ServicoAgro(
    id: '2',
    criadorId: 'user_safralimpa',
    titulo: 'Equipe para Desbrote e Carpida de Tabaco',
    prestador: 'Safra Limpa Serviços Rurais',
    whatsappPrestador: '(47) 99845-7890',
    categoria: 'Tabaco',
    tipoMedida: TipoMedida.hora,
    precoBase: 30.00,
    infoComplementar: 'Cobrança por hora efetiva de serviço na lavoura',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Pedro Novak',
        nota: 4.8,
        comentario: 'Serviço muito bem feito na lavoura.',
        data: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ],
    cidade: 'Bela Vista do Toldo - SC',
    equipamento: 'Equipe treinada + Enxadas e aplicadores manuais',
    descricao:
        'Desbrote manual rigoroso, aplicação localizada de anti-brotante e carpida limpa entre linhas para máximo desenvolvimento foliar.',
    icone: Icons.content_cut,
  ),
  ServicoAgro(
    id: '3',
    criadorId: 'user_aeroagro',
    titulo: 'Pulverização com Drone DJI Agras T40',
    prestador: 'AeroAgro Planalto',
    whatsappPrestador: '(47) 99701-2233',
    categoria: 'Pulverização',
    tipoMedida: TipoMedida.hectare,
    precoBase: 115.00,
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Fazenda Santa Clara',
        nota: 5.0,
        comentario: 'Zero amassamento na soja e aplicação uniforme.',
        data: DateTime.now().subtract(const Duration(days: 8)),
      ),
      AvaliacaoItem(
        autor: 'Luiz Henrique',
        nota: 4.8,
        comentario: 'Excelente atendimento em Canoinhas.',
        data: DateTime.now().subtract(const Duration(days: 15)),
      ),
    ],
    cidade: 'Canoinhas - SC',
    equipamento: 'Drone DJI T40 (Tanque 40L)',
    descricao:
        'Aplicação localizada de defensivos e foliares sem amassamento de cultura, ideal para áreas declivosas e lavouras de grãos.',
    icone: Icons.airplanemode_active,
  ),
  ServicoAgro(
    id: '4',
    criadorId: 'user_colheitaforte',
    titulo: 'Aluguel de Colheitadeira de Grãos',
    prestador: 'Colheita Forte Maquinários',
    whatsappPrestador: '(42) 99934-1122',
    categoria: 'Colheita',
    tipoMedida: TipoMedida.hectare,
    precoBase: 380.00,
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Sítio Boa Vista',
        nota: 4.8,
        comentario: 'Máquina revisada e operador muito experiente.',
        data: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ],
    cidade: 'Paulo Frontin - PR',
    equipamento: 'John Deere S790 + Plataforma 45 pés',
    descricao:
        'Colheita mecanizada de soja, milho e feijão com operador especializado incluso, telemetria e baixa perda de grãos.',
    icone: Icons.agriculture,
  ),
  ServicoAgro(
    id: '5',
    criadorId: 'user_geocampo',
    titulo: 'Mapeamento Aéreo e Índice NDVI',
    prestador: 'GeoCampo Inteligência',
    whatsappPrestador: '(47) 99655-8899',
    categoria: 'Mapeamento',
    tipoMedida: TipoMedida.hectare,
    precoBase: 35.00,
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Agropecuária Sul',
        nota: 4.7,
        comentario: 'Relatório detalhado entregue no mesmo dia.',
        data: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ],
    cidade: 'Três Barras - SC',
    equipamento: 'Drone Mavic 3 Multispectral',
    descricao:
        'Geração de ortomosaico, contagem de plantas, identificação de falhas de plantio e mapas de vigor vegetativo (NDVI).',
    icone: Icons.map,
  ),
  ServicoAgro(
    id: '6',
    criadorId: 'user_solofertil',
    titulo: 'Coleta e Análise de Solo Georreferenciada',
    prestador: 'SoloFértil Consultoria',
    whatsappPrestador: '(42) 99811-4455',
    categoria: 'Solo',
    tipoMedida: TipoMedida.hectare,
    precoBase: 65.00,
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Granja União',
        nota: 5.0,
        comentario: 'Mapa de calagem muito preciso, recomendo!',
        data: DateTime.now().subtract(const Duration(days: 4)),
      ),
    ],
    cidade: 'Paula Freitas - PR',
    equipamento: 'Quadriciclo com Amostrador Hidráulico',
    descricao:
        'Grade amostral georreferenciada, análise química completa em laboratório e mapa de recomendação de calagem e adubação.',
    icone: Icons.grass,
  ),
  ServicoAgro(
    id: '7',
    criadorId: 'user_fumoouro',
    titulo: 'Classificação e Enfardamento de Tabaco',
    prestador: 'Fumo Ouro Classificação',
    whatsappPrestador: '(47) 99923-6611',
    categoria: 'Tabaco',
    tipoMedida: TipoMedida.hora,
    precoBase: 32.00,
    infoComplementar: 'Equipe por hora no galpão de classificação e prensa',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Valmir Kurek',
        nota: 4.9,
        comentario: 'Separação impecável de classes BO1 e TO1, deu ótimo rendimento.',
        data: DateTime.now().subtract(const Duration(days: 6)),
      ),
    ],
    cidade: 'Itaiópolis - SC',
    equipamento: 'Equipe de 6 classificadores + Prensa enfardadeira',
    descricao:
        'Manocagem, destalamento, separação rigorosa por padrão comercial (baixeiro, meeiro, ponteiro) e enfardamento pronto para venda.',
    icone: Icons.inventory_2,
  ),
  ServicoAgro(
    id: '8',
    criadorId: 'user_agrimao',
    titulo: 'Transplante e Plantio de Mudas de Tabaco',
    prestador: 'AgriMão Colheitas & Safra',
    whatsappPrestador: '(47) 99912-3456',
    categoria: 'Tabaco',
    tipoMedida: TipoMedida.hora,
    precoBase: 34.00,
    infoComplementar: 'Inclui operação com plantadora semiautomática',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Cláudio Mielke',
        nota: 4.9,
        comentario: 'Espaçamento uniforme e excelente pegamento das mudas.',
        data: DateTime.now().subtract(const Duration(days: 14)),
      ),
    ],
    cidade: 'Irineópolis - SC',
    equipamento: 'Trator 75cv + Transplantadora de 2 linhas + 5 auxiliares',
    descricao:
        'Transplante mecanizado de mudas produzidas em float com adubação de base e rega localizada no sulco.',
    icone: Icons.spa,
  ),
  ServicoAgro(
    id: '9',
    criadorId: 'user_tratornorte',
    titulo: 'Subsolagem, Gradagem e Camalhão',
    prestador: 'TratorNorte Preparo de Solo',
    whatsappPrestador: '(47) 99876-5432',
    categoria: 'Solo',
    tipoMedida: TipoMedida.hora,
    precoBase: 210.00,
    infoComplementar: 'Hora-máquina trabalhada com diesel incluso',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Sérgio Wrubleski',
        nota: 4.8,
        comentario: 'Camalhões altos e bem alinhados para o fumo.',
        data: DateTime.now().subtract(const Duration(days: 9)),
      ),
    ],
    cidade: 'Mafra - SC',
    equipamento: 'Trator Valtra BH 180 + Subsolador 7 hastes + Sulcador',
    descricao:
        'Descompactação profunda de solo, gradagem niveladora e levantamento de camalhões com adubação incorporada.',
    icone: Icons.build_circle,
  ),
  ServicoAgro(
    id: '10',
    criadorId: 'user_plantiosul',
    titulo: 'Plantio Direto de Soja e Milho com GPS',
    prestador: 'PlantioSul Precisão',
    whatsappPrestador: '(42) 99945-3321',
    categoria: 'Colheita',
    tipoMedida: TipoMedida.hectare,
    precoBase: 165.00,
    infoComplementar: 'Plantio com piloto automático RTK e corte seção a seção',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Fazenda Rio Claro',
        nota: 5.0,
        comentario: 'Distribuição perfeita de sementes e zero sobreposição.',
        data: DateTime.now().subtract(const Duration(days: 11)),
      ),
    ],
    cidade: 'São Mateus do Sul - PR',
    equipamento: 'Trator Massey 7719 + Plantadeira 13 linhas a vácuo',
    descricao:
        'Semeadura de precisão para soja, milho e feijão sobre palhada com taxa variável de adubo e semente.',
    icone: Icons.straighten,
  ),
  ServicoAgro(
    id: '11',
    criadorId: 'user_silagempr',
    titulo: 'Ensilagem de Milho Área Total',
    prestador: 'Silagem & Forragem PR',
    whatsappPrestador: '(42) 99867-1209',
    categoria: 'Colheita',
    tipoMedida: TipoMedida.hora,
    precoBase: 320.00,
    infoComplementar: 'Conjunto completo com ensiladeira e 2 carretas basculantes',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Leiteria Cruz Machado',
        nota: 4.9,
        comentario: 'Grão bem quebrado e ótimo rendimento por hora no silo.',
        data: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
    cidade: 'Cruz Machado - PR',
    equipamento: 'Ensiladeira JF C120 AT + 2 Tratores com carretas',
    descricao:
        'Corte, picagem com processador de grãos (cracker) e transporte até o silo trincheira ou superfície.',
    icone: Icons.local_shipping,
  ),
  ServicoAgro(
    id: '12',
    criadorId: 'user_terraviva',
    titulo: 'Aplicação de Calcário e Gesso Taxa Variável',
    prestador: 'TerraViva Corretivos',
    whatsappPrestador: '(47) 99612-7744',
    categoria: 'Solo',
    tipoMedida: TipoMedida.hectare,
    precoBase: 85.00,
    infoComplementar: 'Leitura direta de mapa de prescrição agrícola',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'AgroPinhão',
        nota: 4.7,
        comentario: 'Faixa de aplicação larga e bem calibrada.',
        data: DateTime.now().subtract(const Duration(days: 13)),
      ),
    ],
    cidade: 'Papanduva - SC',
    equipamento: 'Distribuidor Hercules 10000 com controlador eletrônico',
    descricao:
        'Distribuição uniforme de calcário, gesso agrícola e fertilizantes granulados seguindo mapas de fertilidade do solo.',
    icone: Icons.layers,
  ),
  ServicoAgro(
    id: '13',
    criadorId: 'user_transagro',
    titulo: 'Transporte de Fardos de Tabaco e Insumos',
    prestador: 'TransAgro Cargas Rurais',
    whatsappPrestador: '(47) 99788-9012',
    categoria: 'Tabaco',
    tipoMedida: TipoMedida.hora,
    precoBase: 140.00,
    infoComplementar: 'Caminhão baú/lonado para entrega nas fumageiras da região',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'Marcos Becker',
        nota: 5.0,
        comentario: 'Caminhão limpo, seco e motorista ajuda na carga e descarga.',
        data: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
    cidade: 'Porto União - SC',
    equipamento: 'Caminhão Truck 14t com carroceria graneleira/lonada',
    descricao:
        'Frete rural seguro para entrega de fardos de tabaco em Rio Negro, Mafra, Canoinhas e Venâncio Aires, além de transporte de adubos.',
    icone: Icons.fire_truck,
  ),
  ServicoAgro(
    id: '14',
    criadorId: 'user_aeroagro',
    titulo: 'Pulverização Tratorizada com Barras 24m',
    prestador: 'AeroAgro Planalto',
    whatsappPrestador: '(47) 99701-2233',
    categoria: 'Pulverização',
    tipoMedida: TipoMedida.hectare,
    precoBase: 75.00,
    infoComplementar: 'Controlador de vazão automático e pontas anti-deriva',
    avaliacoes: [
      AvaliacaoItem(
        autor: 'João Paulo G.',
        nota: 4.8,
        comentario: 'Excelente cobertura foliar na cultura do feijão.',
        data: DateTime.now().subtract(const Duration(days: 16)),
      ),
    ],
    cidade: 'União da Vitória - PR',
    equipamento: 'Pulverizador Jacto Advance 3000 AM24',
    descricao:
        'Aplicação terrestre de herbicidas, fungicidas e inseticidas com desligamento automático de bicos para economia de calda.',
    icone: Icons.water_drop,
  ),
];

final List<AgendamentoHistorico> historicoUsuario = [
  AgendamentoHistorico(
    id: 'ag_demo_1',
    servico: listaServicosInicial[0],
    contratanteNome: 'Produtor José Kowalski (Irineópolis - SC)',
    contratanteWhatsapp: '(47) 99988-7766',
    quantidade: 65.0,
    pesFumoReferencia: '40000',
    dataDesejada: DateTime.now().add(const Duration(days: 3)),
    valorTotal: 65.0 * 38.00,
    dataSolicitacao: DateTime.now().subtract(const Duration(hours: 4)),
    status: 'Pendente',
  ),
  AgendamentoHistorico(
    id: 'ag_demo_2',
    servico: listaServicosInicial[1],
    contratanteNome: 'Produtor Pedro Novak (Bela Vista do Toldo - SC)',
    contratanteWhatsapp: '(47) 99877-6655',
    quantidade: 12.0,
    pesFumoReferencia: '32000',
    dataDesejada: DateTime.now().add(const Duration(days: 1)),
    valorTotal: 12.0 * 30.00,
    dataSolicitacao: DateTime.now().subtract(const Duration(hours: 2)),
    status: 'Pendente',
  ),
];

String formatarDataSimples(DateTime dt) {
  final dia = dt.day.toString().padLeft(2, '0');
  final mes = dt.month.toString().padLeft(2, '0');
  final ano = dt.year;
  return '$dia/$mes/$ano';
}

void copiarWhatsapp(BuildContext context, String numero, String nomePessoa) {
  Clipboard.setData(ClipboardData(text: numero));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('WhatsApp de $nomePessoa ($numero) copiado!'),
      backgroundColor: Colors.green.shade700,
      duration: const Duration(seconds: 2),
    ),
  );
}

ButtonStyle estiloBotaoVerde(BuildContext context) {
  final corPrimaria = Theme.of(context).colorScheme.primary;
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(corPrimaria),
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

// ==========================================
// DIÁLOGO REUTILIZÁVEL PARA AVALIAR SERVIÇO
// ==========================================
Future<bool> abrirDialogoAvaliacao(
  BuildContext context,
  ServicoAgro servico,
) async {
  double notaSelecionada = 5.0;
  final comentarioController = TextEditingController();

  final avaliou = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (context, setDialogState) {
        return AlertDialog(
          title: const Text('Avaliar Serviço'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  servico.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  servico.prestador,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                const Text('Toque nas estrelas para dar sua nota:'),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final valorEstrela = index + 1.0;
                    final selecionada = valorEstrela <= notaSelecionada;
                    return IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        selecionada ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 36,
                      ),
                      onPressed: () {
                        setDialogState(() {
                          notaSelecionada = valorEstrela;
                        });
                      },
                    );
                  }),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nota: ${notaSelecionada.toStringAsFixed(1)} / 5.0',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: comentarioController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Comentário sobre o serviço (opcional)',
                    hintText: 'Ex: Equipe pontual e trabalho muito bem feito...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton.icon(
              style: estiloBotaoVerde(context),
              onPressed: () {
                servico.adicionarAvaliacao(
                  notaSelecionada,
                  comentario: comentarioController.text,
                );
                Navigator.of(ctx).pop(true);
              },
              icon: const Icon(Icons.star, size: 18),
              label: const Text('Enviar Avaliação'),
            ),
          ],
        );
      },
    ),
  );

  if (avaliou == true && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Avaliação enviada! Nova média: ${servico.avaliacao.toStringAsFixed(1)} ★ (${servico.totalAvaliacoes} avaliações)',
        ),
        backgroundColor: Colors.green.shade700,
      ),
    );
    return true;
  }
  return false;
}

// ==========================================
// TELA DE LOGIN E CRIAÇÃO DE CONTA
// ==========================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _loginFormKey = GlobalKey<FormState>();
  final _loginEmailController = TextEditingController();
  final _loginSenhaController = TextEditingController();

  final _cadastroFormKey = GlobalKey<FormState>();
  final _cadNomeController = TextEditingController();
  final _cadEmailController = TextEditingController();
  final _cadWhatsappController = TextEditingController();
  final _cadSenhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginSenhaController.dispose();
    _cadNomeController.dispose();
    _cadEmailController.dispose();
    _cadWhatsappController.dispose();
    _cadSenhaController.dispose();
    super.dispose();
  }

  void _fazerLogin() {
    if (!_loginFormKey.currentState!.validate()) return;

    final email = _loginEmailController.text.trim().toLowerCase();
    final senha = _loginSenhaController.text.trim();

    final index = usuariosCadastrados.indexWhere(
      (u) => u.email.toLowerCase() == email && u.senha == senha,
    );

    if (index == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail ou senha incorretos.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    usuarioLogado = usuariosCadastrados[index];
    Navigator.pop(context, true);
  }

  void _criarConta() {
    if (!_cadastroFormKey.currentState!.validate()) return;

    final email = _cadEmailController.text.trim().toLowerCase();
    final jaExiste =
        usuariosCadastrados.any((u) => u.email.toLowerCase() == email);

    if (jaExiste) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Este e-mail já está cadastrado.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final novoUsuario = UsuarioAgro(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      nome: _cadNomeController.text.trim(),
      email: email,
      whatsapp: _cadWhatsappController.text.trim(),
      senha: _cadSenhaController.text.trim(),
    );

    usuariosCadastrados.add(novoUsuario);
    usuarioLogado = novoUsuario;
    Navigator.pop(context, true);
  }

  void _preencherContaTeste(UsuarioAgro u) {
    setState(() {
      _loginEmailController.text = u.email;
      _loginSenhaController.text = u.senha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acesso do Prestador / Produtor'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.login), text: 'Entrar'),
            Tab(icon: Icon(Icons.person_add), text: 'Criar Conta'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Entre na sua conta para anunciar, editar serviços ou ver os agendamentos recebidos.',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _loginEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Informe o e-mail'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _loginSenhaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Informe a senha'
                        : null,
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: estiloBotaoVerde(context),
                      onPressed: _fazerLogin,
                      icon: const Icon(Icons.login),
                      label: const Text(
                        'Entrar na Conta',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Divider(height: 36),
                  Text(
                    'Prestadores cadastrados (${usuariosCadastrados.length}) - toque para preencher:',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  ...usuariosCadastrados.map(
                    (u) => Card(
                      child: ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text(u.nome),
                        subtitle: Text(
                            '${u.email} • WhatsApp: ${u.whatsapp} • Senha: ${u.senha}'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                        onTap: () => _preencherContaTeste(u),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _cadastroFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Crie seu cadastro com seu WhatsApp para publicar serviços ou contratar equipes.',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _cadNomeController,
                    decoration: const InputDecoration(
                      labelText: 'Seu Nome ou Empresa *',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Informe seu nome'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _cadWhatsappController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'WhatsApp (com DDD) *',
                      hintText: 'Ex: (47) 99999-8888',
                      prefixIcon: Icon(Icons.chat_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().length < 8)
                        ? 'Informe um WhatsApp válido'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _cadEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail *',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Informe o e-mail'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _cadSenhaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Crie uma Senha *',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().length < 3)
                        ? 'Mínimo 3 caracteres'
                        : null,
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: estiloBotaoVerde(context),
                      onPressed: _criarConta,
                      icon: const Icon(Icons.check),
                      label: const Text(
                        'Cadastrar e Entrar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TELA PRINCIPAL: DIRETÓRIO DE SERVIÇOS
// ==========================================
class DiretorioHomePage extends StatefulWidget {
  const DiretorioHomePage({super.key});

  @override
  State<DiretorioHomePage> createState() => _DiretorioHomePageState();
}

class _DiretorioHomePageState extends State<DiretorioHomePage> {
  final List<ServicoAgro> _servicos = List.from(listaServicosInicial);
  String _categoriaSelecionada = 'Todos';
  String _termoBusca = '';

  final List<String> _categorias = [
    'Todos',
    'Tabaco',
    'Pulverização',
    'Colheita',
    'Mapeamento',
    'Solo',
  ];

  List<ServicoAgro> get _servicosFiltrados {
    return _servicos.where((servico) {
      final matchCategoria = _categoriaSelecionada == 'Todos' ||
          servico.categoria == _categoriaSelecionada;
      final matchBusca = servico.titulo
              .toLowerCase()
              .contains(_termoBusca.toLowerCase()) ||
          servico.prestador
              .toLowerCase()
              .contains(_termoBusca.toLowerCase()) ||
          servico.cidade.toLowerCase().contains(_termoBusca.toLowerCase());
      return matchCategoria && matchBusca;
    }).toList();
  }

  int get _totalAgendamentosRecebidos {
    if (usuarioLogado == null) return 0;
    return historicoUsuario
        .where((ag) => ag.servico.criadorId == usuarioLogado!.id)
        .length;
  }

  Future<void> _abrirTelaLogin() async {
    final logou = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
    if (logou == true && mounted) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bem-vindo, ${usuarioLogado!.nome}!'),
          backgroundColor: Colors.green.shade700,
        ),
      );
    }
  }

  void _fazerLogout() {
    setState(() {
      usuarioLogado = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Você saiu da sua conta.')),
    );
  }

  Future<void> _abrirNovoServico() async {
    if (usuarioLogado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Faça login para anunciar um serviço.'),
        ),
      );
      await _abrirTelaLogin();
      if (usuarioLogado == null) return;
    }

    if (!mounted) return;

    final resultado = await Navigator.push<ServicoAgro>(
      context,
      MaterialPageRoute(
        builder: (_) => const CadastroServicoPage(),
      ),
    );

    if (resultado != null) {
      setState(() {
        _servicos.insert(0, resultado);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Serviço "${resultado.titulo}" publicado com sucesso!'),
            backgroundColor: Colors.green.shade700,
          ),
        );
      }
    }
  }

  void _abrirHistorico() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HistoricoAgendamentosPage(recemSolicitado: false),
      ),
    ).then((_) => setState(() {}));
  }

  Future<void> _abrirAgendaPrestador() async {
    if (usuarioLogado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Faça login para acessar o Painel do Prestador.'),
        ),
      );
      await _abrirTelaLogin();
      if (usuarioLogado == null) return;
    }

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AgendaPrestadorPage(meusServicos: _servicos),
      ),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.agriculture_rounded),
            SizedBox(width: 6),
            Text('AgroService',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Painel do Prestador',
            onPressed: _abrirAgendaPrestador,
            icon: Badge(
              isLabelVisible: _totalAgendamentosRecebidos > 0,
              backgroundColor: Colors.amber.shade700,
              label: Text('$_totalAgendamentosRecebidos'),
              child: const Icon(Icons.event_note),
            ),
          ),
          IconButton(
            tooltip: 'Minhas Solicitações',
            onPressed: _abrirHistorico,
            icon: Badge(
              isLabelVisible: historicoUsuario.isNotEmpty,
              label: Text('${historicoUsuario.length}'),
              child: const Icon(Icons.history),
            ),
          ),
          IconButton(
            tooltip: 'Anunciar Serviço',
            onPressed: _abrirNovoServico,
            icon: const Icon(Icons.add_circle_outline),
          ),
          if (usuarioLogado == null)
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              onPressed: _abrirTelaLogin,
              child: const Text('Login',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )
          else
            IconButton(
              tooltip: 'Sair (${usuarioLogado!.nome})',
              onPressed: _fazerLogout,
              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      body: Column(
        children: [
          if (usuarioLogado != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.green.shade800,
              child: Row(
                children: [
                  const Icon(Icons.verified_user,
                      color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${usuarioLogado!.nome} • ${usuarioLogado!.whatsapp}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: _abrirAgendaPrestador,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade600,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Painel ($_totalAgendamentosRecebidos)',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Planalto Norte SC & Sul PR • ${_servicos.length} serviços disponíveis',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 12),
                TextField(
                  onChanged: (valor) => setState(() => _termoBusca = valor),
                  decoration: InputDecoration(
                    hintText:
                        'Buscar serviço, prestador ou cidade (ex: Mafra, Cruz Machado)...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: _categorias.length,
              itemBuilder: (context, index) {
                final cat = _categorias[index];
                final isSelected = cat == _categoriaSelecionada;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (_) {
                      setState(() => _categoriaSelecionada = cat);
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: _servicosFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum prestador encontrado para este filtro.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _servicosFiltrados.length,
                    itemBuilder: (context, index) {
                      final servico = _servicosFiltrados[index];

                      return _ServicoCard(
                        servico: servico,
                        onAvaliarRapido: () async {
                          final atualizou =
                              await abrirDialogoAvaliacao(context, servico);
                          if (atualizou) setState(() {});
                        },
                        onRetorno: () => setState(() {}),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ServicoCard extends StatelessWidget {
  final ServicoAgro servico;
  final VoidCallback onAvaliarRapido;
  final VoidCallback onRetorno;

  const _ServicoCard({
    required this.servico,
    required this.onAvaliarRapido,
    required this.onRetorno,
  });

  @override
  Widget build(BuildContext context) {
    final textoMedia = servico.totalAvaliacoes > 0
        ? '${servico.avaliacao.toStringAsFixed(1)} (${servico.totalAvaliacoes})'
        : 'Novo';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalhesServicoPage(servico: servico),
            ),
          ).then((_) => onRetorno());
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.1),
                    child: Icon(
                      servico.icone,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          servico.titulo,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${servico.prestador} • ${servico.cidade}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.chat,
                                size: 13, color: Colors.green.shade700),
                            const SizedBox(width: 4),
                            Text(
                              servico.whatsappPrestador,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onAvaliarRapido,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber.shade300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            textoMedia,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Estrutura / Equipe:',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          servico.equipamento,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Tarifa base',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'R\$ ${servico.precoBase.toStringAsFixed(2)} ${servico.sufixoPreco}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// PAINEL DO PRESTADOR (EDITAR SERVIÇOS + VER AVALIAÇÕES E COMENTÁRIOS)
// ==========================================
class AgendaPrestadorPage extends StatefulWidget {
  final List<ServicoAgro> meusServicos;

  const AgendaPrestadorPage({super.key, required this.meusServicos});

  @override
  State<AgendaPrestadorPage> createState() => _AgendaPrestadorPageState();
}

class _AgendaPrestadorPageState extends State<AgendaPrestadorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<AgendamentoHistorico> get _agendamentosDosMeusServicos {
    if (usuarioLogado == null) return [];
    return historicoUsuario
        .where((ag) => ag.servico.criadorId == usuarioLogado!.id)
        .toList();
  }

  List<ServicoAgro> get _servicosDoUsuarioLogado {
    if (usuarioLogado == null) return [];
    return widget.meusServicos
        .where((s) => s.criadorId == usuarioLogado!.id)
        .toList();
  }

  Future<void> _editarMeuServico(ServicoAgro servico) async {
    final resultado = await Navigator.push<ServicoAgro>(
      context,
      MaterialPageRoute(
        builder: (_) => CadastroServicoPage(servicoParaEditar: servico),
      ),
    );

    if (resultado != null) {
      setState(() {
        final index =
            widget.meusServicos.indexWhere((s) => s.id == servico.id);
        if (index != -1) {
          widget.meusServicos[index] = resultado;
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Serviço "${resultado.titulo}" atualizado com sucesso!'),
            backgroundColor: Colors.green.shade700,
          ),
        );
      }
    }
  }

  void _alterarStatus(AgendamentoHistorico item, String novoStatus) {
    setState(() {
      item.status = novoStatus;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Decisão registrada: Agendamento $novoStatus.'),
        backgroundColor:
            novoStatus == 'Confirmado' ? Colors.green.shade700 : Colors.red,
      ),
    );
  }

  void _excluirAgendamentoRecebido(AgendamentoHistorico item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir Agendamento'),
        content: Text(
          'Tem certeza que deseja excluir permanentemente o agendamento de "${item.contratanteNome}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                historicoUsuario.removeWhere((e) => e.id == item.id);
              });
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Agendamento excluído com sucesso.'),
                ),
              );
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Color _corStatus(String status) {
    switch (status) {
      case 'Confirmado':
        return Colors.green.shade700;
      case 'Recusado':
        return Colors.red.shade700;
      default:
        return Colors.orange.shade800;
    }
  }

  IconData _iconeStatus(String status) {
    switch (status) {
      case 'Confirmado':
        return Icons.check_circle;
      case 'Recusado':
        return Icons.cancel;
      default:
        return Icons.hourglass_top;
    }
  }

  @override
  Widget build(BuildContext context) {
    final recebidos = _agendamentosDosMeusServicos;
    final cadastrados = _servicosDoUsuarioLogado;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel do Prestador'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(
              icon: const Icon(Icons.event_available),
              text: 'Agendamentos (${recebidos.length})',
            ),
            Tab(
              icon: const Icon(Icons.business_center),
              text: 'Meus Serviços (${cadastrados.length})',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ABA 1: AGENDAMENTOS RECEBIDOS
          recebidos.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.event_busy,
                            size: 60, color: Colors.grey[400]),
                        const SizedBox(height: 12),
                        const Text(
                          'Nenhum agendamento recebido ainda',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Quando produtores contratarem os serviços cadastrados por ${usuarioLogado?.nome ?? "você"}, eles aparecerão aqui.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: recebidos.length,
                  itemBuilder: (context, index) {
                    final item = recebidos[index];
                    final corAtual = _corStatus(item.status);
                    final jaDecidido = item.status != 'Pendente';

                    return Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: jaDecidido
                            ? BorderSide(color: corAtual, width: 1.5)
                            : BorderSide.none,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.servico.titulo,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: corAtual.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: corAtual),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(_iconeStatus(item.status),
                                          size: 14, color: corAtual),
                                      const SizedBox(width: 4),
                                      Text(
                                        item.status,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: corAtual,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 4),
                                IconButton(
                                  tooltip: 'Excluir agendamento',
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: Icon(Icons.delete_outline,
                                      color: Colors.red.shade700, size: 22),
                                  onPressed: () =>
                                      _excluirAgendamentoRecebido(item),
                                ),
                              ],
                            ),
                            if (jaDecidido) ...[
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: corAtual.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(_iconeStatus(item.status),
                                        size: 18, color: corAtual),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        item.status == 'Confirmado'
                                            ? 'Você CONFIRMOU este agendamento com o produtor.'
                                            : 'Você RECUSOU este agendamento.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: corAtual,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.person,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'Cliente: ${item.contratanteNome}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.chat,
                                    size: 16, color: Colors.green.shade700),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'WhatsApp: ${item.contratanteWhatsapp}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ),
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () => copiarWhatsapp(
                                    context,
                                    item.contratanteWhatsapp,
                                    item.contratanteNome,
                                  ),
                                  icon: const Icon(Icons.copy, size: 14),
                                  label: const Text('Copiar',
                                      style: TextStyle(fontSize: 12)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.calendar_month,
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                const SizedBox(width: 6),
                                Text(
                                  'Data agendada: ${formatarDataSimples(item.dataDesejada)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Divider(height: 20),
                            Text(
                              'Serviço solicitado: ${item.dimensionamentoFormatado}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Valor a receber:'),
                                Text(
                                  'R\$ ${item.valorTotal.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.red.shade700,
                                      backgroundColor: item.status == 'Recusado'
                                          ? Colors.red.shade50
                                          : null,
                                      side: BorderSide(
                                          color: Colors.red.shade400),
                                    ),
                                    onPressed: item.status == 'Recusado'
                                        ? null
                                        : () =>
                                            _alterarStatus(item, 'Recusado'),
                                    icon: const Icon(Icons.close, size: 18),
                                    label: Text(item.status == 'Recusado'
                                        ? 'Recusado'
                                        : 'Recusar'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    style: estiloBotaoVerde(context),
                                    onPressed: item.status == 'Confirmado'
                                        ? null
                                        : () =>
                                            _alterarStatus(item, 'Confirmado'),
                                    icon: const Icon(Icons.check, size: 18),
                                    label: Text(item.status == 'Confirmado'
                                        ? 'Confirmado'
                                        : 'Confirmar'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

          // ABA 2: MEUS SERVIÇOS (EDITAR + VER AVALIAÇÕES E COMENTÁRIOS)
          cadastrados.isEmpty
              ? const Center(
                  child: Text(
                    'Você ainda não cadastrou nenhum serviço.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cadastrados.length,
                  itemBuilder: (context, index) {
                    final s = cadastrados[index];
                    final qtdPedidos = recebidos
                        .where((ag) => ag.servico.id == s.id)
                        .length;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: 0.1),
                                  child: Icon(s.icone,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s.titulo,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '${s.cidade} • R\$ ${s.precoBase.toStringAsFixed(2)} ${s.sufixoPreco}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'WhatsApp: ${s.whatsappPrestador}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green.shade800,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                  ),
                                  onPressed: () => _editarMeuServico(s),
                                  icon: const Icon(Icons.edit, size: 16),
                                  label: const Text('Editar'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star,
                                          size: 16, color: Colors.amber),
                                      const SizedBox(width: 4),
                                      Text(
                                        s.totalAvaliacoes > 0
                                            ? 'Média: ${s.avaliacao.toStringAsFixed(1)} (${s.totalAvaliacoes})'
                                            : 'Sem avaliações',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Chip(
                                  label: Text(
                                    '$qtdPedidos pedido(s)',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  visualDensity: VisualDensity.compact,
                                  backgroundColor: qtdPedidos > 0
                                      ? Colors.green.shade100
                                      : Colors.grey.shade200,
                                ),
                              ],
                            ),
                            const Divider(height: 22),
                            Row(
                              children: [
                                const Icon(Icons.reviews_outlined,
                                    size: 18, color: Colors.black87),
                                const SizedBox(width: 6),
                                Text(
                                  'Avaliações e Comentários (${s.totalAvaliacoes})',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            if (s.avaliacoes.isEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Nenhum produtor avaliou este serviço ainda.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              )
                            else
                              ...s.avaliacoes.map(
                                (av) => Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade300),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              av.autor,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 15),
                                              const SizedBox(width: 3),
                                              Text(
                                                av.nota.toStringAsFixed(1),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                formatarDataSimples(av.data),
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (av.comentario.isNotEmpty) ...[
                                        const SizedBox(height: 5),
                                        Text(
                                          '"${av.comentario}"',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ] else ...[
                                        const SizedBox(height: 3),
                                        Text(
                                          '(Avaliação sem comentário escrito)',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class InfoTileItem extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String valor;
  final Widget? trailing;

  const InfoTileItem({
    super.key,
    required this.icone,
    required this.titulo,
    required this.valor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icone, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 10),
          Text('$titulo: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(valor)),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

// ==========================================
// TELA DE DETALHES, AVALIAÇÃO, DATA E CALCULADORA
// ==========================================
class DetalhesServicoPage extends StatefulWidget {
  final ServicoAgro servico;

  const DetalhesServicoPage({super.key, required this.servico});

  @override
  State<DetalhesServicoPage> createState() => _DetalhesServicoPageState();
}

class _DetalhesServicoPageState extends State<DetalhesServicoPage> {
  late final TextEditingController _quantidadeController;
  final TextEditingController _pesFumoController =
      TextEditingController(text: '35000');
  late final TextEditingController _whatsappClienteController;
  late double _quantidade;
  DateTime _dataDesejada = DateTime.now().add(const Duration(days: 2));

  TipoMedida get _tipo => widget.servico.tipoMedida;

  @override
  void initState() {
    super.initState();
    _whatsappClienteController = TextEditingController(
      text: usuarioLogado?.whatsapp ?? '',
    );
    switch (_tipo) {
      case TipoMedida.metroQuadradoEstufa:
        _quantidade = 60.0;
        _quantidadeController = TextEditingController(text: '60');
        break;
      case TipoMedida.hora:
        _quantidade = 8.0;
        _quantidadeController = TextEditingController(text: '8');
        break;
      case TipoMedida.hectare:
        _quantidade = 10.0;
        _quantidadeController = TextEditingController(text: '10');
        break;
    }
  }

  @override
  void dispose() {
    _quantidadeController.dispose();
    _pesFumoController.dispose();
    _whatsappClienteController.dispose();
    super.dispose();
  }

  void _atualizarCalculo(String valor) {
    final parsed = double.tryParse(valor.replaceAll(',', '.'));
    setState(() {
      _quantidade = (parsed != null && parsed > 0) ? parsed : 0;
    });
  }

  double get _valorTotal => _quantidade * widget.servico.precoBase;

  String get _tituloCalculadora {
    switch (_tipo) {
      case TipoMedida.metroQuadradoEstufa:
        return 'Simulador por Área da Estufa (m²)';
      case TipoMedida.hora:
        return 'Simulador por Horas Trabalhadas';
      case TipoMedida.hectare:
        return 'Simulador de Orçamento por Hectare';
    }
  }

  String get _labelCampoQuantidade {
    switch (_tipo) {
      case TipoMedida.metroQuadradoEstufa:
        return 'Área da estufa (em m²)';
      case TipoMedida.hora:
        return 'Quantidade de horas estimadas';
      case TipoMedida.hectare:
        return 'Tamanho da área (em Hectares)';
    }
  }

  String get _sufixoCampoQuantidade {
    switch (_tipo) {
      case TipoMedida.metroQuadradoEstufa:
        return 'm²';
      case TipoMedida.hora:
        return 'horas';
      case TipoMedida.hectare:
        return 'ha';
    }
  }

  Future<void> _selecionarData() async {
    final escolhida = await showDatePicker(
      context: context,
      initialDate: _dataDesejada,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (escolhida != null) {
      setState(() {
        _dataDesejada = escolhida;
      });
    }
  }

  Future<void> _avaliarEsteServico() async {
    final avaliou = await abrirDialogoAvaliacao(context, widget.servico);
    if (avaliou && mounted) {
      setState(() {});
    }
  }

  void _confirmarContratacao() {
    if (_quantidade <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe uma quantidade válida para calcular.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_whatsappClienteController.text.trim().length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Informe seu número de WhatsApp para o prestador retornar.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    historicoUsuario.insert(
      0,
      AgendamentoHistorico(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        servico: widget.servico,
        contratanteNome: usuarioLogado?.nome ?? 'Produtor Rural (Visitante)',
        contratanteWhatsapp: _whatsappClienteController.text.trim(),
        quantidade: _quantidade,
        pesFumoReferencia: _pesFumoController.text.trim(),
        dataDesejada: _dataDesejada,
        valorTotal: _valorTotal,
        dataSolicitacao: DateTime.now(),
        status: 'Pendente',
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HistoricoAgendamentosPage(recemSolicitado: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTabaco = widget.servico.categoria == 'Tabaco';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Serviço'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            onPressed: _avaliarEsteServico,
            icon: const Icon(Icons.star_outline, color: Colors.amberAccent),
            label: const Text('Avaliar'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.15),
                  child: Icon(
                    widget.servico.icone,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.servico.titulo,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.servico.prestador,
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade300),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 26),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.servico.totalAvaliacoes > 0
                              ? 'Média: ${widget.servico.avaliacao.toStringAsFixed(1)} de 5.0'
                              : 'Sem avaliações ainda',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          '${widget.servico.totalAvaliacoes} avaliação(ões) de produtores',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _avaliarEsteServico,
                    icon: const Icon(Icons.rate_review, size: 18),
                    label: const Text('Avaliar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            InfoTileItem(
              icone: Icons.chat,
              titulo: 'WhatsApp',
              valor: widget.servico.whatsappPrestador,
              trailing: TextButton.icon(
                onPressed: () => copiarWhatsapp(
                  context,
                  widget.servico.whatsappPrestador,
                  widget.servico.prestador,
                ),
                icon: const Icon(Icons.copy, size: 16),
                label: const Text('Copiar'),
              ),
            ),
            InfoTileItem(
              icone: Icons.location_on,
              titulo: 'Base / Região',
              valor: widget.servico.cidade,
            ),
            InfoTileItem(
              icone: Icons.precision_manufacturing,
              titulo: 'Estrutura / Equipe',
              valor: widget.servico.equipamento,
            ),
            if (widget.servico.infoComplementar != null &&
                widget.servico.infoComplementar!.isNotEmpty)
              InfoTileItem(
                icone: Icons.info_outline,
                titulo: 'Critério de Medição',
                valor: widget.servico.infoComplementar!,
              ),
            InfoTileItem(
              icone: Icons.attach_money,
              titulo: 'Tarifa Base',
              valor:
                  'R\$ ${widget.servico.precoBase.toStringAsFixed(2)} ${widget.servico.sufixoPreco}',
            ),
            const SizedBox(height: 16),
            const Text(
              'Sobre o Serviço',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              widget.servico.descricao,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
            if (widget.servico.avaliacoes.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                'Avaliações dos Produtores',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...widget.servico.avaliacoes.map(
                (av) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(av.autor,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  av.nota.toStringAsFixed(1),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (av.comentario.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(av.comentario,
                              style: const TextStyle(fontSize: 13)),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
            const Divider(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _tituloCalculadora,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _quantidadeController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: _atualizarCalculo,
                    decoration: InputDecoration(
                      labelText: _labelCampoQuantidade,
                      suffixText: _sufixoCampoQuantidade,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  if (isTabaco) ...[
                    const SizedBox(height: 12),
                    TextField(
                      controller: _pesFumoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText:
                            'Quantidade de pés de fumo na lavoura (referência)',
                        suffixText: 'pés',
                        prefixIcon: Icon(Icons.eco_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  TextField(
                    controller: _whatsappClienteController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Seu WhatsApp para contato *',
                      hintText: 'Ex: (47) 99999-8888',
                      prefixIcon: Icon(Icons.chat_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: _selecionarData,
                    borderRadius: BorderRadius.circular(8),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Data desejada para o serviço *',
                        prefixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatarDataSimples(_dataDesejada),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Alterar data',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Investimento Total Estimado:',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'R\$ ${_valorTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: estiloBotaoVerde(context),
                onPressed: _confirmarContratacao,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text(
                  'Solicitar Agendamento / Orçamento',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE HISTÓRICO DO PRODUTOR (COM BOTÃO AVALIAR)
// ==========================================
class HistoricoAgendamentosPage extends StatefulWidget {
  final bool recemSolicitado;

  const HistoricoAgendamentosPage({super.key, this.recemSolicitado = false});

  @override
  State<HistoricoAgendamentosPage> createState() =>
      _HistoricoAgendamentosPageState();
}

class _HistoricoAgendamentosPageState extends State<HistoricoAgendamentosPage> {
  String _formatarDataHora(DateTime dt) {
    final dia = dt.day.toString().padLeft(2, '0');
    final mes = dt.month.toString().padLeft(2, '0');
    final ano = dt.year;
    final hora = dt.hour.toString().padLeft(2, '0');
    final min = dt.minute.toString().padLeft(2, '0');
    return '$dia/$mes/$ano às $hora:$min';
  }

  void _voltarPaginaInicial() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _removerAgendamento(AgendamentoHistorico item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remover Agendamento'),
        content: Text(
            'Deseja realmente cancelar e remover "${item.servico.titulo}" do seu histórico?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                historicoUsuario.removeWhere((e) => e.id == item.id);
              });
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Agendamento removido do histórico.'),
                ),
              );
            },
            child: const Text('Remover', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _editarAgendamento(AgendamentoHistorico item) {
    final qtdController =
        TextEditingController(text: item.quantidade.toStringAsFixed(0));
    final pesController = TextEditingController(text: item.pesFumoReferencia);
    DateTime novaData = item.dataDesejada;
    final isTabaco = item.servico.categoria == 'Tabaco';

    String labelCampo;
    switch (item.servico.tipoMedida) {
      case TipoMedida.metroQuadradoEstufa:
        labelCampo = 'Área da estufa (m²)';
        break;
      case TipoMedida.hora:
        labelCampo = 'Quantidade de horas';
        break;
      case TipoMedida.hectare:
        labelCampo = 'Área (hectares)';
        break;
    }

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Editar Solicitação'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.servico.titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: qtdController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: labelCampo,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  if (isTabaco) ...[
                    const SizedBox(height: 12),
                    TextField(
                      controller: pesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Pés de fumo (referência)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () async {
                      final escolhida = await showDatePicker(
                        context: context,
                        initialDate: novaData,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (escolhida != null) {
                        setDialogState(() {
                          novaData = escolhida;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Data desejada',
                        prefixIcon: Icon(Icons.calendar_today, size: 18),
                        border: OutlineInputBorder(),
                      ),
                      child: Text(formatarDataSimples(novaData)),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                style: estiloBotaoVerde(context),
                onPressed: () {
                  final novaQtd = double.tryParse(
                      qtdController.text.replaceAll(',', '.'));
                  if (novaQtd == null || novaQtd <= 0) return;

                  setState(() {
                    item.quantidade = novaQtd;
                    item.pesFumoReferencia = pesController.text.trim();
                    item.dataDesejada = novaData;
                    item.valorTotal = novaQtd * item.servico.precoBase;
                  });

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(
                      content: Text('Agendamento atualizado com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Salvar Alterações'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Solicitações'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          if (widget.recemSolicitado)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              color: Colors.green.shade100,
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green.shade800),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Agendamento solicitado com sucesso! Você pode editar, avaliar ou remover abaixo.',
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: historicoUsuario.isEmpty
                ? const Center(
                    child: Text(
                      'Você ainda não possui agendamentos no histórico.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: historicoUsuario.length,
                    itemBuilder: (context, index) {
                      final item = historicoUsuario[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.servico.titulo,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${item.servico.prestador} • ${item.servico.cidade}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    tooltip: 'Editar agendamento',
                                    icon: const Icon(Icons.edit, size: 20),
                                    color: Colors.blue.shade700,
                                    onPressed: () => _editarAgendamento(item),
                                  ),
                                  IconButton(
                                    tooltip: 'Remover agendamento',
                                    icon: const Icon(Icons.delete_outline,
                                        size: 20),
                                    color: Colors.red.shade700,
                                    onPressed: () => _removerAgendamento(item),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.chat,
                                      size: 15, color: Colors.green.shade700),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'WhatsApp Prestador: ${item.servico.whatsappPrestador}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green.shade800,
                                      ),
                                    ),
                                  ),
                                  TextButton.icon(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () => copiarWhatsapp(
                                      context,
                                      item.servico.whatsappPrestador,
                                      item.servico.prestador,
                                    ),
                                    icon: const Icon(Icons.copy, size: 14),
                                    label: const Text('Copiar',
                                        style: TextStyle(fontSize: 12)),
                                  ),
                                ],
                              ),
                              const Divider(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.event_available,
                                          size: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Data: ${formatarDataSimples(item.dataDesejada)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Chip(
                                    label: Text(
                                      item.status,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Dimensionamento: ${item.dimensionamentoFormatado}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Solicitado em: ${_formatarDataHora(item.dataSolicitacao)}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total: R\$ ${item.valorTotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.amber.shade900,
                                      side: BorderSide(
                                          color: Colors.amber.shade700),
                                    ),
                                    onPressed: () async {
                                      final avaliou =
                                          await abrirDialogoAvaliacao(
                                              context, item.servico);
                                      if (avaliou) {
                                        setState(() {
                                          item.jaAvaliado = true;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.star,
                                        color: Colors.amber, size: 18),
                                    label: Text(
                                      item.jaAvaliado
                                          ? 'Avaliar Novamente'
                                          : 'Avaliar Serviço',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: estiloBotaoVerde(context),
                onPressed: _voltarPaginaInicial,
                icon: const Icon(Icons.home),
                label: const Text(
                  'Voltar para a Página Inicial',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TELA DE CADASTRO E EDIÇÃO DE SERVIÇOS
// ==========================================
class CadastroServicoPage extends StatefulWidget {
  final ServicoAgro? servicoParaEditar;

  const CadastroServicoPage({super.key, this.servicoParaEditar});

  @override
  State<CadastroServicoPage> createState() => _CadastroServicoPageState();
}

class _CadastroServicoPageState extends State<CadastroServicoPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _tituloController;
  late final TextEditingController _prestadorController;
  late final TextEditingController _whatsappController;
  late final TextEditingController _precoController;
  late final TextEditingController _equipamentoController;
  late final TextEditingController _infoComplementarController;
  late final TextEditingController _descricaoController;

  late String _categoriaSelecionada;
  late String _cidadeSelecionada;
  late TipoMedida _tipoMedidaSelecionado;

  bool get _isEdicao => widget.servicoParaEditar != null;

  final List<String> _categoriasCadastro = [
    'Tabaco',
    'Pulverização',
    'Colheita',
    'Mapeamento',
    'Solo',
  ];

  @override
  void initState() {
    super.initState();
    final s = widget.servicoParaEditar;
    _tituloController = TextEditingController(text: s?.titulo ?? '');
    _prestadorController = TextEditingController(
      text: s?.prestador ?? (usuarioLogado?.nome ?? ''),
    );
    _whatsappController = TextEditingController(
      text: s?.whatsappPrestador ?? (usuarioLogado?.whatsapp ?? ''),
    );
    _precoController = TextEditingController(
        text: s != null ? s.precoBase.toStringAsFixed(2) : '');
    _equipamentoController = TextEditingController(text: s?.equipamento ?? '');
    _infoComplementarController =
        TextEditingController(text: s?.infoComplementar ?? '');
    _descricaoController = TextEditingController(text: s?.descricao ?? '');

    _categoriaSelecionada = s?.categoria ?? 'Tabaco';
    _cidadeSelecionada = (s != null && cidadesDisponiveis.contains(s.cidade))
        ? s.cidade
        : 'Irineópolis - SC';
    _tipoMedidaSelecionado =
        s?.tipoMedida ?? TipoMedida.metroQuadradoEstufa;
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _prestadorController.dispose();
    _whatsappController.dispose();
    _precoController.dispose();
    _equipamentoController.dispose();
    _infoComplementarController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarServico() {
    if (!_formKey.currentState!.validate()) return;

    final preco = double.parse(_precoController.text.replaceAll(',', '.'));

    IconData iconeCategoria;
    switch (_categoriaSelecionada) {
      case 'Tabaco':
        iconeCategoria = Icons.groups;
        break;
      case 'Pulverização':
        iconeCategoria = Icons.airplanemode_active;
        break;
      case 'Colheita':
        iconeCategoria = Icons.agriculture;
        break;
      case 'Mapeamento':
        iconeCategoria = Icons.map;
        break;
      default:
        iconeCategoria = Icons.grass;
    }

    final servicoSalvo = ServicoAgro(
      id: widget.servicoParaEditar?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      criadorId: widget.servicoParaEditar?.criadorId ?? usuarioLogado!.id,
      titulo: _tituloController.text.trim(),
      prestador: _prestadorController.text.trim(),
      whatsappPrestador: _whatsappController.text.trim(),
      categoria: _categoriaSelecionada,
      tipoMedida: _tipoMedidaSelecionado,
      precoBase: preco,
      infoComplementar: _infoComplementarController.text.trim().isNotEmpty
          ? _infoComplementarController.text.trim()
          : null,
      avaliacoes: widget.servicoParaEditar?.avaliacoes,
      cidade: _cidadeSelecionada,
      equipamento: _equipamentoController.text.trim(),
      descricao: _descricaoController.text.trim(),
      icone: iconeCategoria,
    );

    Navigator.pop(context, servicoSalvo);
  }

  String get _labelPrecoCadastro {
    switch (_tipoMedidaSelecionado) {
      case TipoMedida.metroQuadradoEstufa:
        return 'Valor cobrado por m² de estufa (R\$) *';
      case TipoMedida.hora:
        return 'Valor cobrado por Hora (R\$) *';
      case TipoMedida.hectare:
        return 'Valor cobrado por Hectare (R\$) *';
    }
  }

  String get _hintPrecoCadastro {
    switch (_tipoMedidaSelecionado) {
      case TipoMedida.metroQuadradoEstufa:
        return 'Ex: 38.00';
      case TipoMedida.hora:
        return 'Ex: 30.00';
      case TipoMedida.hectare:
        return 'Ex: 150.00';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdicao ? 'Editar Serviço' : 'Anunciar Meu Serviço'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isEdicao
                    ? 'Atualize as informações do seu serviço cadastrado'
                    : 'Cadastre sua equipe ou maquinário para produtores da região',
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: 'Título do Serviço *',
                  hintText: 'Ex: Colheita de Tabaco ou Desbrote e Carpida',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Informe o título' : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _prestadorController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Responsável / Empresa *',
                  hintText: 'Ex: João Silva Serviços Rurais',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Informe o nome do prestador'
                    : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _whatsappController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'WhatsApp de Contato (com DDD) *',
                  hintText: 'Ex: (47) 99999-8888',
                  prefixIcon: Icon(Icons.chat_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().length < 8)
                    ? 'Informe um número de WhatsApp válido'
                    : null,
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                initialValue: _categoriaSelecionada,
                decoration: const InputDecoration(
                  labelText: 'Categoria do Serviço',
                  border: OutlineInputBorder(),
                ),
                items: _categoriasCadastro
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _categoriaSelecionada = val;
                      if (!_isEdicao) {
                        if (val == 'Tabaco') {
                          _tipoMedidaSelecionado =
                              TipoMedida.metroQuadradoEstufa;
                        } else {
                          _tipoMedidaSelecionado = TipoMedida.hectare;
                        }
                      }
                    });
                  }
                },
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                initialValue: _cidadeSelecionada,
                decoration: const InputDecoration(
                  labelText: 'Cidade Base (Planalto Norte SC / Sul PR)',
                  border: OutlineInputBorder(),
                ),
                items: cidadesDisponiveis
                    .map((cid) => DropdownMenuItem(value: cid, child: Text(cid)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _cidadeSelecionada = val);
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Forma de Cobrança:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RadioListTile<TipoMedida>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Por m² de Estufa (Colheita de Tabaco)'),
                value: TipoMedida.metroQuadradoEstufa,
                groupValue: _tipoMedidaSelecionado,
                onChanged: (val) =>
                    setState(() => _tipoMedidaSelecionado = val!),
              ),
              RadioListTile<TipoMedida>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Por Hora Trabalhada (Desbrote / Carpida)'),
                value: TipoMedida.hora,
                groupValue: _tipoMedidaSelecionado,
                onChanged: (val) =>
                    setState(() => _tipoMedidaSelecionado = val!),
              ),
              RadioListTile<TipoMedida>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Por Hectare (Grãos / Drones / Solo)'),
                value: TipoMedida.hectare,
                groupValue: _tipoMedidaSelecionado,
                onChanged: (val) =>
                    setState(() => _tipoMedidaSelecionado = val!),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _precoController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: _labelPrecoCadastro,
                  hintText: _hintPrecoCadastro,
                  prefixText: 'R\$ ',
                  border: const OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Informe o valor';
                  final parsed = double.tryParse(v.replaceAll(',', '.'));
                  if (parsed == null || parsed <= 0) return 'Valor inválido';
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _infoComplementarController,
                decoration: const InputDecoration(
                  labelText: 'Observação sobre a medição (opcional)',
                  hintText: 'Ex: Medição interna da estufa ou mínimo de 4h',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _equipamentoController,
                decoration: const InputDecoration(
                  labelText: 'Tamanho da Equipe ou Maquinário *',
                  hintText: 'Ex: Equipe com 8 pessoas + carreta',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Informe a equipe ou equipamento'
                    : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição detalhada do serviço *',
                  hintText: 'Explique como o trabalho é realizado...',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Informe a descrição'
                    : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  style: estiloBotaoVerde(context),
                  onPressed: _salvarServico,
                  icon: Icon(_isEdicao ? Icons.save : Icons.publish),
                  label: Text(
                    _isEdicao
                        ? 'Salvar Alterações do Serviço'
                        : 'Publicar Serviço no Diretório',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}