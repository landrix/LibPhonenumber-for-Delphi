unit PhoneNumbersInteropTests;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TPhoneNumbersInteropTests = class
  public
    [Test]
    procedure InvalidNumberReturnsFalse;
    [Test]
    procedure ValidNumberIsParsedToE164;
    [Test]
    procedure ValidNumberReturnsTrue;
  end;

implementation

uses
  PhoneNumbers;

procedure TPhoneNumbersInteropTests.InvalidNumberReturnsFalse;
begin
  Assert.IsFalse(TLibPhoneNumber.IsValidNumber('123456789', 'DE'));
end;

procedure TPhoneNumbersInteropTests.ValidNumberIsParsedToE164;
begin
  Assert.AreEqual('+4915112345678', TLibPhoneNumber.Parse('015112345678', 'DE'));
end;

procedure TPhoneNumbersInteropTests.ValidNumberReturnsTrue;
begin
  Assert.IsTrue(TLibPhoneNumber.IsValidNumber('015112345678', 'DE'));
end;

initialization
  TDUnitX.RegisterTestFixture(TPhoneNumbersInteropTests);

end.
