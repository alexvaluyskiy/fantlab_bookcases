package FantlabBookcases::Repository::BookcaseWork;
use common::sense;

sub get_bookcase_works {
    my ($user_id, $bookcase_id) = @_;

    my $works = [
        {
            bookcase_id => $bookcase_id,
            bookcase_work_id => 1,
            work_id => 5,
            user_id => $user_id
        },
        {
            bookcase_id => $bookcase_id,
            bookcase_work_id => 2,
            work_id => 6,
            user_id => $user_id
        }
    ];

    return $works;
}

sub get_bookcase_work {
    my ($user_id, $bookcase_id, $bookcase_work_id) = @_;

    my $work = {
        bookcase_id => $bookcase_id,
        bookcase_work_id => $bookcase_work_id,
        work_id => 5,
        user_id => $user_id
    };

    return $work;
}

sub add_bookcase_work {
    my $bookcase_work = shift;

    return {};
}

sub update_bookcase_work {
    my $bookcase_work = shift;

    return {};
}

sub delete_bookcase_work {
    my ($user_id, $bookcase_id, $bookcase_work_id) = @_;

    return {};
}

1;