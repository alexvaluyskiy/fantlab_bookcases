package FantlabBookcases::Repository::BookcaseWork;
use common::sense;

sub get_bookcase_works {
    my $bookcase_id = shift;

    my $works = [
        {
            bookcase_id => $bookcase_id,
            bookcase_work_id => 1,
            work_id => 5
        },
        {
            bookcase_id => $bookcase_id,
            bookcase_work_id => 2,
            work_id => 6
        }
    ];

    return $works;
}

1;