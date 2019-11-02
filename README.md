# Rent Calculator

Rent estimation API based on the exsiting data

Things you may want to cover:

* Ruby version
	`ruby-2.6.3`
	you can install it using rvm.io or any other favorite option

## Initial Setup
make sure you have got the right ruby version as it mentioned in the above step.

```
# if you are using rvm
rvm install ruby-2.6.3
```

Installing gems:

```bash
gem install bundler
bundle install
```

DB Setup:

```bash
rake db:migrate
```
To start the app:

```bash
rails s
```

### Data Import

#### Manual

To import a new CSV dump via rake task manually:


```bash
# M indicates the manual execution
rake import[test/fixtures/files/rents.csv,M]
```
#### Cron Job

To import csv files on daily bases e.g; (At 01:00) automatically, then you need to add this to your cron jobs using `crontab -e`:

```bash
# A indicates the Auto execution
0 1 * * * cd /Path/to/rent_calculator && bin/rake import[test/fixtures/files/rents,A]
```
change the `/Path/to/rent_calculator` to project path and `test/fixtures/files/rents.csv` to the file path you want to import.

**Important:**

The job expects you to name the csv files with the date suffix e.g; `rents-2019-11-02.csv`. You can change the fie name to what ever you want in the cron job.

## API Endpoints
Using the `Apartment` API endpoint you can Create, Read, Update or Delete a specific apartment.

To access apartments:

- http://localhost:3000/apartments?zip_code=10319

You can filter apartments by `zip_code`, `apartment_id`, `apartment_size`, `rent`, `apartment_type` and `deleted`

- e.g; http://localhost:3000/apartments?zip_code=10319&apartment_size145&rent=870

### Apartment Estimation
You can pass the `zip_code` and `apartment_size` to get an estimation:

- e.g; http://localhost:3000/estimations?zip_code=10315&apartment_size=98

## Test cases
To run all the tests:

`rails test`

You can find the tests under the `test` directory
- test/controllers
- test/lib/services
- test/lib/tasks