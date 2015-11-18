package FantlabBookcases::Repository::Bookcase;
use common::sense;

sub get_bookcases_list {
    my $user_id = shift;

    my $bookcases = [
        {
            bookcase_id => 1,
            name => 'Just a bookcase',
            description => 'My bookcase',
            user_id => $user_id
        }
    ];

    return $bookcases;
}

sub get_bookcase {
    my ($user_id, $bookcase_id) = @_;

    my $bookcase = {
        bookcase_id => $bookcase_id,
        name => 'Just a bookcase',
        description => 'My bookcase',
        user_id => $user_id
    };

    return $bookcase;
}

sub add_bookcase {
    my $user = shift;

    return 1;
}

sub delete_bookcase {
    my ($user_id, $bookcase_id) = @_;

    return 1;
}

1;