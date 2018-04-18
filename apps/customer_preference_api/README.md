# CustomerPreferenceApi

This repository contains the code base which forms the case study for the talk presented at both `Code Beam Lite - (Closing KeyNote) Milan, 2018` and `Elixir EU - Warsaw, 2018`.

There are several branches:

There is one branch per SOLID principle violation, then other branches which demonstrate methods of fixing the violations as talked through in the presentation.

To keep the code concise, not all implementation details are fleshed out.

To run the code you will need to have a locally running Dynamo DB, or a Dynamo DB instance available.

## Running DynamoDB Locally

When running the customer-preference-api locally, it is useful to have a local instance of DynamoDB running so that you do not have to connect to a real instance of AWS.

Download the local DynamoDB jar from [AWS](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html) and untar it in a dedicated directory:

```shell
$ mkdir DynamoDB
$ cd DynamoDB
$ tar -zxvf ../dynamodb_local_latest.tar.gz
```

Start the local DynamoDB instance on port 8889:

```
$ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -port 8889
```

View your local DynamoDB instance by navigating to `http://localhost:8889/shell`

## Populate and Query DynamoDB using the browser

Click the `</>` icon on your locally running DynamoDB for JavaScript snippets which can be used to populate and query the DynamoDB table.

## Populate and Query DynamoDB using ExAws

*Important*: To use ExAws against your locally running DynamoDB you need to export two environment variables, with dummy values:

```
export AWS_ACCESS_KEY_ID=dummy
export AWS_SECRET_ACCESS_KEY=dummy
```

Create the local Dynamo table:

  ```
  ExAws.Dynamo.create_table("customer-preferences", [id: :hash], %{id: :string}, 1, 1) |> ExAws.request!

  http_request_body =   %{"id" => "uuid-1",
    "preferences" => %{
      "accommodation" => %{
        "apartment" => %{
          "catering" => "self_catering",
          "bedrooms" => 2,
          "parking" => "secure"
        },
        "hotel" => %{
          "catering" => "catered",
          "bedrooms" => 1,
          "parking" => "none"
        }
      }
    }
  }

ExAws.Dynamo.put_item("customer-preferences", http_request_body) |> ExAws.request!
```
