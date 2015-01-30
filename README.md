# Dark Magic

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
