import 'package:flutter/material.dart';
import '../components/manga_card.dart';
import '../models/manga_item.dart';
import 'manga_details_screen.dart';
import 'upload_new_volume_page.dart';

class MangaSelectedPage extends StatefulWidget {
  @override
  _MangaSelectedPageState createState() => _MangaSelectedPageState();
}

class _MangaSelectedPageState extends State<MangaSelectedPage> {
  List<MangaItem> mangaItems = [
   
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
  ];

  bool _isHovered = false; 
  void _navigateToAddProductScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadNewVolumePage()),
    );

    if (result != null) {
      setState(() {
        mangaItems.add(result);
      });
    }
  }

  void _removeProduct(int index) {
    setState(() {
      mangaItems.removeAt(index);
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
      itemCount: mangaItems.length,
      itemBuilder: (context, index) {
        final mangaItem = mangaItems[index];
        return isMobile
            ? _buildMobileCard(context, mangaItem, index)
            : _buildDesktopCard(context, mangaItem, index);
      },
    );
  }

  Widget _buildMobileCard(BuildContext context, MangaItem mangaItem, int index) {
    return Stack(
      children: [
        MangaCard(
          imagePath: mangaItem.imagePath,
          title: mangaItem.title,
          description: mangaItem.shortDescription,
          price: mangaItem.price,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MangaDetailsScreen(
                  title: mangaItem.title,
                  price: mangaItem.price,
                  index: index,
                  additionalImages: mangaItem.additionalImages,
                  description: mangaItem.description,
                  format: mangaItem.format,
                  publisher: mangaItem.publisher,
                  imagePath: mangaItem.imagePath,
                  chapters: mangaItem.chapters,
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

  Widget _buildDesktopCard(BuildContext context, MangaItem mangaItem, int index) {
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
            imagePath: mangaItem.imagePath,
            title: mangaItem.title,
            description: mangaItem.shortDescription,
            price: mangaItem.price,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MangaDetailsScreen(
                    title: mangaItem.title,
                    price: mangaItem.price,
                    index: index,
                    additionalImages: mangaItem.additionalImages,
                    description: mangaItem.description,
                    format: mangaItem.format,
                    publisher: mangaItem.publisher,
                    imagePath: mangaItem.imagePath,
                    chapters: mangaItem.chapters,
                  ),
                ),
              );
            },
          ),
          if (_isHovered)
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
      ),
    );
  }
}