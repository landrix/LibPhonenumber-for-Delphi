program LibPhonenumberTests;

{$APPTYPE CONSOLE}
{$STRONGLINKTYPES ON}

uses
  System.SysUtils,
  DUnitX.Loggers.Console, DUnitX.TestFramework,
  PhoneNumbers in '..\PhoneNumbers.pas',
  PhoneNumbersInteropTests in 'PhoneNumbersInteropTests.pas';

var
  lLogger: ITestLogger;
  lResults: IRunResults;
  lRunner: ITestRunner;

begin
  try
    TDUnitX.CheckCommandLine;
    lRunner := TDUnitX.CreateRunner;
    lRunner.UseRTTI := True;
    lLogger := TDUnitXConsoleLogger.Create(True);
    lRunner.AddLogger(lLogger);
    lRunner.FailsOnNoAsserts := True;
    lResults := lRunner.Execute;
    if not lResults.AllPassed then
      System.ExitCode := EXIT_ERRORS;
  except
    on E: Exception do
    begin
      System.Writeln(E.ClassName + ': ' + E.Message);
      Halt(1);
    end;
  end;
end.
