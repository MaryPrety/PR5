import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MangaDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final int index;
  final List<String> additionalImages;
  final String description;
  final String format;
  final String publisher;
  final String imagePath;
  final String chapters;

  const MangaDetailsScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.index,
    required this.additionalImages,
    required this.description,
    required this.format,
    required this.publisher,
    required this.imagePath,
    required this.chapters, required void Function() onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 450;

    Future<void> _handleEscKey() async {
      if (ModalRoute.of(context)?.isCurrent == true) {
        Navigator.pop(context);
      }
    }

    SystemChannels.keyEvent.setMessageHandler((message) async {
      final keyMessage = message as Map<String, dynamic>?;
      if (keyMessage != null && keyMessage['type'] == 'keydown') {
        final keyCode = keyMessage['keyCode'];
        if (keyCode == 27) {
          await _handleEscKey();
        }
      }
      return null;
    });

    return Scaffold(
      backgroundColor: const Color(0xFF2D4263),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 27, 20, 43),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'MAN ',
                      style: TextStyle(
                        fontFamily: 'RussoOne',
                        fontSize: isMobile ? 28.0 : 60.0,
                        color: const Color(0xFFECDBBA),
                      ),
                    ),
                    TextSpan(
                      text: 'go100',
                      style: TextStyle(
                        fontFamily: 'Tektur',
                        fontSize: isMobile ? 28.0 : 60.0,
                        color: const Color(0xFFECDBBA),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'RussoOne',
                  fontSize: isMobile ? 28.0 : 50.0,
                  color: const Color(0xFFECDBBA),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Image.network(
                            imagePath,
                            width: isMobile ? 120 : 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          format,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Tektur',
                            fontSize: isMobile ? 10.0 : 20.0,
                            color: const Color(0xFFECDBBA),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chapters,
                          style: TextStyle(
                            fontFamily: 'RussoOne',
                            fontSize: isMobile ? 16.0 : 28.0,
                            color: const Color(0xFFC84B31),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          description,
                          style: TextStyle(
                            fontFamily: 'RussoOne',
                            fontSize: isMobile ? 12.0 : 18.0,
                            color: const Color(0xFFECDBBA),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC84B31),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            '$price',
                            style: TextStyle(
                              fontFamily: 'RussoOne',
                              fontSize: isMobile ? 14.0 : 20.0,
                              color: const Color(0xFFECDBBA),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: additionalImages.map((image) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.network(
                                  image,
                                  width: isMobile ? 50 : 80,
                                  height: isMobile ? 50 : 80,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Tektur',
                    fontSize: isMobile ? 12.0 : 16.0,
                    color: const Color(0xFFECDBBA),
                  ),
                  children: [
                    const TextSpan(
                      text: '\n\nПеревод выполнен профессионально, сохраняя дух оригинала.',
                    ),
                    const TextSpan(text: 'Издательство '),
                    TextSpan(
                      text: publisher,
                      style: TextStyle(
                        fontFamily: 'Tektur',
                        fontSize: isMobile ? 12.0 : 16.0,
                        color: const Color(0xFFC84B31),
                      ),
                    ),
                    const TextSpan(
                      text: ' уделяет внимание деталям при производстве книг, что делает каждое издание не только интересным для чтения, но и привлекательным для коллекционеров.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Возвращаем индекс при нажатии на кнопку "Удалить"
                  Navigator.pop(context, index);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC84B31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  'Удалить',
                  style: TextStyle(
                    fontFamily: 'RussoOne',
                    fontSize: isMobile ? 14.0 : 20.0,
                    color: const Color(0xFFECDBBA),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}