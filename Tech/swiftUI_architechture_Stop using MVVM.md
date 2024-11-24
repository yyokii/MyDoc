後で見る
* https://developer.apple.com/videos/play/wwdc2020/10040/: SwiftUI で有効なデータモデルについて説明されている。コンテキストの境界ごとにモデルを作成すれば良いことの詳細な説明がありそう。

---

## Resources

* [Stop using MVVM for SwiftUI | Apple Developer Forums](https://developer.apple.com/forums/thread/699003?page=1) 
* [Practical Mv Pattern Crud | AzamSharp](https://azamsharp.com/2022/10/06/practical-mv-pattern-crud.html)

## Summary

SwiftUIとProperty WrapperによってSwiftUIのViewはデータをリアクティブに扱える宣言的に記述できるフレームワークである。従ってRxSwiftを用いていた時のようなViewとModelをブリッジする、1Viewに対して1つ存在するViewModelのようなものは必要ないはずである。

> Registration and other objects are Source of Truths, model objects, part of our model. That objects are independent from a specific view and this is one important difference from MVVM. I see, from other platforms some people use the name VM for the “Source of Truth” (shared, view independent, …) but this is not MVVM. Also we can’t share a state using true MVVM, for SwiftUI (and other declarative platforms) EnvironmentObject is key for many use cases and situations. 
> 
https://developer.apple.com/forums/thread/699003?page=4

設計の手順

* 境界コンテキストに基づき、aggregate root model、service、objectを定義する
*  複数のビューから参照されるべきmodelはEnvironmentObjectとして定義する

命名

+ objectは名詞とし、それで表したいものを表現する
+ modelは~Model
+ serviceは~Service

## Philosophy

> Simple software design can only be achieved by really fully understanding the problem First you have to really understand what’s going on, in all its complexities, and then come up with a solution so simple that – in hindsight – it is the obvious way to do it.
>
> - Don't over-engineer your code
> - Don't fall into the tutorial trap
> - Don't just copy and paste code without understanding it
> - Don't blindly follow someone else's strategy
> - Avoid sacrificing software design for testability
> - Consider mocking only as a last resort
>
> Be careful, in an effort to make code more testable, we can very often find ourselves introducing a ton of new protocols and other kinds of abstractions, and end up making our code significantly more complicated.
>
> **There's an object for that!**
>
> 1. Identify Objects
> 2. Identify Tasks
> 3. Identify Dependencies
>
> - Don’t fight the system
> - Don’t literally start with a protocol
> - Avoid unnecessary internal & external dependencies
> - Avoid too many layers of abstraction or complexity
> - Use nested type for supporting or to hide complexity

> Be careful, in an effort to make code more testable, we can very often find ourselves introducing a ton of new protocols and other kinds of abstractions, and end up making our code significantly more complicated. Avoid sacrificing software design for testability and consider mocking only as a last resort.
>
> Model (Data / Networking / Algorithms) objects represent special knowledge and expertise. They hold an application’s data and define the logic that manipulates that data.
>
> The model layer is not simple structs (POJOs). A model is a system of objects (structs / classes) with properties, methods and relationships. For simple apps we can define one model, for complex apps we can have many models as needed (and makes sense).
>
> Popular Model design patterns: Active Record, Data Mapper and Factory Method are the key' to avoid massive ViewControllers / ViewModels (and unnecessary layers).
>
> See “The Features of the Main Data Access Patterns Applied in Software Industry” by Marcelo Rodrigues de Jesus

[Data Access Patterns: The Features of the Main Data Access Patterns Applied in Software Industry | by Marcelo Rodrigues de Jesus | Mastering Software Engineering | Medium](https://medium.com/mastering-software-engineering/data-access-patterns-the-features-of-the-main-data-access-patterns-applied-in-software-industry-6eff86906b4e)

> About the tests:
>
> - Unit Tests (should used where there's non other objects / systems integration, test your model)
> - Integration Tests (should used where there's other objects / systems integration, test your model)
> - UI Tests (test your UI and presentation logic)
>
> But an ugly guy said: "Ahhh you should do Unit Tests for integrations integrations, use mocks for them" and boom! This guy killed the software design. Wrong!! First you should avoid this and second there's many ways to mock without complicate or sacrifice the software design. Default rule: Use Unit Tests only when you need to test a calculation, algorithm, ... not when you do a request to web service. Don’t fall in unit test troll!

> Today developers are obsessed with tests and other ugly thinks. I see projects delayed with lots problems because devs today want to be SOLID and testable.
>
> Agile, SOLID and over testing works like a cancer for development teams.

> Remember:
>
> - Avoid sacrificing software design for testability
> - Automated tests didn’t ensure a quality product

## View

> SwiftUI automatically performs most of the work traditionally done by view controllers (view models too).

> Declarative UI does not require MVVM. We are now in an era where declarative UI is commonplace in iOS development.

> View is just an interaction layer and handle presentation logic.

## Model

> Model is everything your app (or part / system) can do, in a pure OOP.

> - In app, you store and process data by using a data model that is separate from its UI
> - Adopt the ObservableObject protocol for model classes
> - Use ObservableObject where you need to manage the life cycle of your data
> - Typically, the ObservableObject is part of your model

> Designing your model
>
> 1. Identify Objects(structs / classes)
> 2. Identify Tasks (methods)
> 3. Identify Dependencies
>
> - Don’t fight the system
> - Don’t literally start with a protocol
> - Avoid unnecessary internal & external dependencies
> - Avoid too many layers of abstraction or complexity
> - Use nested type for supporting or to hide complexity

> Struct (Data objects )
>
> Class (Life-cycle objects)
> Service, Session, Store, Library, Manager, Document, Center, Processor, Looder, Downloader, Controller, Player

Active Record

* オブジェクトがデータ（DB）を操作する処理を持つ
* ロジックを1つのオブジェクトが持つことになるので分かりやすい
* アプリケーションの規模によっては肥大化する

Data Mapper

* DBとの接続処理をもつMapperを作成する
* Data Mapperが処理に絡む分、Active Recordよりはコード量は増える
* Active Recordよりエンティティが肥大化しにくい
* 複雑なクエリ機能を持つようになったらそれは別のもの、例えばRepsitoryオブジェクトなどを検討した方がいい

Repository

* ドメイン オブジェクトのコレクションのように機能し、クエリ機能を持つことができる。
* DBとの接続の文脈というより、より一般的な概念でありDBとの接続を持たないこともあるが、多くの場合Data Mapperの機能を持つ。

* [P of EAA: Active Record](https://www.martinfowler.com/eaaCatalog/activeRecord.html)
* [P of EAA: Data Mapper](https://martinfowler.com/eaaCatalog/dataMapper.html)
* [Data Access Patterns: The Features of the Main Data Access Patterns Applied in Software Industry | by Marcelo Rodrigues de Jesus | Mastering Software Engineering | Medium](https://medium.com/mastering-software-engineering/data-access-patterns-the-features-of-the-main-data-access-patterns-applied-in-software-industry-6eff86906b4e)
* [Webアプリケーションの構成に関する予備知識 - Qiita](https://qiita.com/okeyaki/items/37eb4b66bd8ef62c1fe8)

> The model is composed by **Data Objects** (structs), **Service Objects** (providers, shared classes) and **State Objects** (observable objects, “life cycle” / “data projection” classes). We should use the state objects for specific (or related) data and functionality, not for screen / view, as they should be independent from specific UI structure / needs, When needed we can share then in view hierarchy.
>
> Remember (using state objects in views):
>
> - StateObject - strong reference, single source of truth
> - EnvironmentObject / ObservedObject - weak reference
>
> Also (when async calls needed):
>
> - Define state objects (or base class) as MainActor to avoid warnings and concurrency problems
> - Define state object tasks as async, e.g “func load() async”, because for some situations you need to do other jobs after data load completed and async is more simple / sequencial than checking the “phase” (.loaded) using onChange(of:)

> *What if the data format in your model does not correspond with how you want to show it on screen?* Depends on your needs. From my experience I find using local state (1.2) for form data, then convert to your model the best approach. Form should follow the Model. Remember **View = f(Model)**.
>
> （翻訳）
> モデルのデータ形式が画面上での表示方法に対応していない場合はどうすればよいでしょうか?ニーズに応じて異なります。私の経験から、フォーム データにローカル状態 (1.2) を使用してからモデルに変換するのが最良のアプローチであることがわかりました。フォームはモデルに従う必要があります。 View = f(Model) を覚えておいてください。

## Test
