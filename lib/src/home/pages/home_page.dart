part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Background.parallax(
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: Env.controller.node,
          onKey: Env.controller.onKey,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: NavigationHeader(),
            drawer: NavigationDrawer.of(context),
            body: InteractiveScrollViewer(
              scrollToId: Env.controller.instance,
              scrollDirection: Axis.vertical,
              children: [
                ...Env.navigations.to(HomePage.scrollContent),
                ScrollContent(
                  id: 'footer',
                  child: const NavigationFooter(),
                )
              ],
            ),
            floatingActionButton: HomePage.floatingButton(),
          ),
        ),
      ),
    );
  }

  static Widget floatingButton() {
    return ValueListenableBuilder(
      valueListenable: Env.controller,
      builder: (_, value, child) {
        return TweenAnimationBuilder(
          tween: Tween(end: value == Env.navigations.last.id ? 0.0 : 1.0),
          duration: Constants.duration,
          builder: (_, value, child) {
            return Transform.translate(
              offset: Offset(0.0, value * kToolbarHeight * 2.0),
              child: child,
            );
          },
          child: child,
        );
      },
      child: Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              /*
              DButton(
                onTap: () => launchUrl(Uri.parse('https://github.com'
                    '/Nialixus'
                    '/flutter_landing_page')),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View the source code in',
                        style: context.text.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const DImage(
                        source: 'https://assets.stickpng.com'
                            '/images'
                            '/629b7adc7c5cd817694c3231.png',
                        size: Size(80.0, 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              */
              const Spacer(),
              FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () => Env.controller.onTap(
                  context,
                  id: Env.navigations.first.id,
                ),
                child: Seo.link(
                  anchor: 'Go back to top',
                  href: '/?section=${Env.navigations.first.id}',
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    semanticLabel: 'Go back to top',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static ScrollContent scrollContent(
    int index,
    NavigationModel item,
  ) {
    return ScrollContent(
        id: item.id,
        child: [
          // HomeStarter Section: Introduction
          HomeStarter(
            id: item.id,
            title: "A Chapa da Autonomia Vote 02  Vote 101 Vote 52",
            subtitle:
                "Décadas de luta forjaram o CRT-07 (PA/AP). Pela autonomia, vote com propósito: 02, 101, 52.",
          ),

          // HomeFeatures Section: Key Features
          HomeFeatures(
            id: item.id,
            title: 'Os Candidatos',
            subtitle:
                'Conheça os candidatos à Diretoria Executiva do CFT, ao Conselho Federal pelo Pará e à Diretoria Executiva do CRT-07.',
            cards: const [
              CardModel(
                source: 'assets/image/vicente_carneiro.png', // ← Foto do Abelardo
                title: 'Presidente do CFT Chapa 02: Vicente Carneiro',
                subtitle: 'Técnico, Engenheiro, CEO do Grupo EGF e Secretário de Políticas Energéticas, com sólida experiência offshore e vivência prática na profissão. Propõe um novo CFT com Caixa de Assistência e Proteção ao Técnico e defesa intransigente das atribuições da categoria.',
              ),
              CardModel(
                source: 'assets/image/abelardo_lopes_de_sousa.png', // ← Foto do Abelardo
                title: 'Conselheiro Federal Chapa 101: Abelardo Lopes De Sousa',
                subtitle: 'Arquiteto do desmembramento da Região Norte e criação do CRT-07. Defende a valorização dos técnicos industriais e a autonomia do conselho para melhor atender a categoria.',
              ),
              CardModel(
                source: 'assets/image/jose_ignacio.png', // ← Foto do Abelardo
                title: 'Conselheiro Federal Suplente Chapa 101: José Ignacio  ',
                subtitle: 'Técnico em Telecomunicações com mais de 40 anos de experiência em TELEX, Comunicação de Dados e Backbone. Especialista em infraestrutura crítica, defende a confiabilidade e à continuidade dos serviços como base da conectividade nacional.',
              ),
              CardModel(
                source: 'assets/image/ana-paula-fonseca.png',
                title: "Presidente do CRT 07 Chapa 52: Ana Paula Fonseca",
                subtitle: 'Técnica em Telecomunicações pelo IFPA com mais de 25 anos de experiência nos setores público e privado. Como agente de fiscalização concursada, defende uma fiscalização orientadora em vez de punitiva.',
              ),
              CardModel(
                source: 'assets/image/jefferson_costa.png', // ← Foto do Jefferson
                title: 'Vice-Presidente do CRT 07 Chapa 52: Jefferson Costa',
                subtitle: 'Técnico em Eletrônica e especialista em energia solar. Com experiência na Embratel e ETEMB, defende a qualificação e o registro profissional para valorização e segurança da categoria.',
              ),
              CardModel(
                source: 'assets/image/francisco_silva_santos.png', // ← Foto do Francisco
                title: 'Diretor Administrativo do CRT 07 Chapa 52: Francisco Silva Santos',
                subtitle: 'Técnico em Edificações (IFPA/1975), participou de obras como Mangueirão e Marco Zero. Atua na defesa do reconhecimento dos técnicos industriais no Norte.',
              ),
              CardModel(
                source: 'assets/image/arivaldo_lieuthier.png', // ← Foto do Arivaldo
                title: 'Diretor Financeiro do CRT 07 Chapa 52: Arivaldo Lieuthier',
                subtitle: 'Técnico em Telecomunicações desde 1978. Paraense, articulou a separação da Região Norte e lutou contra a privatização da Telebrás, defendendo o fortalecimento da categoria há décadas.',
              ),
              CardModel(
                source: 'assets/image/jose_maria_melo.png', // ← Foto do José Maria
                title: 'Diretor de Fiscalização e normas do CRT 07 Chapa 52 : José Maria Melo',
                subtitle: 'Técnico com 34 anos de experiência em eletrônica e telecomunicações (Amazônia/Chile). Agente do CRT-02, foca em fiscalização orientadora e valorização da categoria.',
              ),
            ],
          ),

          // HomePricing Section: Pricing Plans
          HomePricing(
            id: item.id,
            title: 'Queremos te escutar',
            subtitle:
                'Sua proposta virou nosso compromisso, aponte o rumo e desenhe a solução.',
            plans: const [
              // HomePricingModel items representing pricing plans
              HomePricingModel(
                title: 'Digite sua proposta',
                price: 0,
                benefits:
                    "Contamos com a sua voz. Ela é o PRUMO da nossa gestão..\nVocê é o motor da nossa candidatura.\nJuntos, vamos escrever o próximo capítulo da nossa categoria..",
                type: HomePricingType.forever,
              ),
              HomePricingModel(
                title: 'Visite nosso instagram',
                price: 15,
                benefits:
                    "Conheça nossa equipe.\nVeja nossa história.\nSinta a nossa paixão pela categoria.",
                type: HomePricingType.month,
              ),
            ],
          ),

          // HomeFAQ Section: Frequently Asked Questions
          HomeFAQ(
            id: item.id,
            title: ' PROPOSTAS QUE JÁ ESTÃO NO PLANO. FEITAS POR QUEM VIVE A PROFISSÃO.',
            subtitle: 'Juntos, vamos escrever o próximo capítulo da nossa categoria.',
            cards: const [
              // CardModel items representing frequently asked questions
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: "Proposta 1: Redução de Taxas e Impostos",
                subtitle:
                    'Parceria com governo federal/estado/municípios para diminuir taxas ou impostos de empresas registradas no Conselho.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Proposta 2: Valorização Profissional',
                subtitle:
                    'Plataforma digital oficial do CRT para profissionais registrados, aonde esses poderão criar perfis e oferecer serviços, conectando diretamente o cliente e o técnico e combatendo profissionais irregulares/sem registro e assim valorizando o profissional regular.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Proposta 3: Agilidade e Rapidez.',
                subtitle:
                    'Mais agilidade e rapidez nas emissões dos TRTs.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: 'Proposta 4: Convênios e Benefícios',
                subtitle:
                    'Benefícios para os técnicos como: convênio, assistência médicas para fazer jus a anuidade..',
              ),   
            ],
          ),
        ][index]);
  }
}
