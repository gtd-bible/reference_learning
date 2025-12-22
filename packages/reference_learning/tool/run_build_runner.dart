import 'dart:io';

void main(List<String> arguments) async {
  final result = await Process.run(
    'dart',
    [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
      ...arguments,
    ],
    workingDirectory: './', // Run from the package root
    runInShell: true,
  );

  stdout.write(result.stdout);
  stderr.write(result.stderr);
  exit(result.exitCode);
}