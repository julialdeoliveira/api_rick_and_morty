import 'package:faker/faker.dart';

class ApiFactory {
  static Map<String, dynamic> getAllCharacters() => {
        "info": {
          "count": faker.randomGenerator.integer(826),
          "pages": faker.randomGenerator.integer(42),
          "next": faker.lorem.toString(),
          "prev": faker.lorem.toString(),
        },
        "results": [
          {
            "id": faker.randomGenerator.integer(20),
            "name": faker.lorem.toString(),
            "status": faker.lorem.toString(),
            "species": faker.lorem.toString(),
            "type": faker.lorem.toString(),
            "gender": faker.lorem.toString(),
            "origin": {
              "name": faker.lorem.toString(),
              "url": faker.lorem.toString(),
            },
            "location": {
              "name": faker.lorem.toString(),
              "url": faker.lorem.toString(),
            },
            "image": faker.lorem.toString(),
            "episode": [faker.lorem.toString()],
            "url": faker.lorem.toString(),
            "created": faker.lorem.toString(),
          }
        ]
      };
}
