# Pesamoni Android library

The Pesamoni Pesaway c# Library provides integration access to Pesamoni services. You can view API features by clicking the link https://pesamoni.com/developers#features-intro.

## Frameworks supported
- .NET 4.0 or later
- Windows Phone 7.1 (Mango)

## Dependencies
- [RestSharp](https://www.nuget.org/packages/RestSharp) - 105.1.0 or later
- [Json.NET](https://www.nuget.org/packages/Newtonsoft.Json/) - 7.0.0 or later
- [JsonSubTypes](https://www.nuget.org/packages/JsonSubTypes/) - 1.2.0 or later

The DLLs included in the package may not be the latest version. We recommend using [NuGet](https://docs.nuget.org/consume/installing-nuget) to obtain the latest version of the packages:
```
Install-Package RestSharp
Install-Package Newtonsoft.Json
Install-Package JsonSubTypes
```

NOTE: RestSharp versions greater than 105.1.0 have a bug which causes file uploads to fail. See [RestSharp#742](https://github.com/restsharp/RestSharp/issues/742)

## Installation
Run the following command to generate the DLL
- [Mac/Linux] `/bin/sh build.sh`
- [Windows] `build.bat`

Then include the DLL (under the `bin` folder) in the C# project, and use the namespaces:
```csharp
using IO.Pesamoni_csharp.Api;
using IO.Pesamoni_csharp.Client;
using IO.Pesamoni_csharp.Model;
```

## Quick Start Example

The SDK needs to be instantiated using your API username and API password, which you can get from your [Pesamoni business account](https://pesamoni.com/business/dash).

You can register a new Pesamoni business account [Here](https://pesamoni.com/businesses/sign_up) or Sign in [Here](https://pesamoni.com/businesses/sign_in)

```csharp
using System;
using System.Diagnostics;
using IO.Pesamoni_csharp.Api;
using IO.Pesamoni_csharp.Client;
using IO.Pesamoni_csharp.Model;

namespace Example
{
    public class Example
    {
        public void main()
        {

            // Configure API key authorization: apipassword
            Configuration.Default.ApiKey.Add("apipassword", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.ApiKeyPrefix.Add("apipassword", "Bearer");
            // Configure API key authorization: apiusername
            Configuration.Default.ApiKey.Add("apiusername", "YOUR_API_USERNAME");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.ApiKeyPrefix.Add("apiusername", "Bearer");

            var apiInstance = new DefaultApi();
```

### Accepting funds from mobile subscriber
```csharp
        //  you can either use method acreceive or acreceivekeac as explained below
        //  method acreceive
        // This method enables you receive funds from a mobile subscriber in your registered native currency on the Pesamoni platform. If for instance your account is registered in currency UGX and you request money from a Kenyan number e.g 254712346789, a Pesamoni exchange rate will automatically be applied and money deposited into your Pesamoni wallet in your default currency
        //  method acreceivekeac
        //  You can have two native currencies on your Pesamoni account on request. If you would like to deposit funds from a mobile subscriber to your Kenyan Pesamoni wallet account then this is the method you use.
        //  example
        var method = acreceive;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var mobile = mobile_example;  // string | Enter the mobile number you would like to execute the above method in format 256.... or 254...<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, senderid, sendsms, sendairtime</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            }
```

### Sending funds to a mobile subscriber

```csharp
        // you can either use method acreceive or acreceivekeac as explained below
        // acsend
        // This method enables you send funds to a mobile subscriber in your registered native currency on the Pesamoni platform. If for instance your account is registered in currency UGX and you send money to a kenyan number e.g 254712346789, a Pesamoni exchange rate will automatically be applied and the equivalent exchange amount deducted from your Pesamoni wallet in your default currency
        // acsendkeac
        // You can have two native currencies on your Pesamoni account on request. If you would like to send funds from your Pesamoni wallet to a mobile subscriber from your Kenyan Pesamoni wallet account then this is the method you use.
        var method = acsend;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to send funds to. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var mobile = mobile_example;  // string | Enter the mobile number you would like to execute the above method in format 256.... or 254...<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, senderid, sendsms, sendairtime</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            }
```

### Accepting Card Payments e.g VISA/MASTERCARD

```csharp
        var method = method_example;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var holdername = holdername_example;  // string | Enter name of payer for Visa/MasterCard transactions<p style=\"color:red\">This method applies for request method <b>cardaccept</b></p> (optional) 
        var cardnumber = cardnumber_example;  // string | Enter the Visa/MasterCard cardnumber<p style=\"color:red\">This method applies for request method <b>cardaccept</b></p> (optional) 
        var cvv = cvv_example;  // string | Enter the Visa/MasterCard cvv<p style=\"color:red\">This method applies for request method <b>cardaccept</b></p> (optional) 
        var exp = exp_example;  // string | Enter the Visa/MasterCard expiry date in the format MM/YYYY e.g 07/2030<p style=\"color:red\">This method applies for request method <b>cardaccept</b></p> (optional) 
        var currency = currency_example;  // string | Enter the currency you intend to make the transaction for Visa/MasterCard based transactions<p style=\"color:red\">This method applies for request method <b>cardaccept</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional)
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            } 
```
## Bank Transfers

```csharp
         // you can either use method acsendbank or acsendbankeac as explained below
        // acsendbank
        // This method enables you send funds to a users bank account. A Pesamoni exchange rate will automatically be applied and the equivalent exchange amount deposited to your bank account dependent on your default currency.
        // acsendbankeac
        // You can have two native currencies on your Pesamoni account on request. If you would like to send funds from your Pesamoni wallet to a mobile subscriber from your Kenyan Pesamoni wallet account then this is the method you use.
        var method = acsendbank;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var account = account_example;  // string | Enter the Pesamoni account you would like to use for this transaction<p style=\"color:red\">This method applies for request method <b>paybills</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional)
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            } 

```

## Sending Airtime to a mobile subsriber

```csharp
        var method = sendairtime;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var mobile = mobile_example;  // string | Enter the mobile number you would like to execute the above method in format 256.... or 254...<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, senderid, sendsms, sendairtime</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional)
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            } 
```

### Sending to a Pesamoni users wallet

```csharp
        var method = pesab2c;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var account = account_example;  // string | Enter the Pesamoni account you would like to use for this transaction<p style=\"color:red\">This method applies for request method <b>paybills</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional)
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            } 
```

### Accepting funds from a Pesamoni user

```csharp
        var method = pesac2b;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var account = account_example;  // string | Enter the Pesamoni account you would like to use for this transaction<p style=\"color:red\">This method applies for request method <b>paybills</b></p> (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional)
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            } 
```

### Paying Utility Bills

```csharp
            var method = paybills;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
            var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
            var mobile = mobile_example;  // string | Enter the mobile number you would like to execute the above method in format 256.... or 254...<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, senderid, sendsms, sendairtime</b></p> (optional) 
            var account = account_example;  // string | Enter the Pesamoni account you would like to use for this transaction<p style=\"color:red\">This method applies for request method <b>paybills</b></p> (optional) 
            var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
            var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
            var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
            var bouquet = bouquet_example;  // string | Enter the bouquet or package you would like to pay for<p style=\"color:red\">This method applies for request methods <b>paybills</b></p> (optional) 
            var payoption = payoption_example;  // string | Enter your prefered payment option<p style=\"color:red\">This method applies for request methods <b>paybills</b></p> (optional) 
            var meternumber = meternumber_example;  // string | Enter the meter number for the intended payment<p style=\"color:red\">This method applies for request methods <b>paybills</b></p> (optional) 

            try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            }
```

### Checking transaction status

```csharp
            var method = transactionstatus;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
            var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
            try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method,reference);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            }
```

### Checking your Pesamoni Business Wallet Balance

```csharp
            var method = acbalance;  // string | Enter a request method. To check for request methods <a href=''>click here</a> 
            try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            }
```

## Sending SMS to a mobile subscriber

```csharp
        var method = sendsms;  // string | Enter a request method. To check for request methods <a href=''>click here</a>
        var amount = amount_example;  // string | Enter the amount you would like to request for. <p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, acsendbank, pesab2c, sendairtime, cardaccept</b></p>
        var message = message_example;  // string | Enter your message (optional) 
        var reference = reference_example;  // string | Enter your user generated transaction reference<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, transactionstatus, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var genericmsg = genericmsg_example;  // string | Enter your user generated generic message for the requested transaction<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional) 
        var token = token_example;  // string | Enter your user generated token for the above mentioned method<p style=\"color:red\">This method applies for request methods <b>acreceive, acreceivekeac, acsend, acsendkeac, sendsms, sendairtime, pesab2c, sendsms, cardaccept</b></p> (optional)
        try
            {
                InlineResponse200 result = apiInstance.TransactionsPost(method, amount, mobile, holdername, cardnumber, cvv, exp, currency, account, reference, genericmsg, token, bouquet, payoption, meternumber);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DefaultApi.TransactionsPost: " + e.Message );
            } 
```

## Documentation for API Endpoints

All Endpoint URIs are relative to https://pesamoni.com/api/live/v1/transactions


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Pesamoni.

## License

The c# Api library is available as open source under the terms of the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

### Authentication schemes defined for the API:
### apipassword

- **Type**: API key
- **API key parameter name**: apipassword
- **Location**: URL query string

### apiusername

- **Type**: API key
- **API key parameter name**: apiusername
- **Location**: URL query string
