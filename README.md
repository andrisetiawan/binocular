# Binocular

Get detail info of Bank Identification Number (BIN) / Issuer Identification Number (IIN) from http://www.binlist.net/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'binocular'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install binocular

## Usage

#### Sample code

```ruby
bin_number = Binocular::Bin.new(431940)
bin_number.fetch_info # fetch bin info from http://www.binlist.net/
bin_number.info # return Hash of fetched bin info.

```

or for more simple use:

```ruby
Binocular::Bin.info(431940) # fetch bin info from http://www.binlist.net/ & return Hash of fetched bin info

```

#### From command line:

Binocular can be used from command line: `binocular <(6-length numeric) bin number>`

Sample:

```
binocular 431940
```

#### Sample result

```ruby
{
  "bin"=>"431940", 
  "brand"=>"VISA", 
  "sub_brand"=>"",
  "country_code"=>"IE",
  "country_name"=>"Ireland",
  "bank"=>"BANK OF IRELAND",
  "card_type"=>"DEBIT",
  "card_category"=>"",
  "latitude"=>"53",
  "longitude"=>"-8",
  "query_time"=>"385.784\u00B5s"
}
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/binocular/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
