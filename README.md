# Dark Magic

## Setup

### Solr

**IMPORTANT:** This project depends on Solr for search functionality.  Solr must be running in the background for the site to operate properly.  (Solr requires a local installation of the Java Development Kit (JDK).)

**To turn on Solr** open up a separate console tab and run `bundle exec rake sunspot:solr:run`.  Leave Solr running as long as you are using the site.

(If at any time your Solr index gets out of whack for whatever reason, you can run `bundle exec rake sunspot:solr:reindex`.)

### Database Setup

After setting up the database, run `rake create_states`, `rake create_schools`, and `rake create_data` (in that order).


# Classes

Each USER has one and only one STUDENTPROFILE.

Each USER has an @email.

## SP

Each SP has one ADDRESS.

Each SP has a first_name an a last_name.

Each SP has one or more GOALPATHS.  (Max of ??? 3? 5?.)

Each SP has one or more ESSAYS.

Each SP has one or more EXPERIENCES.

Each SP has one or more SKILLS.

Each SP has one or more REFERENCES.

Each SP has one or more TESTS (individual test taken).

Each SP has one or more SCHOOLS.

## ESSAY, EXPERIENCE, SKILL

(Just text and strings.)

## TEST

Each TEST has one @testtype, @score, @date.

## SCHOOL

Each SCHOOL has zero or more APPLICATIONDATES (AD).

Each SCHOOL accepts zero or more TESTTYPES.

Each SCHOOL has a @name, @requirements, @student_population.

Each SCHOOL has one ADDRESS.

Each AD has a @description and a @datetime.

(Tests are required some time before the AD.)

## ADDRESS

Each ADDRESS belongs to one and only one ADDRESSABLE.

## GOALPATHS

Each GOALPATH has one @end_goal.

Each GOALPATH has zero or more SCHOOLS.

Each GOALPATH has zero or more DEADLINES.

## REFERENCES

Each R has a @name, a @relation, a @file_attachment (?), and a @date.

## DEADLINE

Each DEADLINE belongs to a SP.
