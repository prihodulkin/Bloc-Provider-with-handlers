# test_proj

Пример концепции BlocProviderWithHandlers
Проблема: 
    1. Некоторые стейты (например, сообщающие об ошибке) есть у разных блоков. При этом могут требовать одинаковой обработки (допустим, показывать диалоговое окно или toast с сообщением)
    2. BlocListener, если он выполняет какую-то общую функцию, не зависящую от локального окружения (положить новую страницу на стек или показать диалоговое окно), может быть расположен в произвольном месте дерева виджетов. Он:
            a) занимает много места в коде
            б) не имеет чёткой позиции: его нужно располагать на максимальной или минимальном глубине в поддереве? И как не забыть, где он размещён, когда его дерево виджетов реализовано с помощью нескольких классов в разных файлах?

Предлагаемое решение: объединить BlocProvider и BlocListener в один виджет (см. [BlocProviderWithHandlers](https://github.com/prihodulkin/Bloc-Provider-with-handlers/blob/main/lib/UI/widgets/bloc_provider_with_handlers.dart) ). Он позволяет сразу навешивать на блок обработчики, что обеспечивает:
    1. Следование SRP - за обработку того или иного стейта ответственны отдельные классы, реализующие интерфейс [Handler](https://github.com/prihodulkin/Bloc-Provider-with-handlers/blob/main/lib/UI/handlers/handler.dart)
    2. Строго определённое место, где расположены все обработчики, в противовес листенерам, которые могут быть раскиданы по дереву
    3. Универсальность обработки стейтов, если он реализуют один интерфейс (см. [ErrorState](https://github.com/prihodulkin/Bloc-Provider-with-handlers/blob/main/lib/business_logic/models/error_state.dart), [NickHandlerErrorState](https://github.com/prihodulkin/Bloc-Provider-with-handlers/blob/main/lib/business_logic/bloc/nick_handler_bloc/nick_handler_state.dart))
