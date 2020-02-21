typedef Consumer<T> = void Function(T);

typedef Predicate<T> = bool Function(T);

typedef Supplier<R> = R Function();

typedef Action = void Function();

typedef Transformer<T, R> = R Function(T);

typedef BiConsumer<T, U> = void Function(T, U);

typedef BiPredicate<T, U> = bool Function(T, U);

typedef BiTransformer<T, U, R> = R Function(T, U);