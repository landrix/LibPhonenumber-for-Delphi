using System;
using PhoneNumbers;
using System.Runtime.InteropServices;

namespace PhoneNumbersUnmanaged
{
  public class PhoneNumbersWrapper
  {

    //https://sites.google.com/site/robertgiesecke/Home/uploads/csharpprojecttemplateforunmanagedexports
    //http://stackoverflow.com/questions/2273141/how-can-i-pass-a-delphi-string-to-a-prism-dll/2275309#2275309
    //https://github.com/3F/DllExport

    [DllExport]
    static Boolean parse([MarshalAs(UnmanagedType.BStr)] String number,
                            [MarshalAs(UnmanagedType.BStr)] String country,
                            [MarshalAs(UnmanagedType.BStr)] out String formatetNumber)
    {
      PhoneNumberUtil phoneUtil = PhoneNumberUtil.GetInstance();
      try
      {
        PhoneNumber phonenumber = phoneUtil.Parse(number, country);
        formatetNumber = phoneUtil.Format(phonenumber, PhoneNumberFormat.INTERNATIONAL);
        return true;
      }
      catch (Exception e)
      {
        formatetNumber = e.Message;
        return false;
      }

      // Produces "+41 44 668 18 00"
      //System.out.println(phoneUtil.format(swissNumberProto, PhoneNumberFormat.INTERNATIONAL));
      // Produces "044 668 18 00"
      //System.out.println(phoneUtil.format(swissNumberProto, PhoneNumberFormat.NATIONAL));
      // Produces "+41446681800"
      //System.out.println(phoneUtil.format(swissNumberProto, PhoneNumberFormat.E164));
    }

    //https://www.baeldung.com/java-libphonenumber
    [DllExport]
    static Boolean isValidNumber([MarshalAs(UnmanagedType.BStr)] String number,
                            [MarshalAs(UnmanagedType.BStr)] String region)
    {
      PhoneNumberUtil phoneUtil = PhoneNumberUtil.GetInstance();
      try
      {
        PhoneNumber phonenumber = phoneUtil.Parse(number, region);
        return phoneUtil.IsValidNumber(phonenumber);

        //PhoneNumber phone = phoneNumberUtil.parse("+911234567890",  CountryCodeSource.UNSPECIFIED.name());
        //assertTrue(phoneNumberUtil.isValidNumber(phone));
        //assertTrue(phoneNumberUtil.isValidNumberForRegion(phone, "IN"));
        //assertFalse(phoneNumberUtil.isValidNumberForRegion(phone, "US"));
        //assertTrue(phoneNumberUtil.isValidNumber(phoneNumberUtil.getExampleNumber("IN")));
      }
      catch //(Exception e)
      {
        return false;
      }
    }
  }
}
