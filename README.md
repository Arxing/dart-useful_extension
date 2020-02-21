# useful_extension

Integrate other languages (like Java and Kotlin) code style to extensions.

[![Dart Version](https://img.shields.io/badge/Dart-2.7-blue.svg?style=flat-square)](https://dart.dev)

## Java Util Function Extension

| Dart Class | Java Class | Dart Prototype |
| --- | --- | --- |
| Consumer\<T> | Consumer\<T> | void Function(T) |
| Predicate\<T> | Predicate\<T> | bool Function(T) |
| Action | Action | void Function() |
| Supplier\<R> | Supplier\<R> | R Function() |
| Transformer\<T, R> | Function\<T, R> | R Function(T) |
| BiConsumer\<T, U> | BiConsumer\<T, U> | void Function(T, U) |
| BiPredicate\<T, U> | BiPredicate\<T, U> | bool Function(T, U) |
| BiTransformer<T, U, R> | BiFunction\<T, U, R> | R Function(T, U) | 

## Kotlin Style Extension

| Operator | Parameter | Returns |
| --- | --- | --- |
| let | self | self |
| apply | - | self |
| also | self | R |
| run | - | R |

### Simple Usage

```dart
String name = null;
name?.let((it){
  print("it=$it");
});
```
> Because `name` is null, so `let` not execute.

```dart
String name = "Hello";
name?.let((it){
  print("it=$it");
});
```
> Because `name` is not null, so outputs "it=Hello".

#### Use to Initialize Instance

By cascade style
```dart
People john = People()
  ..name = "John"
  ..age = 18;
```

By `let` operator
```dart
People john = People().let((it) {
  it.name = "John";
  it.age = 18;
});
```

#### Operator Chains


```dart
100.also((it) => it * it)
   .also((it) => it.toString())
   .also((it) => double.parse(it))
   .let((it) => print("result=$it"));
```

#### Functions Invocation

You can call `invoke` to execute a `Function`.

##### Dart style `Function` execution
```dart
Function func = () => print("Execute");
func();
```

##### Use `invoke` instead of Dart style execution
```dart
Function func = () => print("Execute");
func.invoke();
```

##### Use `invoke` and `let` to Simplified Null Safety Style

Dart style `Function` null safety
```dart
Function func = null;
if(func != null) func();
```

Instead of `invoke` and `let` style
```dart
Function func = null;
func?.invoke();
```

##### `invoke` also Supports Parameters and Returns

Parameters and returns will auto transform and keep type-safe.
```dart
typedef Func1 = bool Function(String s, int i);
typedef Func2 = String Function(int i);

Func1 func1 = null;
bool result1 = func1?.invoke("String", 100);

Func2 func2 = null;
String result2 = func2?.invoke(100);

func2?.invoke(true); /// compile error
bool r = func2?.invoke(100); /// compile errpr
```

## Dart Basic Extension


### Operator `cast`
Use `cast` instead of `as` to make chain style.
```dart
dynamic o = "Hello";
(o as String).length;
o.cast<String>().length;

((o as String) as String).length;
o.cast<String>().cast<String>().length;
```


## Futures