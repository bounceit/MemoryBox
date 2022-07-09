# audio_fairy_tales

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
<<<<<<< Updated upstream
=======

stl - виджет без состояния, может только отображать

каждый раз когда мы в stf меняем State вызывается build заново
когда нужно нарисовать виджет у его нужно вызвать метод build 

жизненный цикл stf
- виджет рождается 
- create state
- вызов context(до этого момента лучше с ниим ничего не делать)
// из любого метода можно обращаться к контексту
- initState вызывается у context (место где нужно совершить действие ровно один раз)
- didChangeDependens ( для работы с инхеритами )
   
>>>>>>> Stashed changes
