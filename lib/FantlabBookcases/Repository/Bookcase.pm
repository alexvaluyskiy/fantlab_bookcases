package FantlabBookcases::Repository::Bookcase;
use common::sense;
use Mojo::Redis2;
use Data::Dumper;

my $redis = Mojo::Redis2->new;

sub get_bookcases_list {
    my $user_id = shift;

    my @keys = $redis->hkeys("bookcase=user=$user_id");

    my @bookcases = ();
    foreach my $key (@keys) {
      my $item = {$redis->hgetall($key)};
      push(@bookcases, $item);
    }

    return \@bookcases;
}

sub get_bookcase {
    my ($user_id, $bookcase_id) = @_;

    my $bookcase = {$redis->hgetall("bookcase=$bookcase_id")};

    return $bookcase;
}

sub add_bookcase {
    my $bookcase = shift;

    # generate a new id
    my $new_id = $redis->incr('bookcase=identity');
    my $id_key = "bookcase=$new_id";

    # insert a bookcase
    $redis->hmset($id_key, %$bookcase);

    # create an index for the user_id
    $redis->hset("bookcase=user=$bookcase->{user_id}", $id_key, 1);

    return $new_id;
}

sub update_bookcase {
    my $bookcase = shift;

    $redis->hmset("bookcase=$bookcase->{id}", %$bookcase);

    return 1;
}

sub delete_bookcase {
    my ($user_id, $bookcase_id) = @_;

    # delete a bookcase
    $redis->del("bookcase=$bookcase_id");

    # delete from user index
    $redis->hdel("bookcase=user=$user_id", $bookcase_id);

    return 1;
}
1;
