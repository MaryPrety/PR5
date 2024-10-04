import 'package:flutter/material.dart';
import '../components/manga_card.dart';
import '../models/manga_item.dart';
import 'manga_details_screen.dart';
import 'upload_new_volume_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MangaItem> productItems = [
     MangaItem(
      imagePath: 'https://sun1-25.userapi.com/impg/DOnyhuU_QBsca35XAr-n_gPNnN-mxrMXwU862w/s7mcCbHbKa4.jpg?size=632x1000&quality=95&sign=e6e3545030659d40332278d2e9cd74a2&type=album',
      title: 'Том 1',
      description: 'Знакомство с Кагэямой Сигэо, известным как Моб, восьмиклассником с мощными физическими способностями. Моб пытается вести обычную жизнь, контролируя свои силы, чтобы избежать разрушений.',
      price: '800 рублей',
      additionalImages: [
        'https://sun9-47.userapi.com/impg/RpU4AOhMZT5Uzao0bp7hhSnyWlTGKFhOVrfGMQ/cJp-NdI4fR0.jpg?size=474x474&quality=95&sign=c579b6fbcbc85bc490f42e77060f00fb&type=album',
        'https://sun9-73.userapi.com/impg/fsrpdwlR4_LabF2Kcu-DS2GS2P6rRBYSNnoHAQ/7tfElgUCcjU.jpg?size=482x482&quality=95&sign=2716b278a8a35a0c20702737a6319804&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Знакомство с Кагэямой Сигэо.', 
      chapters: '№ глав: 1-36  + дополнительные истории', 
    ),
    MangaItem(
      imagePath: 'https://sun9-6.userapi.com/impg/jGCyD_LXNv3XGmXBm9OZChWgCKMfQPheoecQkw/yLz9kAkHiYs.jpg?size=631x1000&quality=95&sign=ede487677f8746d80169607c27834d64&type=album',
      title: 'Том 2',
      description: 'Моб сталкивается с новыми врагами и осознает, что его способности могут быть как благословением, так и проклятием. Он понимает глубину своих эмоций и их влияние на окружающих.',
      price: '810 рублей',
      additionalImages: [
        'https://sun9-1.userapi.com/impg/xUaEl94-HFx2z5nQ4M9t5fI6wED-DMkChoBUAQ/t_2BQ5vgHKA.jpg?size=340x340&quality=95&sign=c713653f38826a2c0c7f42ac39c56f70&type=album',
        'https://sun9-12.userapi.com/impg/sX_ivT8L1CuJ4JqbJy5BPxIyD-VPrnHhdtc8_A/4EBVCuJTgQI.jpg?size=200x200&quality=95&sign=d200c7d06311d71ac2780c07b13c7b6d&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Моб сталкивается с новыми врагами.', 
      chapters: '№ глав: 37-74', 
    ),
    MangaItem(
      imagePath: 'https://sun9-6.userapi.com/impg/nj1Sb_rbkzM5ePbUho1RU84F62NrV6Ir68TFuQ/5zPEr7rbmeQ.jpg?size=991x1570&quality=95&sign=7ec565442cf6da18e8c129ce1b37b5ea&type=album',
      title: 'Том 3',
      description: 'Моб исследует свои основные конфликты и учится использовать свои способности во благо. Он встречает новых друзей и врагов, которые помогают ему разобраться в своих чувствах.',
      price: '700 рублей',
      additionalImages: [
        'https://sun9-47.userapi.com/impg/fCcmPqq7BQEyOiB7QCXChperGYPsSdQBDoNOrw/1CVGWBCnq4E.jpg?size=306x306&quality=95&sign=2d43f0b460187dc2f2bb29fd11d1265a&type=album',
        'https://sun9-69.userapi.com/impg/ZeU8a05H4_OJ7U58xqNnujIWma-Zm6iX8_FhqQ/hXwD1UAef34.jpg?size=521x521&quality=95&sign=b74b2fc9e60ba43bb3694d4663355590&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Моб исследует свои конфликты.', 
      chapters: '№ глав: 75-112', 
    ),
    MangaItem(
      imagePath: 'https://sun9-6.userapi.com/impg/1GHcUse4OHcS5uBy3BoKKhYH-N_bK5nlh-ahqw/DgHKAZOhyyI.jpg?size=900x1425&quality=95&sign=1d22095c1c5859698b257f7766ea1ea1&type=album',
      title: 'Том 4',
      description: 'Моб сталкивается с основными испытаниями и должен сделать выбор между использованием своих сил для борьбы со злом или стремлением к нормальной жизни. Этот том полон экшена и размышлений.',
      price: '750 рублей',
      additionalImages: [
        'https://sun9-71.userapi.com/impg/Ai8LQBEn_T0JN3hZzxM8-nrTGQwD4dKhQ_qVSQ/odTt2GS35Gs.jpg?size=298x298&quality=95&sign=cd36c971dea78517687a413c07a16cab&type=album',
        'https://sun9-46.userapi.com/impg/LqqGrTDzxWMIbgLdg6EmJf4-Qug7gPl9D1kr4g/KNmsUvbqDrk.jpg?size=410x410&quality=95&sign=1f9dd38c00a571702b6671db0ea337ff&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Моб сталкивается с испытаниями.', 
      chapters: '№ глав: 113-150', 
    ),
    MangaItem(
      imagePath: 'https://sun9-30.userapi.com/impg/5oeojf1tQ8O5aIMVX-ZwF66yARP-ZDQ-avRBnQ/eFuxO3a1PZ4.jpg?size=1293x2048&quality=95&sign=b5232c80fa206a171aa524164dc56736&type=album',
      title: 'Том 5',
      description: 'Моб начинает понимать уровень дружбы и поддержки со стороны окружающих. Он сталкивается с новыми вызовами и учится принимать помощь от других.',
      price: '800 рублей',
      additionalImages: [
        'https://sun9-3.userapi.com/impg/MBWpW07C7-jCSIVVYKJyA-nbxVHBnGbeR5y9aQ/l4fXNdHlG-U.jpg?size=562x562&quality=95&sign=b45f0b7b716dbfa2a5c7804efde705ad&type=album',
        'https://sun9-47.userapi.com/impg/dafsSKJAzSm1JtAxAielojo4RhmOyXZ3M-_xvg/S5Sq4wKCx8o.jpg?size=272x272&quality=95&sign=5d762e0a14a540b02c1b1090c6d4cca4&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Моб понимает уровень дружбы.', 
      chapters: '№ глав: 151-188', 
    ),
    MangaItem(
      imagePath: 'https://sun9-11.userapi.com/impg/erhljDwzT0DeHDTiBkvDBYWaQUSF9AeBto66Ug/B6YG9w9dbyQ.jpg?size=636x1007&quality=95&sign=b8742cb4aa1d726786916e73c7b79f24&type=album',
      title: 'Том 6',
      description: 'Том углубляется в прошлое персонажей, раскрывая их мотивацию. Моб сталкивается с трудными выборами, которые ставят под сомнение его моральные принципы.',
      price: '710 рублей',
      additionalImages: [
        'https://sun9-79.userapi.com/impg/0LrgHmsDOtzYMHZC82uc2UpMQMM0iBmZc_fv0w/b559kbXuPZw.jpg?size=212x212&quality=95&sign=32464caa56286c5244da9a9aab0a1fb3&type=album',
        'https://sun9-25.userapi.com/impg/JRI-E3eGR9qqxoKrK3vd8l2KkpBUoNETbsr0uQ/d-yo1Lw0CHE.jpg?size=310x310&quality=95&sign=f1a1c0d8de1037a2fcd3067a15c742c7&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Углубление в прошлое персонажей.', 
      chapters: '№ глав: 189-226', 
    ),
    MangaItem(
      imagePath: 'https://sun9-42.userapi.com/impg/UvK5cYFhMQXUrv_6r0cpJMGuO5aA98rQG0IhNA/UCb0ITlAAbs.jpg?size=885x1401&quality=95&sign=208536eb8d86d4f3fb8592d24cbec313&type=album',
      title: 'Том 7',
      description: 'История достигает кульминации, когда все персонажи едут к финишной границе. Моб должен использовать все свои силы, чтобы защитить друзей от угрозы.',
      price: '800 рублей',
      additionalImages: [
        'https://sun9-49.userapi.com/impg/AL2NurbVFJ-mEfivNhbz_n4gLlsDdZSreWXpZQ/m4_F6C_tSEk.jpg?size=603x603&quality=95&sign=c50e9ac9fd9abb000e10b91c4e2236e8&type=album',
        'https://sun9-76.userapi.com/impg/UJGt4T_WEEwDJcyGHBlzw1JNbeKnfFIb0aj-Tw/plIs6iGepzU.jpg?size=181x181&quality=95&sign=e14056c77fd7b8cb8202d2f29ab1d91a&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Кульминация истории.', 
      chapters: '№ глав: 227-264', 
    ),
    MangaItem(
      imagePath: 'https://sun9-75.userapi.com/impg/c1IxwwIND2oFCtlj74P5rB4zDwaz6HwMueSLGQ/Q1kUiRZeP0A.jpg?size=240x380&quality=95&sign=d60d2bc3d4b5a3d3149cb52ffbbf51d0&type=album',
      title: 'Том 8',
      description: 'Заключительный том подводит итоги истории о Мобе. Он должен решить, использовать свои способности или стремиться к обычной жизни. Читатели увидят завершение всех сюжетных линий.',
      price: '710 рублей',
      additionalImages: [
        'https://sun9-25.userapi.com/impg/hSNAsTJY2JOsE06vJHa-TzH-sXMEqcIvaOZtRg/cWv8vxAmo_0.jpg?size=497x497&quality=95&sign=636d3465ca570413a724fd21d37f494c&type=album',
        'https://sun1-47.userapi.com/impg/3301aEXncil0nHmc2az4rgFReEwHdfgyRJtP2A/AHYlbHJtOMg.jpg?size=650x650&quality=95&sign=51fb21ced48d8b0164bb39a07a0c9658&type=album',
      ],
      format: 'Твердый переплет Формат издания 19.6 x 12.5 см кол-во стр от 380 до 400 ',
      publisher: 'Терлецки комикс',
      shortDescription: 'Заключительный том.', 
      chapters: '№ глав: 265-300', 
    ),
  ];

  bool _isHovered = false; 

  void _navigateToAddProductScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadNewVolumePage()),
    );

    if (result != null) {
      setState(() {
        productItems.add(result);
      });
    }
  }

  void _removeProduct(int index) {
    setState(() {
      productItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: backgroundColor, 
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildHeader(context, isMobile),
            const SizedBox(height: 20),
            Expanded(
              child: _buildMangaList(context, isMobile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MANgo100',
            style: TextStyle(
              fontSize: isMobile ? 30.0 : 40.0,
              color: secondaryColor,
              fontFamily: 'Tektur',
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => _navigateToAddProductScreen(context),
            child: Container(
              width: isMobile ? 24.0 : 40.0,
              height: isMobile ? 24.0 : 40.0,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.add,
                color: secondaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMangaList(BuildContext context, bool isMobile) {
    return ListView.builder(
      itemCount: productItems.length,
      itemBuilder: (context, index) {
        final productItem = productItems[index];
        return isMobile
            ? _buildMobileCard(context, productItem, index)
            : _buildDesktopCard(context, productItem, index);
      },
    );
  }

  Widget _buildMobileCard(BuildContext context, MangaItem productItem, int index) {
    return Stack(
      children: [
        MangaCard(
          imagePath: productItem.imagePath,
          title: productItem.title,
          description: productItem.shortDescription,
          price: productItem.price,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MangaDetailsScreen(
                  title: productItem.title,
                  price: productItem.price,
                  index: index,
                  additionalImages: productItem.additionalImages,
                  description: productItem.description,
                  format: productItem.format,
                  publisher: productItem.publisher,
                  imagePath: productItem.imagePath,
                  chapters: productItem.chapters,
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 25, 
          right: 15,
          child: GestureDetector(
            onTap: () {
              _removeProduct(index);
            },
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: primaryColor, 
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15), 
              ),
              child: Icon(
                Icons.close,
                color: secondaryColor, 
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopCard(BuildContext context, MangaItem productItem, int index) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Stack(
        children: [
          MangaCard(
            imagePath: productItem.imagePath,
            title: productItem.title,
            description: productItem.shortDescription,
            price: productItem.price,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MangaDetailsScreen(
                    title: productItem.title,
                    price: productItem.price,
                    index: index,
                    additionalImages: productItem.additionalImages,
                    description: productItem.description,
                    format: productItem.format,
                    publisher: productItem.publisher,
                    imagePath: productItem.imagePath,
                    chapters: productItem.chapters,
                  ),
                ),
              );
            },
          ),
          if (_isHovered)
            Positioned(
              top: 25, // Опустим кнопку чуть ниже
              right: 15,
              child: GestureDetector(
                onTap: () {
                  _removeProduct(index);
                },
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: primaryColor, 
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.close,
                    color: secondaryColor, 
                    size: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
