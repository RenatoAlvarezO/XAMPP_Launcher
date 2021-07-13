import 'dart:io';

void main(List<String> arguments) {
  var commands = <String>['start', 'stop'];

  if (arguments.isEmpty) {
    print('No input argument, toggling current state...');
    var result =
        Process.runSync('sudo', ['/opt/lampp/lampp', '${commands[0]}']);
    if (result.stdout.toString().contains('running'))
      result =
          Process.runSync('sudo', ['/opt/lampp/lampp', '${commands[1]}']);

    stdout.write(result.stdout);
  } else {
    var argument = arguments.first;
    if (commands.contains(argument)) {
      print('Executing command...');
      var result =
          Process.runSync('sudo', ['/opt/lampp/lampp', '${argument}']);
      stdout.write(result.stdout);
    } else
      print('Invalid Command');
  }
}
