// Openapi Generator last run: : 2024-06-18T10:16:02.414709
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
        AdditionalProperties(pubName: 'mensa_api', pubAuthor: 'Aaron Schlitt'),
    inputSpec: RemoteSpec(path: 'https://mensa.aaronschlitt.de/openapi.json'),
    generatorName: Generator.dart,
    typeMappings: {'int': 'num', 'double': 'num'},
    skipSpecValidation: true,
    outputDirectory: 'api')
class OpenAPI {}
// test