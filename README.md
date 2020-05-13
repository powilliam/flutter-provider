# Gerenciamento de estado em uma aplicação Flutter

## Entendendo o conceito de _estado_

Vamos supor que estamos desenvolvendo uma aplicação que tem o objetivo de exibir uma lista de produtos de uma loja. Simplificando as entidades, cada produto tem um título, uma descrição e um valor. **Como implementamos a aplicação para guardar essas informações de uma lista? Através do estado!** Dessa forma, todas as variáveis que escrevemos são armazenadas na memória do nosso aplicativo.

> O estado não serve só para armazenar essas variáveis dos produtos, no caso. Ele também armazena as informações da nossa interface, assim como cada elemento nativo que está sendo exibido. Porém não precisamos nos preocupar com isso, especificamente, porque o Framework já faz esse trabalho para a gente.

Sendo assim, dentro de uma aplicação Flutter temos dois tipos de estados:

- ### Ephemeral State

  Também podemos chamar ele de _estado local_. Nele armazenamos as nossas varíaveis que dizem respeito a somente um widget específico e que não precisam ser compartilhadas com a aplicação inteira. Para atualizar esse valor, simplismente precisamos chamar a função `setState` dentro do nosso `State<Widget>` e pronto, esse valor será alterado e toda nossa UI responderá a essa atualização, provocando uma nova renderização da tela. Fácil!

  Veja como o implementamos:

  ```dart
      class Ephemeral extends StatefulWidget {

          @override
          _Ephemeral createState() => _Ephemeral();
      }

      class _Ephemeral extends State<Ephemeral> {
            int _counter = 0;

            // Toda vez que _incrementCounter for chamada, ela chamará a função setState para incrementar o valor da nossa varíavel de estado _counter
            void _incrementCounter() {
                setState(() {
                    _counter++
                });
            }

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    child: Center(
                        child: Column(
                            children: <Widget>[
                                Text("$_counter"),
                                FlatButton(
                                    child: Text("Incrementar"),
                                    onPress: _incrementCounter
                                )
                            ]
                        )
                    )
                );
            }
        }
  ```

- ### App State
  Também podemos chamar ele de _estado global_ ou _estado compartilhado_. Ele é o oposto do _Ephemeral_, já que neles armazenamos informações pertinentes a aplicação inteira e todos os Widgets podem acessar essas informações. Como exemplo tempos as preferências de um usuário, informações de Login e até mesmo o Carrinho do nosso eCommerce. Para implementar esse tipo de estado você precisa pesquisar especificamente um "padrão", digamos, de como podemos organizá-lo. Entre esses padrões, temos Redux, BloC, MobX, etc.

<br />

Pois bem, vamos ressaltar algo importante sobre isso: **não existe uma regra que você deve seguir em TODOS as aplicações**. As coisas sempre dependem do que você precisa desenvolver. Mas, podemos seguir um fluxo de pensamento que nos dirá qual tipo de estado devemos implementar, seja um _Ephemeral_ ou um _App State_:

- Quem precisa do dado?
  - Muitos ou alguns Widgets: Então, provavelmente você precisa de um _App State_
  - Somente um Widget: Então, use um _Ephemeral_
